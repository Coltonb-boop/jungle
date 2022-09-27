describe('cart page', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('should add product to cart when clicking on add button', () => {
    cy.get('form[method="post"] > button')
      .click({force:true});
    cy.contains('My Cart (1)')
      .should('exist');
  });
})