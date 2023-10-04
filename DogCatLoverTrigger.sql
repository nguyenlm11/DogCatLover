USE DogCatLoverFlatform


CREATE TRIGGER trgAccountUpdate ON [dbo].[Account]
FOR UPDATE
AS
UPDATE account
SET updated_at = SYSDATETIME()
FROM   [dbo].[Account] AS account
       JOIN inserted AS i
          ON account.id = i.id;
GO

CREATE TRIGGER trgPostUpdate ON [dbo].[Post]
FOR UPDATE
AS
UPDATE post
SET updated_at = SYSDATETIME()
FROM   [dbo].[Post] AS post JOIN [dbo].[Account] AS account ON post.author_id = account.id
                            JOIN [dbo].[Post_category] AS post_cate ON post_cate.id = post.category_id
                            JOIN inserted AS i ON post.id = i.id;
GO

CREATE TRIGGER trgPostCateUpdate ON [dbo].[Post_category]
FOR UPDATE
AS
UPDATE post_category
SET updated_at = SYSDATETIME()
FROM   [dbo].[Post_category] AS post_category
       JOIN inserted AS i
          ON post_category.id = i.id;
GO

CREATE TRIGGER trgMediaUpdate ON [dbo].[Media]
FOR UPDATE
AS
UPDATE media
SET updated_at = SYSDATETIME()
FROM   [dbo].[Media] AS media
       JOIN inserted AS i
          ON media.id = i.id;
GO

CREATE TRIGGER trgNotificationUpdate ON [dbo].[Notification]
FOR UPDATE
AS
UPDATE [notification]
SET updated_at = SYSDATETIME()
FROM   [dbo].[Notification] AS [notification]
       JOIN inserted AS i
          ON [notification].id = i.id;
GO

CREATE TRIGGER trgCommentUpdate ON [dbo].[Comment]
FOR UPDATE
AS
UPDATE comment
SET updated_at = SYSDATETIME()
FROM   [dbo].[Comment] AS comment
       JOIN inserted AS i
          ON comment.id = i.id;
GO

CREATE TRIGGER trgTradeUpdate ON [dbo].[Trade]
FOR UPDATE
AS
UPDATE trade
SET updated_at = SYSDATETIME()
FROM   [dbo].[Trade] AS trade
       JOIN inserted AS i
          ON trade.id = i.id;
GO

CREATE TRIGGER trgItemCateUpdate ON [dbo].[Item_category]
FOR UPDATE
AS
UPDATE item_cate
SET updated_at = SYSDATETIME()
FROM [dbo].[Item_category]   AS item_cate
       JOIN inserted AS i
          ON item_cate.id = i.id;
GO

CREATE TRIGGER trgTradeItemUpdate ON [dbo].[Trade_item]
FOR UPDATE
AS
UPDATE trade_item
SET updated_at = SYSDATETIME()
FROM   [dbo].[Trade_item] AS trade_item JOIN [dbo].[Trade] AS trade ON trade_item.trade_id = trade.id
                            JOIN [dbo].[Item_category] AS item_cate ON item_cate.id = trade_item.item_id
                            JOIN inserted AS i ON trade_item.id = i.id;
GO