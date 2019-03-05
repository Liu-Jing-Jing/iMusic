//
//  TabsViewController.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "TabsViewController.h"
#import "TabsResponse.h"
@implementation TabsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    self.tableView.sectionFooterHeight = 0;
    //tableView.separatorStyle = UITableViewCellSeparatorStyle.None
}

- (void)refresh
{
    [self reloadData];
}

- (void)reloadData
{
// tabs标签数据加载
//func reloadData() {
//    Alamofire.request(.GET, "https://syncapi-dev.sateh.com/1.0/tabs")
//    .authenticate(user: "sarentz+syncapi@mozilla.com", password: "q1w2e3r4")
//    .responseJSON { (request, response, data, error) in
//        self.tabsResponse = parseTabsResponse(data)
//        dispatch_async(dispatch_get_main_queue()) {
//            self.refreshControl?.endRefreshing()
//            self.tableView.reloadData()
//        }
//    }
//}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.tabsResponse != nil)
    {
        return self.tabsResponse.clients.count;
    }
    else
    {
        return 0;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.tabsResponse != nil)
    {
        TabClient *client = self.tabsResponse.clients[section];
        return client.tabs.count;
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"tabsVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellID];
    }
    // Configure the cell...
    cell.imageView.image = [self createMockFavicon:[UIImage imageNamed:@"leaf.png"]];
    TabClient *tabs = self.tabsResponse.clients[indexPath.section];
    Tab *tab = tabs.tabs[indexPath.row];
    
    cell.textLabel.text = tab.title;
    //cell.textLabel.font = UIFont(name: "FiraSans-SemiBold", size: 13)
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.indentationWidth = 20;
    
    return cell;
}


- (UIImage *)createMockFavicon:(UIImage *)icon
{
//    let size = CGSize(width: 30, height: 30)
//    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//    var context = UIGraphicsGetCurrentContext()
//    icon.drawInRect(CGRectInset(CGRect(origin: CGPointZero, size: size), 1.0, 1.0))
//    CGContextSetStrokeColorWithColor(context, UIColor.grayColor().CGColor)
//    CGContextSetLineWidth(context, 0.5);
//    CGContextStrokeEllipseInRect(context, CGRectInset(CGRect(origin: CGPointZero, size: size), 1.0, 1.0))
//    let image = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return image
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 42;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TabClient *tabs = self.tabsResponse.clients[indexPath.section];
    Tab *tab = tabs.tabs[indexPath.row];
    if (tab == nil)
    {
        NSURL *url = [NSURL URLWithString:tab.url];
        [[UIApplication sharedApplication] openURL:url];
    }
}


#warning FIX
//override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    let objects = UINib(nibName: "TabsViewControllerHeader", bundle: nil).instantiateWithOwner(nil, options: nil)
//    let view = objects[0] as? UIView
//    
//    if let label = view?.viewWithTag(1) as? UILabel {
//        if let response = tabsResponse {
//            let client = response.clients[section]
//            label.text = client.name
//        }
//    }
//    
//    return view
//}

//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let objects = UINib(nibName: "TabsViewControllerHeader", bundle: nil).instantiateWithOwner(nil, options: nil)
//        if let view = objects[0] as? UIView {
//            if let label = view.viewWithTag(1) as? UILabel {
//                // TODO: More button
//            }
//        }
//        return view
//    }


@end
