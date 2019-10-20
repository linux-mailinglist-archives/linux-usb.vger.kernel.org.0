Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9678DE154
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 01:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfJTXzI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Oct 2019 19:55:08 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36544 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfJTXzI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Oct 2019 19:55:08 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so6607966pgk.3;
        Sun, 20 Oct 2019 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UodzCb9Apw3mQXV1vLdahuw4NY4qPkdKMWtR8HIneco=;
        b=rcGwPvyb2v5GDaP7i3CU5m0E05udPJiB8C1ga3XcXUSX21dMrh9XDlsdY5nJkWpIH9
         7ruD2HNXhwQFZYfKIoYHo+XI96Bko0Gjx8F1emjt6E8UmG2fT1jRMrp2MBDvcCs7g54G
         EHG5g20uZKOJDRFxKWYIWubEQCGcJYfh6BB1FbFZRRth6vjDDCAJZGMfUxZqOVGisDth
         1cQ9EZA3OIbk046inbHx6WqUjkKkyCrNfLmmHCilkYZKDY6/zcj5qZ2DySk2MGFiy6E4
         BNhB2sdYz4AJ3FAMUlNS91PZvkKRPBvARleZVdgX4hxTOO+4rOHKMRlU4sygZKkF/Cjq
         m29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UodzCb9Apw3mQXV1vLdahuw4NY4qPkdKMWtR8HIneco=;
        b=d1GU81EXN1YL+xdxXBawZsj/VHwthH52hNWjbRTzYcUbIXxPn5fJt0ovvWUd4F/SSB
         2mpvY7g+Si8yKHMH8mWJ46VOLB5f9Hwn9GUHawjgWLmYypMBkCfCHomLvwO994ODmren
         y90RhLXJAojq+mjIgZsW72v5rlAufsuBKxZrv3HUB9mseHZnvpLHpCN95s306jdxjzDL
         ckoIoAO2Q8wmOvI2m1GXNkAOx+t4+WYNeiruTzQzeUjdu9LyUO9KzAhTYwAiHcorrNfq
         DNhFjk8OblqY0eO6DelKrbfoL40Jod8+fdLBJ5DbU8YUSK2EkI1NMMQ2blOOeeJI379X
         sC1w==
X-Gm-Message-State: APjAAAUkclFg3+puOXWh3MmsQ2all8c4hAZ0efRYafZ490GqN6J6Bh+R
        71lQyqz2nJdk0qDq+IDIhBXQzcIs
X-Google-Smtp-Source: APXvYqwiFMZEHGLUDCsSu9iK5pzbH6Poj1XWnAso/wk8PmuHLz+73uwa9NgV9K0mJ/0syyIcDhLoLQ==
X-Received: by 2002:a62:3203:: with SMTP id y3mr18904481pfy.221.1571615706779;
        Sun, 20 Oct 2019 16:55:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o67sm12519518pje.17.2019.10.20.16.55.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 16:55:06 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: typec: tcpm: Add support for configuring DP
 altmode through device-properties
To:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20191018195719.94634-1-hdegoede@redhat.com>
 <20191018195719.94634-2-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1a3399f9-a95e-0557-06c2-5f255f9a7850@roeck-us.net>
Date:   Sun, 20 Oct 2019 16:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018195719.94634-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/18/19 12:57 PM, Hans de Goede wrote:
> Add support for configuring display-port altmode through device-properties.
> 
> We could try to add a generic mechanism for describing altmodes in
> device-properties, but various altmodes will likely need altmode specific
> configuration. E.g. the display-port altmode needs some way to describe
> which set of DP pins on the GPU is connected to the USB Type-C connector.
> 
> As such it is better to have a separate set of altmode specific properties
> per altmode and this commit adds a property for basic display-port altmode
> support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   .../bindings/connector/usb-connector.txt      |  3 ++
>   drivers/usb/typec/tcpm/tcpm.c                 | 33 +++++++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> index d357987181ee..7bae3cc9c76a 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> @@ -38,6 +38,9 @@ Optional properties for usb-c-connector:
>     or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
>   - data-role: should be one of "host", "device", "dual"(DRD) if typec
>     connector supports USB data.
> +- displayport-vdo: The presenence of this property indicates that the

 From a DT perspective, I wonder if the vdo properties should be listed
explicitly (capabilities, signaling, receptacle etc) or if it is ok to list
a single value. Either case, I wonder if the VDO should be explained in
more detail.

> +  usb-connector supports displayport-altmode (svid 0xff01), the value of
> +  this property is an u32 with the vdo value for the displayport-altmode,
>   

The added property will require approval by a DT maintainer.

>   Required properties for usb-c-connector with power delivery support:
>   - source-pdos: An array of u32 with each entry providing supported power
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c5fa18759f8e..2e3096657e96 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -28,6 +28,7 @@
>   #include <linux/usb/role.h>
>   #include <linux/usb/tcpm.h>
>   #include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
>   #include <linux/workqueue.h>
>   
>   #define FOREACH_STATE(S)			\
> @@ -281,6 +282,7 @@ struct tcpm_port {
>   	unsigned int nr_snk_pdo;
>   	u32 snk_vdo[VDO_MAX_OBJECTS];
>   	unsigned int nr_snk_vdo;
> +	u32 displayport_vdo;
>   
>   	unsigned int operating_snk_mw;
>   	bool update_sink_caps;
> @@ -4433,6 +4435,9 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>   					    port->nr_snk_pdo))
>   		return -EINVAL;
>   
> +	fwnode_property_read_u32(fwnode, "displayport-vdo",
> +				 &port->displayport_vdo);
> +
>   	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
>   		return -EINVAL;
>   	port->operating_snk_mw = mw / 1000;
> @@ -4667,6 +4672,28 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
>   	return PTR_ERR_OR_ZERO(port->psy);
>   }
>   
> +static int tcpm_register_port_altmodes(struct tcpm_port *port)
> +{
> +	struct typec_altmode_desc desc;
> +	struct typec_altmode *alt;
> +	int index = 0;
> +
> +	if (port->displayport_vdo) {
> +		desc.svid = USB_TYPEC_DP_SID;
> +		desc.mode = USB_TYPEC_DP_MODE;
> +		desc.vdo  = port->displayport_vdo;
> +		alt = typec_port_register_altmode(port->typec_port, &desc);
> +		if (IS_ERR(alt))
> +			return PTR_ERR(alt);
> +		typec_altmode_set_drvdata(alt, port);
> +		alt->ops = &tcpm_altmode_ops;
> +		port->port_altmode[index] = alt;
> +		index++;
> +	}
> +	/* Future support for further altmodes goes here */
> +	return 0;
> +}
> +
>   struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   {
>   	struct tcpm_port *port;
> @@ -4736,6 +4763,10 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   		goto out_role_sw_put;
>   	}
>   
> +	err = tcpm_register_port_altmodes(port);
> +	if (err)
> +		goto out_unregister_port;
> +
>   	mutex_lock(&port->lock);
>   	tcpm_init(port);
>   	mutex_unlock(&port->lock);
> @@ -4743,6 +4774,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   	tcpm_log(port, "%s: registered", dev_name(dev));
>   	return port;
>   
> +out_unregister_port:
> +	typec_unregister_port(port->typec_port);
>   out_role_sw_put:
>   	usb_role_switch_put(port->role_sw);
>   out_destroy_wq:
> 

