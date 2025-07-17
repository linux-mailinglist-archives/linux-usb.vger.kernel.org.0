Return-Path: <linux-usb+bounces-25908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 495C3B08CA0
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 14:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0ED71A66F7B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 12:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC6429DB92;
	Thu, 17 Jul 2025 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bigon.be header.i=@bigon.be header.b="NhZI0pp3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87329994E
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752754481; cv=none; b=mqeTRlLVwjR5y85NUuMVG9A1Dusz3Z5Lz0rAee/x87Bv7NaJOGw5kZ3TtxGKrc7tIMA0exAxrOGTOK88yuabYcLjvagI0r+u+0zgdzz87vzvDdZKZDbeCbLtaNe8IOOUPAzwgPiDVVroX4YUU1SIGdiCa56u6KH8PWIf6E9bM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752754481; c=relaxed/simple;
	bh=Gty/qkW8aKWdaf0hXFX7qUJ6xLD2l1Cg08Abwfn4hbQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Yt+8tcJ2K4uraxcW1r4yG0/9/4qIQArOVi19Ul+7NMYyOHkkB7lSseY6FqRzAPtYafhlhrCOxaPo+tDSbngIt6H9NwAYr61/3RTPer4CDIGW0KfaczUBibBfuCnEup4/2YsJ19q//3zPZR5h5n2pJqZGSenz5LUUd6jbIpBDI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bigon.be; spf=pass smtp.mailfrom=bigon.be; dkim=pass (2048-bit key) header.d=bigon.be header.i=@bigon.be header.b=NhZI0pp3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bigon.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bigon.be
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bjWqB5kT6z9sq0
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 14:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bigon.be; s=MBO0001;
	t=1752753974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Yn7HXo110I+jWiBYx/7rDGdjgwHHp5vN3+lWcfMPBS4=;
	b=NhZI0pp3G9v1XvFHlKMi9ZIIJUW/aXluhCZs1G3zWwqnZRJqjqxtpuQxZnA5ihHqLlGLHw
	UEoBfQgQsaPShKtgNY6EJV5f7cOUz2i0sfCLoqaaC3qgmpQYydF5UtXi71oX+dS1ituunM
	CqC8oWD0Ydd5DEOSLZIlV0YCZ5Ss0byYZFnL1X7N1GAbk+Kx7i2RYQPq+tixgx0IZH468K
	ODY0BP8tENOGJagfrY87AQQB7Gbw1ZZ0Jjn2zk1GfJDed9mZZf7x36nBFKEFcEDve/ue8L
	Iw5Kx7srpHXwoMk7DyDsKnfUWNUplYUNGDSuCphEBcLwTfTeWbCHPyiDrDtv4A==
Message-ID: <c05a76cc-ac27-4f64-a4a7-5a1e0fd349d9@bigon.be>
Date: Thu, 17 Jul 2025 14:06:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, fr-BE, fr
To: linux-usb@vger.kernel.org
From: Laurent Bigonville <bigon@bigon.be>
Subject: Hikmicro Mini2 V2: unable to enumerate USB device
Autocrypt: addr=bigon@bigon.be; keydata=
 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
 Gub8y8YgCrSTibbvx1KRJA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I just bought an Hikmicro Mini2 V2 USB thermal camera and the device is 
not recognized

[   64.039667] usb 3-2: new high-speed USB device number 11 using xhci_hcd
[   64.245840] usb 3-2: New USB device found, idVendor=2bdf, 
idProduct=0106, bcdDevice= 4.09
[   64.245857] usb 3-2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[   64.245862] usb 3-2: Product: Thermal Imager
[   64.245865] usb 3-2: Manufacturer: Hikmicro
[   64.245868] usb 3-2: SerialNumber: XXXXXXXX
[   65.817499] usb 3-2: USB disconnect, device number 11
[   66.162197] usb 3-2: new high-speed USB device number 12 using xhci_hcd
[   66.344529] usb 3-2: device descriptor read/64, error -71
[   66.629395] usb 3-2: device descriptor read/64, error -71
[   66.922427] usb 3-2: new high-speed USB device number 13 using xhci_hcd
[   67.104880] usb 3-2: device descriptor read/64, error -71
[   67.390254] usb 3-2: device descriptor read/64, error -71
[   67.493238] usb usb3-port2: attempt power cycle
[   68.151973] usb 3-2: new high-speed USB device number 14 using xhci_hcd
[   68.152150] usb 3-2: Device not responding to setup address.
[   68.354479] usb 3-2: Device not responding to setup address.
[   68.560631] usb 3-2: device not accepting address 14, error -71
[   68.747321] usb 3-2: new high-speed USB device number 15 using xhci_hcd
[   68.747422] usb 3-2: Device not responding to setup address.
[   68.950227] usb 3-2: Device not responding to setup address.
[   69.152505] usb 3-2: device not accepting address 15, error -71
[   69.152593] usb usb3-port2: unable to enumerate USB device

The device is not listed in lsusb after this

It's not clear whether the camera is a UVC one, but the device should 
still appear, right?

An idea what to do?

Kind regards,

Laurent Bigonville


