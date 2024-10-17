Return-Path: <linux-usb+bounces-16386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2799A2F2F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 23:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4643B230B8
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 21:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6BC229139;
	Thu, 17 Oct 2024 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=startmail.com header.i=@startmail.com header.b="32a18BiK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C232281C5
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.131.90.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199154; cv=none; b=QAjzrdVdn7Qt7BsDW5r38Fn0wshOgaOAKoPTDm60eBQdQFUt0mtn0nP3Q7aqclYZiZjtLpcJiJS1XBd4pr+OAAuEP1gI5tgg9j1sr+WU7nULA5c+NL4CzZl7vg8OrmVw28bZiKZLc0NoYptKVrTPgko5bkIALCXfS7jZ7h3fqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199154; c=relaxed/simple;
	bh=kSMaPppzaK7Lb7RIA2lMvVEstKhF+32we+JEv+N010E=;
	h=Message-ID:Date:Mime-Version:From:To:Subject:Content-Type; b=j94E8HWaHpS6y0OLC85S3a0UC3ON+V55RImSDliSZs7tmrYXWT9GbiwOWtGBM188nlSes2GZmqE52EbcKfXvW7DHxGE4gDv3XLQWFjbUHw1wT1/x6mKXX+YUUX/aX0QFn5n2uTbza4YWp6IszVtNma9wbSr8Gw8zKYmk8Da2Stc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=startmail.com; spf=pass smtp.mailfrom=startmail.com; dkim=pass (2048-bit key) header.d=startmail.com header.i=@startmail.com header.b=32a18BiK; arc=none smtp.client-ip=145.131.90.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=startmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=startmail.com
Message-ID: <50f9a086-d873-44d2-bdda-a8e00dd2421e@startmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1729199146;
	bh=kSMaPppzaK7Lb7RIA2lMvVEstKhF+32we+JEv+N010E=;
	h=Message-ID:Date:Mime-Version:From:To:Subject:Content-Type:
	 Content-Transfer-Encoding:From:Subject:To:Date:Sender:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition:Mime-Version:
	 Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=32a18BiKfCCVGiaHqg2kJqDF5+XUjRllZ86LXZak4LBrKKOAdW75ccNt16oG/5z/N
	 JaiTrvJDa2RiGhHqVrTFoWYvPH5qqXjwYAQbPhLgIfx2f7GL3naiqVUzpwAlox6xCB
	 giWDrxZM0N1pzx31lBiviNshbvFagqNqtJ2pH4aTwQiQsnIDPu9l4RtyJamoksLP11
	 BTxtTLX3+mdg2hj4b0q8EyRNKZ1W03R4hzAx5yfV/9y05Ouy531O+feOB2s42qUDHJ
	 JsUMu28SeZ8SyfLU1+1qepO841C36oymmqnGn3Lm2HBIa6G/6GjTVukWVY9sD7Aahv
	 8Ie3XUZEloGHw==
Date: Thu, 17 Oct 2024 15:05:43 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Angel D Raygoza <9bea5cde-4b55-4b34-b91a-37dbd16ce68e@startmail.com>
Content-Language: en-US, de-DE
To: linux-usb@vger.kernel.org
Subject: Usb IP Failing to connect depending of program being runned even when
 the connection talks are identical
Disposition-Notification-To: Angel D Raygoza
 <9bea5cde-4b55-4b34-b91a-37dbd16ce68e@startmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear USB Linux Mailing List.

I have been trying to write a USB IP Virtual Device  as your protocol
(https://docs.kernel.org/usb/usbip_protocol.html).


Currently I am in the step of writing the code that responds to the
OP_REQ_IMPORT package, I have been writing the code accordingly to the,
previously mentioned, documentation,
https://docs.kernel.org/usb/usbip_protocol.html, and some USB resources
https://www.usb.org/defined-class-codes.


When attaching my USB IP Virtual Device as here `sudo usbip --debug
--tcp-port 3000 attach --remote=localhost -d 2-2` I get the following error

```

usbip: debug: usbip_network.c:28:[usbip_setup_port_number] parsing port
arg '3000'

usbip: info: using port 3000 ("3000")

usbip: debug: usbip.c:129:[run_command] running command: `attach'

libusbip: debug: vhci_driver.c:269:[usbip_vhci_driver_open] available
ports: 16

libusbip: debug: vhci_driver.c:281:[usbip_vhci_driver_open] available
controllers: 1

libusbip: debug: vhci_driver.c:128:[refresh_imported_device_list]
controller 0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 0 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 1 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 2 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 3 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 4 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 5 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 6 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub hs port 7 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 8 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 9 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 10 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 11 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 12 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 13 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 14 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:67:[parse_status] hub ss port 15 status 4
speed 0 devid 0

libusbip: debug: vhci_driver.c:69:[parse_status] sockfd 0 lbusid 0-0

libusbip: debug: vhci_driver.c:104:[parse_status] exit

usbip: debug: usbip_attach.c:100:[import_device] got free port 0

libusbip: debug: vhci_driver.c:367:[usbip_vhci_attach_device2] writing:
0 3 131074 2

libusbip: debug: vhci_driver.c:372:[usbip_vhci_attach_device2] attach
attribute path: /sys/devices/platform/vhci_hcd.0/attach

libusbip: debug: vhci_driver.c:380:[usbip_vhci_attach_device2] attached
port: 0

```

(With a success code of 0)

Which I have not found very informative, but when attaching this
https://github.com/bulwarkid/virtual-fido.git USB IP Virtual Device, I
found success.

This I proceeded to reverse engineer the working USB IP Device with
Wireshark, which led mo to the fact that the connection start with the
interchange

```

OP_REQ_IMPORT:

00000000 01 11 80 03 00 00 00 00 .......

00000008 32 2d 32 00 00 00 00 00 00 00 00 00 00 00 00 00 2-2..... ........

00000018 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

OP_REP_IMPORT:

00000000 01 11 00 03 00 00 00 00 2f 64 65 76 69 63 65 2f ........ /device/

00000010 30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0....... ........

00000020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

000000A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

000000B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

000000C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

000000D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

000000E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

000000F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000100 00 00 00 00 00 00 00 00 32 2d 32 00 00 00 00 00 ........ 2-2.....

00000110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ........ ........

00000120 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00 02 ........ ........

00000130 00 00 00 02 00 00 00 00 00 00 00 00 00 00 01 01 ........ ........

```

And replicating the same exact behavior in my application in my
application, I get the same exact error, and is actually error that I
share in the start of this email.


So I would appreciate any help that could help mo to get out of thick
wall brick where I found myself now.


As an extra remark, I have not understood yet which are supposed to
contain the fields: transfer_flags, setup and transfer buffer. I guess
it has something to do with the USB specification
(https://www.usb.org/document-library/usb-20-specification), Which have
to still finish reading.


Cordially, Pixiae


