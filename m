Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E98B113A246
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 08:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgANHvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 02:51:55 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37868 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgANHvz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 02:51:55 -0500
Received: by mail-qt1-f193.google.com with SMTP id w47so11672618qtk.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 23:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rhT+e3kmyPDqgmQXDlJ4XsnZWAFBKtN4akZdNapdz4g=;
        b=WZsk/3S904U6Amhzam+HkGVGpD9ofxhA0809RiDrT4fVh1PaMXFYcK96PQcfeyPXZl
         FlPKJH9jlqc5Ygh1B+1E3BbPSYyZiE9w4na87cGBZfI0kChGFZNae2WE61YWxiuqQeTN
         zuAGmr5K/3zvgCUsMOh1QPxfKAKIsTYj2kOwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhT+e3kmyPDqgmQXDlJ4XsnZWAFBKtN4akZdNapdz4g=;
        b=oULx0EITQ1/QQDRHOlnJ1PMhpGFpgwDkmnhTS0D+wIFqhMra6FgEVDBVkbRMbYVzlK
         Lq1P/smZ8B9xJurOqf+LtDnuZLPyqyHYFd0+jJQ1J1FS6vhvPMgrMytF9s1K8h4Fn62S
         z4JYewFBYt3JhIwpPO6AQ5tzCOk7N7Kdk3D7CEcuHPWpy38FP6KoDfhYzZL0rrx1kFpj
         llUzeR2siVeqHm0H7A0xfKRrOAXUco/r9ZeP0uCvBVffXKw6v6o93epfOy8Shtdo3hYP
         K0cAI5KpvIL95BB7YncetEOU58zMPe3dhl/lhJ4CHcVG1qxNxShl8sInGXKZg6HpFbmi
         oYkg==
X-Gm-Message-State: APjAAAXGtmCvhJieh4uJU0oaC2z9bEkyxWP8v58PrkzJTkFBJzlnsmEi
        1Ste9T8/ssiRQ0TSWZ6ucuu5Gcl0Y5xE9GncLrYXSA==
X-Google-Smtp-Source: APXvYqwhQYF/GKLD9HKWK24cEOdmxhckIK4Lacr+f3TBQEpZsO2ajEnxpItfNVrVcpPo1oY6aK0PPcZ8WZLG9FomFVA=
X-Received: by 2002:aed:29e1:: with SMTP id o88mr2577201qtd.182.1578988313958;
 Mon, 13 Jan 2020 23:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20200114044127.20085-1-kai.heng.feng@canonical.com>
In-Reply-To: <20200114044127.20085-1-kai.heng.feng@canonical.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 13 Jan 2020 23:51:42 -0800
Message-ID: <CACeCKacQpDsptRi6AZhuFYg2c87-bW0KS6vy=CacB8+j+6YBXA@mail.gmail.com>
Subject: Re: [PATCH] r8152: Add MAC passthrough support to new device
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     David Miller <davem@davemloft.net>,
        Hayes Wang <hayeswang@realtek.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Grant Grundler <grundler@chromium.org>,
        Mario Limonciello <mario.limonciello@dell.com>,
        David Chen <david.chen7@dell.com>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 13, 2020 at 8:41 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Device 0xa387 also supports MAC passthrough, therefore add it to the
> whitelst.
>
> BugLink: https://bugs.launchpad.net/bugs/1827961/comments/30
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/net/usb/r8152.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index c5ebf35d2488..42dcf1442cc0 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -6657,7 +6657,8 @@ static int rtl8152_probe(struct usb_interface *intf,
>         }
>
>         if (le16_to_cpu(udev->descriptor.idVendor) == VENDOR_ID_LENOVO &&
> -           le16_to_cpu(udev->descriptor.idProduct) == 0x3082)
> +           (le16_to_cpu(udev->descriptor.idProduct) == 0x3082 ||
> +            le16_to_cpu(udev->descriptor.idProduct) == 0xa387))
Perhaps we can try to use #define's for these vendor IDs (like
https://github.com/torvalds/linux/blob/master/drivers/net/usb/r8152.c#L680)
?

>                 set_bit(LENOVO_MACPASSTHRU, &tp->flags);
>
>         if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x3011 && udev->serial &&
> --
> 2.17.1
>
