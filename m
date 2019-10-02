Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEC6C8E7F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 18:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfJBQgn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 12:36:43 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44226 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfJBQgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 12:36:43 -0400
Received: by mail-pg1-f193.google.com with SMTP id i14so12108958pgt.11
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 09:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aTajeG9zclia2pFGQdl4zC0I56P0kV2+jk6xa3m8XQs=;
        b=JVMsSVrekmbvx+8Lx6bep87jkErWLbXHgxIKUMfaWzt7aiFtpuQ/Nac0se+5Qs/Wk1
         yK0yOFsN0JWhCaojEgCYrmGqcLrLruVQn0AEmGiyTQdwcrKpg2Ujx4n/ACUlDAuko339
         yxTgSuLwrlFxczgihBjQIiJo0KV6ck+WGziodQOB7k+NyOJo7Oh09JEmM1DCyknM8TwU
         X0oDMqzSIZqk7Adz0GWT0A9sBI0b2KZHmfkVhWRjl3DvXFXvhwkhu6OvzSBEmdBhexNd
         XcIu+08Yqnn83Ow/7kZDyHzvl6cWNM0aXeCG6haLayb7Gb/1QDK/+iqz0CHHFdNTMGqC
         nncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=aTajeG9zclia2pFGQdl4zC0I56P0kV2+jk6xa3m8XQs=;
        b=OYVVRL+QMQPM/2Bq8dpqTzK3b2XYTl4LpVNVi/tDr9efoG2HnDRzLYxuylgmMHQyD9
         MtrPMtCn8axSrTAsCUKhVDotcSzzUcoyJQM8+rXVcrY1GzRjOJamvvFnaogfuTJ0Geuz
         q1cJdcFnOdo/mRAxGK9kE5Xqrs5YoKV63SM/jrNZd4mMCYyoXfuZWrMOZIYFIayn7Rsx
         Xny0Q7bhWb4YF+3XMwkyyp/nDq4E5M9FvDU9mPqT8TQprPn7LQ4SMmGcTDOHGUj+BZV1
         d8ltU/5Gaje9GRZHSHB0kjWXQ9j6ufxcwRbeyl3aQg6oK8OEMmZotxm72OLsgkFw8q+0
         wkBQ==
X-Gm-Message-State: APjAAAWjvPWNzLRmWgVSzmPA4GeYaY4+z/19qDjBie5QQhryKC/qdq6I
        abvSfFFV1d0fZCvEWsNAq8M=
X-Google-Smtp-Source: APXvYqyx/h9P0hNQvbwN9ZT7GG5E2QcEyQV4PDlSqHGpLvDPIHxrmVdKvXHY8EyCRr76e04k2F3s1Q==
X-Received: by 2002:aa7:9d8e:: with SMTP id f14mr5667296pfq.217.1570034202470;
        Wed, 02 Oct 2019 09:36:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u1sm5755286pjn.3.2019.10.02.09.36.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 09:36:40 -0700 (PDT)
Date:   Wed, 2 Oct 2019 09:36:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191002163639.GA30400@roeck-us.net>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
 <20191002160652.GB19836@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002160652.GB19836@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 07:06:52PM +0300, Heikki Krogerus wrote:
> On Tue, Oct 01, 2019 at 06:08:17AM -0700, Guenter Roeck wrote:
> > On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> > > Copying everything from struct typec_capability to struct
> > > typec_port during port registration.
> > > 
> > What is the purpose of this patch ? To reduce the number of indirections at
> > runtime, or to avoid having to have cap around ?
> 
> To get rid of the cap member.
> 
> > FWIW, it looks like the code doesn't copy _all_ variables (eg cap->try_role),
> > and it doesn't drop port->cap. Am I missing something ?
> 
> We can't drop port->cap at this point because the drivers still depend
> on it. This patch is the "prepare" phase of the series. The last patch
> in the series finally drops the member. I'll improve the commit message.
> 
Yes, I figured that with the later patches. Sorry for the noise.

> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > >   drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++--------------
> > >   1 file changed, 35 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > > index 94a3eda62add..3835e2d9fba6 100644
> > > --- a/drivers/usb/typec/class.c
> > > +++ b/drivers/usb/typec/class.c
> > > @@ -46,8 +46,14 @@ struct typec_port {
> > >   	enum typec_role			vconn_role;
> > >   	enum typec_pwr_opmode		pwr_opmode;
> > >   	enum typec_port_type		port_type;
> > > +	enum typec_port_type		fixed_role;
> > > +	enum typec_port_data		port_roles;
> > > +	enum typec_accessory		accessory[TYPEC_MAX_ACCESSORY];
> > 
> > Would a pointer to cap->accessory be sufficient ? Or is there a reason to copy
> > the actual array ?
> 
> No. The point is to get rid of the cap member.
> 
> > >   	struct mutex			port_type_lock;
> > > +	u16				revision;
> > > +	u16				pd_revision;
> > > +
> > >   	enum typec_orientation		orientation;
> > >   	struct typec_switch		*sw;
> > >   	struct typec_mux		*mux;
> > > @@ -950,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
> > >   	int role;
> > >   	int ret;
> > > -	if (port->cap->type != TYPEC_PORT_DRP) {
> > > +	if (port->fixed_role != TYPEC_PORT_DRP) {
> > >   		dev_dbg(dev, "Preferred role only supported with DRP ports\n");
> > >   		return -EOPNOTSUPP;
> > >   	}
> > > @@ -982,7 +988,7 @@ preferred_role_show(struct device *dev, struct device_attribute *attr,
> > >   {
> > >   	struct typec_port *port = to_typec_port(dev);
> > > -	if (port->cap->type != TYPEC_PORT_DRP)
> > > +	if (port->fixed_role != TYPEC_PORT_DRP)
> > >   		return 0;
> > >   	if (port->prefer_role < 0)
> > > @@ -1009,7 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
> > >   		return ret;
> > >   	mutex_lock(&port->port_type_lock);
> > > -	if (port->cap->data != TYPEC_PORT_DRD) {
> > > +	if (port->port_roles != TYPEC_PORT_DRD) {
> > >   		ret = -EOPNOTSUPP;
> > >   		goto unlock_and_ret;
> > >   	}
> > > @@ -1029,7 +1035,7 @@ static ssize_t data_role_show(struct device *dev,
> > >   {
> > >   	struct typec_port *port = to_typec_port(dev);
> > > -	if (port->cap->data == TYPEC_PORT_DRD)
> > > +	if (port->port_roles == TYPEC_PORT_DRD)
> > >   		return sprintf(buf, "%s\n", port->data_role == TYPEC_HOST ?
> > >   			       "[host] device" : "host [device]");
> > > @@ -1044,7 +1050,7 @@ static ssize_t power_role_store(struct device *dev,
> > >   	struct typec_port *port = to_typec_port(dev);
> > >   	int ret;
> > > -	if (!port->cap->pd_revision) {
> > > +	if (!port->pd_revision) {
> > >   		dev_dbg(dev, "USB Power Delivery not supported\n");
> > >   		return -EOPNOTSUPP;
> > >   	}
> > > @@ -1064,9 +1070,9 @@ static ssize_t power_role_store(struct device *dev,
> > >   		return ret;
> > >   	mutex_lock(&port->port_type_lock);
> > > -	if (port->port_type != TYPEC_PORT_DRP) {
> > > +	if (port->fixed_role != TYPEC_PORT_DRP) {
> > 
> > This is a semantic change: Previously, it compared the _current_ port type.
> > Now it compares the initial (fixed) port type. Is this on purpose ?
> > 
> > [ comment written before I noticed the change below. See there. ]
> > 
> > >   		dev_dbg(dev, "port type fixed at \"%s\"",
> > > -			     typec_port_power_roles[port->port_type]);
> > > +			     typec_port_power_roles[port->fixed_role]);
> > >   		ret = -EOPNOTSUPP;
> > >   		goto unlock_and_ret;
> > >   	}
> > > @@ -1086,7 +1092,7 @@ static ssize_t power_role_show(struct device *dev,
> > >   {
> > >   	struct typec_port *port = to_typec_port(dev);
> > > -	if (port->cap->type == TYPEC_PORT_DRP)
> > > +	if (port->fixed_role == TYPEC_PORT_DRP)
> > >   		return sprintf(buf, "%s\n", port->pwr_role == TYPEC_SOURCE ?
> > >   			       "[source] sink" : "source [sink]");
> > > @@ -1102,7 +1108,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> > >   	int ret;
> > >   	enum typec_port_type type;
> > > -	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
> > > +	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
> > >   		dev_dbg(dev, "changing port type not supported\n");
> > >   		return -EOPNOTSUPP;
> > >   	}
> > > @@ -1114,7 +1120,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> > >   	type = ret;
> > >   	mutex_lock(&port->port_type_lock);
> > > -	if (port->port_type == type) {
> > > +	if (port->fixed_role == type) {
> > 
> > This seems wrong.
> > 
> > >   		ret = size;
> > >   		goto unlock_and_ret;
> > >   	}
> > > @@ -1123,7 +1129,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> > >   	if (ret)
> > >   		goto unlock_and_ret;
> > > -	port->port_type = type;
> > > +	port->fixed_role = type;
> > 
> > As does this. It changes the semantics of all checks that used to be against
> > port->cap->type, except for the one I commented on above. If that is intentional,
> > the variable name "fixed_role" seems inappropriate.
> > 
> > Overall, I would have thought that "fixed_role" could essentially be a boolean,
> > set to true if cap->type is not TYPEC_PORT_DRP. That would make the code easier
> > to understand. Right now I am just confused about the use of port_type vs.
> > fixed_role.
> 
> Because the idea is to get rid of the cap member, I have to store the
> actual capability of the port in one member, and the one supplied by
> the user in another new member. I chose to use the "port_type" member
> to hold the actual capability of the port, and introduced the
> "fixed_type" to hold the one given by the user.
> 

port->cap->type used to be the role provided by the low level driver.
That was static, and it was not possible to override it. It did not
resemble the current port type, or a configured port type, it resembled
port capabilities.

Your code changes that, meaning even if the low level driver (effectively
the hardware) states that it can not support DRP, it is now configurable
anyway. That seems to me like a substantial change to the original meaning
of this attribute.

Effectiv ely there are now three values,
- port->port_type	the current port tyle
- port->fixed_type	the type selected by the user
- port->cap->type	the type provided by low level code,
			now no longer available / used

Even if the low level driver (hardware) says that it can not support
TYPEC_PORT_DRP, that can be overwritten by the user. Maybe there is a
good reason for that, but I don't see it, sorry.

Maybe it would make sense to introduce port->fixed_type in a separate patch.
As part of that patch you could explain why port->cap->type, ie a reflection
of the port capabilities, is no longer needed.

Thanks,
Guenter
