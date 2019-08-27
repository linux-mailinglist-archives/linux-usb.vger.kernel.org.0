Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10FB49E9A6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 15:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbfH0Nj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 09:39:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43954 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfH0Nj0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Aug 2019 09:39:26 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EFAC0C04B940
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 13:39:25 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id d64so11712120edd.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 06:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d1SaRknkLL/EJY0+pdXY5AHU1pBmVLN+9XZ8ZbqDYZQ=;
        b=bjE8fGJVfxrJhICcx1FUff+wKLDqgXc1Hqn9X804ne+z1kUWDqC2iIjcvPOD7SQJzT
         YD6HI+sf9WVZO2x/k+HHcIQzcRZzYssDoNUgZOlUGL7FIpkF9tWCg9aMEDg3W/tisIdG
         V6mp4/aOZ6g6Xf9KB209ra+qYx0NZDXnANc/fnEuKtQ2/G4yMR6U6EZXtlpRERL2rOA/
         Ozi8gF4efdr5rhrnBbH8KlB0MPXG9QKp+S/Mu7Afmwmat50jqrfCg0a7RZBjTw/pvWOs
         Xagzb0gHyKVxZQ7eMyRV4fu3TKMLIjQaFZWMWL8dQXIXVsjzBHXPuSaKY/NvygSSVpCu
         LmKA==
X-Gm-Message-State: APjAAAVOcKpVItNy7r0goW/Eph/P7CiDgaND490tcIvsmzfehJ2lq/b9
        CH0vlef+CeDiCoVlk0BwsUsyvRFwGRxg6Gur04FZnkxpZHtIKL0KW8/kIS3kF04hO/LKcRHXol9
        O8IZ6H6o00QZh7+kz/l4n
X-Received: by 2002:a05:6402:1641:: with SMTP id s1mr23597615edx.52.1566913164735;
        Tue, 27 Aug 2019 06:39:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjtpiiPfBImX2s4eUS6RfKG3gsx2XLyeB8HMBFOJEybWF6GhRn9XiAu3sZUOFC+rOb8pRtsA==
X-Received: by 2002:a05:6402:1641:: with SMTP id s1mr23597600edx.52.1566913164555;
        Tue, 27 Aug 2019 06:39:24 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id y25sm1945643edt.29.2019.08.27.06.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2019 06:39:23 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] usb: roles: intel: Enable static DRD mode for role
 switch
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
References: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
 <20190826143230.59807-3-heikki.krogerus@linux.intel.com>
Message-ID: <2a0d10b9-b21d-5bd6-9115-5a686bfbb701@redhat.com>
Date:   Tue, 27 Aug 2019 15:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826143230.59807-3-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 26-08-19 16:32, Heikki Krogerus wrote:
> From: Saranya Gopal <saranya.gopal@intel.com>
> 
> Enable static DRD mode in Intel platforms which guarantees
> successful role switch all the time. This fixes issues like
> software role switch failure after cold boot and issue with
> role switch when USB 3.0 cable is used. But, do not enable
> static DRD mode for Cherrytrail devices which rely on firmware
> for role switch.
> 
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   .../usb/roles/intel-xhci-usb-role-switch.c    | 26 ++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> index 7325a84dd1c8..9101ff94c8d2 100644
> --- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
> +++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> @@ -19,6 +19,7 @@
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>   #include <linux/usb/role.h>
>   
>   /* register definition */
> @@ -26,6 +27,9 @@
>   #define SW_VBUS_VALID			BIT(24)
>   #define SW_IDPIN_EN			BIT(21)
>   #define SW_IDPIN			BIT(20)
> +#define SW_SWITCH_EN_CFG0		BIT(16)

Nitpick: Please drop the _CFG0 postfix, if anything this
should be a prefix applied to *all* defines for the bits
in this register

> +#define SW_DRD_STATIC_HOST_CFG0		1
> +#define SW_DRD_STATIC_DEV_CFG0		2

So bits 0-1 together define the drd-mode. The datasheet
calls the combination DRD_CONFIG, without a SW_ prefix,
with the following values being defined:

00: Dynamic role-switch
01: Static Host mode
10: Static device mode
11: Reserved

Notice this is an enum, so the use of bit-ops to clear the
other state below is wrong. It happens to work, but this is
not how a multi-bit setting should be modified.

I suggest using the following defines instead:

#define DRD_CONFIG_DYNAMIC		0
#define DRD_CONFIG_STATIC_HOST		1
#define DRD_CONFIG_STATIC_DEVICE	2
#define DRD_CONFIG_MASK			3

>   #define DUAL_ROLE_CFG1			0x6c
>   #define HOST_MODE			BIT(29)
> @@ -37,6 +41,7 @@
>   struct intel_xhci_usb_data {
>   	struct usb_role_switch *role_sw;
>   	void __iomem *base;
> +	bool disable_sw_switch;

I would prefer for this to be enable_sw_switch and the negation
when reading the property.

>   };
>   
>   static const struct software_node intel_xhci_usb_node = {
> @@ -63,23 +68,39 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
>   
>   	pm_runtime_get_sync(dev);
>   
> -	/* Set idpin value as requested */
> +	/*
> +	 * Set idpin value as requested.
> +	 * Since some devices rely on firmware setting DRD_CONFIG and
> +	 * SW_SWITCH_EN_CFG0 bits to be zero for role switch,
> +	 * do not set these bits for those devices.
> +	 */
>   	val = readl(data->base + DUAL_ROLE_CFG0);
>   	switch (role) {
>   	case USB_ROLE_NONE:
>   		val |= SW_IDPIN;
>   		val &= ~SW_VBUS_VALID;
> +		val &= ~(SW_DRD_STATIC_DEV_CFG0 | SW_DRD_STATIC_HOST_CFG0);
>   		break;

Right, so this should be:

		val &= ~DRD_CONFIG_MASK;

Also ideally this should also have a if (!data->disable_sw_switch)
for consistency.

>   	case USB_ROLE_HOST:
>   		val &= ~SW_IDPIN;
>   		val &= ~SW_VBUS_VALID;
> +		if (!data->disable_sw_switch) {
> +			val &= ~SW_DRD_STATIC_DEV_CFG0;

So this clearing is wrong, it happens to work, but is not
how modifying a "bit-set" / enum should be done, this should be:

			val &= ~DRD_CONFIG_MASK;

> +			val |= SW_DRD_STATIC_HOST_CFG0;
> +		}
>   		break;
>   	case USB_ROLE_DEVICE:
>   		val |= SW_IDPIN;
>   		val |= SW_VBUS_VALID;
> +		if (!data->disable_sw_switch) {
> +			val &= ~SW_DRD_STATIC_HOST_CFG0;
> +			val |= SW_DRD_STATIC_DEV_CFG0;
> +		}

Idem.


>   		break;
>   	}
>   	val |= SW_IDPIN_EN;
> +	if (!data->disable_sw_switch)
> +		val |= SW_SWITCH_EN_CFG0;

So we now have a lot of "if (!data->disable_sw_switch)" checks,

IMHO it would be better / cleaner to do this:

	u32 glk, val, drd_config;

	...

  	val = readl(data->base + DUAL_ROLE_CFG0);
  	switch (role) {
  	case USB_ROLE_NONE:
  		val |= SW_IDPIN;
  		val &= ~SW_VBUS_VALID;
		drd_config = DRD_CONFIG_DYNAMIC;
  		break;
  	case USB_ROLE_HOST:
  		val &= ~SW_IDPIN;
  		val &= ~SW_VBUS_VALID;
		drd_config = DRD_CONFIG_STATIC_HOST;
  		break;
  	case USB_ROLE_DEVICE:
  		val |= SW_IDPIN;
  		val |= SW_VBUS_VALID;
		drd_config = DRD_CONFIG_STATIC_DEVICE;
  		break;
  	}
  	val |= SW_IDPIN_EN;

	if (!data->disable_sw_switch) {
		val &= ~DRD_CONFIG_MASK;
		val |= SW_SWITCH_EN_CFG0 | drd_config;
	}

	...

Regards,

Hans



>   
>   	writel(val, data->base + DUAL_ROLE_CFG0);
>   
> @@ -156,6 +177,9 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
>   	sw_desc.allow_userspace_control = true,
>   	sw_desc.fwnode = software_node_fwnode(&intel_xhci_usb_node);
>   
> +	data->disable_sw_switch = device_property_read_bool(dev,
> +						"sw_switch_disable");
> +
>   	data->role_sw = usb_role_switch_register(dev, &sw_desc);
>   	if (IS_ERR(data->role_sw)) {
>   		fwnode_handle_put(sw_desc.fwnode);
> 
