Return-Path: <linux-usb+bounces-432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2A7A90BD
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 03:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249FB1C20BB3
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 01:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24A817C2;
	Thu, 21 Sep 2023 01:58:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430E138C
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 01:58:51 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84FE5B7;
	Wed, 20 Sep 2023 18:58:47 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.201])
	by gateway (Coremail) with SMTP id _____8Cxc_BVowtl1XEqAA--.16276S3;
	Thu, 21 Sep 2023 09:58:45 +0800 (CST)
Received: from [10.20.42.201] (unknown [10.20.42.201])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxK9xSowtlX_wMAA--.26148S3;
	Thu, 21 Sep 2023 09:58:44 +0800 (CST)
Subject: Re: [PATCH v2] usb: xhci-plat: fix usb disconnect issue after s4
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230809095826.18183-1-zhuyinbo@loongson.cn>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <4862ba2c-fa6b-de12-2ad9-4099d2eddbb1@loongson.cn>
Date: Thu, 21 Sep 2023 09:58:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230809095826.18183-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxK9xSowtlX_wMAA--.26148S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



Friendly ping ?


ÔÚ 2023/8/9 ÏÂÎç5:58, Yinbo Zhu Ð´µÀ:
> The xhci retaining bogus hardware states cause usb disconnect devices
> connected before hibernation(s4) and refer to the commit 'f3d478858be
> ("usb: ohci-platform: fix usb disconnect issue after s4")' which set
> flag "hibernated" as true when resume-from-hibernation and that the
> drivers will reset the hardware to get rid of any existing state and
> make sure resume from hibernation re-enumerates everything for xhci.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v2:
> 		1. Add CONFIG_PM_SLEEP in xhci_plat_pm_ops that for fix
> 		   compile issue when CONFIG_PM not enable.
> 
>   drivers/usb/host/xhci-plat.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 28218c8f1837..112468fdcca2 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -451,7 +451,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused xhci_plat_resume(struct device *dev)
> +static int __maybe_unused xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
>   {
>   	struct usb_hcd	*hcd = dev_get_drvdata(dev);
>   	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> @@ -466,7 +466,7 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	ret = xhci_resume(xhci, PMSG_RESUME);
> +	ret = xhci_resume(xhci, pmsg);
>   	if (ret)
>   		return ret;
>   
> @@ -477,6 +477,16 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
>   	return 0;
>   }
>   
> +static int __maybe_unused xhci_plat_resume(struct device *dev)
> +{
> +	return xhci_plat_resume_common(dev, PMSG_RESUME);
> +}
> +
> +static int __maybe_unused xhci_plat_restore(struct device *dev)
> +{
> +	return xhci_plat_resume_common(dev, PMSG_RESTORE);
> +}
> +
>   static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
>   {
>   	struct usb_hcd  *hcd = dev_get_drvdata(dev);
> @@ -499,8 +509,14 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
>   }
>   
>   const struct dev_pm_ops xhci_plat_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(xhci_plat_suspend, xhci_plat_resume)
> -
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = xhci_plat_suspend,
> +	.resume = xhci_plat_resume,
> +	.freeze = xhci_plat_suspend,
> +	.thaw = xhci_plat_resume,
> +	.poweroff = xhci_plat_suspend,
> +	.restore = xhci_plat_restore,
> +#endif
>   	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
>   			   xhci_plat_runtime_resume,
>   			   NULL)
> 


