Return-Path: <linux-usb+bounces-26639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580DB1F05A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Aug 2025 23:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCB0D7B1E4E
	for <lists+linux-usb@lfdr.de>; Fri,  8 Aug 2025 21:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896B72367BA;
	Fri,  8 Aug 2025 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b="N1b4LVo5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp6.goneo.de (smtp6.goneo.de [85.220.129.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CADE1B2186
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.220.129.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689636; cv=none; b=joRy33u4Ech5QqG1JLmXtwPh6x3kYOsKhLnzoWI9F3PeDjsygrC5gY7eZ9BV4SftlMjrAjWgYEOLfwILCv1VAA42bjf+zS1ABV7k68IhLyQEzaSNSkQWMpYk3WmvBj8txzNkpsxCzFGz++QCkUokHt3Wx5BDIeVWahw9yE7csfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689636; c=relaxed/simple;
	bh=zzSBdQEum5E71iD78KKka1c2FxEjh9SYHxnVlHZD8xA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=aiINZTiLtzoVbgJTpRR24nHFA+hmAwaufwAHV22PwLMKRAd3+eC1SyAo2d+XGUKdrV0WkkkhT2AAs52sy11yjJMLN3kOLKz2ONCg14Ke/sfEw/akfB/8vQEyocUNTQdrGTwOifdStgZ6UcyxgfIJCmONz6D7W9VG6cZAbqvW4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de; spf=pass smtp.mailfrom=mmeacs.de; dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b=N1b4LVo5; arc=none smtp.client-ip=85.220.129.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmeacs.de
Received: from hub1.goneo.de (hub1.goneo.de [85.220.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp6.goneo.de (Postfix) with ESMTPS id 8B99E240EFA
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 23:47:10 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPS id F0C41240167
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 23:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mmeacs.de; s=DKIM001;
	t=1754689629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CQFXuQ1FH6Xw20R5Is8kcQd6ZPJ20ZVgZRULG6FDjfo=;
	b=N1b4LVo57m5Nxxso7HxzCZXN6Jz7jvA8RxFOpRxDI/ZhsHxLyPJ3Hos8EzpOJmEk78mHAA
	Tefob+0/OxDvReK970lcn+BfVSL50Hujd4JpObCQVrc3FiwM4jgA4LwCcR7hu54srJgga6
	8tlH7arkArW+O8HVl6EMt0uU7DZ/42jFKq5+fE+Nc5N2BR6A6TMgsK0b0QvQbwONxFFssd
	a/9/Ex6EUVvuoZKVlpPniBRl9jSl0m8ip1+9ihhqCC+Sc2biGvRQG/8kuVobycPUkBpFuH
	RM0jYzct584AlpkPEGQJC5yHZ6TXgOazko2q7hXW+ZTWkvmrnHtnCwd2C75V7g==
Received: from [192.168.177.20] (tmo-080-85.customers.d1-online.com [80.187.80.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPSA id BD871240165
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 23:47:08 +0200 (CEST)
Message-ID: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
Date: Fri, 8 Aug 2025 23:47:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
From: Martin Maurer <martin.maurer@mmeacs.de>
Subject: Problem hanging Bulk IN, with USB 3.x, perhaps due to wMaxPacketSize
 = 1024 and wMaxBurst = 6 (OUT) and 2 (IN), tested and reproduceable with
 i.MX8MP and Raspberry Pi Compute Module 5 (CM5)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-UID: 68d22e
X-Rspamd-UID: fe79a2

Hello,

since some time I am fighting against a problem with USB:

I have a Qualcomm radio module (in my case a Quectel RM520N-GL and 
SIMCOM SIM8260G-M2)

connected to a Phytec Pollux board with an NXP i.MX8MP.

I started with Linux 6.6.23. It communicates with USB 3.x.

I build up an internet connection with this radio module. I connected a 
Notebook (via Wifi, but external hardware converts to Ethernet).

First test setup was a bit difficult.


Radio Module <-> USB 3.x <-> Phytec Linux Board <-> Ethernet Tunnel <-> 
Raspberry Pi CM5 <-> Wifi <-> Windows Notebook


I opened Firefox, Youtube worked well, HD video over multiple hours with 
no problem.

Then I opened Microsoft Teams instead and data transfer immediately 
stalled. I had a ping running in parallel directly to radio module, this 
also stalled.

With more testing I found out also Firefox and opening Twitch.tv stalled 
the connection.

# lsusb -t
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
     |__ Port 1: Dev 2, If 0, Class=Vendor Specific Class, 
Driver=option, 5000M
     |__ Port 1: Dev 2, If 1, Class=Vendor Specific Class, 
Driver=option, 5000M
     |__ Port 1: Dev 2, If 2, Class=Vendor Specific Class, 
Driver=option, 5000M
     |__ Port 1: Dev 2, If 3, Class=Vendor Specific Class, 
Driver=option, 5000M
     |__ Port 1: Dev 2, If 4, Class=Vendor Specific Class, 
Driver=qmi_wwan, 5000M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
     |__ Port 1: Dev 2, If 0, Class=Communications, Driver=cdc_ncm, 5000M
     |__ Port 1: Dev 2, If 1, Class=CDC Data, Driver=cdc_ncm, 5000M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
#

It is the Bus 05, Port 1, Dev 2 with multiple interface.

I found a newer Linux version 6.6.52. Same error occured.

When error occurs, I don't see anything in system logs (e.g. dmesg).

Instead of the Quectel radio module I took one from SIMCOM and same 
problem occured.

I added my USB 2.0 analyzer (old Ellisys) and problem disappeared. 
Unfortunately I have no USB 3.x analyzer.

I am still waiting for a original NXP board with an i.MX8MP, which seems 
a 6.12.x kernel can be used and tested.

I found an errata for i.MX8MP: ERR050714 “USB: HOST Stream IN issue if 
received short packet”, but it looks like I have no Stream IN in use...?

So perhaps something different.

For confirming, if it could be something i.MX8MP related, I today took a 
Raspberry Pi Compute Module 5 (CM5).

Also ARM64, but else, I assume completely different USB 3 peripheral.

And surprise: I was able to reproduce the problem.

The Raspberry Pi uses:

Linux CM5 6.12.34+rpt-rpi-v8 #1 SMP PREEMPT Debian 
1:6.12.34-1+rpt1~bookworm (2025-06-26) aarch64 GNU/Linux


I still can't decide which side makes the problem, or if it is just an 
interop problem.


I saw the virtual channel, which is used for data transfer, uses a 
wMaxPacketSize of 1024 Bytes (IN and OUT) and a wMaxBurst of 6 (OUT) and 
2 (IN).

I already created traces by usbmon, which I can share.

I can also read out USB descriptor (lsusb -v) and share.

Qualcomm radio modules are widely used, due to high possible throughput, 
I assume people are also using USB 3.x with it.

I am not sure yet, why the error occurs on my side and not just works...

Someone already heard from such an error? Is there perhaps some workaround?

Can I perhaps patch wMaxPacketSize or wMaxBurst done in Kernel, at least 
only for test purposes?

Note beside:

I can query number of sent and received IP packets. I sent the pings (1 
every second).

The ping does not display, that it receives an answer, after the hang 
occured.

But the radio module tells 5 sent and 5 received packets, when querying 
the statistics every 5 packets via QMI.

So I assume sending (Bulk OUT) is working, packet go to server and back 
to radio module, but answer is not sent over USB from device to host.

Second perhaps interesting note:

It looks like the received radio module is keeping/storing the packets.

After a more or less long time (a few hours), all buffers are exhausted. 
Then QMI commands are not answered anymore.

When doing some action (I saw it with opening the channel for AT 
commands, or for creating log files),

it could happen that all kept packets are then sent in one go, so I get 
QMI packet statistic a lot of time, all with increase of 5 packets,

in sum an amount of packets, which needed the hours the create.

The radio module seems also to be using Linux. Which version, I don't know.

What can I do/test next?

Try again on a AMD x64 controller? Perhaps with main/latest of Linux Kernel?

I thought about getting an i.MX95, but seems to be not yet available,

but Phytec has some engineering samples (?) on boards, but release notes 
say: only USB 2 is working yet.

Can I enabled traces in USB kernel which could be helpful to narrow the 
problem.

Sorry for the long description. I tested meanwhile a lot...

Best regards,

Martin




