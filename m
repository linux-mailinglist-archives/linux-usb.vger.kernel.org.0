Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D735497BDE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 10:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbiAXJXn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 04:23:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:17856 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233686AbiAXJXh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jan 2022 04:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643016217; x=1674552217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JwfbH2BtLhHwgNXD/kpbZVxetGYkdorw9LZHJPIMVkg=;
  b=KSXy8+CP5DL52HiLqHYZbkRG3gjo+nTxaE9Yt6+kCDiwuDMaCZYXSnsv
   XRp/e+VkecBL3Uiy08IMzW87bgNSACv560znCgrrINir5ObK3sOiaXquF
   shnR/SP4JYqbWt3gFWW55V9Ips9iHAoo3G2fiyJ/RP0K1kzuNCvVPhXCO
   +v2Zy8GQEQ/BbTULriCfYrAXyYuzYyYG0Vpcbff0bNUgD4X1CMNstMnoz
   XoN97hSBn+8BIoYqBIe9XxF3KUoennv23g59d6hE0vScnAmBHHNa+JamX
   gx2EtIxzbgt4HTJ4AgXvQeWQDYuOSEbyMKmySbrB1cStOucM0BfHhg2Bx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246220653"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="246220653"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673566592"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Jan 2022 01:23:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 24 Jan 2022 11:23:33 +0200
Date:   Mon, 24 Jan 2022 11:23:33 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <Ye5wFVwQTWawdPPK@kuha.fi.intel.com>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
 <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
 <20210826114105.amyjjhslqhiqdw6e@fastboi.localdomain>
 <178d8c7ca72400c2aa12679d4532611d@cavoj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178d8c7ca72400c2aa12679d4532611d@cavoj.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 22, 2022 at 12:21:29AM +0000, Samuel Čavoj wrote:
> Hi Heikki,
> 
> do you think we could get this back on track somehow? I'm not sure what to
> try next, do you have any ideas? Are there any tools to try and trace what
> the Windows driver does? Either from within Windows itself or intercept it
> somehow externally -- a hypervisor approach? Are there any tools developed
> for this purpose? I wasn't really able to find much.

I don't have any ideas right now, but I'll try to think of something
that we could try. I'll also see if I can get my hands on one of those
Asus Zenbook laptops. It was a Zenbook 13, right?

Did you try to see what happens if you don't reset the "PPM"?

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f0c2fa19f3e0f..6e93ef0cbe006 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1199,13 +1199,6 @@ static int ucsi_init(struct ucsi *ucsi)
        int ret;
        int i;
 
-       /* Reset the PPM */
-       ret = ucsi_reset_ppm(ucsi);
-       if (ret) {
-               dev_err(ucsi->dev, "failed to reset PPM!\n");
-               goto err;
-       }
-
        /* Enable basic notifications */
        ucsi->ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
        command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;

thanks,

> On 2021-08-26 12:41, Samuel Čavoj wrote:
> > Hello,
> > 
> > On 26.08.2021 10:53, Heikki Krogerus wrote:
> > > Hi Samuel,
> > > 
> > > >
> > > > the command finishes instantly and does not seem to produce any error.
> > > >
> > > >     PS C:\Program Files (x86)\USBTest\x64> .\UcsiControl.exe Send 0 00010005
> > > >     COMMAND:
> > > >     AsUInt64: 10005
> > > >     Command: 5
> > > >     DataLength: 0
> > > >
> > > >     MESSAGE IN is empty.
> > > 
> > > Thanks for testing that. So UCSI is definitely working on this
> > > platform. I guess the ACPI notifications are simply not going through.
> > > 
> > > Can you check if there are any events coming from the EC with the
> > > following commands:
> > > 
> > >         % modprobe -r ucsi_acpi
> > >         % modprobe -r typec_ucsi
> > >         % grep -i acpi /proc/interrupts
> > >         ...
> > >         % modprobe typec_ucsi
> > >         % modprobe ucsi_acpi
> > >         % grep -i acpi /proc/interrupts
> > >         ...
> > > 
> > > See if the number of interrupts increases considerable, or at all. The
> > > ucsi drivers need to be modules of course in order for that to work.
> > 
> > I made four snapshots of the (filtered) /proc/interrupts file:
> > 
> >     1. with the modules loaded normally
> >     2. right after unloading them
> >     3. right after loading them again
> >     4. after the timeout expires and the init failed message is logged
> > 
> > Files 3 and 4 are identical. Between 1--2 and 2--3, IRQ 9 increases by
> > exactly 1 each time. The IRQ is described as "IR-IO-APIC 9-fasteoi
> > acpi".
> > Here is the line in question from each of the files.
> > 
> >             CPU0       CPU1       CPU2       CPU3       CPU4
> > CPU5       CPU6       CPU7       CPU8       CPU9       CPU10
> > CPU11      CPU12      CPU13      CPU14      CPU15
> >    9:          0         52          0          0          0
> > 0          0          0          0          0          0          0
> >       0          0          0          0  IR-IO-APIC    9-fasteoi
> > acpi
> >    9:          0         53          0          0          0
> > 0          0          0          0          0          0          0
> >       0          0          0          0  IR-IO-APIC    9-fasteoi
> > acpi
> >    9:          0         54          0          0          0
> > 0          0          0          0          0          0          0
> >       0          0          0          0  IR-IO-APIC    9-fasteoi
> > acpi
> >    9:          0         54          0          0          0
> > 0          0          0          0          0          0          0
> >       0          0          0          0  IR-IO-APIC    9-fasteoi
> > acpi
> > 
> > To make it clear what I did in the first place, is to add a dev_err line
> > in the error branch right after "Enable basic notifications" in
> > ucsi_init. The line does get printed.
> > 
> > My understanding is that the PPM is completely quiet during the reset
> > procedure, and therefore the single notifications received should be the
> > completion notification for the "enable basic notifications" command.
> > 
> > I added a debug print to ucsi_acpi_notify, to see if the interrupt is
> > getting routed correctly at all (I suspected the ACPI might be
> > generating notifications for a different device). Another debug print
> > was added to ucsi_init right after the reset completes.
> > 
> > This is a snippet from ucsi_acpi_notify showing added printouts:
> > 
> >     dev_err(ua->dev, "checking ua->flags: %ld, cci: %d\n", ua->flags,
> > cci);
> > 	if (test_bit(COMMAND_PENDING, &ua->flags) &&
> > 	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE)) {
> > 
> >         dev_err(ua->dev, "complete\n");
> > 		complete(&ua->complete);
> >     }
> > 
> > Indeed, ucsi_acpi_notify gets called once when the module loads, after
> > the reset procedure is completed (as long as the ordering of the
> > messages in dmesg is good enough to tell, they are 20ms apart).
> > This is the output in dmesg: (i shortened the timeout to 5s).
> > 
> >     [ 1397.741701] ucsi_acpi USBC000:00: PPM reset succeeded
> >     [ 1397.761319] ucsi_acpi USBC000:00: checking ua->flags: 2, cci: 0
> >     [ 1402.941808] ucsi_acpi USBC000:00: failed to enable basic
> > notifications
> >     [ 1402.989510] ucsi_acpi USBC000:00: PPM init failed (-110)
> > 
> > The completion condition is not satisfied and "complete" is not
> > printed. Possibly the firmware has some quirk, a cci of 0 seems wrong to
> > me.
> > 
> > > Maybe there is something special that the OS should do with the EC on
> > 
> > I suppose either that, or the PPM deviates from the spec. I don't know
> > how to go about tracing what Windows does, but that would be a way to
> > go.
> > 
> > > your board... There is a weird message in your dmesg.
> > > 
> > >         "ACPI: EC: interrupt blocked"
> > > 
> > > I don't know if it's relevant at all in this case, but I've just never
> > > seen that. I'm not an EC or ACPI expert, but I think that you only see
> > > that if the EC event interrupt is a GPIO. I would expect there to be
> > > also a message:
> > > 
> > >         "ACPI: EC: interrupt unblocked"
> > 
> > There is such a message in the log, on line 475. Also on every suspend,
> > the interrupt is blocked before going to sleep and unblocked when waking
> > up, which makes sense.
> > 
> > > But as said, I'm really not an EC expert. We probable need to ask the
> > > ACPI guys about this, but let's first check the interrupts.
> > > 
> > > thanks,
> > > 
> > > --
> > > heikki
> > 
> > Thank you very much for helping me with this.
> > 
> > Regards,
> > Samuel

-- 
heikki
