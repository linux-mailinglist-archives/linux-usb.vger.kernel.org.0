Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCB1359F85
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbhDINGw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:06:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:25493 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDINGv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 09:06:51 -0400
IronPort-SDR: Do4wT5DNrBWAKy/01fuOO2NCgU/MAlwG3UwpTqoXmdLZiEpzBg7B+JHvoncf/Sd6/tI6IRHvue
 iFfuqKds6d+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="257739833"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="257739833"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 06:06:38 -0700
IronPort-SDR: UZOwSf86vHSjZ1w+nbkflhK5SYgMfixQz6G67oEy77yJUmqw4JXa28auKASZJOsYkU4DCr5Kj1
 v8l7ajHvb6kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520277812"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2021 06:06:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 09 Apr 2021 16:06:35 +0300
Date:   Fri, 9 Apr 2021 16:06:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
Message-ID: <YHBRW6nep7inwY/c@kuha.fi.intel.com>
References: <20210408203129.526604-1-hdegoede@redhat.com>
 <20210408203129.526604-2-hdegoede@redhat.com>
 <YHAyah2n+yKnAT7d@kuha.fi.intel.com>
 <d2f809ef-9e9f-ed00-f8f1-acb4d75a786a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2f809ef-9e9f-ed00-f8f1-acb4d75a786a@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 09, 2021 at 02:49:05PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/9/21 12:54 PM, Heikki Krogerus wrote:
> > Hi Hans,
> > 
> > On Thu, Apr 08, 2021 at 10:31:27PM +0200, Hans de Goede wrote:
> >> This can be used by Type-C controller drivers which use a standard
> >> usb-connector fwnode, with altmodes sub-node, to describe the available
> >> altmodes.
> >>
> >> Note there are is no devicetree bindings documentation for the altmodes
> >> node, this is deliberate. ATM the fwnodes used to register the altmodes
> >> are only used internally to pass platform info from a drivers/platform/x86
> >> driver to the type-c subsystem.
> >>
> >> When a devicetree user of this functionally comes up and the dt-bindings
> >> have been hashed out the internal use can be adjusted to match the
> >> dt-bindings.
> >>
> >> Currently the typec_port_register_altmodes_from_fwnode() function expects
> >> an "altmodes" child fwnode on port->dev with this "altmodes" fwnode having
> >> child fwnodes itself with each child containing 2 integer properties:
> >>
> >> 1. A "svid" property, which sets the id of the altmode, e.g. displayport
> >> altmode has a svid of 0xff01.
> >>
> >> 2. A "vdo" property, typically used as a bitmask describing the
> >> capabilities of the altmode, the bits in the vdo are specified in the
> >> specification of the altmode.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Changes in v2:
> >> - Drop the unnecessary fwnode parameter from
> >>   typec_port_register_altmodes_from_fwnode()
> >> - Document the expected "altmodes" fwnode in the commit message for now
> >>   as v2 of the patch-set drops the dt-bindings since there are not DT
> >>   users for this yet
> >> ---
> >>  drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++++++++++++++++
> >>  include/linux/usb/typec.h |  6 +++++
> >>  2 files changed, 61 insertions(+)
> >>
> >> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> >> index 45f0bf65e9ab..a82344fe1650 100644
> >> --- a/drivers/usb/typec/class.c
> >> +++ b/drivers/usb/typec/class.c
> >> @@ -1978,6 +1978,61 @@ typec_port_register_altmode(struct typec_port *port,
> >>  }
> >>  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
> >>  
> >> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> >> +	const struct typec_altmode_ops *ops, void *drvdata,
> >> +	struct typec_altmode **altmodes, size_t n)
> > 
> > Couldn't we just call this typec_port_register_altmodes()?
> 
> Ack, will fix for v3.
> 
> >> +{
> >> +	struct fwnode_handle *altmodes_node, *child;
> >> +	struct typec_altmode_desc desc;
> >> +	struct typec_altmode *alt;
> >> +	size_t index = 0;
> >> +	u32 svid, vdo;
> >> +	int ret;
> >> +
> >> +	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
> >> +	if (!altmodes_node)
> >> +		return; /* No altmodes specified */
> >> +
> >> +	child = NULL;
> >> +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
> > 
> > fwnode_for_each_child_node()?
> 
> Ack, will fix for v3.
> 
> > 
> >> +		ret = fwnode_property_read_u32(child, "svid", &svid);
> >> +		if (ret) {
> >> +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
> >> +				fwnode_get_name(child));
> >> +			continue;
> >> +		}
> >> +
> >> +		ret = fwnode_property_read_u32(child, "vdo", &vdo);
> >> +		if (ret) {
> >> +			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
> >> +				fwnode_get_name(child));
> >> +			continue;
> >> +		}
> >> +
> >> +		if (index >= n) {
> >> +			dev_err(&port->dev, "Error not enough space for altmode %s\n",
> >> +				fwnode_get_name(child));
> >> +			continue;
> >> +		}
> >> +
> >> +		desc.svid = svid;
> >> +		desc.vdo = vdo;
> >> +		desc.mode = index + 1;
> >> +		alt = typec_port_register_altmode(port, &desc);
> >> +		if (IS_ERR(alt)) {
> >> +			dev_err(&port->dev, "Error registering altmode %s\n",
> >> +				fwnode_get_name(child));
> >> +			continue;
> >> +		}
> >> +
> >> +		alt->ops = ops;
> >> +		typec_altmode_set_drvdata(alt, drvdata);
> >> +		altmodes[index] = alt;
> >> +		index++;
> >> +	}
> >> +}
> >> +EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
> > 
> > This is OK by me, but I've been wondering if it would be more clear to
> > just have a function fwnode_for_each_altmode() (I don't know if the
> > name is good enough).
> > 
> > int fwnode_for_each_altmode(struct fwnode_handle *fwnode,
> >                             int (*fn)(struct typec_altmode_desc *, void *),
> >                             void *data)
> > {
> >         struct fwnode_handle *altmodes_node, *child;
> >         struct typec_altmode_desc desc;
> > 	u32 svid, vdo;
> > 	int ret;
> > 
> > 	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> > 	if (!altmodes_node)
> > 		return 0; /* No altmodes specified */
> > 
> >         fwnode_for_each_child_node(altmodes_node, child) {
> >                 ...
> >                 /* read the properties */
> >                 ...
> > 
> > 		desc.svid = svid;
> > 		desc.vdo = vdo;
> > 		desc.mode = index + 1;
> > 
> >                 /* We need to add this member to struct typec_altmode_desc! */
> >                 desc.fwnode = client;
> > 
> >                 ret = fn(&desc, data);
> >                 if (ret)
> >                         return ret;
> >         }
> > 
> >         return 0;
> > }
> > 
> > Something like that. It would leave the registration of the alternate
> > modes to the drivers, which I think would actually be better.
> > 
> > If there ever is need, this can be also used for other things besides
> > mode registration.
> > 
> > What do you think?
> 
> I think adding such a helper might make sense once we actually have
> a need for the doing "other things" for all altmodes in a fwnode beside
> registering them.
> 
> And even then I think it would still make sense to have a
> typec_port_register_altmodes() helper for drivers to use, but that
> could then be a wrapper around fwnode_for_each_altmode().
> 
> Since ATM we have only 1 user for a fwnode_for_each_altmode()
> helper adding it now seems premature to me.
> 
> But if you have a strong preference for adding it now, then I can
> do that for v3.
> 
> If you let me know which way you want to go on this, then I'll
> prepare a v3.

It's API so we can change it later. Let's go with your function
first.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki
