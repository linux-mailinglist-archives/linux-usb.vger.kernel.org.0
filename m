Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2932AC3532
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfJANIW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:08:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42070 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJANIV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:08:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so7947287pff.9
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zlSV04UbfNObM5Dno6JsQbj+cpyz4HmYuzwjsyaCCK0=;
        b=aj58+k+U7jz4Wx/F/Kj1ho2IiOV/P0TUY1/rRWStYOLwjVjavXm8Z6kTiAoa+sCFv4
         S++10mT9737HF8GzVzFULLpYxCocXUugnZdp/yqbE2chufXwR/o4+Fc47QqECZu0Z+c9
         gHlR1eZckzH5rFS16AUI+SjyEa1y5Kanqt7wLbgfdqSazt8200JbOZ5ZjF3onHoBHPYT
         tXzTEj5GQw4ksFSqdKgaAcdB9LWBi416tNN6TOdFwhzO0M2MzFcybfzU8fxSUUntT/lX
         xdw0PRQQNsh/nUc8QfFOdQxT9B5jzkLxxlSw642hzeUNeHxqcR2vcVp1i1JzMhn91TEG
         g21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zlSV04UbfNObM5Dno6JsQbj+cpyz4HmYuzwjsyaCCK0=;
        b=aMgxbOQbPTuquxm1NHnvR2Oe8PCKHbcsUNKpoWa7K4Ul3OVLdpdX4ErFHcKhTo/uq8
         GrIeNnY5Vi7TB69OuFmhbQAc0xGMYfXJidRPtZ7AtHGPvOFNhIKJzg6m6/TAbJkP2BX7
         /8BebWE0xeVzy0lKIBU1TCHsJvavqBtoOl61nMOajgQ4ILunrmWKISzsWNid7S61Lvnx
         IdXICqpXSpZ4+Oc12hYUOSzHywKkfhOk1frGhU56XrDIvVMg6KeiuOfCjntWUkpPWT1p
         8aKDhAWY5gZC9kCggup7mPxnfp8D3u2xGZVcKvwmcSW4yeSMKMyjxyWJ/iFq/P0O5lin
         oj5g==
X-Gm-Message-State: APjAAAVhkRzfnGDjVbuWmuDZ5N9xwaS499Pbl7TsMyU6go7NWOMcKxxQ
        LcQx6rfMHP0KnnmJyarnNV72RL3c
X-Google-Smtp-Source: APXvYqy/JmX96pySfYJraCiSWSVbB/BfYTETWId7Z02tDzgHAkxdaUdsAMpxTnnd5s/4H4nqlZwWuQ==
X-Received: by 2002:a63:4661:: with SMTP id v33mr29883305pgk.258.1569935300702;
        Tue, 01 Oct 2019 06:08:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 22sm16369505pfj.139.2019.10.01.06.08.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:08:19 -0700 (PDT)
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:08:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> Copying everything from struct typec_capability to struct
> typec_port during port registration.
> 
What is the purpose of this patch ? To reduce the number of indirections at
runtime, or to avoid having to have cap around ?

FWIW, it looks like the code doesn't copy _all_ variables (eg cap->try_role),
and it doesn't drop port->cap. Am I missing something ?

> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++--------------
>   1 file changed, 35 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 94a3eda62add..3835e2d9fba6 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -46,8 +46,14 @@ struct typec_port {
>   	enum typec_role			vconn_role;
>   	enum typec_pwr_opmode		pwr_opmode;
>   	enum typec_port_type		port_type;
> +	enum typec_port_type		fixed_role;
> +	enum typec_port_data		port_roles;
> +	enum typec_accessory		accessory[TYPEC_MAX_ACCESSORY];

Would a pointer to cap->accessory be sufficient ? Or is there a reason to copy
the actual array ?

>   	struct mutex			port_type_lock;
>   
> +	u16				revision;
> +	u16				pd_revision;
> +
>   	enum typec_orientation		orientation;
>   	struct typec_switch		*sw;
>   	struct typec_mux		*mux;
> @@ -950,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>   	int role;
>   	int ret;
>   
> -	if (port->cap->type != TYPEC_PORT_DRP) {
> +	if (port->fixed_role != TYPEC_PORT_DRP) {
>   		dev_dbg(dev, "Preferred role only supported with DRP ports\n");
>   		return -EOPNOTSUPP;
>   	}
> @@ -982,7 +988,7 @@ preferred_role_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct typec_port *port = to_typec_port(dev);
>   
> -	if (port->cap->type != TYPEC_PORT_DRP)
> +	if (port->fixed_role != TYPEC_PORT_DRP)
>   		return 0;
>   
>   	if (port->prefer_role < 0)
> @@ -1009,7 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
>   		return ret;
>   
>   	mutex_lock(&port->port_type_lock);
> -	if (port->cap->data != TYPEC_PORT_DRD) {
> +	if (port->port_roles != TYPEC_PORT_DRD) {
>   		ret = -EOPNOTSUPP;
>   		goto unlock_and_ret;
>   	}
> @@ -1029,7 +1035,7 @@ static ssize_t data_role_show(struct device *dev,
>   {
>   	struct typec_port *port = to_typec_port(dev);
>   
> -	if (port->cap->data == TYPEC_PORT_DRD)
> +	if (port->port_roles == TYPEC_PORT_DRD)
>   		return sprintf(buf, "%s\n", port->data_role == TYPEC_HOST ?
>   			       "[host] device" : "host [device]");
>   
> @@ -1044,7 +1050,7 @@ static ssize_t power_role_store(struct device *dev,
>   	struct typec_port *port = to_typec_port(dev);
>   	int ret;
>   
> -	if (!port->cap->pd_revision) {
> +	if (!port->pd_revision) {
>   		dev_dbg(dev, "USB Power Delivery not supported\n");
>   		return -EOPNOTSUPP;
>   	}
> @@ -1064,9 +1070,9 @@ static ssize_t power_role_store(struct device *dev,
>   		return ret;
>   
>   	mutex_lock(&port->port_type_lock);
> -	if (port->port_type != TYPEC_PORT_DRP) {
> +	if (port->fixed_role != TYPEC_PORT_DRP) {

This is a semantic change: Previously, it compared the _current_ port type.
Now it compares the initial (fixed) port type. Is this on purpose ?

[ comment written before I noticed the change below. See there. ]

>   		dev_dbg(dev, "port type fixed at \"%s\"",
> -			     typec_port_power_roles[port->port_type]);
> +			     typec_port_power_roles[port->fixed_role]);
>   		ret = -EOPNOTSUPP;
>   		goto unlock_and_ret;
>   	}
> @@ -1086,7 +1092,7 @@ static ssize_t power_role_show(struct device *dev,
>   {
>   	struct typec_port *port = to_typec_port(dev);
>   
> -	if (port->cap->type == TYPEC_PORT_DRP)
> +	if (port->fixed_role == TYPEC_PORT_DRP)
>   		return sprintf(buf, "%s\n", port->pwr_role == TYPEC_SOURCE ?
>   			       "[source] sink" : "source [sink]");
>   
> @@ -1102,7 +1108,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   	int ret;
>   	enum typec_port_type type;
>   
> -	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
> +	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
>   		dev_dbg(dev, "changing port type not supported\n");
>   		return -EOPNOTSUPP;
>   	}
> @@ -1114,7 +1120,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   	type = ret;
>   	mutex_lock(&port->port_type_lock);
>   
> -	if (port->port_type == type) {
> +	if (port->fixed_role == type) {

This seems wrong.

>   		ret = size;
>   		goto unlock_and_ret;
>   	}
> @@ -1123,7 +1129,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   	if (ret)
>   		goto unlock_and_ret;
>   
> -	port->port_type = type;
> +	port->fixed_role = type;

As does this. It changes the semantics of all checks that used to be against
port->cap->type, except for the one I commented on above. If that is intentional,
the variable name "fixed_role" seems inappropriate.

Overall, I would have thought that "fixed_role" could essentially be a boolean,
set to true if cap->type is not TYPEC_PORT_DRP. That would make the code easier
to understand. Right now I am just confused about the use of port_type vs.
fixed_role.

>   	ret = size;
>   
>   unlock_and_ret:
> @@ -1137,11 +1143,11 @@ port_type_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct typec_port *port = to_typec_port(dev);
>   
> -	if (port->cap->type == TYPEC_PORT_DRP)
> +	if (port->fixed_role == TYPEC_PORT_DRP)
>   		return sprintf(buf, "%s\n",
> -			       typec_port_types_drp[port->port_type]);
> +			       typec_port_types_drp[port->fixed_role]);
>   
> -	return sprintf(buf, "[%s]\n", typec_port_power_roles[port->cap->type]);
> +	return sprintf(buf, "[%s]\n", typec_port_power_roles[port->fixed_role]);
>   }
>   static DEVICE_ATTR_RW(port_type);
>   
> @@ -1170,7 +1176,7 @@ static ssize_t vconn_source_store(struct device *dev,
>   	bool source;
>   	int ret;
>   
> -	if (!port->cap->pd_revision) {
> +	if (!port->pd_revision) {
>   		dev_dbg(dev, "VCONN swap depends on USB Power Delivery\n");
>   		return -EOPNOTSUPP;
>   	}
> @@ -1209,10 +1215,10 @@ static ssize_t supported_accessory_modes_show(struct device *dev,
>   	ssize_t ret = 0;
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(port->cap->accessory); i++) {
> -		if (port->cap->accessory[i])
> +	for (i = 0; i < ARRAY_SIZE(port->accessory); i++) {
> +		if (port->accessory[i])
>   			ret += sprintf(buf + ret, "%s ",
> -			       typec_accessory_modes[port->cap->accessory[i]]);
> +			       typec_accessory_modes[port->accessory[i]]);
>   	}
>   
>   	if (!ret)
> @@ -1229,7 +1235,7 @@ static ssize_t usb_typec_revision_show(struct device *dev,
>   				       char *buf)
>   {
>   	struct typec_port *port = to_typec_port(dev);
> -	u16 rev = port->cap->revision;
> +	u16 rev = port->revision;
>   
>   	return sprintf(buf, "%d.%d\n", (rev >> 8) & 0xff, (rev >> 4) & 0xf);
>   }
> @@ -1241,7 +1247,7 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
>   {
>   	struct typec_port *p = to_typec_port(dev);
>   
> -	return sprintf(buf, "%d\n", (p->cap->pd_revision >> 8) & 0xff);
> +	return sprintf(buf, "%d\n", (p->pd_revision >> 8) & 0xff);
>   }
>   static DEVICE_ATTR_RO(usb_power_delivery_revision);
>   
> @@ -1532,6 +1538,7 @@ struct typec_port *typec_register_port(struct device *parent,
>   	struct typec_port *port;
>   	int ret;
>   	int id;
> +	int i;
>   
>   	port = kzalloc(sizeof(*port), GFP_KERNEL);
>   	if (!port)
> @@ -1581,8 +1588,16 @@ struct typec_port *typec_register_port(struct device *parent,
>   	port->id = id;
>   	port->cap = cap;
>   	port->port_type = cap->type;
> +	port->fixed_role = cap->type;
> +	port->port_roles = cap->data;
>   	port->prefer_role = cap->prefer_role;
>   
> +	port->revision = cap->revision;
> +	port->pd_revision = cap->pd_revision;
> +
> +	for (i = 0; i < TYPEC_MAX_ACCESSORY; i++)
> +		port->accessory[i] = cap->accessory[i];
> +
>   	device_initialize(&port->dev);
>   	port->dev.class = typec_class;
>   	port->dev.parent = parent;
> 

