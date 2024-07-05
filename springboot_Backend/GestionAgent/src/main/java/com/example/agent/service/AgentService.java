package com.example.agent.service;

import com.example.agent.model.Agent;

import java.util.List;
import java.util.Optional;

public interface AgentService {

    List<Agent> getAllAgents();

    Optional<Agent> getAgentById(int id);

    Agent saveAgent(Agent agent);

    void deleteAgent(int id);
}
