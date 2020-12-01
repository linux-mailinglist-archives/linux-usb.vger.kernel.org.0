Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90CD2C97A8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 07:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgLAGrC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 01:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbgLAGrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 01:47:02 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19108C0613D4
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 22:46:16 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id u7so348627vsq.11
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 22:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bvSUYwhCU35pqD9sVr8d4DmmML+ab/eSlq9W2GgDok=;
        b=BoLmnvDcswunF/COrz/EQ+1cB8/+kMiJAw8neJjSWZp/E6NpVsNjGF2bWF1uldQDPe
         wm0tbHsaw40JbZwq1mAvZ+iF+RstQAJWTsUwOJHSwY0a0KJQi+7SFw0NQMVP5vg+AoiS
         dS4hFQcUJ0cdgkb+64fOrbhS+OpQNF+gM2XL/QDdO5DZdkC37tDacrlF6dYem+TnrLGP
         xNRi7NG7tkdGug546SpQ8OTJZdCjOzLsiNb8SC/l5L7/hFIVhIf8epOXtLzMEqzREuej
         pZoNH0QiS+5DqgT17uR/qqZW1YSoJvzrQL0/Xb3Z+hUnxsc15vWolQjEeytjeBGhdCzU
         IsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bvSUYwhCU35pqD9sVr8d4DmmML+ab/eSlq9W2GgDok=;
        b=ja815R6SWX4XcotHjQsCmr/Lr2ktBGkj21dulozRFuR3usmA0It+rehGG/Xc8s2V72
         AKmRRTLPUEXSDZSna6Eq5Nu9speU8m3CAzeYdJyU0S4mlsXagrLZ1gQYBP0RUosW7QEY
         r8WWqHGx0xQimV4qRpaMKgAP111LXBiMDfJ0md446X1r+9cBNdtEHsun6JdFhDjH+AQu
         5ybepe74aKSaRXvJWK7w/7fq7zqlf2SmUnbEVZgvNEbW0r7LV8yaHBJJ1f+0jaqcLMi5
         6T3XE3jpOFMg9PusnAckKQQ/j1VxXsKX/Dpa5rFJKP0wDJ8CLeY4i9GTbj68JE2iByu/
         I+2w==
X-Gm-Message-State: AOAM530Y51iIBPDXxUnpuyZyYQo9M0VZASpz2IKDSUcUUmldSYrjTy0z
        UsldkMW/skPBdkUrNjp7mMUaGV1P84yvLcSB9M0=
X-Google-Smtp-Source: ABdhPJwh3GCu9DEICZ08IoAiezuf7ZpuFs67Qa6SfvBN+zM1aJl1cHxUqS2I9GZ9d4BPNnTGYouGxKxOes2vDfYdqlc=
X-Received: by 2002:a67:7307:: with SMTP id o7mr1405918vsc.41.1606805175397;
 Mon, 30 Nov 2020 22:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20201013092746.10602-1-peter.chen@nxp.com>
In-Reply-To: <20201013092746.10602-1-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 1 Dec 2020 14:46:03 +0800
Message-ID: <CAL411-p+6q9U91H+9-jTtkenxhS3FZNgFREjOr1GYoosE4oB_g@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] usb: gadget: core: change the comment for usb_gadget_connect
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 13, 2020 at 8:01 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> The pullup does not need to be enabled at below situations:
> - For platforms which the hardware pullup starts after setting
> register even they do not see the VBUS. If the pullup is always
> enabled for these platforms, it will consume more power and
> break the USB IF compliance tests [1].
> - For platforms which need to do BC 1.2 charger detection after
> seeing the VBUS. Pullup D+ will break the charger detection
> flow.
> - For platforms which the system suspend is allowed when the
> connection with host is there but the bus is not at suspend.
> For these platforms, it is better to disable pullup when
> entering the system suspend otherwise the host may confuse
> the device behavior after controller is in low power mode.
> Disable pullup is considered as a disconnection event from
> host side.
>
> [1] USB-IF Full and Low Speed Compliance Test Procedure
> F Back-voltage Testing
> Section 7.2.1 of the USB specification requires that no device
> shall supply (source) current on VBUS at its upstream facing
> port at any time. From VBUS on its upstream facing port,
> a device may only draw (sink) current. They may not provide power
> to the pull-up resistor on D+/D- unless VBUS is present (see
> Section 7.1.5).
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/gadget/udc/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index debf54205d22..215ecbe8b692 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -659,8 +659,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
>   *
>   * Enables the D+ (or potentially D-) pullup.  The host will start
>   * enumerating this gadget when the pullup is active and a VBUS session
> - * is active (the link is powered).  This pullup is always enabled unless
> - * usb_gadget_disconnect() has been used to disable it.
> + * is active (the link is powered).
>   *
>   * Returns zero on success, else negative errno.
>   */
> --
> 2.17.1
>

Ping...

Peter
