package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/administracao/**").authenticated() // 🔒 exige login nessa rota
                .anyRequest().permitAll() // ✅ libera todas as outras
            )
            .csrf(csrf -> csrf.disable())
            .formLogin(form -> form
                .loginPage("/cadastro") // sua página de login/cadastro
                .permitAll()
            )
            .logout(logout -> logout.permitAll());

        return http.build();
    }

    // ✅ Registrando o encoder
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
