Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95344822D7
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 09:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhLaItV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 03:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhLaItV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 03:49:21 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2458FC061574
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 00:49:21 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id s21-20020a05683004d500b0058f585672efso30291585otd.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Thedunrh0TBZfjdMYOUn5wcBAWfd3zKYO8Zkb7Rvv+k=;
        b=S5unmAHwZrHkiltOqRwW7KOeM07llHY/rKjxnFHE92rDthO+3HXdxDM5+HKrgYEWHk
         i5yGEYTYzrsZ5UvGrw7DMgmSxLrLBFcUWBFhvyXG7vfcGcgED/34glAXV0expbbTLX+I
         FpnXncBiqw/pUKgyoGu6ktoz9aC5ys5Zw+iQ46n7MtdOO8KAXoATfb/6ixZIRE+bLSJ9
         lEmNGxoyQxjAC4iq1WAHnSV//e4OCi3wEKkUOXgZgEsDD0vk3daEFpQXMamTFAMynia0
         XdscDie3E625Kzx0Qnhizkhg9bngN+1NRITSE7mxP29VSdZrlu3Jm2sQShtpCXu5KIjZ
         3Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Thedunrh0TBZfjdMYOUn5wcBAWfd3zKYO8Zkb7Rvv+k=;
        b=w7oHhi9dzWOKQuG26ZJoxjLl/+toJFGriwddBM2QyYTazpZu+qhsijzMilHd7X7jT7
         IBfZUmcB0X+0a7RM0cM0vzDJJqYruPwxBS5G/rUmIpcCESP9tBBhyL8wmIdVbJwjs1W1
         RtFIsUh5kEWgWcG/YV2/wXOiKLb+YK8/yYu3Nso3kUY9uWzUnGXOiRxPj3uySYEk0VvN
         NUu4/L3Dvpo1iFOl0pOE1JBeQI5htJ7X8uQv6tVrA7ZW07T2Zx4ZtCxv3dWEttTzz06C
         fd0cVFXiKn5nd9qKP4rcnz1VN7W3x9is+kQ0TYA7d2cC06d6JkO7NxDIBl+mJnGxd2MO
         KRKw==
X-Gm-Message-State: AOAM530Gv2Fr+7OKm/Y8wUkwCnJzfA3BmV0w85aZIMAQD4+xkSd4Muok
        oQY2xoGp4YZdGZTr6HVgbvAzh4fMSmCM6hSouLU=
X-Google-Smtp-Source: ABdhPJw26naXgXq9w2lm/ySnksa6e4BNxX+0qVi9DdoQ6aLes0EXYLE4VpDA8QdnLXolnbF1K1E/0I7jyUPujL9JoJ8=
X-Received: by 2002:a05:6830:80a:: with SMTP id r10mr25786935ots.74.1640940560402;
 Fri, 31 Dec 2021 00:49:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4007:0:0:0:0:0 with HTTP; Fri, 31 Dec 2021 00:49:20
 -0800 (PST)
In-Reply-To: <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com> <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
From:   youling 257 <youling257@gmail.com>
Date:   Fri, 31 Dec 2021 16:49:20 +0800
Message-ID: <CAOzgRdZKXa9N1-OPEDyRvckbCnx5DFfEx6P7Us7TRFA9aF9LtA@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

please you subject a patch to linux-usb.

2021-12-31 9:39 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
> The ASmedia host controller incorrectly reports the speed ID in the
> port-status mismatching with its PSI capability for SSP devices. As
> a result, the host/hub driver will report the wrong speed.
>
> To resolve/workaround this, the xHCI driver can capture the device speed
> from sublink speed notification of a SSP device. All SSP devices must
> send sublink speed device notification, so this method should resolve
> your issue.
>
> You can apply the change below. This should resolve your issue.
>
> BR,
> Thinh
>
>
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 9ddcc0ab4db7..6de15f004684 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2602,7 +2602,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	 */
>  	temp = readl(&xhci->op_regs->dev_notification);
>  	temp &= ~DEV_NOTE_MASK;
> -	temp |= DEV_NOTE_FWAKE;
> +	temp |= DEV_NOTE_FWAKE | DEV_NOTE_SUBLINK_SPEED;
>  	writel(temp, &xhci->op_regs->dev_notification);
>
>  	return 0;
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 99d9d9c88988..80081b3fd52a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1860,6 +1860,8 @@ static void handle_device_notification(struct xhci_hcd
> *xhci,
>  {
>  	u32 slot_id;
>  	struct usb_device *udev;
> +	u32 type;
> +	u32 dn;
>
>  	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->generic.field[3]));
>  	if (!xhci->devs[slot_id]) {
> @@ -1868,11 +1870,45 @@ static void handle_device_notification(struct
> xhci_hcd *xhci,
>  		return;
>  	}
>
> -	xhci_dbg(xhci, "Device Wake Notification event for slot ID %u\n",
> -			slot_id);
>  	udev = xhci->devs[slot_id]->udev;
> -	if (udev && udev->parent)
> -		usb_wakeup_notification(udev->parent, udev->portnum);
> +	type = TRB_DN_TYPE(le32_to_cpu(event->generic.field[0]));
> +
> +	switch (type) {
> +	case TRB_DN_TYPE_FUNC_WAKE:
> +		xhci_info(xhci, "Device Wake Notification event for slot ID %u\n",
> +			  slot_id);
> +		if (udev && udev->parent)
> +			usb_wakeup_notification(udev->parent, udev->portnum);
> +		break;
> +	case TRB_DN_TYPE_SUBLINK_SPEED:
> +		if (!udev)
> +			break;
> +
> +		dn = le32_to_cpu(event->generic.field[1]);
> +		udev->ssp_rate = USB_SSP_GEN_UNKNOWN;
> +
> +		if (TRB_DN_SUBLINK_SPEED_LP(dn) ==
> +		    TRB_DN_SUBLINK_SPEED_LP_SSP) {
> +			udev->speed = USB_SPEED_SUPER_PLUS;
> +
> +			if (TRB_DN_SUBLINK_SPEED_LSE(dn) !=
> +			    TRB_DN_SUBLINK_SPEED_LSE_GBPS)
> +				break;
> +
> +			if (TRB_DN_SUBLINK_SPEED_LSM(dn) == 10) {
> +				if (TRB_DN_SUBLINK_SPEED_LANES(dn))
> +					udev->ssp_rate = USB_SSP_GEN_2x2;
> +				else
> +					udev->ssp_rate = USB_SSP_GEN_2x1;
> +			} else if (TRB_DN_SUBLINK_SPEED_LSM(dn) == 5) {
> +				if (TRB_DN_SUBLINK_SPEED_LANES(dn))
> +					udev->ssp_rate = USB_SSP_GEN_1x2;
> +			}
> +		} else {
> +			udev->speed = USB_SPEED_SUPER;
> +		}
> +		break;
> +	}
>  }
>
>  /*
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 9192465fd5f3..ce2ca67c115f 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -267,6 +267,7 @@ struct xhci_op_regs {
>   * SW does need to pay attention to function wake notifications.
>   */
>  #define	DEV_NOTE_FWAKE		ENABLE_DEV_NOTE(1)
> +#define	DEV_NOTE_SUBLINK_SPEED	ENABLE_DEV_NOTE(5)
>
>  /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
>  /* bit 0 is the command ring cycle state */
> @@ -1434,6 +1435,30 @@ union xhci_trb {
>  /* Get NEC firmware revision. */
>  #define	TRB_NEC_GET_FW		49
>
> +/* Get Device Notification type */
> +#define TRB_DN_TYPE(p)			(((p) >> 4) & 0xf)
> +
> +#define TRB_DN_TYPE_FUNC_WAKE		1
> +#define TRB_DN_TYPE_SUBLINK_SPEED	5
> +
> +/* Get sublink speed attributes */
> +#define TRB_DN_SUBLINK_SPEED_LSE(p)	(((p) >> 4) & 0x3)
> +#define TRB_DN_SUBLINK_SPEED_LSE_BPS	0
> +#define TRB_DN_SUBLINK_SPEED_LSE_KBPS	1
> +#define TRB_DN_SUBLINK_SPEED_LSE_MBPS	2
> +#define TRB_DN_SUBLINK_SPEED_LSE_GBPS	3
> +#define TRB_DN_SUBLINK_SPEED_ST(p)	(((p) >> 6) & 0x3)
> +#define TRB_DN_SUBLINK_SPEED_LANES(p)	(((p) >> 10) & 0xf)
> +#define TRB_DN_SUBLINK_SPEED_LP(p)	(((p) >> 14) & 0x3)
> +#define TRB_DN_SUBLINK_SPEED_LP_SS	0
> +#define TRB_DN_SUBLINK_SPEED_LP_SSP	1
> +#define TRB_DN_SUBLINK_SPEED_LSM(p)	(((p) >> 16) & 0xffff)
> +
> +#define TRB_DN_SUBLINK_SPEED_IS_SYMMETRIC(p) \
> +	(!(TRB_DN_SUBLINK_SPEED_ST(p) & BIT(0)))
> +#define TRB_DN_SUBLINK_SPEED_IS_TX(p) \
> +	(!!(TRB_DN_SUBLINK_SPEED_ST(p) & BIT(1)))
> +
>  static inline const char *xhci_trb_type_string(u8 type)
>  {
>  	switch (type) {
>
>
>
>
>
