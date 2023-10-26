//
//  MediaPlayer.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 25.10.2023.
//

import UIKit
import AVKit

final class MediaPlayer: UIView {
    
    var album: Album
    
    private lazy var albumName: UILabel = {
       let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textAlignment = .center
        v.font = .systemFont(ofSize: 32, weight: .bold)
        
        return v
    }()
    
    private lazy var albumCover: UIImageView = {
       let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleToFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 100
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return v
    }()
    
    private lazy var progressBar: UISlider = {
       let v = UISlider()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addTarget(self, action: #selector(progressScrubbed(_:)), for: .valueChanged)
        v.minimumTrackTintColor = UIColor(named: "subtitleColor")
        return v
    }()
    
    private lazy var elapsedTimeLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14, weight: .light)
        v.text = "00:00"
        return v
    }()
    
    private lazy var remainingTimeLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14, weight: .light)
        v.text = "00:00"
        return v
    }()
    
    private lazy var songNameLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 16, weight: .bold)
        return v
    }()
    
    private lazy var artistLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 16, weight: .light)
        return v
    }()
    
    private lazy var previosButton: UIButton = {
       let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        v.setImage(UIImage(systemName: "backward.end.fill", withConfiguration: config), for: .normal)
        v.addTarget(self, action: #selector(didTapPrevios(_ :)), for: .touchUpInside)
        v.tintColor = .white
        return v
    }()
    
    private lazy var playPlauseButton: UIButton = {
       let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 100)
        v.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: config), for: .normal)
        v.addTarget(self, action: #selector(didTapPlayPause(_ :)), for: .touchUpInside)
        v.tintColor = .white
        return v
    }()
    
    private lazy var nextButton: UIButton = {
       let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        v.setImage(UIImage(systemName: "forward.end.fill", withConfiguration: config), for: .normal)
        v.addTarget(self, action: #selector(didTapNext(_ :)), for: .touchUpInside)
        v.tintColor = .white
        return v
    }()
    
    private lazy var controlStack: UIStackView = {
        let v = UIStackView(arrangedSubviews: [previosButton, playPlauseButton, nextButton])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .equalSpacing
        v.spacing = 20
        return v
    }()
    
    private var player = AVAudioPlayer()
    private var timer: Timer?
    private var playingIndex = 0
    
    init(album: Album) {
        self.album = album
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        albumName.text = album.name
        albumCover.image = UIImage(named: album.image)
        setupPlayer(song: album.songs[playingIndex])
        
        [albumName, songNameLabel, artistLabel, elapsedTimeLabel, remainingTimeLabel].forEach { (v) in
            v.textColor = .white
        }
        
        [albumName, albumCover, songNameLabel, artistLabel, progressBar, elapsedTimeLabel, remainingTimeLabel, controlStack].forEach { (v) in
            addSubview(v)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        //album name
        
        NSLayoutConstraint.activate([
        
            albumName.leadingAnchor.constraint(equalTo: leadingAnchor),
            albumName.trailingAnchor.constraint(equalTo: trailingAnchor),
            albumName.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
        
        // album cover
        
        NSLayoutConstraint.activate([
            albumCover.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            albumCover.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            albumCover.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 32),
            albumCover.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5)
        ])
        
        // song mane
        
        NSLayoutConstraint.activate([
        songNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        songNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        songNameLabel.topAnchor.constraint(equalTo: albumCover.bottomAnchor, constant: 16)
        ])
        
        // artistLabel
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            artistLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 8)
            ])
        
        //progress bar
        
        NSLayoutConstraint.activate([
        
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            progressBar.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 8)
        
        ])
        
        // elapsed timer
        NSLayoutConstraint.activate([
        
            elapsedTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            elapsedTimeLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8)
        
        ])
        
        // remainig timer
        NSLayoutConstraint.activate([
        
            remainingTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            remainingTimeLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8)

        ])
        
        // control stack
        
        NSLayoutConstraint.activate([
        
            controlStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            controlStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            controlStack.topAnchor.constraint(equalTo: remainingTimeLabel.bottomAnchor, constant: 8)

        ])
        
    }
    
    private func setupPlayer(song: Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") else {
            return
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        }
        
        songNameLabel.text = song.name
        artistLabel.text = song.artist
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.prepareToPlay()
            
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func play() {
        progressBar.value = 0.0
        progressBar.maximumValue = Float(player.duration)
        player.play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    func stop() {
        player.stop()
        timer?.invalidate()
        timer = nil
    }
    
    private func setPlayPauseIcon(isPlaying: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 100)
        playPlauseButton.setImage(UIImage(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill", withConfiguration: config), for: .normal)
    }
    
    @objc
    func updateProgress() {
        progressBar.value = Float(player.currentTime)
        
        elapsedTimeLabel.text = getFormattedTimer(timeInterval: player.currentTime)
        let remainigTime = player.duration - player.currentTime
        remainingTimeLabel.text = getFormattedTimer(timeInterval: remainigTime)
    }
    
    @objc
    func progressScrubbed(_ sender: UISlider) {
        player.currentTime = Float64(sender.value)
    }
    
    @objc
    func didTapPrevios(_ sender: UIButton) {
        playingIndex -= 1
        if playingIndex < 0 {
            playingIndex = album.songs.count - 1
        }
        setupPlayer(song: album.songs[playingIndex])
        play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    @objc
    func didTapPlayPause(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    @objc
    func didTapNext(_ sender: UIButton) {
        playingIndex += 1
        if playingIndex >= album.songs.count {
            playingIndex = 0
        }
        setupPlayer(song: album.songs[playingIndex])
        play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    private func getFormattedTimer(timeInterval: TimeInterval) -> String {
        let mins = timeInterval / 60
        let secs = timeInterval.truncatingRemainder(dividingBy: 60)
        let timeFormatter = NumberFormatter()
        timeFormatter.minimumIntegerDigits = 2
        timeFormatter.minimumFractionDigits = 0
        timeFormatter.roundingMode = .down
        
        guard let minsString = timeFormatter.string(from: NSNumber(value: mins)), let secStr = timeFormatter.string(from: NSNumber(value: secs)) else {
            return "00:00"
        }
        
        return "\(minsString) : \(secStr)"
        
    }
}

extension MediaPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        didTapNext(nextButton)
    }
}
