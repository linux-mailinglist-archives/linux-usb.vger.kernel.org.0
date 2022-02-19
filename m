Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068E14BC3AC
	for <lists+linux-usb@lfdr.de>; Sat, 19 Feb 2022 01:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240528AbiBSAtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 19:49:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbiBSAtB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 19:49:01 -0500
X-Greylist: delayed 537 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Feb 2022 16:48:32 PST
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7661027AA27
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 16:48:32 -0800 (PST)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id E299831181C8;
        Sat, 19 Feb 2022 01:39:33 +0100 (CET)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
        by mail.sammserver.com (Postfix) with ESMTP id 947581582B;
        Sat, 19 Feb 2022 01:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1645231173; bh=Xv3sbVkbvb95E++6ooTNfl3Ncu88E/iqQucNq7aarOQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=isKEzcQp+Vb/hOuQVxWqm/YfaCDQCC3zqSThWgRH0VoScWog20FvB7VwQfIjEWN/f
         xDNTl20Tp5xTp3MYibYctIftHEEP+d6Vkg/jSybSvSBFTH0/fms5NDKDv3WoinPSX3
         IJZd4vBm6uxYTmvl16XmvJaB7kYGuS1IFUgAnyNQ=
MIME-Version: 1.0
Date:   Sat, 19 Feb 2022 01:39:33 +0100
From:   =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
In-Reply-To: <Ye5wFVwQTWawdPPK@kuha.fi.intel.com>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
 <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
 <20210826114105.amyjjhslqhiqdw6e@fastboi.localdomain>
 <178d8c7ca72400c2aa12679d4532611d@cavoj.net>
 <Ye5wFVwQTWawdPPK@kuha.fi.intel.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <23e8104421efcf0937168e0ac5489367@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

sorry about the delay.

On 2022-01-24 10:23, Heikki Krogerus wrote:
> On Sat, Jan 22, 2022 at 12:21:29AM +0000, Samuel Čavoj wrote:
>> Hi Heikki,
>> 
>> do you think we could get this back on track somehow? I'm not sure 
>> what to
>> try next, do you have any ideas? Are there any tools to try and trace 
>> what
>> the Windows driver does? Either from within Windows itself or 
>> intercept it
>> somehow externally -- a hypervisor approach? Are there any tools 
>> developed
>> for this purpose? I wasn't really able to find much.
> 
> I don't have any ideas right now, but I'll try to think of something
> that we could try. I'll also see if I can get my hands on one of those
> Asus Zenbook laptops. It was a Zenbook 13, right?

Yup, it's a Zenbook 13 OLED (UM325).

> 
> Did you try to see what happens if you don't reset the "PPM"?

No difference, as far as I can tell. I used the patch below to
get more output. This is right after boot, in the initramfs:

[    0.787887] ucsi_acpi USBC000:00: hi ucsi here
[    0.787893] ucsi_acpi USBC000:00: skipping reset
[    0.787894] ucsi_acpi USBC000:00: enable basic notifications
[    0.813169] ucsi_acpi USBC000:00: got notification:
[    0.814386] ucsi_acpi USBC000:00:     checking ua->flags: 2, cci: 0
[    1.859334] ucsi_acpi USBC000:00: PPM init failed (-110)

Same output after cold boot, reboot from linux and reboot from windows.

Thanks,
Samuel

diff --git a/drivers/usb/typec/ucsi/ucsi.c 
b/drivers/usb/typec/ucsi/ucsi.c
index 08561bf7c40c..f1880bdaa9f6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1185,25 +1185,34 @@ static int ucsi_init(struct ucsi *ucsi)
  	int ret;
  	int i;

+	dev_info(ucsi->dev, "hi ucsi here");
  	/* Reset the PPM */
+	dev_warn(ucsi->dev, "skipping reset");
+	/*
  	ret = ucsi_reset_ppm(ucsi);
  	if (ret) {
  		dev_err(ucsi->dev, "failed to reset PPM!\n");
  		goto err;
  	}
+	dev_info(ucsi->dev, "reset ok");
+	*/

  	/* Enable basic notifications */
  	ucsi->ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
  	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
+	dev_info(ucsi->dev, "enable basic notifications");
  	ret = ucsi_send_command(ucsi, command, NULL, 0);
  	if (ret < 0)
  		goto err_reset;
+	dev_info(ucsi->dev, "done enable basic notifications");

  	/* Get PPM capabilities */
  	command = UCSI_GET_CAPABILITY;
+	dev_info(ucsi->dev, "get capabilities");
  	ret = ucsi_send_command(ucsi, command, &ucsi->cap, sizeof(ucsi->cap));
  	if (ret < 0)
  		goto err_reset;
+	dev_info(ucsi->dev, "done get capabilities");

  	if (!ucsi->cap.num_connectors) {
  		ret = -ENODEV;
@@ -1228,9 +1237,11 @@ static int ucsi_init(struct ucsi *ucsi)
  	/* Enable all notifications */
  	ucsi->ntfy = UCSI_ENABLE_NTFY_ALL;
  	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
+	dev_info(ucsi->dev, "enable all notifications");
  	ret = ucsi_send_command(ucsi, command, NULL, 0);
  	if (ret < 0)
  		goto err_unregister;
+	dev_info(ucsi->dev, "done enable all notifications");

  	return 0;

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c 
b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 6771f05e32c2..765c89594c41 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -98,6 +98,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 
event, void *data)
  	struct ucsi_acpi *ua = data;
  	u32 cci;
  	int ret;
+	dev_info(ua->dev, "got notification:\n");

  	ret = ucsi_acpi_read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
  	if (ret)
@@ -106,9 +107,13 @@ static void ucsi_acpi_notify(acpi_handle handle, 
u32 event, void *data)
  	if (UCSI_CCI_CONNECTOR(cci))
  		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));

+	dev_info(ua->dev, "    checking ua->flags: %ld, cci: %d\n", ua->flags, 
cci);
  	if (test_bit(COMMAND_PENDING, &ua->flags) &&
-	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
+	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE)) {
+
+		dev_warn(ua->dev, "    complete\n");
  		complete(&ua->complete);
+	}
  }

  static int ucsi_acpi_probe(struct platform_device *pdev)

> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c 
> b/drivers/usb/typec/ucsi/ucsi.c
> index f0c2fa19f3e0f..6e93ef0cbe006 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1199,13 +1199,6 @@ static int ucsi_init(struct ucsi *ucsi)
>         int ret;
>         int i;
> 
> -       /* Reset the PPM */
> -       ret = ucsi_reset_ppm(ucsi);
> -       if (ret) {
> -               dev_err(ucsi->dev, "failed to reset PPM!\n");
> -               goto err;
> -       }
> -
>         /* Enable basic notifications */
>         ucsi->ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | 
> UCSI_ENABLE_NTFY_ERROR;
>         command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
> 
> thanks,
> 
>> On 2021-08-26 12:41, Samuel Čavoj wrote:
>> > Hello,
>> >
>> > On 26.08.2021 10:53, Heikki Krogerus wrote:
>> > > Hi Samuel,
>> > >
>> > > >
>> > > > the command finishes instantly and does not seem to produce any error.
>> > > >
>> > > >     PS C:\Program Files (x86)\USBTest\x64> .\UcsiControl.exe Send 0 00010005
>> > > >     COMMAND:
>> > > >     AsUInt64: 10005
>> > > >     Command: 5
>> > > >     DataLength: 0
>> > > >
>> > > >     MESSAGE IN is empty.
>> > >
>> > > Thanks for testing that. So UCSI is definitely working on this
>> > > platform. I guess the ACPI notifications are simply not going through.
>> > >
>> > > Can you check if there are any events coming from the EC with the
>> > > following commands:
>> > >
>> > >         % modprobe -r ucsi_acpi
>> > >         % modprobe -r typec_ucsi
>> > >         % grep -i acpi /proc/interrupts
>> > >         ...
>> > >         % modprobe typec_ucsi
>> > >         % modprobe ucsi_acpi
>> > >         % grep -i acpi /proc/interrupts
>> > >         ...
>> > >
>> > > See if the number of interrupts increases considerable, or at all. The
>> > > ucsi drivers need to be modules of course in order for that to work.
>> >
>> > I made four snapshots of the (filtered) /proc/interrupts file:
>> >
>> >     1. with the modules loaded normally
>> >     2. right after unloading them
>> >     3. right after loading them again
>> >     4. after the timeout expires and the init failed message is logged
>> >
>> > Files 3 and 4 are identical. Between 1--2 and 2--3, IRQ 9 increases by
>> > exactly 1 each time. The IRQ is described as "IR-IO-APIC 9-fasteoi
>> > acpi".
>> > Here is the line in question from each of the files.
>> >
>> >             CPU0       CPU1       CPU2       CPU3       CPU4
>> > CPU5       CPU6       CPU7       CPU8       CPU9       CPU10
>> > CPU11      CPU12      CPU13      CPU14      CPU15
>> >    9:          0         52          0          0          0
>> > 0          0          0          0          0          0          0
>> >       0          0          0          0  IR-IO-APIC    9-fasteoi
>> > acpi
>> >    9:          0         53          0          0          0
>> > 0          0          0          0          0          0          0
>> >       0          0          0          0  IR-IO-APIC    9-fasteoi
>> > acpi
>> >    9:          0         54          0          0          0
>> > 0          0          0          0          0          0          0
>> >       0          0          0          0  IR-IO-APIC    9-fasteoi
>> > acpi
>> >    9:          0         54          0          0          0
>> > 0          0          0          0          0          0          0
>> >       0          0          0          0  IR-IO-APIC    9-fasteoi
>> > acpi
>> >
>> > To make it clear what I did in the first place, is to add a dev_err line
>> > in the error branch right after "Enable basic notifications" in
>> > ucsi_init. The line does get printed.
>> >
>> > My understanding is that the PPM is completely quiet during the reset
>> > procedure, and therefore the single notifications received should be the
>> > completion notification for the "enable basic notifications" command.
>> >
>> > I added a debug print to ucsi_acpi_notify, to see if the interrupt is
>> > getting routed correctly at all (I suspected the ACPI might be
>> > generating notifications for a different device). Another debug print
>> > was added to ucsi_init right after the reset completes.
>> >
>> > This is a snippet from ucsi_acpi_notify showing added printouts:
>> >
>> >     dev_err(ua->dev, "checking ua->flags: %ld, cci: %d\n", ua->flags,
>> > cci);
>> > 	if (test_bit(COMMAND_PENDING, &ua->flags) &&
>> > 	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE)) {
>> >
>> >         dev_err(ua->dev, "complete\n");
>> > 		complete(&ua->complete);
>> >     }
>> >
>> > Indeed, ucsi_acpi_notify gets called once when the module loads, after
>> > the reset procedure is completed (as long as the ordering of the
>> > messages in dmesg is good enough to tell, they are 20ms apart).
>> > This is the output in dmesg: (i shortened the timeout to 5s).
>> >
>> >     [ 1397.741701] ucsi_acpi USBC000:00: PPM reset succeeded
>> >     [ 1397.761319] ucsi_acpi USBC000:00: checking ua->flags: 2, cci: 0
>> >     [ 1402.941808] ucsi_acpi USBC000:00: failed to enable basic
>> > notifications
>> >     [ 1402.989510] ucsi_acpi USBC000:00: PPM init failed (-110)
>> >
>> > The completion condition is not satisfied and "complete" is not
>> > printed. Possibly the firmware has some quirk, a cci of 0 seems wrong to
>> > me.
>> >
>> > > Maybe there is something special that the OS should do with the EC on
>> >
>> > I suppose either that, or the PPM deviates from the spec. I don't know
>> > how to go about tracing what Windows does, but that would be a way to
>> > go.
>> >
>> > > your board... There is a weird message in your dmesg.
>> > >
>> > >         "ACPI: EC: interrupt blocked"
>> > >
>> > > I don't know if it's relevant at all in this case, but I've just never
>> > > seen that. I'm not an EC or ACPI expert, but I think that you only see
>> > > that if the EC event interrupt is a GPIO. I would expect there to be
>> > > also a message:
>> > >
>> > >         "ACPI: EC: interrupt unblocked"
>> >
>> > There is such a message in the log, on line 475. Also on every suspend,
>> > the interrupt is blocked before going to sleep and unblocked when waking
>> > up, which makes sense.
>> >
>> > > But as said, I'm really not an EC expert. We probable need to ask the
>> > > ACPI guys about this, but let's first check the interrupts.
>> > >
>> > > thanks,
>> > >
>> > > --
>> > > heikki
>> >
>> > Thank you very much for helping me with this.
>> >
>> > Regards,
>> > Samuel
