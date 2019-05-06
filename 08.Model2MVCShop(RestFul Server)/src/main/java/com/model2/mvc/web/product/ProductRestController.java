package com.model2.mvc.web.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable String prodNo ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return productService.getProduct(Integer.parseInt(prodNo));
		}
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product addProduct( @RequestBody Product product) throws Exception{
	
		System.out.println("/product/json/addProduct : POST");
		
		System.out.println("product 들어왔나 체크해줘");
		System.out.println(product);
		
		productService.addProduct(product);
		System.out.println("☆★☆★☆★addProduct 직후 왜안찍히는 거야?체크해줘☆★☆★☆★");
		
		product.setProTranCode("addProd 리턴값 확인용 임시 트랜코드.");
		return product;
		
	}

}