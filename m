Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA1922D9E
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 10:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730571AbfETIEH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 04:04:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:19097 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbfETIEH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 May 2019 04:04:07 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 May 2019 01:04:06 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2019 01:04:00 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 May 2019 11:03:59 +0300
Date:   Mon, 20 May 2019 11:03:59 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Biju Das <biju.das@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by node
Message-ID: <20190520080359.GC1887@kuha.fi.intel.com>
References: <1557823643-8616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1557823643-8616-5-git-send-email-chunfeng.yun@mediatek.com>
 <20190517103736.GA1490@kuha.fi.intel.com>
 <20190517130511.GA1887@kuha.fi.intel.com>
 <1558319951.10179.352.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558319951.10179.352.camel@mhfsdcap03>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 20, 2019 at 10:39:11AM +0800, Chunfeng Yun wrote:
> Hi,
> On Fri, 2019-05-17 at 16:05 +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Fri, May 17, 2019 at 01:37:36PM +0300, Heikki Krogerus wrote:
> > > On Tue, May 14, 2019 at 04:47:21PM +0800, Chunfeng Yun wrote:
> > > > Add fwnode_usb_role_switch_get() to make easier to get
> > > > usb_role_switch by fwnode which register it.
> > > > It's useful when there is not device_connection registered
> > > > between two drivers and only knows the fwnode which register
> > > > usb_role_switch.
> > > > 
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > Tested-by: Biju Das <biju.das@bp.renesas.com>
> > > 
> > > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > Hold on. I just noticed Rob's comment on patch 2/6, where he points out
> > that you don't need to use device graph since the controller is the
> > parent of the connector. Doesn't that mean you don't really need this
> > API?
> No, I still need it. 
> The change is about the way how to get fwnode;
> when use device graph, get fwnode by of_graph_get_remote_node();
> but now will get fwnode by of_get_parent();

OK, I get that, but I'm still not convinced about if something like
this function is needed at all. I also have concerns regarding how you
are using the function. I'll explain in comment to the patch 5/6 in
this series...

> > > > ---
> > > > v5 changes:
> > > >  1. remove linux/of.h suggested by Biju
> > > >  2. add tested by Biju
> > > > 
> > > > Note: still depends on [1]
> > > >  [1]: [v6,08/13] usb: roles: Introduce stubs for the exiting functions in role.h
> > > >       https://patchwork.kernel.org/patch/10909971/
> > > > 
> > > > v4 changes:
> > > >   1. use switch_fwnode_match() to find fwnode suggested by Heikki
> > > >   2. this patch now depends on [1]
> > > > 
> > > >  [1] [v6,08/13] usb: roles: Introduce stubs for the exiting functions in role.h
> > > >     https://patchwork.kernel.org/patch/10909971/
> > > > 
> > > > v3 changes:
> > > >   1. use fwnodes instead of node suggested by Andy
> > > >   2. rebuild the API suggested by Heikki
> > > > 
> > > > v2 no changes
> > > > ---
> > > >  drivers/usb/roles/class.c | 24 ++++++++++++++++++++++++
> > > >  include/linux/usb/role.h  |  8 ++++++++
> > > >  2 files changed, 32 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > > > index f45d8df5cfb8..4a1f09a41ec0 100644
> > > > --- a/drivers/usb/roles/class.c
> > > > +++ b/drivers/usb/roles/class.c
> > > > @@ -135,6 +135,30 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> > > >  
> > > > +/**
> > > > + * fwnode_usb_role_switch_get - Find USB role switch by it's parent fwnode
> > > > + * @fwnode: The fwnode that register USB role switch
> > > > + *
> > > > + * Finds and returns role switch registered by @fwnode. The reference count
> > > > + * for the found switch is incremented.
> > > > + */
> > > > +struct usb_role_switch *
> > > > +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
> > > > +{
> > > > +	struct usb_role_switch *sw;
> > > > +	struct device *dev;
> > > > +
> > > > +	dev = class_find_device(role_class, NULL, fwnode, switch_fwnode_match);
> > > > +	if (!dev)
> > > > +		return ERR_PTR(-EPROBE_DEFER);
> > > > +
> > > > +	sw = to_role_switch(dev);
> > > > +	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > > > +
> > > > +	return sw;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> > 
> > This function only basically converts the fwnode to usb_role_switch,
> > but I would actually prefer that we walked through the device graph
> > here instead of expecting the caller to do that.
> > 
> > So this function should probable be called fwnode_to_usb_role_switch()
> > and not fwnode_usb_role_switch_get(), but I guess you don't need it
> > at all, right?
> > 
> > 
> > thanks,
> > 
> 

-- 
heikki
