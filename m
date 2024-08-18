Return-Path: <linux-usb+bounces-13583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24F955F25
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2024 22:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E89292815E1
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2024 20:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55AF154C0C;
	Sun, 18 Aug 2024 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="FhuymCE6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C321547E6
	for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724014577; cv=none; b=j3fNk4xPHmQhoTECe23pchQC9+jIdlLVvVawUSXGRpj24W88iUQOyfz2cJknoYFud4JWmB3S1ZBtRQWULyFz/E2YmjiHIQ8aPM0sY6i3yzzrXeXpz+ZGkq0wYIgfIgfWjU6XFGz1xiIPTBWEgjJtJvBsCIg4b/1grNtqrJGai7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724014577; c=relaxed/simple;
	bh=uaMB82AVU9g/RRe+ejh6jqlMZgpYr1U3W+sGYvhFueI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AoryV0gfjENUyll7UwsoRJAloMNX4t2naKs1hFel3I8rUulONsgjYED6AEzDK+t/DLmuXNQvmJyKB6sMbO0TRWHeccNDZ8JEJfJljH09Xn3xA69FQC0yWyK2rVPehj51asVFwOf89KLOkQvVU3yfHZHcxeeg/ThOfNLObxJva+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=FhuymCE6; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724014572; x=1724619372; i=mista.tapas@gmx.net;
	bh=i0vB7516RELOjH3gb52NppgEHlavLcvQm7Gplbeex+4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FhuymCE6rQZPbodHowD0WMwdo3zwNIc4lvyTRp5gcinZ+hfenWRqbZMOT3x8dkrK
	 hsS7Cvqrx3gRTAceV7Fmbn/hCDQa0Zi1iscP2Duscs0zhsjHk0678Z6zKA1eix7Ag
	 WbVlNL9qLMoaODLb07Vupx79yQHBseCoueDhV446gUQLelEz1fUV8OtgS/Bn1wL2u
	 GOHOb1TqgiZoSqrNqonD976RSRv0PZz8S43VAiqbzEQPOxhY1QzwkjqHJoPEcT1tR
	 HKZ/OgrwpAgYWiMOn2CaWfQsifrLQw+KuJRGB9YGI31xXdzwCBSKJujLPZFmbxzzo
	 5dImSKzhTQ2yUtabkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([92.39.26.65]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSc1B-1sZQ3u3wu9-00XQUp for
 <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 22:56:12 +0200
Message-ID: <76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net>
Date: Sun, 18 Aug 2024 22:56:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: FPS <mista.tapas@gmx.net>
Subject: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZkH3VlqK8GhpYbhA2EZxGLGjhySkHg9Ea7xnPlya7zcFmatJyVc
 qCEwoEM/hOGIhSXgYqblPxSTfGZyjEer6NVZ+2z9NoOeFhdkSSEMJ8IRwo+0ulUYJ5ECWAc
 1yrjb6vONzDQYsh/VbvWy2ILsBuJ+crerKXQnwgdx1IqrVhmRfAO+CZPQZ4BXAGmeWCo5ZV
 KazvvLeqxJWC94yG7LX6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JWV7Y1icyFU=;EENmpK60Ue+n10HeAmyHwKUryrS
 cQN3UTF5UJPVk7wPrxxnaofMy2ia9P2q5GXkKLq0FBFMyI+0Zj9Rqv9yR3gmWqDg7TksQgagZ
 mTNIHKZTy8QTnYpWuxj+rEV4OdSV94e6Ig9ilnidCe34oBFF1fsQznHRCLaxKIDngCnodbzvZ
 7xhruXjB5wjIAuXyMsjS1orny8cNpEFoaYnvYWFD9m4QB8mWOs8sHHidtY+Y/XTYv8KqRvyr8
 mnk/4TZPxDFWSB5fliRelPqGRq5GPrqVLAqygspfNGdqYQ9/rT3eg2OxE9muKAiyPH2yhM917
 2RwGr0fAYbMSNXT8NfSZextpNjZ6Zk9oPNy/7Yx3zyZU0sVSUwp6QjPsM8PezKFIBJvEdrOWH
 Z7VOMeJ6rYhXBvkrX0vMw3NvjdcB14fGG/MHHz2ZYls/7G0ouQqZwVplocMR2SUWq5YlPcnif
 vzO8ABdh+VZDeM4qyIG1NBlshEhrhE2BXDzLmuFtQOys6SZxgklFTrkTc3R3rQqBFn/kJpIlW
 RbN6cZStPrm7yO3l9OQwK575HMuXG76bwzDx61u/k0vbcxYHMrpgORHqMMVOQ0qcM2wYrOjDP
 T0GwUQ1YA7hx+8Z7dL6FuzChHaj4RZ1bATYqiKCfJnlOZAFS8OfuP/HvAj5TbDN0zc++DXYQ5
 1DIbCVJDEltj2EsZy8Qd9l5o+pMy/aGSeBZtunNORqzBiiOEM7L9sEHTJOW8Ftw06ZJ1f9jWb
 XwLxKAgh5br34+Hwm2iT7J9T1DB28a4vYOj1ot1xZQSYOCbWEWSejj8IlRa71t46WbLZwmsRU
 s5evKqy3IduWfwiMoELFgSjw==

Hi!

I hope this mail is not off-topic for this list :)

I have recently acquired a mini PC equipped with an N97 CPU for use in
my electric guitar setup (I have good experiences with my previous Intel
Celeron J4125-based mini PC), but sadly I can't get it to work reliably
with ALSA/Jack using a USB audio class 2.0 sound card.

The system is running a decently setup rt-kernel:

Linux ogfx97 6.6.44-rt39 #1-NixOS SMP PREEMPT_RT Sat Aug  3 06:54:42 UTC
2024 x86_64 GNU/Linux

Cyclictest gives sufficiently nice results that give me hope that it
should be possible to use this system for realtime-audio. This is just a
short example run but it's quite representative:

[fps@ogfx97:~]$ sudo cyclictest -m -p 90 -S
# /dev/cpu_dma_latency set to 0us
policy: fifo: loadavg: 2.07 1.36 0.74 2/644 9634

T: 0 ( 9615) P:90 I:1000 C:   8715 Min:      1 Act:    1 Avg:    2 Max:
     14
T: 1 ( 9616) P:90 I:1500 C:   5808 Min:      1 Act:    5 Avg:    2 Max:
     28
T: 2 ( 9617) P:90 I:2000 C:   4355 Min:      1 Act:    1 Avg:    2 Max:
     15
T: 3 ( 9618) P:90 I:2500 C:   3483 Min:      1 Act:    1 Avg:    3 Max:
     24

As usual I have elevated the xhci and ahci IRQ kernel threads to
SCHED_FIFO priority 90 and done some other shenanigans like idle=3Dpoll,
disabling C-states in the UEFI firmware, etc..

The xhci in this system is:

00:14.0 USB controller: Intel Corporation Alder Lake-N PCH USB 3.2 xHCI
Host Controller (prog-if 30 [XHCI])
         DeviceName: Onboard - Other
         Subsystem: Intel Corporation Device 7270
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 124
         Region 0: Memory at 6001100000 (64-bit, non-prefetchable)
[size=3D64K]
         Capabilities: <access denied>
         Kernel driver in use: xhci_hcd
         Kernel modules: xhci_pci

Sadly there's some built-in junk on the USB besides my keyboard, mouse
and audio interface:

[fps@ogfx97:~]$ lsusb -tv
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 48=
0M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 001: Dev 004, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
         ID 046d:c31c Logitech, Inc. Keyboard K120
     |__ Port 001: Dev 004, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
         ID 046d:c31c Logitech, Inc. Keyboard K120
     |__ Port 002: Dev 005, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
         ID 046d:c07d Logitech, Inc. G502 Mouse
     |__ Port 002: Dev 005, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
         ID 046d:c07d Logitech, Inc. G502 Mouse
     |__ Port 004: Dev 014, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 4=
80M
         ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
     |__ Port 004: Dev 014, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 4=
80M
         ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
     |__ Port 004: Dev 014, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 4=
80M
         ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
     |__ Port 004: Dev 014, If 3, Class=3DVendor Specific Class,
Driver=3D[none], 480M
         ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
     |__ Port 005: Dev 002, If 0, Class=3DWireless, Driver=3D[none], 12M
         ID 0bda:c821 Realtek Semiconductor Corp.
     |__ Port 005: Dev 002, If 1, Class=3DWireless, Driver=3D[none], 12M
         ID 0bda:c821 Realtek Semiconductor Corp.
     |__ Port 006: Dev 003, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
         ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
     |__ Port 006: Dev 003, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
         ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
     |__ Port 006: Dev 003, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
         ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
     |__ Port 006: Dev 003, If 3, Class=3DHuman Interface Device,
Driver=3D[none], 12M
         ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 100=
00M
     ID 1d6b:0003 Linux Foundation 3.0 root hub

OK, with that out of the way, what's the problem? Well, with an USB
audio class 2.0 device I would expect a maximum jitter of a microframe
(125 us) regardless of the buffer size and I have used this audio
interface successfully on different xHCI HCDs with buffer sizes as low
as 24 samples at 48000 Hz sampling rate (0.5 ms period duration).

But in this mini PC I cannot run such low period durations/buffer sizes
at all. Sporadically I see delays of up to 3 or 4 ms - which makes it
absolutely unusable for real-time audio stuff. It can't really be NMIs
from what I can tell - they would show up in the cyclictest results. So
I suspect the xHCI is doing something funky.

Here's another observation: When I run the audio interface with 2
periods of 48 frames at 48000 Hz sampling rate I get constant Xruns from
jack of about 0.004-0.008 ms. It seems that the xHCI is not willing to
deliver all microframes in a timely manner but somehow wants a minimum
time interval of 1 ms between them (I read the term interrupt moderation
somewhere on the web - but I don't know if the linux xhci driver does
something like that at all.)

How could I debug this further? All help appreciated :)

Kind regards,
FPS

