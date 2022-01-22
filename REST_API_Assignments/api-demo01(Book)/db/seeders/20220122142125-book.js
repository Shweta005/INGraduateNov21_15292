'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Books', [

      {

       id: 11,

       bookName: 'Rapid Development',

       authorName: 'Steve McConnell',

       publicationDate:'2020-01-21'   ,
       createdAt: new Date()  ,
       updatedAt:new Date()  

     },

     {

      id: 12,

       bookName: 'Coders at work',

       authorName: 'Peter Seibel',

       publicationDate:'2020-05-03'  ,       
       createdAt: new Date(),
       updatedAt:new Date()
    },

    {

      id: 13,

      bookName: 'The Art of Computer Programming',

      authorName: 'Donald E. Knuth',

      publicationDate:'2020-07-17'  ,
      createdAt: new Date() ,
      updatedAt:new Date()
    }

    ], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
