Return-Path: <linux-usb+bounces-2804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBF7E8F8E
	for <lists+linux-usb@lfdr.de>; Sun, 12 Nov 2023 12:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9C0280CBD
	for <lists+linux-usb@lfdr.de>; Sun, 12 Nov 2023 11:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A3879D0;
	Sun, 12 Nov 2023 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeVA44gN"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B908473
	for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 11:03:51 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3277C2D61
	for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 03:03:47 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso548923366b.3
        for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 03:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699787025; x=1700391825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xU6QvSHB4kTc2Ghim176m3ha9qVjcSZhR/LAwv6GhbA=;
        b=LeVA44gNMqdyKIh/FzHoRXhjV+gSiW87Sh9DNH1IVzrtN7kDVbaJjQ9y4luJMfzFXa
         2TYqiofb8f9F5BcIv3+PkrcBXRtGycWXTWxy9zjahNTuxixAxH477DayrlZVvn/EOqT8
         nF3dSMZ8UDpvzhfqP46kgHwWpOWeyKHUr8P2MY/W/ZrI7W04n2IjKfXT8UjvmVUPl10g
         reBiKW1pudCyx8tEEQLQ9D6BN8pR/f7sVfYV2KuxZbTz26Z5pdtoNwKFmTnjJMs7jyPv
         WdP7k48KWdqOtd9BQ1l03claSFFB4CCbBbD/FeV2XGSZMzaV/uwnz9EvlDcpjw5gHGYD
         cjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699787025; x=1700391825;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xU6QvSHB4kTc2Ghim176m3ha9qVjcSZhR/LAwv6GhbA=;
        b=rJBbce8S4NZ0rGMxHta14IMYIB+OlZd2P1eov/xvk9cyNRBgB8WwI4U+OBCWxQkEGZ
         Dz4tbxFIum9anV3Cseuo7AO1fssvTrpNGU3XnIaFC6J2OWxr1PjyxTYLuC5NWfJsW2fi
         l/1GM6tppdlZaahjCDntcEI/v6c+ZGD7dki0QcuHAQ8ql8Lr6es/L8ffber8NUqnp8vL
         xdNXRHeosOJ/D4GTdRu/5fiwMvsASFHUD+6tM2HGIAnI8aLyUii/aE/ki+nCJjjcq1sT
         FsVNxktz6uEuKhzxTt5tQX8Gob+oZaYYAzw61mzuQLHeXqx36B2EK4WZGwwMrHWwuyXV
         j36w==
X-Gm-Message-State: AOJu0Yy1z4UzzFuXemVqKqy5yWn8j4wNm/amUtJ6/lbL5rvTQIsMcJdH
	Ox0NZIAfE+rnQyByOVdLxlo=
X-Google-Smtp-Source: AGHT+IGd15Z9UHA3YTnTAA7E3xpMVQQMgtG8b5ucTq68mZgM2tjDkNbOo+msNly5388yY7Dw/21MtQ==
X-Received: by 2002:a17:906:1803:b0:9dd:973b:2753 with SMTP id v3-20020a170906180300b009dd973b2753mr2788468eje.15.1699787025019;
        Sun, 12 Nov 2023 03:03:45 -0800 (PST)
Received: from ryzen7700x.fritz.box (p200300ee973f6100aaa159fffee94020.dip0.t-ipconnect.de. [2003:ee:973f:6100:aaa1:59ff:fee9:4020])
        by smtp.gmail.com with ESMTPSA id c14-20020a170906340e00b009e6fa0463adsm2401755ejb.10.2023.11.12.03.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 03:03:44 -0800 (PST)
Date: Sun, 12 Nov 2023 12:03:42 +0100
From: Andreas Kempf <aakempf@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
Mail-Followup-To: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="opBzNNnpIS4jw6Wp"
Content-Disposition: inline
In-Reply-To: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>


--opBzNNnpIS4jw6Wp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 11, 2023 at 03:01:24PM -0500, Alan Stern wrote:
> On Sat, Nov 11, 2023 at 05:58:08PM +0100, Andreas Kempf wrote:
> > Hi,
> > 
> > I apologize if this is the wrong mailing list but my investigation
> > led me to the USB subsystem and I do not know how to proceed.
> > 
> > My system:
> > Arch Linux
> > Linux kernel 6.6.1 (-arch1-1)
> > Motherboard: ASRock X670E PG Lightning
> > Device: Creative Sound Blaster G3
> > 
> > I have a Creative Technology Sound Blaster G3 USB sound device that
> > seems to work perfectly on Windows. It used to work just fine on Linux,
> > as well. However, at some point a few weeks ago, it started behaving
> > oddly. Unfortunately, I cannot pinpoint exactly when the problems
> > started happening because the symptoms did not immediately point me
> > toward the device and I did not immediately figure out what was going
> > on as I only noticed hangs when shutting down the system.
> 
> Did you update your kernel between the time when the device was
> working okay and now?
> 
Unfortunately, I cannot really pinpoint when the issues started to
appear, but on Arch Linux, almost every stable release gets picked up and
a new kernel package is pushed every few days, so it is very likely.
What confuses me, though, is that switching to a 6.1 LTS kernel did not
seem to change anything.
> > After some testing I figured out that it takes several minutes for the
> > device to be recognized. Having plugged in the device, a command like
> > 
> > $ cat /sys/devices/pci0000:00/0000:00:02.1/0000:04:00.0/ \
> >   0000:05:0c.0/0000:17:00.0/usb5/5-4/manufacturer
> > 
> > blocks for several minutes, until, at some point, it correctly prints
> > Creative Technology Ltd
> 
> It sounds like the device isn't behaving properly.  Or maybe the USB
> cable, but I assume you checked that.
> 
> Have you tried plugging the device into a different computer?  And
> have you tried plugging other devices into the same USB port?
> 
The device has a permanently attached cable that cannot be swapped,
unfortunately.
This whole issue is extremely confusing to me as I cannot really figure
out a pattern. Today I tried the following:
- I plugged the device in on Linux: issue occurred
- I plugged the device into a different port on the same machine on
  Linux: issue occurred.
- I plugged the device into an Android phone: played audio immediately
- I plugged the device into a Laptop running Arch on 6.6.1: played audio
  immediately (?!)
- I booted the machine on Linux with the device already plugged in:
  played audio immediately (?!)
- I booted Windows and plugged in the device: played audio immediately
- I plugged a keyboard and a mouse into the port: no issues
> > The kernel seems to slowly figure out what to do with the device:
> > 
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: new high-speed USB device number 2 using xhci_hcd
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256
> 
> This message indicates the device does not follow the USB spec, but it
> isn't a bad error.  Certainly not the sort of thing that would cause
> the behavior you're seeing.
> 
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: Product: Sound Blaster G3
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: Manufacturer: Creative Technology Ltd
> > Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: SerialNumber: 15C1E5E3165B9B3D
> > Nov 11 16:25:29 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4:1.0/0003:041E:3267.0007/input/input28
> > Nov 11 16:25:29 ryzen7700x kernel: hid-generic 0003:041E:3267.0007: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4/input0
> > Nov 11 16:25:34 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
> > Nov 11 16:25:44 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 33
> > Nov 11 16:25:44 ryzen7700x kernel: usb 5-4: clock source 33 is not valid, cannot use
> 
> These -110 errors mean that the system is not getting a reply from the
> device within the usual 5-second time limit.
> 
> > After these 9 minutes, the device seems to be able to play audio
> > normally. Most of these messages I recognize, I think they have always
> > been there but did not cause any issues. If I unplug the device (not
> > sure if it has to happen during these 9 minutes), I encounter a hung
> > task:
> > 
> > Nov 11 16:48:49 ryzen7700x kernel: INFO: task (udev-worker):9428 blocked for more than 122 seconds.
> 
> Probably not really hung, just waiting for the device to send some replies.
> 
> > I am not sure how to proceed. From what I gather, the "invalid maxpacket
> > 256" message suggests that the device's firmware is iffy and the other
> > messages do not inspire confidence either. It used to work without
> > noticeable issues though. In any case, these issues seem to block
> > shutdown sometimes and, all in all, these delays seem problematic.
> > 
> > I captured a few seconds of the devices usbmon interface and, during the
> > long initialization in case they are useful:
> > 
> > ffff888106921980 1731857265 S Co:5:007:0 s 21 01 0100 2203 0001 1 = 01
> > ffff888106a91d40 1731859450 C Ii:5:001:1 0:2048 2 = 1000
> > ffff888106a91d40 1731859451 S Ii:5:001:1 -115:2048 4 <
> 
> These message do not show the initialization, or at least, they don't
> show the beginning of the initialization.  You should start the usbmon
> capture before plugging in the device and stop it after the device has
> been plugged in for 30 seconds or so.  However, I suspect it will just
> show that the system is only occasionally getting replies from the
> device.
Sorry, not sure what I was thinking there. I will attach output
including the initialization.

At this point I am more interested in figuring out what the heck is
going on than actually getting this device to work.

Andreas Kempf

--opBzNNnpIS4jw6Wp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="busdata.txt"

ffff888106725740 503021187 S Ci:5:001:0 s a3 00 0000 0001 0004 4 <
ffff888106725740 503021205 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021209 S Ci:5:001:0 s a3 00 0000 0002 0004 4 <
ffff888106725740 503021212 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021214 S Ci:5:001:0 s a3 00 0000 0003 0004 4 <
ffff888106725740 503021217 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021219 S Ci:5:001:0 s a3 00 0000 0004 0004 4 <
ffff888106725740 503021222 C Ci:5:001:0 0 4 = 01010100
ffff888106725740 503021224 S Co:5:001:0 s 23 01 0010 0004 0000 0
ffff888106725740 503021227 C Co:5:001:0 0 0
ffff888106725740 503021229 S Ci:5:001:0 s a3 00 0000 0005 0004 4 <
ffff888106725740 503021232 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021234 S Ci:5:001:0 s a3 00 0000 0006 0004 4 <
ffff888106725740 503021237 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021239 S Ci:5:001:0 s a3 00 0000 0007 0004 4 <
ffff888106725740 503021241 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021243 S Ci:5:001:0 s a3 00 0000 0008 0004 4 <
ffff888106725740 503021246 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021248 S Ci:5:001:0 s a3 00 0000 0009 0004 4 <
ffff888106725740 503021251 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021253 S Ci:5:001:0 s a3 00 0000 000a 0004 4 <
ffff888106725740 503021255 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021257 S Ci:5:001:0 s a3 00 0000 000b 0004 4 <
ffff888106725740 503021260 C Ci:5:001:0 0 4 = 00010000
ffff888106725740 503021262 S Ci:5:001:0 s a3 00 0000 000c 0004 4 <
ffff888106725740 503021264 C Ci:5:001:0 0 4 = 00010000
ffff888101f31680 503126889 S Ii:5:001:1 -115:2048 4 <
ffff8881067246c0 503126912 S Ci:5:001:0 s a3 00 0000 0004 0004 4 <
ffff8881067246c0 503126921 C Ci:5:001:0 0 4 = 01010000
ffff8881067246c0 503127097 S Co:5:001:0 s 23 03 0004 0004 0000 0
ffff8881067246c0 503127115 C Co:5:001:0 0 0
ffff8881067246c0 503193557 S Ci:5:001:0 s a3 00 0000 0004 0004 4 <
ffff8881067246c0 503193574 C Ci:5:001:0 0 4 = 11010000
ffff8881067246c0 503260222 S Ci:5:001:0 s a3 00 0000 0004 0004 4 <
ffff8881067246c0 503260240 C Ci:5:001:0 0 4 = 03051000
ffff8881067246c0 503260244 S Co:5:001:0 s 23 01 0014 0004 0000 0
ffff8881067246c0 503260248 C Co:5:001:0 0 0
ffff8881067246c0 503317212 S Ci:5:000:0 s 80 06 0100 0000 0040 64 <
ffff8881067246c0 503319647 C Ci:5:000:0 0 18 = 12010002 ef020140 1e046732 40100102 0901
ffff8881067246c0 503319662 S Co:5:001:0 s 23 03 0004 0004 0000 0
ffff8881067246c0 503319670 C Co:5:001:0 0 0
ffff8881067246c0 503383321 S Ci:5:001:0 s a3 00 0000 0004 0004 4 <
ffff8881067246c0 503383338 C Ci:5:001:0 0 4 = 11010000
ffff8881067246c0 503449995 S Ci:5:001:0 s a3 00 0000 0004 0004 4 <
ffff8881067246c0 503450010 C Ci:5:001:0 0 4 = 03051000
ffff8881067246c0 503450018 S Co:5:001:0 s 23 01 0014 0004 0000 0
ffff8881067246c0 503450023 C Co:5:001:0 0 0
ffff8881067246c0 503523558 S Ci:5:002:0 s 80 06 0100 0000 0012 18 <
ffff8881067246c0 503525650 C Ci:5:002:0 0 18 = 12010002 ef020140 1e046732 40100102 0901
ffff8881067246c0 503525674 S Ci:5:002:0 s 80 06 0200 0000 0009 9 <
ffff8881067246c0 503528644 C Ci:5:002:0 0 9 = 09024a03 07010080 32
ffff8881067246c0 503528657 S Ci:5:002:0 s 80 06 0200 0000 034a 842 <
ffff8881067246c0 503544643 C Ci:5:002:0 0 842 = 09024a03 07010080 32090400 00010300 00000921 10010001 224f0007 05860340
ffff888106725d40 503544666 S Ci:5:002:0 s 80 06 0300 0000 00ff 255 <
ffff888106725d40 503547635 C Ci:5:002:0 0 4 = 04030904
ffff888106725d40 503547642 S Ci:5:002:0 s 80 06 0302 0409 00ff 255 <
ffff888106725d40 503550635 C Ci:5:002:0 0 34 = 22035300 6f007500 6e006400 20004200 6c006100 73007400 65007200 20004700
ffff888106725d40 503550644 S Ci:5:002:0 s 80 06 0301 0409 00ff 255 <
ffff888106725d40 503553635 C Ci:5:002:0 0 50 = 32034300 72006500 61007400 69007600 65002000 54006500 63006800 6e006f00
ffff888106725d40 503553643 S Ci:5:002:0 s 80 06 0309 0409 00ff 255 <
ffff888106725d40 503556636 C Ci:5:002:0 0 34 = 22033100 35004300 31004500 35004500 33003100 36003500 42003900 42003300
ffff888106725d40 503577493 S Co:5:002:0 s 00 09 0001 0000 0000 0
ffff888106725d40 503578614 C Co:5:002:0 0 0
ffff888106725d40 503578910 S Ci:5:002:0 s 80 06 0309 0409 00ff 255 <
ffff888106725d40 503581615 C Ci:5:002:0 0 34 = 22033100 35004300 31004500 35004500 33003100 36003500 42003900 42003300
ffff888106725d40 503581622 S Co:5:002:0 s 21 0a 0000 0000 0000 0
ffff888106725d40 503583615 C Co:5:002:0 0 0
ffff888106725d40 503583619 S Ci:5:002:0 s 81 06 2200 0000 004f 79 <
ffff888106725d40 503587625 C Ci:5:002:0 0 79 = 050c0901 a1011600 00260100 09e909ea 09e209cd 09b509b6 09b109b3 09b409cf
ffff888106725d40 503587756 S Ii:5:002:6 -115:32 64 <
ffff888106725c80 503644602 S Ci:5:002:0 s 80 06 0302 0409 00ff 255 <
ffff888106725c80 503646631 C Ci:5:002:0 0 34 = 22035300 6f007500 6e006400 20004200 6c006100 73007400 65007200 20004700
ffff888106725c80 503646635 S Ci:5:002:0 s 80 06 0301 0409 00ff 255 <
ffff888106725c80 503649624 C Ci:5:002:0 0 50 = 32034300 72006500 61007400 69007600 65002000 54006500 63006800 6e006f00
ffff888106725140 503649650 S Co:5:002:0 s 21 01 0100 2203 0001 1 = 01
ffff888101f31680 503651820 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 503651824 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 503660232 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 503660236 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 503926876 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 503926881 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 504166886 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 504166891 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 504433664 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 504433669 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 504673683 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 504673700 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 504913617 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 504913622 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 505180203 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 505180209 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 505420230 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 505420234 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 505660204 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 505660210 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 505926868 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 505926886 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 506166876 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 506166894 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 506433562 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 506433567 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 506673628 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 506673633 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 506913529 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 506913551 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 507180201 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 507180208 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 507420215 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 507420221 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 507660208 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 507660217 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 507926856 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 507926877 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 508166935 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 508166944 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 508433560 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 508433565 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 508673613 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 508673618 S Ii:5:001:1 -115:2048 4 <
ffff888106725140 508701320 C Co:5:002:0 -2 0
ffff8881067255c0 508701366 S Co:5:002:0 s 01 0b 0000 0004 0000 0
ffff888101f31680 508913548 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 508913567 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 509180213 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 509180218 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 509420370 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 509420374 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 509660207 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 509660226 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 509926874 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 509926892 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 510166875 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 510166894 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 510433575 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 510433591 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 510673604 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 510673620 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 510913552 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 510913570 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 511180202 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 511180219 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 511420246 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 511420251 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 511660219 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 511660224 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 511926875 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 511926892 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 512166875 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 512166894 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 512433545 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 512433550 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 512673673 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 512673679 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 512913540 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 512913559 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 513180141 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 513180146 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 513420210 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 513420228 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 513660223 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 513660228 S Ii:5:001:1 -115:2048 4 <
ffff8881067255c0 513820637 C Co:5:002:0 -2 0
ffff8881067255c0 513820651 S Ci:5:002:0 s a1 01 0200 2103 0001 1 <
ffff888101f31680 513926889 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 513926895 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 514166876 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 514166882 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 514433545 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 514433550 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 514673570 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 514673575 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 514913559 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 514913565 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 515180206 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 515180211 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 515420219 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 515420224 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 515660221 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 515660239 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 515926997 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 515927015 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 516166872 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 516166877 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 516433542 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 516433548 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 516673634 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 516673639 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 516913554 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 516913559 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 517180208 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 517180213 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 517420211 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 517420217 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 517660215 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 517660221 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 517926894 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 517926900 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 518166869 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 518166875 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 518433542 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 518433547 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 518673553 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 518673558 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 518913542 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 518913548 S Ii:5:001:1 -115:2048 4 <
ffff8881067255c0 518940382 C Ci:5:002:0 -2 0
ffff8881067255c0 518940402 S Co:5:002:0 s 21 01 0100 2203 0001 1 = 01
ffff888101f31680 519180317 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 519180335 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 519420215 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 519420233 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 519660273 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 519660291 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 519926870 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 519926888 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 520166870 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 520166888 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 520433551 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 520433556 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 520673538 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 520673557 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 520913696 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 520913715 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 521180251 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 521180270 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 521420233 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 521420248 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 521660229 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 521660245 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 521926888 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 521926903 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 522166892 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 522166907 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 522433656 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 522433671 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 522673633 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 522673648 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 522913597 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 522913613 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 523180210 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 523180214 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 523420211 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 523420215 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 523660225 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 523660243 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 523926867 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 523926873 S Ii:5:001:1 -115:2048 4 <
ffff8881067255c0 524060649 C Co:5:002:0 -2 0
ffff8881067255c0 524063346 S Co:5:002:0 s 01 0b 0001 0004 0000 0
ffff888101f31680 524167008 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 524167013 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 524433576 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 524433582 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 524673564 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 524673583 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 524913560 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 524913565 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 525180227 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 525180245 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 525420242 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 525420257 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 525660219 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 525660225 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 525926888 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 525926894 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 526167014 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 526167031 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 526433568 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 526433574 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 526673659 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 526673663 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 526913572 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 526913577 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 527180219 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 527180224 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 527420223 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 527420229 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 527660227 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 527660245 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 527926885 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 527926891 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 528166900 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 528166917 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 528433611 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 528433616 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 528673721 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 528673726 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 528913566 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 528913571 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 529180265 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 529180268 S Ii:5:001:1 -115:2048 4 <
ffff8881067255c0 529180665 C Co:5:002:0 -2 0
ffff8881067255c0 529182908 S Co:5:002:0 s 21 01 0100 2203 0001 1 = 01
ffff888101f31680 529420222 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 529420227 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 529660225 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 529660244 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 529926890 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 529926896 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 530166893 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 530166898 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 530433617 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 530433623 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 530673312 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 530673332 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 530913579 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 530913584 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 531180218 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 531180236 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 531419990 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 531420008 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 531660222 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 531660240 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 531926887 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 531926893 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 532166878 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 532166882 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 532433647 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 532433652 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 532673417 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 532673435 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 532913620 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 532913625 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 533180217 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 533180223 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 533420227 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 533420232 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 533660222 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 533660227 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 533926888 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 533926894 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 534166890 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 534166895 S Ii:5:001:1 -115:2048 4 <
ffff8881067255c0 534300673 C Co:5:002:0 -2 0
ffff8881067255c0 534300705 S Co:5:002:0 s 01 0b 0000 0004 0000 0
ffff888101f31680 534433651 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 534433668 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 534673554 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 534673560 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 534913623 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 534913641 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 535180220 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 535180225 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 535420236 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 535420241 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 535660221 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 535660240 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 535926903 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 535926919 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 536166907 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 536166923 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 536433701 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 536433705 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 536673555 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 536673560 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 536913651 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 536913656 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 537180225 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 537180231 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 537420225 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 537420230 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 537660222 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 537660227 S Ii:5:001:1 -115:2048 4 <
ffff888101f31680 537926887 C Ii:5:001:1 0:2048 2 = 1000
ffff888101f31680 537926890 S Ii:5:001:1 -115:2048 4 <

--opBzNNnpIS4jw6Wp--

