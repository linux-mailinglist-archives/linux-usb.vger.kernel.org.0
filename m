Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41553302C6
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 16:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhCGPyC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 10:54:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52548 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230460AbhCGPxU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 10:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615132399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2E9HR/8SE8nfv2QApREdLqcMX48ExNvPHTTBJrV6T/Q=;
        b=V2/j7ntCk7C+x+t0aiHNIjX/O+H87sqX4bRLcXcCYRVQUEGjHOgRzW/fntYvGMrx3si79l
        3AXE6AOU0EWldZV4dDdD4YNOduM4HHDg9ywmhRnSNce3scq+vh1RfiE7Cc7BvBHnX9WQjk
        jBWUYspWebkvkMu2sSe//CohymxTByA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-x9iBJjjdMhmzFA-kX4OtAQ-1; Sun, 07 Mar 2021 10:53:17 -0500
X-MC-Unique: x9iBJjjdMhmzFA-kX4OtAQ-1
Received: by mail-ed1-f72.google.com with SMTP id o15so3846323edv.7
        for <linux-usb@vger.kernel.org>; Sun, 07 Mar 2021 07:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2E9HR/8SE8nfv2QApREdLqcMX48ExNvPHTTBJrV6T/Q=;
        b=EbN9UkSx3Nn+3hSeQ27U3yUPVpz/ZAwv1dCUYEnlzIBs17PSdmfXStIGDPBx11o3LO
         VUK5s/4VaMxUiM29Hy5n0FN3TuEGMNRXyj65QmH3Oe0tTb1vzYumsjQN17f7bbYoP8gp
         1gZGe03IxI4v8Bwlseh6U2f9VefUgMnie09lU7YtxQvoE+TL7Ap6eMgwDMo7lJUoZN5n
         tPbNdklh7RPwUdoqHYBXB+N78WwGBe3Qgcio4/g1TBD1he0OMbpQxwk/vXqAz2lH6Rmo
         5R2c6c59Mc5gLMe4niPHjyvazCaFq44UjHoQW4EttIpoR6+69V0zEU+6CmjCllPHzrxX
         0SMQ==
X-Gm-Message-State: AOAM530p/RRf1B1sm9CB2xDA0UgJnfiPTerQTFaFla3bLSS29GHwnQ27
        SBj8AMGLFv0vAw7eTJ/oxjmqZwQhbD84ByqEW0DDjoCxkcktMzKxpiXj04Xea1smHugG358ECMC
        PRk13gwOuHqv8zvukNYeNva7Elth5Loyvk2UKFt5wZdmjhXDADUYl8djknPytsEmrKTewa2sb
X-Received: by 2002:a05:6402:3096:: with SMTP id de22mr18181529edb.141.1615132396064;
        Sun, 07 Mar 2021 07:53:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP5p69RzMCXKSg36ruW8Av63862LYZpkJMpWBWfgGP/6ddMiTAtbSNvNSQisCnP/mqNV3vOQ==
X-Received: by 2002:a05:6402:3096:: with SMTP id de22mr18181520edb.141.1615132395867;
        Sun, 07 Mar 2021 07:53:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y17sm5148199ejf.116.2021.03.07.07.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 07:53:15 -0800 (PST)
Subject: Re: [PATCH] Add unusal uas devices reported by Umbrel users
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     linux-usb@vger.kernel.org
References: <aaron.dewes@web.de> <20210307151830.38070-1-aaron.dewes@web.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a8c2e4b2-ef9b-2eef-d76f-1dd304bd49b4@redhat.com>
Date:   Sun, 7 Mar 2021 16:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307151830.38070-1-aaron.dewes@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

First of all I'm not the maintainer of this file, to find the
right email address to submit patches to see:


[hans@x1 linux]$ scripts/get_maintainer.pl -f drivers/usb/storage/uas.c 
Oliver Neukum <oneukum@suse.com> (maintainer:USB ATTACHED SCSI)
Alan Stern <stern@rowland.harvard.edu> (maintainer:USB MASS STORAGE DRIVER)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
linux-usb@vger.kernel.org (open list:USB ATTACHED SCSI)
linux-scsi@vger.kernel.org (open list:USB ATTACHED SCSI)
usb-storage@lists.one-eyed-alien.net (open list:USB MASS STORAGE DRIVER)
linux-kernel@vger.kernel.org (open list)


On 3/7/21 4:18 PM, Aaron Dewes wrote:

No commit message ? No explanation, just disable UAS on a long list
of devices, including several very popular devices such as various
Samsung models, without any explanation at all ?

Sorry, but in that case all I can do is NACK this patch.

Please split this into a series with one patch per model, while
explaining for each mode what the problem is, including links to
bug-reports or forum discussions.

Disabling UAS is a big hammer and severely limits performance,
as it also disables all forms of NCQ which is a must have
feature to get decent performance from SSDs.

And often UAS is not the problem, disabling UAS simply papers
over the problem, e.g.:

1. Disabling it either hides issue with the XHCI bulk-streams
handling (could be a bug in the XHCI controller, or in the kernel's
XHCI code).

2. Disabling it makes the SSD use much less power since it now
cannot multi-task, so often it is hiding problems with the
power-supplied to the disk.

I see at https://github.com/getumbrel/umbrel that the recommended
platform for Umbrel is a Raspberry Pi 4. Which certainly explains
the long list of UAS problems. Pi-s are famous for their USB
problems. I don't know if the Pi 4 suffers from 1. above, but I
would not be surprised if does; and the Pi certainly suffers from 2.
https://www.raspberrypi.org/forums/viewtopic.php?p=1507278 is an
interesting read here. The USB-3 spec says that USB-3 ports must
be capable of 0.9 A per port, the R-Pi 4 maxes out at 1.2A
for all 4 ports combined.. And then only if its own power-supply
is capable enough; and nothing is said there about how low the
voltage drops when actually drawing 1.2A and any voltage drop
itself might also be an issue.

Also see below for some inline comments.



> ---
>  drivers/usb/storage/unusual_uas.h | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index f9677a5ec31b..a67ed2b527fa 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -28,6 +28,27 @@
>   * and don't forget to CC: the USB development list <linux-usb@vger.kernel.org>
>   */
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x4001, 0x0000, 0x9999,
> +		"Samsung",
> +		"SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),

There is no need to specify US_FL_NO_REPORT_OPCODES if you are
disabling UAS, same for all the other entries.

> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x61b6, 0x0000, 0x9999,
> +		"Samsung",
> +		"M3 Portable Hard Drive",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x61f5, 0x0000, 0x9999,
> +		"Samsung",
> +		"Portable SSD T5",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +

These are very popular drives if these really had broken
UAS support then we would already have a ton of reports
about these.

>  /* Reported-by: Till Dörges <doerges@pre-sense.de> */
>  UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
>  		"Sony",
> @@ -62,6 +83,20 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x1058, 0x082a, 0x0000, 0x9999,
> +		"Western Digital",
> +		"SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),

Idem.

> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x125f, 0xa76a, 0x0000, 0x9999,
> +		"ADATA",
> +		"ED600 enclosure",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",
> @@ -76,6 +111,13 @@ UNUSUAL_DEV(0x152d, 0x0539, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x152d, 0x0562, 0x0000, 0x9999,
> +		"JMicron",
> +		"JMS567",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +

These are very popular chipsets if these really had broken
UAS support then we would already have a ton of reports
about these.

>  /* Reported-by: Claudio Bizzarri <claudio.bizzarri@gmail.com> */
>  UNUSUAL_DEV(0x152d, 0x0567, 0x0000, 0x9999,
>  		"JMicron",
> @@ -90,6 +132,20 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
> +		"JMicron",
> +		"JMS561U",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
> +		"JMicron",
> +		"External Disk connector",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +

Idem.

>  /* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
>  UNUSUAL_DEV(0x154b, 0xf00b, 0x0000, 0x9999,
>  		"PNY",
> @@ -104,6 +160,13 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x174c, 0x55aa, 0x0000, 0x9999,
> +		"ASMedia",
> +		"ASM1051E and ASM1053E",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +

Another very popular chipsets, some older versions of these
indeed have some issues, we have special code handling these
with chipset version specific behavior, see:

drivers/usb/storage/uas-detect.h

Which also means that UAS is actually know to work fine
on the newer models and it should not be outright disabled
on them as you are doing here!

Together with the samsung drivers + jmicron bridge chipsets you
are disabling UAS on what is probably 50% of all capable UAS
drives out there (if not 70% or more).

Did I already say: NACK ?


At the top I indicated that you should split this in per
model patches, but that was before I figured out most of
these problems are beeing seen on Raspberry Pi-s (and likely
on Raspberry Pi-s only).

What might be worth considering is disabling bulk-stream support
on the Pi-s XHCI controller by setting the  XHCI_BROKEN_STREAMS
flag in xhci->quirks for that controller.  This will disable UAS
at least when the drivers are plugged into the USB3 / superspeed
ports of the Pi.  This might still be a too big hammer though.
since with a powered-hub, or with a proper power-supply feeding
the Pi 4 (and not using the other ports) UAS might still work
and you are now taking away those options from users.

But setting the XHCI_BROKEN_STREAMS flag on the Pi 4 and only
on the Pi 4 would definitely be closer to acceptable then disabling
UAS for, well everyone, because it is causing issues on the Pi.

Regards,

Hans

