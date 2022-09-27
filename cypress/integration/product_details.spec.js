describe('product page', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('should click on Scented Blade plant to load its product details page', () => {
    cy.contains('Scented Blade')
      .click();
  });
})