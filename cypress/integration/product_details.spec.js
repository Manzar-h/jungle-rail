describe('Product Detail Page', () => {
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it('should show products on home page', () => {
    cy.get('.products article').should('be.visible');
  });

  it('should click on the product and navigate to product detail page', () => {
    cy.get('.products article').first().click();
    cy.url().should('include', '/products/');
  });

  it('should load product detail page', () => {
    cy.get('.product-detail').should('be.visible');
  });
});
