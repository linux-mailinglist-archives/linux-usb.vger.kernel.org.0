Return-Path: <linux-usb+bounces-19878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC80DA22761
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2025 02:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4BA43A3C0F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2025 01:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AD71DA5F;
	Thu, 30 Jan 2025 01:05:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F98BE8
	for <linux-usb@vger.kernel.org>; Thu, 30 Jan 2025 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738199117; cv=none; b=SWZ1FRVeS2LlszCLr42GWAE9wr9iRwHUFm6tasexR7jIuzbMghqLcovXHPyPyWwBbrLTDc5xc8GJmahC1AZ8U1V7QEjRLiFXoUfLaS8L95i5JyravIiEpip0NuYeQ/vs72qIsZE58QnOhrxqn5s1h2o1TikAxdozH4AIQLwrKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738199117; c=relaxed/simple;
	bh=/gG+4gluCc24KbhBzxtmtkSz7nU5UyRvZcifE5E66qk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uejHekoEjCifY0YL2gW/OgsF4K3YKVTeyVitbFyadl9oMBNVZwMMP4ovdCbGMLeDevVDHTYrZvbAJty3UF3JcgEvqkblQphJSHtKbVa55NiAHg2qhCx8ESL++msQtQqO8+rg3TRe9TP1eeTXZi4DHwhKwTAL4BwvBiC++lMNnuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.28.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4Yk0yz6sc9z8tqD
	for <linux-usb@vger.kernel.org>; Thu, 30 Jan 2025 11:59:07 +1100 (AEDT)
Message-ID: <ab96aa1f-25ba-4eef-aec7-0f4c3a4047fa@eyal.emu.id.au>
Date: Thu, 30 Jan 2025 11:58:59 +1100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Reply-To: eyal@eyal.emu.id.au
Content-Language: en-US
From: Eyal Lebedinsky <eyal@eyal.emu.id.au>
Subject: nvme disk in caddy runs at 480M (expect 10000M)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

$ uname -a
Linux e7.eyal.emu.id.au 6.12.10-100.fc40.x86_64 #1 SMP PREEMPT_DYNAMIC Fri Jan 17 18:03:20 UTC 2025 x86_64 GNU/Linux

I have a USB-C PCIe card that can run at 10Gbps. When I connect an nvme disk it connects at 480M.

## no disk plugged into this card:
$ lsusb -tv
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 20000M/x2
     ID 1d6b:0003 Linux Foundation 3.0 root hub

## now I plug in the USB-C caddy:
	/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
	    ID 1d6b:0002 Linux Foundation 2.0 root hub
	    |__ Port 001: Dev 006, If 0, Class=Mass Storage, Driver=usb-storage, 480M	<<<
	        ID 0bda:9210 Realtek Semiconductor Corp. RTL9210 M.2 NVME Adapter	<<< the caddy
	/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 20000M/x2
	    ID 1d6b:0003 Linux Foundation 3.0 root hub

It connects at 480M rather than the max for it (10G).

$ sudo hdparm -t /dev/sdi
	/dev/sdi:
	 Timing buffered disk reads: 100 MB in  3.03 seconds =  33.00 MB/sec

## using a USB-3.0 to USB-C cable connects at 5000M:
$ sudo hdparm -t /dev/sdi
	/dev/sdi:
	Timing buffered disk reads: 1276 MB in  3.11 seconds = 410.77 MB/sec
$ lsusb -tv
	/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
	    ID 1d6b:0003 Linux Foundation 3.0 root hub
	    |__ Port 007: Dev 006, If 0, Class=Mass Storage, Driver=uas, 5000M		<<<
	        ID 0bda:9210 Realtek Semiconductor Corp. RTL9210 M.2 NVME Adapter	<<< the caddy

I remember it connecting at full speed in the past.
Also tested on another computer and measured 1010MB/sec, so the caddy seems good.

What information will show the decisions the drivers made?

TIA

-- 
Eyal at Home (eyal@eyal.emu.id.au)


