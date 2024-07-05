package com.store.sotre.controller;

import com.store.sotre.model.Adresse;
import com.store.sotre.repository.MySqlRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;


@RestController
public class StoreController {

    @Autowired
    MySqlRepository mySqlRepository;

    @GetMapping("/get-all-adresses")
    public List<Adresse> getAllAddresses(){

        return mySqlRepository.findAll();
    }

    @GetMapping("/get-address/{identity}")
    public Adresse getSingleAddress(@PathVariable("identity") Integer id){
        return mySqlRepository.findById(id).get();
    }

    @DeleteMapping("/remove/{id}")
    public boolean deleteRow(@PathVariable("id") Integer id){
        if(!mySqlRepository.findById(id).equals(Optional.empty())){
            mySqlRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @PutMapping("/update/{id}")
    public Adresse updateAddress(@PathVariable("id") Integer id,
                                 @RequestBody Map<String, String> body){

        Adresse current = mySqlRepository.findById(id).get();
        current.setDescription(body.get("description"));
        current.setAdresse(body.get("adresse"));
        current.setName(body.get("name"));
        mySqlRepository.save(current);
        return current;
    }

    @PostMapping("/add")
    public Adresse create(@RequestBody Map<String, String> body){

        String description = body.get("description");
        String name = body.get("name");
        String adresse = body.get("adresse");
       // Initialize rating to a default value

        Adresse newAddress = new Adresse(name,description,adresse);

        return mySqlRepository.save(newAddress);
    }

   

}