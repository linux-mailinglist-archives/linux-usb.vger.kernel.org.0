Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC20A17A7
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 13:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfH2LEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 07:04:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41024 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbfH2LEH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 07:04:07 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D302481DF2
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2019 11:04:06 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id y15so1904577edu.19
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2019 04:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v151/DDJVVo76OLaGkD3bAqGv2vYS9KJt1Lu3KVWxmM=;
        b=aLVGS54rWvVkANzjroDBvYFCixhYGyWUTBE4G/oh+LwceQxllJ1aNnJQw5f93G4GmE
         bw0Kz9WKxV4W8KzqrFZdnvMYAgPC3/AiBYIUUz8Mnva5kQnMSgEXfimsQith0Fpg7aGt
         avplWQziOeETrDed+je9JFR2P293vIHWLnE8fWMWZXkVzz2lt8CBX4g7k0hwHpgqhHVd
         qF4i9Gjw26AJGjXDH22MGAXftqMP28Hp42FLg4tFtN+TF8g1/2J+k8XozfPUpdinNRri
         WHftxCui1DaeZzPTjF/eSSX7rA8t2WjdabqkztqOC++ZkkjVZmZKZnBPJxrICRyKzopk
         SYOg==
X-Gm-Message-State: APjAAAVSWkLiEX8iZqvdyuJfalWJNM750PTjmDG3X5oTOuuJN2EOfV8X
        OlDNlTK1XJTs+qKgUJQG0pcfwbI422f3LW/T/jZpuAsfBDj94rIyKhkWfu26dH54RICOJkZ1n6b
        AfFpJ0ZZ3nLKgxq9/6q9/
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr7254605ejr.310.1567076645200;
        Thu, 29 Aug 2019 04:04:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcHmnq3Wjl0Oc2DOjqRdyeCfJNeknz9mgaVnrOspgGSzfuy8L8/Bry75sfnpNaY6w+kAeoNA==
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr7254579ejr.310.1567076644944;
        Thu, 29 Aug 2019 04:04:04 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id y25sm382938edt.29.2019.08.29.04.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2019 04:04:04 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] usb: roles: intel: Enable static DRD mode for role
 switch
To:     Saranya Gopal <saranya.gopal@intel.com>,
        heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Balaji Manoharan <m.balaji@intel.com>,
        =?UTF-8?Q?Rafa=c5=82_Psota?= <rafalzaq@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <1567075327-24016-1-git-send-email-saranya.gopal@intel.com>
 <1567075327-24016-2-git-send-email-saranya.gopal@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <94e5c5e9-2a73-58a3-fd1a-fbf0f5e07e23@redhat.com>
Date:   Thu, 29 Aug 2019 13:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567075327-24016-2-git-send-email-saranya.gopal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Saranya,

On 29-08-19 12:42, Saranya Gopal wrote:
> Enable static DRD mode in Intel platforms which guarantees
> successful role switch all the time. This fixes issues like
> software role switch failure after cold boot and issue with
> role switch when USB 3.0 cable is used. But, do not enable
> static DRD mode for Cherrytrail devices which rely on firmware
> for role switch.
> 
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> Signed-off-by: Balaji Manoharan <m.balaji@intel.com>

Unfortunately this patch conflicts with a patch to
drivers/usb/roles/intel-xhci-usb-role-switch.c from Heikki
which is already in -next, see:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/log/?h=devprop

And specifically this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=devprop&id=d2a90ebb65536a6deeb9daf5aa8e0700e8cbb43a

So you need to rebase on op of that branch and then the subsys
maintainers need to figure out how to merge this, I guess
the usb-next tree can merge Rafael's devprop branch for this?

I've manually resolved the conflict locally and  given this new version
a test-run on a Cherry Trail device and things still work as they should
there, so with the conflict fixed this series is:

Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   changes since v3: Initialized drd_config variable to fix warning
>   changes since v2: Revised SoB tags
>   changes since v1: Added drd_config to avoid multiple if checks
>                     Other minor changes suggested by Hans
>                     
>   drivers/usb/roles/intel-xhci-usb-role-switch.c | 27 ++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> index 277de96..88d0416 100644
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
> @@ -26,6 +27,12 @@
>   #define SW_VBUS_VALID			BIT(24)
>   #define SW_IDPIN_EN			BIT(21)
>   #define SW_IDPIN			BIT(20)
> +#define SW_SWITCH_EN			BIT(16)
> +
> +#define DRD_CONFIG_DYNAMIC		0
> +#define DRD_CONFIG_STATIC_HOST		1
> +#define DRD_CONFIG_STATIC_DEVICE	2
> +#define DRD_CONFIG_MASK			3
>   
>   #define DUAL_ROLE_CFG1			0x6c
>   #define HOST_MODE			BIT(29)
> @@ -37,6 +44,7 @@
>   struct intel_xhci_usb_data {
>   	struct usb_role_switch *role_sw;
>   	void __iomem *base;
> +	bool enable_sw_switch;
>   };
>   
>   static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
> @@ -45,6 +53,7 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
>   	unsigned long timeout;
>   	acpi_status status;
>   	u32 glk, val;
> +	u32 drd_config = DRD_CONFIG_DYNAMIC;
>   
>   	/*
>   	 * On many CHT devices ACPI event (_AEI) handlers read / modify /
> @@ -59,24 +68,35 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
>   
>   	pm_runtime_get_sync(dev);
>   
> -	/* Set idpin value as requested */
> +	/*
> +	 * Set idpin value as requested.
> +	 * Since some devices rely on firmware setting DRD_CONFIG and
> +	 * SW_SWITCH_EN bits to be zero for role switch,
> +	 * do not set these bits for those devices.
> +	 */
>   	val = readl(data->base + DUAL_ROLE_CFG0);
>   	switch (role) {
>   	case USB_ROLE_NONE:
>   		val |= SW_IDPIN;
>   		val &= ~SW_VBUS_VALID;
> +		drd_config = DRD_CONFIG_DYNAMIC;
>   		break;
>   	case USB_ROLE_HOST:
>   		val &= ~SW_IDPIN;
>   		val &= ~SW_VBUS_VALID;
> +		drd_config = DRD_CONFIG_STATIC_HOST;
>   		break;
>   	case USB_ROLE_DEVICE:
>   		val |= SW_IDPIN;
>   		val |= SW_VBUS_VALID;
> +		drd_config = DRD_CONFIG_STATIC_DEVICE;
>   		break;
>   	}
>   	val |= SW_IDPIN_EN;
> -
> +	if (data->enable_sw_switch) {
> +		val &= ~DRD_CONFIG_MASK;
> +		val |= SW_SWITCH_EN | drd_config;
> +	}
>   	writel(val, data->base + DUAL_ROLE_CFG0);
>   
>   	acpi_release_global_lock(glk);
> @@ -147,6 +167,9 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, data);
>   
> +	data->enable_sw_switch = !device_property_read_bool(dev,
> +						"sw_switch_disable");
> +
>   	data->role_sw = usb_role_switch_register(dev, &sw_desc);
>   	if (IS_ERR(data->role_sw))
>   		return PTR_ERR(data->role_sw);
> 
