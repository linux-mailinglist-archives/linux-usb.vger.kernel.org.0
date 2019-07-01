Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F2129771
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 13:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390920AbfEXLko (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 May 2019 07:40:44 -0400
Received: from mga09.intel.com ([134.134.136.24]:5235 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390743AbfEXLkn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 May 2019 07:40:43 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2019 04:40:42 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 24 May 2019 04:40:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 May 2019 14:40:36 +0300
Date:   Fri, 24 May 2019 14:40:36 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by node
Message-ID: <20190524114036.GO1887@kuha.fi.intel.com>
References: <20190520080359.GC1887@kuha.fi.intel.com>
 <OSBPR01MB2103385D996762FA54F8E437B8060@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190520083601.GE1887@kuha.fi.intel.com>
 <OSBPR01MB2103C4C8920C40E42BC1B2A9B8060@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190521095839.GI1887@kuha.fi.intel.com>
 <OSBPR01MB21032206146152983C8F4E8EB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <1558517436.10179.388.camel@mhfsdcap03>
 <OSBPR01MB21038F2B99EF74831A22727BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190522142640.GN1887@kuha.fi.intel.com>
 <1558606570.10179.403.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1558606570.10179.403.camel@mhfsdcap03>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 23, 2019 at 06:16:10PM +0800, Chunfeng Yun wrote:
> Hi Heikki,
> On Wed, 2019-05-22 at 17:26 +0300, Heikki Krogerus wrote:
> > On Wed, May 22, 2019 at 10:55:17AM +0000, Biju Das wrote:
> > > Hi Chunfeng Yun,
> > > 
> > > Thanks for the feedback.
> > > 
> > > > Subject: RE: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by
> > > > node
> > > > 
> > > > Hi Biju,
> > > > On Wed, 2019-05-22 at 08:05 +0000, Biju Das wrote:
> > > > > Hi Heikki,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > Subject: Re: [PATCH v5 4/6] usb: roles: add API to get
> > > > > > usb_role_switch by node
> > > > > >
> > > > > > On Mon, May 20, 2019 at 09:45:46AM +0000, Biju Das wrote:
> > > > > > >
> > > > > > >
> > > > > > > Hi Heikki,
> > > > > > >
> > > > > > > Thanks for the feedback.
> > > > > > >
> > > > > > > > Subject: Re: [PATCH v5 4/6] usb: roles: add API to get
> > > > > > > > usb_role_switch by node
> > > > > > > >
> > > > > > > > On Mon, May 20, 2019 at 08:06:41AM +0000, Biju Das wrote:
> > > > > > > > > Hi Heikki,
> > > > > > > > >
> > > > > > > > > > Subject: Re: [PATCH v5 4/6] usb: roles: add API to get
> > > > > > > > > > usb_role_switch by node
> > > > > > > > > >
> > > > > > > > > > On Mon, May 20, 2019 at 10:39:11AM +0800, Chunfeng Yun wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > On Fri, 2019-05-17 at 16:05 +0300, Heikki Krogerus wrote:
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >
> > > > > > > > > > > > On Fri, May 17, 2019 at 01:37:36PM +0300, Heikki Krogerus
> > > > wrote:
> > > > > > > > > > > > > On Tue, May 14, 2019 at 04:47:21PM +0800, Chunfeng Yun
> > > > > > wrote:
> > > > > > > > > > > > > > Add fwnode_usb_role_switch_get() to make easier to
> > > > > > > > > > > > > > get usb_role_switch by fwnode which register it.
> > > > > > > > > > > > > > It's useful when there is not device_connection
> > > > > > > > > > > > > > registered between two drivers and only knows the
> > > > > > > > > > > > > > fwnode which register usb_role_switch.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Signed-off-by: Chunfeng Yun
> > > > > > > > > > > > > > <chunfeng.yun@mediatek.com>
> > > > > > > > > > > > > > Tested-by: Biju Das <biju.das@bp.renesas.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > Acked-by: Heikki Krogerus
> > > > > > > > > > > > > <heikki.krogerus@linux.intel.com>
> > > > > > > > > > > >
> > > > > > > > > > > > Hold on. I just noticed Rob's comment on patch 2/6,
> > > > > > > > > > > > where he points out that you don't need to use device
> > > > > > > > > > > > graph since the controller is the parent of the
> > > > > > > > > > > > connector. Doesn't that mean you don't really need this API?
> > > > > > > > > > > No, I still need it.
> > > > > > > > > > > The change is about the way how to get fwnode; when use
> > > > > > > > > > > device graph, get fwnode by of_graph_get_remote_node();
> > > > > > > > > > > but now will get fwnode by of_get_parent();
> > > > > > > > > >
> > > > > > > > > > OK, I get that, but I'm still not convinced about if
> > > > > > > > > > something like this function is needed at all. I also have
> > > > > > > > > > concerns regarding how you are using the function. I'll
> > > > > > > > > > explain in comment to the patch 5/6 in this
> > > > > > > > series...
> > > > > > > > >
> > > > > > > > > FYI, Currently  I am also using this api in my patch series.
> > > > > > > > > https://patchwork.kernel.org/patch/10944637/
> > > > > > > >
> > > > > > > > Yes, and I have the same question for you I jusb asked in
> > > > > > > > comment I added to the patch 5/6 of this series. Why isn't
> > > > > > > > usb_role_switch_get()
> > > > > > enough?
> > > > > > >
> > > > > > > Currently no issue. It will work with this api as well, since the
> > > > > > > port node is
> > > > > > part of controller node.
> > > > > > > For eg:-
> > > > > > > https://patchwork.kernel.org/patch/10944627/
> > > > > > >
> > > > > > > However if any one adds port node inside the connector node, then
> > > > > > > this
> > > > > > api may won't work as expected.
> > > > > > > Currently I get below error
> > > > > > >
> > > > > > > [    2.299703] OF: graph: no port node found in
> > > > > > /soc/i2c@e6500000/hd3ss3220@47
> > > > > >
> > > > > > We need to understand why is that happening?
> > > > > >
> > > > >
> > > > > Form the stack trace  the parent node is "parent_node=hd3ss3220@47" ,
> > > > instead of the "connector" node.
> > > > > That is the reason for the above error.
> > > > >
> > > > > [    2.442429]  of_graph_get_next_endpoint.part.0+0x28/0x168
> > > > > [    2.447889]  of_fwnode_graph_get_next_endpoint+0x5c/0xb0
> > > > > [    2.453267]  fwnode_graph_get_next_endpoint+0x20/0x30
> > > > > [    2.458374]  device_connection_find_match+0x74/0x1a0
> > > > > [    2.463399]  usb_role_switch_get+0x20/0x28
> > > > > [    2.467542]  hd3ss3220_probe+0xc4/0x218
> > > > >
> > > > > The use case is
> > > > >
> > > > > &i2c0 {
> > > > > 	hd3ss3220@47 {
> > > > >                  	compatible = "ti,hd3ss3220";
> > > > >
> > > > >                  	usb_con: connector {
> > > > >                           		compatible = "usb-c-connector";
> > > > >                          		port {
> > > > >                                 		 hd3ss3220_ep: endpoint {
> > > > >                                         			remote-endpoint =
> > > > <&usb3_role_switch>;
> > > > >                                 		};
> > > > >                          		};
> > > > >                 	 };
> > > > > 	 };
> > > > > };
> > > > >
> > > > > &usb3_peri0 {
> > > > >          companion = <&xhci0>;
> > > > >          usb-role-switch;
> > > > >
> > > > >          port {
> > > > >                 usb3_role_switch: endpoint {
> > > > >                         remote-endpoint = <&hd3ss3220_ep>;
> > > > >                  };
> > > > >          };
> > > > > };
> > > > >
> > > > > Q1) How do we modify the usb_role_switch_get() function to search
> > > > > Child(connector) and child's endpoint?
> > > > How about firstly finding connector node in fwnode_graph_devcon_match(),
> > > > then search each endpoint?
> > > 
> > >  I have done a quick prototyping with the changes you suggested and it works.
> > > 
> > > -       struct fwnode_handle *ep;
> > > +       struct fwnode_handle *ep,*child,*tmp = fwnode; 
> > >  
> > > -       fwnode_graph_for_each_endpoint(fwnode, ep) {
> > > +       child = fwnode_get_named_child_node(fwnode, "connector");
> > > +       if (child)
> > > +               tmp = child;
> > > +
> > > +       fwnode_graph_for_each_endpoint(tmp, ep) {
> > > 
> > > Form the stack trace  the parent node is "parent_node= connector" .
> > > 
> > > [    2.440922]  of_graph_get_next_endpoint.part.0+0x28/0x168
> > > [    2.446381]  of_fwnode_graph_get_next_endpoint+0x5c/0xb0
> > > [    2.451758]  fwnode_graph_get_next_endpoint+0x20/0x30
> > > [    2.456866]  device_connection_find_match+0x84/0x1c0
> > > [    2.461888]  usb_role_switch_get+0x20/0x28
> > > 
> > > Heikki, 
> > > Are you ok  with the above changes?
> > 
> > Doesn't that mean that if we made fwnode_usb_role_switch_get() the way
> > I proposed, there is no problem? You just find the "connector" child
> > node in your driver, and pass that to fwnode_usb_role_switch_get():
> > 
> >         struct fwnode_handle *connector;
> >         ...
> >         connector = device_get_named_child_node(&client->dev, "connector");
> >         if (IS_ERR(connector))
> >                 <do something>
> > 
> >         hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
> >         ...
> > 
> > The difference is that instead of just converting a device node of an
> > usb role switch to the usb role switch, it works just like
> > usb_role_switch_get(), just taking fwnode instead of device entry as
> > parameter.
> > 
> > I prepared the patches implementing fwnode_usb_role_switch_get() the
> > way I though it needs to work for my own tests. Please find the
> > patches attached.
> I tested these patches, it didn't work for case as following:
> 
> case 2:
> 
> &mtu3 {
>     usb-role-switch;
> 
>     connector {
>         compatible = "linux,typeb-conn-gpio", "usb-b-connector";
>         label = "micro-USB";
>         type = "micro";
>         id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
>         vbus-supply = <&usb_p0_vbus>;
>     };
> };
> 
> so I consider this case in the function fwnode_graph_devcon_match()
> (based on your patches)

IMO that case should be handled in USB role switch API initially, not
in the device connection API. If there is another user for it one day,
then we can move it to device connection API, but not before that.

How about this on top of the two patches I sent:

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index aab795b54c7f..36ac9d181e09 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -114,6 +114,19 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
        return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }

+static struct usb_role_switch *
+usb_role_switch_is_parent(struct fwnode_handle *parent)
+{
+       struct device *dev;
+
+       if (!parent ||�!fwnode_property_present(parent, "usb-role-switch"))
+               return NULL;
+
+       dev = class_find_device(role_class, NULL, parent, switch_fwnode_match);
+
+       return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
+}
+
 /**
  * usb_role_switch_get - Find USB role switch linked with the caller
  * @dev: The caller device
@@ -125,6 +138,10 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 {
        struct usb_role_switch *sw;

+       sw = usb_role_switch_is_parent(fwnode_get_parent(dev_fwnode(dev)));
+       if (sw)
+               return sw;
+
        sw = device_connection_find_match(dev, "usb-role-switch", NULL,
                                          usb_role_switch_match);

@@ -146,6 +163,10 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 {
        struct usb_role_switch *sw;

+       sw = usb_role_switch_is_parent(fwnode_get_parent(fwnode));
+       if (sw)
+               return sw;
+
        sw = fwnode_connection_find_match(fwnode, "usb-role-switch", NULL,
                                          usb_role_switch_match);
        if (!IS_ERR_OR_NULL(sw))


thanks,

-- 
heikki
