Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1AB56A484
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 11:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbfGPJF5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 05:05:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36439 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbfGPJF4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 05:05:56 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so19156988ljj.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 02:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GUdvMVRJjR5gDZCveaKBilqhHot/qyhNLcr/aJIDGbY=;
        b=EbfVNt1hs823rv1JWc80e+m2AEMVHRvSeYRjj/VbhxQh+T7VsNusnv1vmi+of4rtJg
         rPI/eOPvwZxp590gj4s3IVrc/K1rybuCFcq/LsyHfH+0TahDbi4roe5wt1rmhbrQjTID
         JOLLOot5wOQf/IOVNZptdY2+NR8mSeSz/56DcLhCCz47ld4zT66KFmI76lyKADHMHY6m
         EqE3iwU6KNG2l3qT6WPgAhpkNBc+ts3yVM6jgQPA1aWb9XKum/sGONwBFbxXuJItWE79
         2q02aKSj9UF0ZVOwuJt8NiChs9KANGQQxuatGSm9mnO0tk4pwSsFJOMll23E9iTmrC1G
         zBLQ==
X-Gm-Message-State: APjAAAWBpFJMXOjVzwy0d1ZYofPl9dzcJ1vVcg2KjVH65J6Xu0LVFFwf
        0p+e3Z1jjD9tObXT63RZYOw=
X-Google-Smtp-Source: APXvYqwXohAbO4SV4IiQHppwdFDVMeRQdXofxbwyi8Z0FixMqjzidyxWb/mV+kQmG85baesDxoU29g==
X-Received: by 2002:a2e:9f57:: with SMTP id v23mr3566380ljk.138.1563267954845;
        Tue, 16 Jul 2019 02:05:54 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id j11sm2740889lfm.29.2019.07.16.02.05.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 02:05:54 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnJPF-00043F-Ca; Tue, 16 Jul 2019 11:05:53 +0200
Date:   Tue, 16 Jul 2019 11:05:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
Cc:     johan@kernel.org, hyamamo@allied-telesis.co.jp,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: Add support for ZTE MF871A
Message-ID: <20190716090553.GA3522@localhost>
References: <156282800460.29653.5486306531486471871.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156282800460.29653.5486306531486471871.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 11, 2019 at 03:53:24PM +0900, Yoshiaki Okamoto wrote:
> This patch adds support for MF871A USB modem (aka Speed USB STICK U03)
> to option driver. This modem is manufactured by ZTE corporation, and
> sold by KDDI.
> 
> Interface layout:
> 0: AT
> 1: MODEM
> 
> usb-devices output:
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  9 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=19d2 ProdID=1481 Rev=52.87
> S:  Manufacturer=ZTE,Incorporated
> S:  Product=ZTE Technologies MSM
> S:  SerialNumber=1234567890ABCDEF
> C:  #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

Thanks for the patch. Looks good, but please fix up the two minor issues
pointed out below and resend, and I'll apply it after the merge window
closes.
 
> Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
> Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>

Since you are the one submitting the patch your SoB should go last. We
have a Co-developed-by tag which can you use to indicate co-authorship
(the second SoB is still required). The documentation for this was
recently updated in commit

	24a2bb90741b ("docs: Clarify the usage and sign-off requirements for Co-developed-by")

> ---
>  drivers/usb/serial/option.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a0aaf0635359..e11ae2092229 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -308,6 +308,7 @@ static void option_instat_callback(struct urb *urb);
>  #define ZTE_PRODUCT_ME3620_MBIM			0x0426
>  #define ZTE_PRODUCT_ME3620_X			0x1432
>  #define ZTE_PRODUCT_ME3620_L			0x1433
> +#define ZTE_PRODUCT_MF871A			0x1481
>  #define ZTE_PRODUCT_AC2726			0xfff1
>  #define ZTE_PRODUCT_MG880			0xfffd
>  #define ZTE_PRODUCT_CDMA_TECH			0xfffe
> @@ -1548,6 +1549,7 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff),  /* Telewell TW-LTE 4G v2 */
>  	  .driver_info = RSVD(2) },
>  	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },	/* GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
> +	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, ZTE_PRODUCT_MF871A, 0xff) },

We're trying to move away from adding product-id defines, so please just
use a constant here as most ZTE entries do and add a short comment after
the entry. It's fine to go above 80 columns here even if checkpatch.pl
complains.

>  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, 0xff) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, 0xff) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, 0xff) },

Thanks,
Johan
