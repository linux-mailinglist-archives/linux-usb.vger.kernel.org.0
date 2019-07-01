Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA8D36A04
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 04:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFFCdC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 22:33:02 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:58827 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726590AbfFFCdC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 22:33:02 -0400
X-UUID: f2f05a0dff3b4d0c8a33395bed6ee558-20190606
X-UUID: f2f05a0dff3b4d0c8a33395bed6ee558-20190606
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 994228977; Thu, 06 Jun 2019 10:32:49 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 6 Jun
 2019 10:32:48 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 6 Jun 2019 10:32:48 +0800
Message-ID: <1559788368.8487.109.camel@mhfsdcap03>
Subject: Re: [PATCH v3] USB: move usb debugfs directory creation to the usb
 common core
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Thu, 6 Jun 2019 10:32:48 +0800
In-Reply-To: <20190605124440.GD17558@kroah.com>
References: <20190605092816.GA23758@kroah.com>
         <20190605124440.GD17558@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-06-05 at 14:44 +0200, Greg Kroah-Hartman wrote:
> The USB gadget subsystem wants to use the USB debugfs root directory, so
> move it to the common "core" USB code so that it is properly initialized
> and removed as needed.
> 
> In order to properly do this, we need to load the common code before the
> usb core code, when everything is linked into the kernel, so reorder the
> link order of the code.
> 
> Also as the usb common code has the possibility of the led trigger logic
> to be merged into it, handle the build option properly by only having
> one module init/exit function and have the common code initialize the
> led trigger if needed.
> 
> Reported-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Chunfeng, can you try testing this again?

Tested-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thank you, Greg, Felipe

> 
> v3: Fix __init and __exit error when building into the tree as reported
>     by Chunfeng
>     Fix Reported-by: line as reported
> v2: handle led common code link error reported by kbuild
>     handle subsys_initcall issue pointed out by Chunfeng
> 
>  drivers/usb/Makefile        |  3 +--
>  drivers/usb/common/common.c | 21 +++++++++++++++++++++
>  drivers/usb/common/common.h | 14 ++++++++++++++
>  drivers/usb/common/led.c    |  9 +++------
>  drivers/usb/core/usb.c      | 10 ++++------
>  5 files changed, 43 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/usb/common/common.h
> 
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index 7d1b8c82b208..ecc2de1ffaae 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -5,6 +5,7 @@
>  
>  # Object files in subdirectories
>  
> +obj-$(CONFIG_USB_COMMON)	+= common/
>  obj-$(CONFIG_USB)		+= core/
>  obj-$(CONFIG_USB_SUPPORT)	+= phy/
>  
> @@ -60,8 +61,6 @@ obj-$(CONFIG_USB_CHIPIDEA)	+= chipidea/
>  obj-$(CONFIG_USB_RENESAS_USBHS)	+= renesas_usbhs/
>  obj-$(CONFIG_USB_GADGET)	+= gadget/
>  
> -obj-$(CONFIG_USB_COMMON)	+= common/
> -
>  obj-$(CONFIG_USBIP_CORE)	+= usbip/
>  
>  obj-$(CONFIG_TYPEC)		+= typec/
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 18f5dcf58b0d..1433260d99b4 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -15,6 +15,8 @@
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
>  #include <linux/of_platform.h>
> +#include <linux/debugfs.h>
> +#include "common.h"
>  
>  static const char *const ep_type_names[] = {
>  	[USB_ENDPOINT_XFER_CONTROL] = "ctrl",
> @@ -291,4 +293,23 @@ struct device *usb_of_get_companion_dev(struct device *dev)
>  EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
>  #endif
>  
> +struct dentry *usb_debug_root;
> +EXPORT_SYMBOL_GPL(usb_debug_root);
> +
> +static int __init usb_common_init(void)
> +{
> +	usb_debug_root = debugfs_create_dir("usb", NULL);
> +	ledtrig_usb_init();
> +	return 0;
> +}
> +
> +static void __exit usb_common_exit(void)
> +{
> +	ledtrig_usb_exit();
> +	debugfs_remove_recursive(usb_debug_root);
> +}
> +
> +subsys_initcall(usb_common_init);
> +module_exit(usb_common_exit);
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/usb/common/common.h b/drivers/usb/common/common.h
> new file mode 100644
> index 000000000000..424a91316a4b
> --- /dev/null
> +++ b/drivers/usb/common/common.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_USB_COMMON_H
> +#define __LINUX_USB_COMMON_H
> +
> +#if defined(CONFIG_USB_LED_TRIG)
> +void ledtrig_usb_init(void);
> +void ledtrig_usb_exit(void);
> +#else
> +static inline void ledtrig_usb_init(void) { }
> +static inline void ledtrig_usb_exit(void) { }
> +#endif
> +
> +#endif	/* __LINUX_USB_COMMON_H */
> diff --git a/drivers/usb/common/led.c b/drivers/usb/common/led.c
> index 7bd81166b77d..0865dd44a80a 100644
> --- a/drivers/usb/common/led.c
> +++ b/drivers/usb/common/led.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/leds.h>
>  #include <linux/usb.h>
> +#include "common.h"
>  
>  #define BLINK_DELAY 30
>  
> @@ -36,18 +37,14 @@ void usb_led_activity(enum usb_led_event ev)
>  EXPORT_SYMBOL_GPL(usb_led_activity);
>  
> 
> -static int __init ledtrig_usb_init(void)
> +void __init ledtrig_usb_init(void)
>  {
>  	led_trigger_register_simple("usb-gadget", &ledtrig_usb_gadget);
>  	led_trigger_register_simple("usb-host", &ledtrig_usb_host);
> -	return 0;
>  }
>  
> -static void __exit ledtrig_usb_exit(void)
> +void __exit ledtrig_usb_exit(void)
>  {
>  	led_trigger_unregister_simple(ledtrig_usb_gadget);
>  	led_trigger_unregister_simple(ledtrig_usb_host);
>  }
> -
> -module_init(ledtrig_usb_init);
> -module_exit(ledtrig_usb_exit);
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 7fcb9f782931..5a0df527a8ca 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -1185,19 +1185,17 @@ static struct notifier_block usb_bus_nb = {
>  	.notifier_call = usb_bus_notify,
>  };
>  
> -struct dentry *usb_debug_root;
> -EXPORT_SYMBOL_GPL(usb_debug_root);
> +static struct dentry *usb_devices_root;
>  
>  static void usb_debugfs_init(void)
>  {
> -	usb_debug_root = debugfs_create_dir("usb", NULL);
> -	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
> -			    &usbfs_devices_fops);
> +	usb_devices_root = debugfs_create_file("devices", 0444, usb_debug_root,
> +					       NULL, &usbfs_devices_fops);
>  }
>  
>  static void usb_debugfs_cleanup(void)
>  {
> -	debugfs_remove_recursive(usb_debug_root);
> +	debugfs_remove(usb_devices_root);
>  }
>  
>  /*


