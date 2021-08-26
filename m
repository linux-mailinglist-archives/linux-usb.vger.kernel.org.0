Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78D13F869D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 13:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242114AbhHZLl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 07:41:59 -0400
Received: from lithium.sammserver.com ([168.119.122.30]:38382 "EHLO
        lithium.sammserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241887AbhHZLl4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Aug 2021 07:41:56 -0400
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 6E41331181D6;
        Thu, 26 Aug 2021 13:41:08 +0200 (CEST)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 732723721C;
        Thu, 26 Aug 2021 13:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1629978068; bh=zWxopHfqmkwz0Upnnz8TWqSU/Rkr5oom8iQpnfsX3EU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rGBZbQn2FTFcUGMPv42ixUCCv3tAa/QR0Dsho0w9woR9IFMd39pK+lYFCO9TWulQ9
         vZ7nnu6hGZBqyqlLyVK1f7iPOckDosxvjPGFEBNlc2dLhO1dNm2ZefvKI9/M5igJxC
         advew0B/SaJV9dAg9r4gQ8nHvDuMIACWuNLENU8c=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id 4D9DD1421D6B; Thu, 26 Aug 2021 13:41:05 +0200 (CEST)
Date:   Thu, 26 Aug 2021 13:41:05 +0200
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <20210826114105.amyjjhslqhiqdw6e@fastboi.localdomain>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
 <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on sammserver.tu
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 26.08.2021 10:53, Heikki Krogerus wrote:
> Hi Samuel,
> 
> > 
> > the command finishes instantly and does not seem to produce any error.
> > 
> >     PS C:\Program Files (x86)\USBTest\x64> .\UcsiControl.exe Send 0 00010005
> >     COMMAND:
> >     AsUInt64: 10005
> >     Command: 5
> >     DataLength: 0
> >     
> >     MESSAGE IN is empty.
> 
> Thanks for testing that. So UCSI is definitely working on this
> platform. I guess the ACPI notifications are simply not going through.
> 
> Can you check if there are any events coming from the EC with the
> following commands:
> 
>         % modprobe -r ucsi_acpi
>         % modprobe -r typec_ucsi
>         % grep -i acpi /proc/interrupts
>         ...
>         % modprobe typec_ucsi
>         % modprobe ucsi_acpi
>         % grep -i acpi /proc/interrupts
>         ...
> 
> See if the number of interrupts increases considerable, or at all. The
> ucsi drivers need to be modules of course in order for that to work.

I made four snapshots of the (filtered) /proc/interrupts file:

    1. with the modules loaded normally
    2. right after unloading them
    3. right after loading them again
    4. after the timeout expires and the init failed message is logged

Files 3 and 4 are identical. Between 1--2 and 2--3, IRQ 9 increases by
exactly 1 each time. The IRQ is described as "IR-IO-APIC 9-fasteoi acpi".
Here is the line in question from each of the files.

            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7       CPU8       CPU9       CPU10      CPU11      CPU12      CPU13      CPU14      CPU15
   9:          0         52          0          0          0          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    9-fasteoi   acpi
   9:          0         53          0          0          0          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    9-fasteoi   acpi
   9:          0         54          0          0          0          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    9-fasteoi   acpi
   9:          0         54          0          0          0          0          0          0          0          0          0          0          0          0          0          0  IR-IO-APIC    9-fasteoi   acpi

To make it clear what I did in the first place, is to add a dev_err line
in the error branch right after "Enable basic notifications" in
ucsi_init. The line does get printed.

My understanding is that the PPM is completely quiet during the reset
procedure, and therefore the single notifications received should be the
completion notification for the "enable basic notifications" command.

I added a debug print to ucsi_acpi_notify, to see if the interrupt is
getting routed correctly at all (I suspected the ACPI might be
generating notifications for a different device). Another debug print
was added to ucsi_init right after the reset completes.

This is a snippet from ucsi_acpi_notify showing added printouts:

    dev_err(ua->dev, "checking ua->flags: %ld, cci: %d\n", ua->flags, cci);
	if (test_bit(COMMAND_PENDING, &ua->flags) &&
	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE)) {
        
        dev_err(ua->dev, "complete\n");
		complete(&ua->complete);
    }

Indeed, ucsi_acpi_notify gets called once when the module loads, after
the reset procedure is completed (as long as the ordering of the
messages in dmesg is good enough to tell, they are 20ms apart).
This is the output in dmesg: (i shortened the timeout to 5s).

    [ 1397.741701] ucsi_acpi USBC000:00: PPM reset succeeded
    [ 1397.761319] ucsi_acpi USBC000:00: checking ua->flags: 2, cci: 0
    [ 1402.941808] ucsi_acpi USBC000:00: failed to enable basic notifications
    [ 1402.989510] ucsi_acpi USBC000:00: PPM init failed (-110)

The completion condition is not satisfied and "complete" is not
printed. Possibly the firmware has some quirk, a cci of 0 seems wrong to
me.

> Maybe there is something special that the OS should do with the EC on

I suppose either that, or the PPM deviates from the spec. I don't know
how to go about tracing what Windows does, but that would be a way to
go.

> your board... There is a weird message in your dmesg.
> 
>         "ACPI: EC: interrupt blocked"
> 
> I don't know if it's relevant at all in this case, but I've just never
> seen that. I'm not an EC or ACPI expert, but I think that you only see
> that if the EC event interrupt is a GPIO. I would expect there to be
> also a message:
> 
>         "ACPI: EC: interrupt unblocked"

There is such a message in the log, on line 475. Also on every suspend,
the interrupt is blocked before going to sleep and unblocked when waking
up, which makes sense.

> But as said, I'm really not an EC expert. We probable need to ask the
> ACPI guys about this, but let's first check the interrupts.
> 
> thanks,
> 
> -- 
> heikki

Thank you very much for helping me with this.

Regards,
Samuel
