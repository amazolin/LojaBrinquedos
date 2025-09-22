package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable() // desabilita CSRF (para facilitar testes)
            .authorizeHttpRequests((authz) -> authz
                .anyRequest().permitAll() // permite acesso a todas as rotas
            );
        return http.build();
    }
}
