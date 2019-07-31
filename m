Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9730F7B9AC
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 08:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbfGaG3x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 02:29:53 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:42483 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727535AbfGaG3w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 02:29:52 -0400
X-UUID: 663b382271d443cba710b10bf1255eb2-20190731
X-UUID: 663b382271d443cba710b10bf1255eb2-20190731
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1945774679; Wed, 31 Jul 2019 14:29:21 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 31 Jul
 2019 14:29:19 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 31 Jul 2019 14:29:18 +0800
Message-ID: <1564554558.5579.7.camel@mhfsdcap03>
Subject: Re: [PATCH v8 08/11] usb: roles: get usb-role-switch from parent
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Jul 2019 14:29:18 +0800
In-Reply-To: <20190729142500.GE28600@kuha.fi.intel.com>
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
         <1563958245-6321-9-git-send-email-chunfeng.yun@mediatek.com>
         <20190729142500.GE28600@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 34B54DA7E8EDA581CD499007594330F98B92C9106B9501712734F061E9E78ACA2000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Mon, 2019-07-29 at 17:25 +0300, Heikki Krogerus wrote:
> On Wed, Jul 24, 2019 at 04:50:42PM +0800, Chunfeng Yun wrote:
> > when the USB host controller is the parent of the connector,
> > usually type-B, sometimes don't need the graph, so we should
> > check whether it's parent registers usb-role-switch or not
> > firstly, and get it if exists.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> I don't think I actually wrote the patch. I may have proposed the code
> for you, but I never prepared a patch out out that. Please drop the
> above Signed-off-by line if that is the case. I case I really did
> write the patch, then you are missing the "From: Heikki..." first
> line, but I really don't remember preparing the patch.
> 
> If the idea came from me, you can use for example the suggested-by
> tag: "Suggested-by: Heikki Krogerus <heikki.krogerus...".
Ok, thanks

> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v8: no changes
> > v7:
> >   add signed-off-by Chunfeng
> > 
> > v6:
> >   new patch
> > ---
> >  drivers/usb/roles/class.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index 5b637aaf311f..87439a84c983 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -114,6 +114,19 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
> >  	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> >  }
> >  
> > +static struct usb_role_switch *
> > +usb_role_switch_is_parent(struct fwnode_handle *fwnode)
> > +{
> > +	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
> > +	struct device *dev;
> > +
> > +	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
> > +		return NULL;
> > +
> > +	dev = class_find_device(role_class, NULL, parent, switch_fwnode_match);
> > +	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> > +}
> > +
> >  /**
> >   * usb_role_switch_get - Find USB role switch linked with the caller
> >   * @dev: The caller device
> > @@ -125,8 +138,10 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
> >  {
> >  	struct usb_role_switch *sw;
> >  
> > -	sw = device_connection_find_match(dev, "usb-role-switch", NULL,
> > -					  usb_role_switch_match);
> > +	sw = usb_role_switch_is_parent(dev_fwnode(dev));
> > +	if (!sw)
> > +		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
> > +						  usb_role_switch_match);
> >  
> >  	if (!IS_ERR_OR_NULL(sw))
> >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > @@ -146,8 +161,10 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
> >  {
> >  	struct usb_role_switch *sw;
> >  
> > -	sw = fwnode_connection_find_match(fwnode, "usb-role-switch", NULL,
> > -					  usb_role_switch_match);
> > +	sw = usb_role_switch_is_parent(fwnode);
> > +	if (!sw)
> > +		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
> > +						  NULL, usb_role_switch_match);
> >  	if (!IS_ERR_OR_NULL(sw))
> >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> >  
> > -- 
> > 2.21.0
> 
> thanks,
> 


