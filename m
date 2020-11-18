Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4EB2B7E13
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 14:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgKRNIv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 18 Nov 2020 08:08:51 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57531 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgKRNIu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Nov 2020 08:08:50 -0500
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kfNCZ-0000aI-W5
        for linux-usb@vger.kernel.org; Wed, 18 Nov 2020 13:08:48 +0000
Received: by mail-pl1-f200.google.com with SMTP id bf9so1144557plb.18
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2020 05:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=21ZU1BIRNMQ3+uPHUldMQmJXyQgMOx75iKFMw5odfJA=;
        b=n6bITJJSug8fuk5iV+IXhyAOdCVFs4WG/21euRPCjrid0tgnQQe27J3msDXpjNWNls
         pNr3XB2d8pBTP4rU9Ns5Pl6rfzAvUTQ/LA0JRyww7OIExoROL2gwg8vgXwB0HI/LtTRV
         ggRXg4kF9arhVmh+ox23H4WuszXX/6DGcwBHjBwzttLpaCINa9Jtg5NuJbhlWFZe1cz0
         oQuH6xeDSeq6jxH72lxx56QBhlqEEQy4Zushu3NnhjotPhk18/GRREUpt97LeSDiqpn+
         JTh23uxboWoL4lNakCqVY7kY6tIE6uumx84ZjsADfpeI88Cx2pJfBVmvdHvk7I22eHM3
         D+sw==
X-Gm-Message-State: AOAM5315d8rKPEbZYL5NU0QeC35f1NtYXfbKNNX9/U2Pq3fOksvzRD8p
        nPZGXY3UXhj/KwVcNOLJDN3weme846gkU3jOdXf7jxMrj8fLYWy+I6c3Mxw1DbUpTRbE0peuGsf
        c7zJYqJWLHXmKpkkA6IR54nCt9JtrK6Pz2eDE4g==
X-Received: by 2002:a17:90a:ee82:: with SMTP id i2mr3966970pjz.158.1605704926571;
        Wed, 18 Nov 2020 05:08:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2qEeW96egxD1oQg6RcIwS4sTi9RYIzJYDeuD50SjWQBN/StPaHqbRf98w76gcOcUXjhdqgg==
X-Received: by 2002:a17:90a:ee82:: with SMTP id i2mr3966947pjz.158.1605704926236;
        Wed, 18 Nov 2020 05:08:46 -0800 (PST)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id z22sm2428925pje.16.2020.11.18.05.08.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 05:08:45 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH] USB: quirks: Add USB_QUIRK_DISCONNECT_SUSPEND quirk for
 Lenovo A630Z TIO built-in usb-audio card
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20201118123039.11696-1-penghao@uniontech.com>
Date:   Wed, 18 Nov 2020 21:08:41 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, johan@kernel.org,
        jonathan@jdcox.net, tomasz@meresinski.eu,
        Hans de Goede <hdegoede@redhat.com>, dlaz@chromium.org,
        richard.o.dodd@gmail.com, kerneldev@karsmulder.nl,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <49219711-84BE-44FC-BBFE-DD8D609CA26D@canonical.com>
References: <20201118123039.11696-1-penghao@uniontech.com>
To:     penghao <penghao@uniontech.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi penghao,

> On Nov 18, 2020, at 20:30, penghao <penghao@uniontech.com> wrote:
> 
> Add a USB_QUIRK_DISCONNECT_SUSPEND quirk for the Lenovo TIO built-in
> usb-audio. when A630Z going into S3,the system immediately wakeup 7-8
> seconds later by usb-audio disconnect interrupt to avoids the issue.
> eg dmesg:
> ....
> [  626.974091 ] usb 7-1.1: USB disconnect, device number 3
> ....
> ....
> [ 1774.486691] usb 7-1.1: new full-speed USB device number 5 using xhci_hcd
> [ 1774.947742] usb 7-1.1: New USB device found, idVendor=17ef, idProduct=a012, bcdDevice= 0.55
> [ 1774.956588] usb 7-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [ 1774.964339] usb 7-1.1: Product: Thinkcentre TIO24Gen3 for USB-audio
> [ 1774.970999] usb 7-1.1: Manufacturer: Lenovo
> [ 1774.975447] usb 7-1.1: SerialNumber: 000000000000
> [ 1775.048590] usb 7-1.1: 2:1: cannot get freq at ep 0x1

Can you please attach full dmesg with dynamic debug enabled when the issue happens?

We may need to poll for U3 in xhci_bus_suspend().

Kai-Heng

> .......
> Seeking a better fix, we've tried a lot of things, including:
> - Check that the device's power/wakeup is disabled
> - Check that remote wakeup is off at the USB level
> - All the quirks in drivers/usb/core/quirks.c
>   e.g. USB_QUIRK_RESET_RESUME,
>        USB_QUIRK_RESET,
>        USB_QUIRK_IGNORE_REMOTE_WAKEUP,
>        USB_QUIRK_NO_LPM.
> 
> but none of that makes any difference.
> 
> There are no errors in the logs showing any suspend/resume-related issues.
> When the system wakes up due to the modem, log-wise it appears to be a
> normal resume.
> 
> Introduce a quirk to disable the port during suspend when the modem is
> detected.
> 
> Changes since v5
> - Add dmesg for this issue
> 
> Changes since v4
> - Fixed add a blank line
> 
> Changes since v3
> - Fixed spelling error on appropriate
> 
> Changes since v2
> - Add Changes commit format
> 
> Changes since v1
> - Change subject form "ALSA" to "USB:"
> - Adjust to appropriate line
> 
> Signed-off-by: penghao <penghao@uniontech.com>
> ---
> drivers/usb/core/quirks.c | 4 ++++
> 1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 7c1198f80c23..26b852ae0d85 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -410,6 +410,10 @@ static const struct usb_device_id usb_quirk_list[] = {
> 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
> 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
> 
> +	/* Lenovo ThinkCenter A630Z TI024Gen3 usb-audio */
> +	{ USB_DEVICE(0x17ef, 0xa012), .driver_info =
> +			USB_QUIRK_DISCONNECT_SUSPEND },
> +
> 	/* BUILDWIN Photo Frame */
> 	{ USB_DEVICE(0x1908, 0x1315), .driver_info =
> 			USB_QUIRK_HONOR_BNUMINTERFACES },
> -- 
> 2.11.0
> 
> 
> 

