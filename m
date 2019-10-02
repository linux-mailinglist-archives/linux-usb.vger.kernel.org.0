Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3DA9C8DA0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 18:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbfJBQG4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 12:06:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:54468 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfJBQGz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Oct 2019 12:06:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 09:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; 
   d="scan'208";a="205369808"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 02 Oct 2019 09:06:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 02 Oct 2019 19:06:52 +0300
Date:   Wed, 2 Oct 2019 19:06:52 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191002160652.GB19836@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 06:08:17AM -0700, Guenter Roeck wrote:
> On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> > Copying everything from struct typec_capability to struct
> > typec_port during port registration.
> > 
> What is the purpose of this patch ? To reduce the number of indirections at
> runtime, or to avoid having to have cap around ?

To get rid of the cap member.

> FWIW, it looks like the code doesn't copy _all_ variables (eg cap->try_role),
> and it doesn't drop port->cap. Am I missing something ?

We can't drop port->cap at this point because the drivers still depend
on it. This patch is the "prepare" phase of the series. The last patch
in the series finally drops the member. I'll improve the commit message.

> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >   drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++--------------
> >   1 file changed, 35 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 94a3eda62add..3835e2d9fba6 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -46,8 +46,14 @@ struct typec_port {
> >   	enum typec_role			vconn_role;
> >   	enum typec_pwr_opmode		pwr_opmode;
> >   	enum typec_port_type		port_type;
> > +	enum typec_port_type		fixed_role;
> > +	enum typec_port_data		port_roles;
> > +	enum typec_accessory		accessory[TYPEC_MAX_ACCESSORY];
> 
> Would a pointer to cap->accessory be sufficient ? Or is there a reason to copy
> the actual array ?

No. The point is to get rid of the cap member.

> >   	struct mutex			port_type_lock;
> > +	u16				revision;
> > +	u16				pd_revision;
> > +
> >   	enum typec_orientation		orientation;
> >   	struct typec_switch		*sw;
> >   	struct typec_mux		*mux;
> > @@ -950,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
> >   	int role;
> >   	int ret;
> > -	if (port->cap->type != TYPEC_PORT_DRP) {
> > +	if (port->fixed_role != TYPEC_PORT_DRP) {
> >   		dev_dbg(dev, "Preferred role only supported with DRP ports\n");
> >   		return -EOPNOTSUPP;
> >   	}
> > @@ -982,7 +988,7 @@ preferred_role_show(struct device *dev, struct device_attribute *attr,
> >   {
> >   	struct typec_port *port = to_typec_port(dev);
> > -	if (port->cap->type != TYPEC_PORT_DRP)
> > +	if (port->fixed_role != TYPEC_PORT_DRP)
> >   		return 0;
> >   	if (port->prefer_role < 0)
> > @@ -1009,7 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
> >   		return ret;
> >   	mutex_lock(&port->port_type_lock);
> > -	if (port->cap->data != TYPEC_PORT_DRD) {
> > +	if (port->port_roles != TYPEC_PORT_DRD) {
> >   		ret = -EOPNOTSUPP;
> >   		goto unlock_and_ret;
> >   	}
> > @@ -1029,7 +1035,7 @@ static ssize_t data_role_show(struct device *dev,
> >   {
> >   	struct typec_port *port = to_typec_port(dev);
> > -	if (port->cap->data == TYPEC_PORT_DRD)
> > +	if (port->port_roles == TYPEC_PORT_DRD)
> >   		return sprintf(buf, "%s\n", port->data_role == TYPEC_HOST ?
> >   			       "[host] device" : "host [device]");
> > @@ -1044,7 +1050,7 @@ static ssize_t power_role_store(struct device *dev,
> >   	struct typec_port *port = to_typec_port(dev);
> >   	int ret;
> > -	if (!port->cap->pd_revision) {
> > +	if (!port->pd_revision) {
> >   		dev_dbg(dev, "USB Power Delivery not supported\n");
> >   		return -EOPNOTSUPP;
> >   	}
> > @@ -1064,9 +1070,9 @@ static ssize_t power_role_store(struct device *dev,
> >   		return ret;
> >   	mutex_lock(&port->port_type_lock);
> > -	if (port->port_type != TYPEC_PORT_DRP) {
> > +	if (port->fixed_role != TYPEC_PORT_DRP) {
> 
> This is a semantic change: Previously, it compared the _current_ port type.
> Now it compares the initial (fixed) port type. Is this on purpose ?
> 
> [ comment written before I noticed the change below. See there. ]
> 
> >   		dev_dbg(dev, "port type fixed at \"%s\"",
> > -			     typec_port_power_roles[port->port_type]);
> > +			     typec_port_power_roles[port->fixed_role]);
> >   		ret = -EOPNOTSUPP;
> >   		goto unlock_and_ret;
> >   	}
> > @@ -1086,7 +1092,7 @@ static ssize_t power_role_show(struct device *dev,
> >   {
> >   	struct typec_port *port = to_typec_port(dev);
> > -	if (port->cap->type == TYPEC_PORT_DRP)
> > +	if (port->fixed_role == TYPEC_PORT_DRP)
> >   		return sprintf(buf, "%s\n", port->pwr_role == TYPEC_SOURCE ?
> >   			       "[source] sink" : "source [sink]");
> > @@ -1102,7 +1108,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> >   	int ret;
> >   	enum typec_port_type type;
> > -	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
> > +	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
> >   		dev_dbg(dev, "changing port type not supported\n");
> >   		return -EOPNOTSUPP;
> >   	}
> > @@ -1114,7 +1120,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> >   	type = ret;
> >   	mutex_lock(&port->port_type_lock);
> > -	if (port->port_type == type) {
> > +	if (port->fixed_role == type) {
> 
> This seems wrong.
> 
> >   		ret = size;
> >   		goto unlock_and_ret;
> >   	}
> > @@ -1123,7 +1129,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> >   	if (ret)
> >   		goto unlock_and_ret;
> > -	port->port_type = type;
> > +	port->fixed_role = type;
> 
> As does this. It changes the semantics of all checks that used to be against
> port->cap->type, except for the one I commented on above. If that is intentional,
> the variable name "fixed_role" seems inappropriate.
> 
> Overall, I would have thought that "fixed_role" could essentially be a boolean,
> set to true if cap->type is not TYPEC_PORT_DRP. That would make the code easier
> to understand. Right now I am just confused about the use of port_type vs.
> fixed_role.

Because the idea is to get rid of the cap member, I have to store the
actual capability of the port in one member, and the one supplied by
the user in another new member. I chose to use the "port_type" member
to hold the actual capability of the port, and introduced the
"fixed_type" to hold the one given by the user.

I'm happy to improve this, but I'm not sure what are you proposing
here? Note. We can not use boolean variable here, because the user may
also decide to set the value to "dual".

This is a bit off topic, but that attribute file is really horrible.
Right now there is no way to know the actual capability of the
port in user space. If something changes a DRP port into sink or
source, there is no way to know after that that the port is actually
DRP capable.

So that ABI is "buggy", but even without the problem, I still really
think that allowing the capabilities to be changed like that in
general is completely wrong. I don't have a problem with changing the
capabilities, but IMO it should be handled at one level higher, at the
controller device level. If the capabilities of a port need to be
changed, the old port should be removed, and a new with the new
capabilities registered. That is the only way to handle it without
making things unnecessarily difficult for the user space.

I'm pretty sure that that was my counter proposal already at the time
when the attribute file was introduced, but I don't remember why
wasn't it accepted at the time? My protest against adding that
attribute file was in any case ignored :-(. In any case, my plan was
to later propose a new sysfs group that we offer to the parent
controller devices instead assigning it to the port devices, and that
group is meant to allow port capability changes the way I explained
above. Unless of course you are against it?

thanks,

-- 
heikki
