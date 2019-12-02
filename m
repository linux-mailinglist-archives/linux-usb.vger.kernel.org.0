Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD2910E8F4
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 11:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfLBKb4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 05:31:56 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41835 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLBKbz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 05:31:55 -0500
Received: by mail-wr1-f67.google.com with SMTP id b18so43527305wrj.8
        for <linux-usb@vger.kernel.org>; Mon, 02 Dec 2019 02:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g6dP6ry74SEyd5dt7pE6fUowydAenmGxZnWV3bHJzlY=;
        b=FRWIy0LcmognG1qfwrTGSr0PLfZcbrji5ZkGhbvmL9+t5Z/1tkWpUJWpg4LbR/u722
         G3G0iev2HvWqjWawHkbYyLH0J+/EzVoarvqvFa5OiCCrMeLBpI+dElbXhO9v5hMxk3HQ
         PpOxzCHtpjunyLTRE2C3SUQHBQY45W6fVIJPtTUl6GULbJ6KrYBW2hmM1tKyTfWM4QDI
         0vsEXerQ3h2xjj6m4bW0HGeazo4BxoPk+rVg0WgvpLHxtDDhDBtoYCW7WDWtEbyeAAX8
         L/gYWyPPNI6lVfVFvi5nklBlHiZq/sACEUi3VGP6WIKF+iywnenX4aDy2hEUiARmzugT
         Zq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g6dP6ry74SEyd5dt7pE6fUowydAenmGxZnWV3bHJzlY=;
        b=QnaU75q8F8og0Jn8bIemBxzHd11QhZD3LdjpEnmZI1IJDrbaR4lZI1Te9Sejz6Pwwg
         /d+9Jo/d2/tFHySiKY10Ae1rFaiCf0rGi+HMao03lD6RX8R3eZMIqQS1JBt2hXAa0alz
         zngMN5UEST0PTLN/GnYdX1/oGCCSgu0TCCgT5NScg6xwLiTd6EFBtd1b5ECTZZEXpNky
         heKD4+8v00HzSX8/eMEydJaS/gVe+SB1RlXFEu8JQKCG4/pYXEt5IaHg7JdoqDnZqT8k
         uOsxL+uHsoZHuEaKV80q+EJAtXuh9PJ2RcdjeHY330mZ02MZiOMJcYHXu427VWFiNe44
         3uww==
X-Gm-Message-State: APjAAAULpin9nOEtcQe6/He+F5aYAZx6xAZgm5WLpZBNDVOKIZTTPVLa
        oqnyWcr8U24A2v3nWn3DDWVxDA==
X-Google-Smtp-Source: APXvYqwxxamKKpWPDGivG9vzv+yfja23o3nFH428n+VhPLbFMuZGIE4T7Mjif3hWLOBklnYIMymxfA==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr9589645wrq.396.1575282713284;
        Mon, 02 Dec 2019 02:31:53 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i127sm24352606wma.35.2019.12.02.02.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 02:31:52 -0800 (PST)
Subject: Re: [PATCH v6 3/8] usb: dwc3: Add support for
 role-switch-default-mode binding
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20191128051001.18995-1-john.stultz@linaro.org>
 <20191128051001.18995-4-john.stultz@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <97d3570e-2b4f-b32e-fe1a-bf0f49603238@nexus-software.ie>
Date:   Mon, 2 Dec 2019 10:32:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128051001.18995-4-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/11/2019 05:09, John Stultz wrote:
> Support the new role-switch-default-mode binding for configuring
> the default role the controller assumes as when the usb role is
> USB_ROLE_NONE
> 
> This patch was split out from a larger patch originally by
> Yu Chen <chenyu56@huawei.com>
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> CC: ShuFan Lee <shufan_lee@richtek.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Change-Id: Ic6e4df1109b350deaecdc69f667d49ce91d599f3
> ---
> v3: Split this patch out from addition of usb-role-switch
>      handling
> v5: Reworked to use string based role-switch-default-mode
> ---
>   drivers/usb/dwc3/core.h |  3 +++
>   drivers/usb/dwc3/drd.c  | 25 ++++++++++++++++++++++---
>   2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 6f19e9891767..3c879c9ab1aa 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -953,6 +953,8 @@ struct dwc3_scratchpad_array {
>    *		- USBPHY_INTERFACE_MODE_UTMI
>    *		- USBPHY_INTERFACE_MODE_UTMIW
>    * @role_sw: usb_role_switch handle
> + * @role_switch_default_mode: default operation mode of controller while
> + *			usb role is USB_ROLE_NONE.
>    * @usb2_phy: pointer to USB2 PHY
>    * @usb3_phy: pointer to USB3 PHY
>    * @usb2_generic_phy: pointer to USB2 PHY
> @@ -1087,6 +1089,7 @@ struct dwc3 {
>   	struct notifier_block	edev_nb;
>   	enum usb_phy_interface	hsphy_mode;
>   	struct usb_role_switch	*role_sw;
> +	enum usb_dr_mode	role_switch_default_mode;
>   
>   	u32			fladj;
>   	u32			irq_gadget;
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 3b57d2ddda93..865341facece 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -491,7 +491,10 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
>   		mode = DWC3_GCTL_PRTCAP_DEVICE;
>   		break;
>   	default:
> -		mode = DWC3_GCTL_PRTCAP_DEVICE;
> +		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
> +			mode = DWC3_GCTL_PRTCAP_HOST;
> +		else
> +			mode = DWC3_GCTL_PRTCAP_DEVICE;
>   		break;
>   	}
>   
> @@ -517,7 +520,10 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
>   		role = dwc->current_otg_role;
>   		break;
>   	default:
> -		role = USB_ROLE_DEVICE;
> +		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
> +			role = USB_ROLE_HOST;
> +		else
> +			role = USB_ROLE_DEVICE;
>   		break;
>   	}
>   	spin_unlock_irqrestore(&dwc->lock, flags);
> @@ -527,6 +533,19 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
>   static int dwc3_setup_role_switch(struct dwc3 *dwc)
>   {
>   	struct usb_role_switch_desc dwc3_role_switch = {NULL};
> +	const char *str;
> +	u32 mode;
> +	int ret;
> +
> +	ret = device_property_read_string(dwc->dev, "role-switch-default-mode",
> +					  &str);
> +	if (ret >= 0  && !strncmp(str, "host", strlen("host"))) {
> +		dwc->role_switch_default_mode = USB_DR_MODE_HOST;
> +		mode = DWC3_GCTL_PRTCAP_HOST;
> +	} else {
> +		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
> +		mode = DWC3_GCTL_PRTCAP_DEVICE;
> +	}
>   
>   	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
>   	dwc3_role_switch.set = dwc3_usb_role_switch_set;
> @@ -535,7 +554,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>   	if (IS_ERR(dwc->role_sw))
>   		return PTR_ERR(dwc->role_sw);
>   
> -	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
> +	dwc3_set_mode(dwc, mode);
>   	return 0;
>   }
>   #else
> 

I've used this on a qcs404 - it works for me.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
