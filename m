Return-Path: <linux-usb+bounces-6461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF1856A93
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 18:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD65B1F21209
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 17:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3C012DD9A;
	Thu, 15 Feb 2024 17:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP6Yn1Hz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113811353FE
	for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708016920; cv=none; b=JkYBRFfnqlXkcmxKuu6/AFuM+CftDna2iuz8iE7lvMtWPjVzHpY3YrmfrZZm86wtm46COrKhTbaHO8wlE23POG972OLjmiy/sWQ0fZdnbLVGp5gHNPL6i3VNU5gCCEZ6KWieLwM8aOaj0pbuXymR8C4W7dAC3lKECnDmtYAHPjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708016920; c=relaxed/simple;
	bh=5xjHV4VA7h9WQ0Wlidu/Bvn8BrSU7MdlpCGg+GNR83c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ev4TRQNsZK4CIAQfy2/UJ5WB3vfSf6qRK5bh25Zt0AjyXQ551WSWR0v06GuVki8swdt0vHCDW60BZ0Hh1m7wBB+JanekciwC1OBZH8Bbwyj3XnPggwuIia6ldCZD+MV6EPjWQ6a81ChImQyDtMmXr0l7vpF8YdeXmng3k1LdCw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP6Yn1Hz; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e2df04c812so528368a34.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708016917; x=1708621717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bZ6lce93Zoub+5MwopTnPKgZGAOgXfru1yxrlIhfqq0=;
        b=ZP6Yn1HzACgIaEYx8tdQ49JhplCP+OhpCh2FqBJZRIdD+7KYuF6akmLRID7cO8hEBN
         1XVxJ7kecVw1p2FeF+3+VeOlQbPYCodNwZLyQSwqSkeFr4HVrEJBwIoCdHQ94VhTHGuX
         GBtBJOM2tf/ulTUy9+fK4ZF0OXMBOcr1XyGOwHMQ5vkXuMPIDpPLXxSRtr96AqbzJK6x
         jYKwX9442TAHaf47rmsSinjR/ZvUcEaWL6nLpNZdp0MDUKP7UWkYHiHJilZBBblkWSve
         cqJfIGQNz4HLlTI6RTQBiT4KqtCvudG6VbGDuJ6K+Nj8BwXeoHyhcX5HNSkUASFLKQVm
         gp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016917; x=1708621717;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZ6lce93Zoub+5MwopTnPKgZGAOgXfru1yxrlIhfqq0=;
        b=GhM1UnZLOPvQjd6P+8N0BK1gbNoBjsNRimNlHy3V7JQERvImTyAO2mlz44hkoOiZJP
         bWdfNUa1JXc2gG6i04BYVdC+wMyOB8dt6smV1bSvJxVkHL82urbl+WiacIO9dCGHnd9v
         LwRKVgTQdxdb1M9TfeUxTPjhUK5I5oEae9u14kOO6xszcZqnuUbYNARpoBdHeOOUVKc3
         FcyIR2RS/pb3nNTUOzbbOBSa/QGMN0/0sPckWb9TWoTt1muypEzHw0o19O8AdkCxaWp2
         NEeVgREBMDS7VPTpx3v1mQK0OY/3nAJrfffokRJz4ZU4CGk2oxxKtQxRVbUkhZwXyGuP
         iOGA==
X-Gm-Message-State: AOJu0YyxhyLyDTPhcnjenZ9Rj34IvXyk4FKvoBCXDlHcDi7Wm+fr8uUX
	yA5GA1tUFfMt+eGLOUFCyUYoEKHDKTVvHCkEyCvGy/wuXp/N8YIKXlt4+cLGCy6DJYD94xHZ6Lm
	oca0UGd3/0hZFZBhcco63Km/QWjE02Z8ee5w=
X-Google-Smtp-Source: AGHT+IGspo9g/u1BuJ2WoKqDJxaEECxMKkgnJBiE4esClyz2FO+7BUZ/zCn2B0P8SDy5KOlfcXp9WRswHzsmtZN+S78=
X-Received: by 2002:a05:6870:f153:b0:21e:579f:a4f3 with SMTP id
 l19-20020a056870f15300b0021e579fa4f3mr595459oac.47.1708016917464; Thu, 15 Feb
 2024 09:08:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Federico L <flicfloc@gmail.com>
Date: Thu, 15 Feb 2024 18:08:01 +0100
Message-ID: <CAGNgjthcKZEUdFvhHKmkAdwYFTNi5-VZWoXO3DdTyn4v5CNTvw@mail.gmail.com>
Subject: Driver bug (?): dwc2 used by bcm2835 (compatible=brcm,bcm2835-usb) -
 please, kindly support
To: linux-usb@vger.kernel.org
Cc: hminas@synopsys.com
Content-Type: text/plain; charset="UTF-8"

Hello,

I put in place a "USB mass storage gadget"
and basically the device works like a charm.
For an entire day no issues at all, with my "dumb" device (a regular
soundbar), the USB-Host, access to it (USB mass storage gadget) just
like a regular "usb pen drive" without any kind of problem all the day
long.
The issue arises when the USB-host stops to access the usb mass
storage gadget for hours;
of course, during the night, the bar is powered off and does not play
sounds, but next morning when I turn it on again, there is no way to
let the bar access USB mass storage gadget
until I force a reboot of my Linux machine.

Analyzing logs (dmesg mainly) does not show any kind of issue, error,
traceback or other, so I tried to investigate more in details, and I
discovered that the "virtual" usb port created by dwc2 driver (named,
in my case "fe980000.usb") hangs in "not attached" state forever;
finally found thanks to this command:

cat /sys/class/udc/fe980000.usb/state
not attached

I tried several Linux embedded utilities as well as, reset scripts
found on the the web,
in order to "reset" the device, the port, the hub, and even the full
usb-stack, but no way to
"restore" the right functionality of the virtual usb port, unless
you do a full fresh reboot.
After the reboot, the port goes in "not attached" and
immediately, when I power-on the USB host it goes in "configured" state and
works like a charm again.

Among my several tests, I performed:
1)
unbind/bind

2)
modprobe -r dwc2
modprobe dwc2

3)
modprobe -r g_mass_storage
modprobe g_mass_storage file=/piusb.bin stall=0 removable=y

watching the results in the logs, and every command returns and performs
right, without any error, but the port still remains, always  "not attached".

In the end, I tried to create, by myself, a python script with this
content, and I was
pretty confident, to get the right result, cause I got in the dmesg logs,
almost the same identical output I get during a standard reboot:

SyntaxEditor Code Snippet

CMD_UNMOUNT1 = "modprobe -r g_mass_storage"
CMD_SYNC2 = "sync"
CMD_UNMOUNT3 = " modprobe -r dwc2"
CMD_MOUNT4 = "modprobe dwc2"
CMD_MOUNT5 = "modprobe g_mass_storage file=/piusb.bin stall=0 removable=y"

os.system(CMD_UNMOUNT1)
time.sleep(30)
os.system(CMD_SYNC2)
time.sleep(30)
os.system(CMD_UNMOUNT3)
time.sleep(30)
os.system(CMD_MOUNT4)
time.sleep(30)
os.system(CMD_MOUNT5)

With this python script I get this log from dmesg, and, this is really
almost identical to what I get from dmesg during a reboot:

[Feb14 10:35] dwc2 fe980000.usb: remove, state 4
[  +0.000052] usb usb3: USB disconnect, device number 1
[  +0.004965] dwc2 fe980000.usb: USB bus 3 deregistered
[Feb14 10:36] dwc2 fe980000.usb: supply vusb_d not found, using dummy
regulator
[  +0.000972] dwc2 fe980000.usb: supply vusb_a not found, using dummy
regulator
[  +0.207690] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in
SPRAM
[  +0.000173] dwc2 fe980000.usb: DWC OTG Controller
[  +0.000014] dwc2 fe980000.usb: new USB bus registered, assigned bus
number 3
[  +0.000023] dwc2 fe980000.usb: irq 38, io mem 0xfe980000
[  +0.000155] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 6.01
[  +0.000008] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[  +0.000005] usb usb3: Product: DWC OTG Controller
[  +0.000005] usb usb3: Manufacturer: Linux 6.1.0-rpi7-rpi-v8 dwc2_hsotg
[  +0.000005] usb usb3: SerialNumber: fe980000.usb
[  +0.000315] hub 3-0:1.0: USB hub found
[  +0.000028] hub 3-0:1.0: 1 port detected
[ +30.033766] Mass Storage Function, version: 2009/09/11
[  +0.000033] LUN: removable file: (no medium)
[  +0.000132] LUN: removable file: /piusb.bin
[  +0.000016] Number of LUNs=1
[  +0.000271] g_mass_storage gadget.0: Mass Storage Gadget, version:
2009/09/11
[  +0.000020] g_mass_storage gadget.0: userspace failed to provide
iSerialNumber
[  +0.000013] g_mass_storage gadget.0: g_mass_storage ready
[  +0.000019] dwc2 fe980000.usb: bound driver g_mass_storage
[  +0.297414] dwc2 fe980000.usb: new device is full-speed
[  +0.363083] dwc2 fe980000.usb: new device is full-speed
[  +0.964163] dwc2 fe980000.usb: new device is full-speed
[  +0.964170] dwc2 fe980000.usb: new device is full-speed

Looking at the log, I was pretty confident, but unfortunately, "cat
/sys/class/udc/fe980000.usb/state" still returns "not attached"
and power-on the soundbar has no change, it starts blinking as nothing is
attached.
Even running the script with the bar powered-on, you can see every
"cycle", as if you
manually, remove the cable, and at a time, you put the cable again
etc.. but no change, it starts blinking and "cat
/sys/class/udc/fe980000.usb/state" reamins "not attached".

Something is still missing, so I asked some Linux expert and he told me to write
to the mailing list cause maybe a bug and, to complete, if I do the same action
with a regular usb-key mass storage pendrive, one hundred times, the
USB-host (soundbar) recognizes it immediately and starts playing with
no fault at all.

Thank you very much in advance,
Best regards
Federico

