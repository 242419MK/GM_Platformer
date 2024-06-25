// In Key Press Event

// Sprawdź, czy cooldown się skończył
if (shield_counter <= 0) {
    // Wykonaj akcję
    oPlayer_shield.count = true;
audio_play_sound(m_player_shield_up, 2345, false);
    // Zresetuj licznik cooldownu do początkowej wartości
    shield_counter = shield_timer;
}