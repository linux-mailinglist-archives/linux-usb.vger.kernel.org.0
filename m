Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC92E3302DD
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 17:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbhCGQDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 11:03:44 -0500
Received: from mout.web.de ([212.227.17.12]:51587 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232402AbhCGQDS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 11:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1615132995;
        bh=4BEpg0MXCgHt5aaF13kgGFe1FNtsCObK7MRYFmckU3M=;
        h=X-UI-Sender-Class:Subject:To:References:From:Cc:Date:In-Reply-To;
        b=qcinOk0MNvzzktBJeF2cq2aku6D0nuiCdG0b5YWbhSzGc7ZD/ND0BPygujpQjX3Jm
         DRDBUvVDIh+ozHo/DBBGZce5G/eujOtxgB+fcK5wP7ay4iuZt45C9iPeN/D0xGM26y
         9AXwJCQ1eOBKk15HwBOqrIalDcgIKOMNfBZGKKZQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.53] ([188.210.62.102]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXpV5-1lE8ub2I11-00WnaC; Sun, 07
 Mar 2021 17:03:15 +0100
Subject: Re: [PATCH] Add unusal uas devices reported by Umbrel users
To:     Hans de Goede <hdegoede@redhat.com>
References: <aaron.dewes@web.de> <20210307151830.38070-1-aaron.dewes@web.de>
 <a8c2e4b2-ef9b-2eef-d76f-1dd304bd49b4@redhat.com>
From:   Aaron Dewes <aaron.dewes@web.de>
Cc:     linux-usb@vger.kernel.org
Message-ID: <e67f26d5-7f10-a1c3-2721-70fb1ce242d1@web.de>
Date:   Sun, 7 Mar 2021 17:03:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a8c2e4b2-ef9b-2eef-d76f-1dd304bd49b4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:/3kourkeKfv75oxO08rLFhMEYN9a3KZl+uaETwXfO+WaBOVl6QR
 xooE+EvFPa1QV+5GuiKRDddVr5Jg/0eU3o1N8QfObYwLs7/YbeX6a3THgq7WNFuhwA+jYPh
 7sLGcg5+mFsVvnQVrhpjbCToKOVlGKcUGE9jgd5WrelovRjLowt5WggBR0kQvxgCQ6kGGBH
 bhNuXv66uBuaww+Qd98oQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EUCpjtSTjpU=:MtlSoFQ4ug5Op5WQRqFu7X
 E1nv3TT1RLYFmq57LCfXcX0HkFCthJIMsoCPMZwJas/LxIEVak84h/oG4EU1op+jI0UQuOsGh
 A7VQrV+lZ2XV7mpOGXnKKKRIoIoxJssbH671/SCiYU/XG1kxYowOgVWxATT+8EB2hwS6L9p+U
 dXnUn4XElu7eR0dVVPLMuda274N3iCt35aqXjJda3i5chRntJBJ/W8Ex6HMaFJl7pY14Ntd0i
 YWQ1veNG+yhaUDc3qmtkPIN5q0PbccCHRJQbC5QwHBQ4IymI2bxT2v/FK0HoBb+ni8ivvLO7s
 +JRh1g2EzU7Mze+jEvg/eoqhcgPZGpd/f+15YwVOQLIOljGEcWwNu//xoQVpXV5W+7wOzxx33
 xSllJOJDyU/fdRjNIn15VkQvA0fPd92NPGMnrnEdA1ycGpKIW6zHmNufDG7O6KxJTmde0dFHT
 rqmnbTvuDkuSL5UPvskr0zGKN1kztox8YmN3IZHWvoFYlmDC+tcZC75ahOuEYQ4TocxS79F0J
 wf6VyjppA/De4H/ro7+uiNbl6maEa2tFuEPRuZ4GB6Y9xWKLVvUmQb9Q1bEwQ8VvHhPW420mg
 iAnwa61Kkjvla7TgpV/oNhJ7X2nQ6QD414RFfN1zTpwc9VBczAqcuYybEUEeWLlkT+k2evLNH
 o9aFVeQTWLw4Rs2lOWitO00MYFSLCHZ2YYlh+6eY5DMNUilqmTQqoz072urb2ryQs9ZpQ76ff
 AMJDLBEIiSeVoQw//ckDK3PajNADyStdPxH5iiDNcpfc+rFw3Cjxln1PBwAwRPyuTbReu9itP
 7ZALZgPYMyEdSPnZuabTcIpbTzPwIg7IfQ+VJy8BZBKJ6Lo4gShaut3U4iZusSasBnL74mU78
 eAFZVCNTdvwM0n1TAcUw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Am 07.03.21 um 16:53 schrieb Hans de Goede:
> Hi,
>
> First of all I'm not the maintainer of this file, to find the
> right email address to submit patches to see:
>
>
> [hans@x1 linux]$ scripts/get_maintainer.pl -f drivers/usb/storage/uas.c
> Oliver Neukum <oneukum@suse.com> (maintainer:USB ATTACHED SCSI)
> Alan Stern <stern@rowland.harvard.edu> (maintainer:USB MASS STORAGE DRIV=
ER)
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM=
)
> linux-usb@vger.kernel.org (open list:USB ATTACHED SCSI)
> linux-scsi@vger.kernel.org (open list:USB ATTACHED SCSI)
> usb-storage@lists.one-eyed-alien.net (open list:USB MASS STORAGE DRIVER)
> linux-kernel@vger.kernel.org (open list)

Then the beginning of that file needs to be updated, because a comment
at the beginning said:


/*
 =C2=A0* If you edit this file, please try to keep it sorted first by Vend=
orID,
 =C2=A0* then by ProductID.
 =C2=A0*
 =C2=A0* If you want to add an entry for this file, be sure to include the
 =C2=A0* following information:
 =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - a patch that adds the entry for y=
our device, including your
 =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 email address right abo=
ve the entry (plus maybe a brief
 =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 explanation of the reas=
on for the entry),
 =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - lsusb -v output for the device
 =C2=A0* Send your submission to Hans de Goede <hdegoede@redhat.com>
 =C2=A0* and don't forget to CC: the USB development list
<linux-usb@vger.kernel.org>
 =C2=A0*/


>
> No commit message ? No explanation, just disable UAS on a long list
> of devices, including several very popular devices such as various
> Samsung models, without any explanation at all ?
Okay, I'll make sure to get more information and improve the commit.
> Sorry, but in that case all I can do is NACK this patch.
>
> Please split this into a series with one patch per model, while
> explaining for each mode what the problem is, including links to
> bug-reports or forum discussions.
>
> Disabling UAS is a big hammer and severely limits performance,
> as it also disables all forms of NCQ which is a must have
> feature to get decent performance from SSDs.
>
> And often UAS is not the problem, disabling UAS simply papers
> over the problem, e.g.:
>
> 1. Disabling it either hides issue with the XHCI bulk-streams
> handling (could be a bug in the XHCI controller, or in the kernel's
> XHCI code).
>
> 2. Disabling it makes the SSD use much less power since it now
> cannot multi-task, so often it is hiding problems with the
> power-supplied to the disk.
>
> I see at https://github.com/getumbrel/umbrel that the recommended
> platform for Umbrel is a Raspberry Pi 4. Which certainly explains
> the long list of UAS problems. Pi-s are famous for their USB
> problems. I don't know if the Pi 4 suffers from 1. above, but I
> would not be surprised if does; and the Pi certainly suffers from 2.
> https://www.raspberrypi.org/forums/viewtopic.php?p=3D1507278 is an
> interesting read here. The USB-3 spec says that USB-3 ports must
> be capable of 0.9 A per port, the R-Pi 4 maxes out at 1.2A
> for all 4 ports combined.. And then only if its own power-supply
> is capable enough; and nothing is said there about how low the
> voltage drops when actually drawing 1.2A and any voltage drop
> itself might also be an issue.
>
> Also see below for some inline comments.
>
>
>
>> ---
>>   drivers/usb/storage/unusual_uas.h | 70 ++++++++++++++++++++++++++++++=
+
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/un=
usual_uas.h
>> index f9677a5ec31b..a67ed2b527fa 100644
>> --- a/drivers/usb/storage/unusual_uas.h
>> +++ b/drivers/usb/storage/unusual_uas.h
>> @@ -28,6 +28,27 @@
>>    * and don't forget to CC: the USB development list <linux-usb@vger.k=
ernel.org>
>>    */
>>
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x04e8, 0x4001, 0x0000, 0x9999,
>> +		"Samsung",
>> +		"SSD",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> There is no need to specify US_FL_NO_REPORT_OPCODES if you are
> disabling UAS, same for all the other entries.
>
>> +
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x04e8, 0x61b6, 0x0000, 0x9999,
>> +		"Samsung",
>> +		"M3 Portable Hard Drive",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x04e8, 0x61f5, 0x0000, 0x9999,
>> +		"Samsung",
>> +		"Portable SSD T5",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
> These are very popular drives if these really had broken
> UAS support then we would already have a ton of reports
> about these.
>
>>   /* Reported-by: Till D=C3=B6rges <doerges@pre-sense.de> */
>>   UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
>>   		"Sony",
>> @@ -62,6 +83,20 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   		US_FL_NO_REPORT_LUNS),
>>
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x1058, 0x082a, 0x0000, 0x9999,
>> +		"Western Digital",
>> +		"SSD",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> Idem.
>
>> +
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x125f, 0xa76a, 0x0000, 0x9999,
>> +		"ADATA",
>> +		"ED600 enclosure",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
>>   /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>>   UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>>   		"Initio Corporation",
>> @@ -76,6 +111,13 @@ UNUSUAL_DEV(0x152d, 0x0539, 0x0000, 0x9999,
>>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   		US_FL_NO_REPORT_OPCODES),
>>
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x152d, 0x0562, 0x0000, 0x9999,
>> +		"JMicron",
>> +		"JMS567",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
> These are very popular chipsets if these really had broken
> UAS support then we would already have a ton of reports
> about these.
>
>>   /* Reported-by: Claudio Bizzarri <claudio.bizzarri@gmail.com> */
>>   UNUSUAL_DEV(0x152d, 0x0567, 0x0000, 0x9999,
>>   		"JMicron",
>> @@ -90,6 +132,20 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   		US_FL_BROKEN_FUA),
>>
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
>> +		"JMicron",
>> +		"JMS561U",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
>> +		"JMicron",
>> +		"External Disk connector",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
> Idem.
>
>>   /* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
>>   UNUSUAL_DEV(0x154b, 0xf00b, 0x0000, 0x9999,
>>   		"PNY",
>> @@ -104,6 +160,13 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
>>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   		US_FL_NO_ATA_1X),
>>
>> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
>> +UNUSUAL_DEV(0x174c, 0x55aa, 0x0000, 0x9999,
>> +		"ASMedia",
>> +		"ASM1051E and ASM1053E",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>> +
> Another very popular chipsets, some older versions of these
> indeed have some issues, we have special code handling these
> with chipset version specific behavior, see:
>
> drivers/usb/storage/uas-detect.h
>
> Which also means that UAS is actually know to work fine
> on the newer models and it should not be outright disabled
> on them as you are doing here!
>
> Together with the samsung drivers + jmicron bridge chipsets you
> are disabling UAS on what is probably 50% of all capable UAS
> drives out there (if not 70% or more).
>
> Did I already say: NACK ?
>
>
> At the top I indicated that you should split this in per
> model patches, but that was before I figured out most of
> these problems are beeing seen on Raspberry Pi-s (and likely
> on Raspberry Pi-s only).
>
> What might be worth considering is disabling bulk-stream support
> on the Pi-s XHCI controller by setting the  XHCI_BROKEN_STREAMS
> flag in xhci->quirks for that controller.  This will disable UAS
> at least when the drivers are plugged into the USB3 / superspeed
> ports of the Pi.  This might still be a too big hammer though.
> since with a powered-hub, or with a proper power-supply feeding
> the Pi 4 (and not using the other ports) UAS might still work
> and you are now taking away those options from users.
>
> But setting the XHCI_BROKEN_STREAMS flag on the Pi 4 and only
> on the Pi 4 would definitely be closer to acceptable then disabling
> UAS for, well everyone, because it is causing issues on the Pi.
>
> Regards,
>
> Hans

Okay, thanks for your feedback! I'll try to check if some of these
drives have issues on PCs too and then only use that for a future patch.

 > There is no need to specify US_FL_NO_REPORT_OPCODES if you are
disabling UAS, same for all the other entries.

I'm sorry about that, I actually just copied one of the definitions
which had both from the file and edited it.

Aaron


