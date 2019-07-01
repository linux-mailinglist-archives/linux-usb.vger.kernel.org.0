Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394602C121
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 10:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfE1IYZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 04:24:25 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:6055 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726371AbfE1IYY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 May 2019 04:24:24 -0400
X-UUID: 8d57248aebdb476eaa7a3ecbbc4956c0-20190528
X-UUID: 8d57248aebdb476eaa7a3ecbbc4956c0-20190528
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 986589591; Tue, 28 May 2019 16:24:16 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 28 May
 2019 16:24:14 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 28 May 2019 16:24:13 +0800
Message-ID: <1559031853.10179.441.camel@mhfsdcap03>
Subject: Re: [v3 PATCH] usb: create usb_debug_root for gadget only
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Tue, 28 May 2019 16:24:13 +0800
In-Reply-To: <cffd6d75f69e4d908c8f39b8a60ddae27d6b7c88.1559028752.git.chunfeng.yun@mediatek.com>
References: <cffd6d75f69e4d908c8f39b8a60ddae27d6b7c88.1559028752.git.chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: C96933C95D958AC6AE24513B8160BC0AC75F44EAA61D38CE6C91777A0D4E505A2000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add Felipe, sorry

On Tue, 2019-05-28 at 15:54 +0800, Chunfeng Yun wrote:
> When CONFIG_USB is not set, and CONFIG_USB_GADGET is set,
> there is an issue, e.g.:
> 
> drivers/usb/mtu3/mtu3_debugfs.o: in function 'ssusb_debugfs_create_root':
> mtu3_debugfs.c:(.text+0xba3): undefined reference to 'usb_debug_root'
> 
> usb_debug_root is currently only built when host is supported
> (CONFIG_USB is set), for convenience, we also want it created when
> gadget only is enabled, this patch try to support it.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. still create usb_debug_root for gadget only
>   2. abandon mtu3's change
>   3. drop acked-by Randy
> 
> v2(resend): add acked-by Randy
> 
> v1: fix mtu3's build error, replace usb_debug_root by NULL;
> ---
>  drivers/usb/core/usb.c        |  2 +-
>  drivers/usb/gadget/udc/core.c | 27 +++++++++++++++++++++++++++
>  include/linux/usb.h           |  1 +
>  3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 7fcb9f782931..88b3ee03a12d 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_GPL(usb_debug_root);
>  
>  static void usb_debugfs_init(void)
>  {
> -	usb_debug_root = debugfs_create_dir("usb", NULL);
> +	usb_debug_root = debugfs_create_dir(USB_DEBUG_ROOT_NAME, NULL);
>  	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
>  			    &usbfs_devices_fops);
>  }
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 7cf34beb50df..ed45f9429e58 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/list.h>
>  #include <linux/err.h>
> @@ -1587,12 +1588,37 @@ static int usb_udc_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	return 0;
>  }
>  
> +/* if CONFIG_USB is set, leave USB core to create usb_debug_root */
> +#ifndef CONFIG_USB
> +struct dentry *usb_debug_root;
> +EXPORT_SYMBOL_GPL(usb_debug_root);
> +
> +static void usb_debugfs_init(void)
> +{
> +	usb_debug_root = debugfs_create_dir(USB_DEBUG_ROOT_NAME, NULL);
> +}
> +
> +static void usb_debugfs_cleanup(void)
> +{
> +	debugfs_remove_recursive(usb_debug_root);
> +}
> +#else
> +static void usb_debugfs_init(void)
> +{}
> +
> +static void usb_debugfs_cleanup(void)
> +{}
> +#endif
> +
>  static int __init usb_udc_init(void)
>  {
> +	usb_debugfs_init();
> +
>  	udc_class = class_create(THIS_MODULE, "udc");
>  	if (IS_ERR(udc_class)) {
>  		pr_err("failed to create udc class --> %ld\n",
>  				PTR_ERR(udc_class));
> +		usb_debugfs_cleanup();
>  		return PTR_ERR(udc_class);
>  	}
>  
> @@ -1604,6 +1630,7 @@ subsys_initcall(usb_udc_init);
>  static void __exit usb_udc_exit(void)
>  {
>  	class_destroy(udc_class);
> +	usb_debugfs_cleanup();
>  }
>  module_exit(usb_udc_exit);
>  
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index ae82d9d1112b..9c6e7b3265af 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1994,6 +1994,7 @@ extern void usb_register_notify(struct notifier_block *nb);
>  extern void usb_unregister_notify(struct notifier_block *nb);
>  
>  /* debugfs stuff */
> +#define USB_DEBUG_ROOT_NAME	"usb"
>  extern struct dentry *usb_debug_root;
>  
>  /* LED triggers */


