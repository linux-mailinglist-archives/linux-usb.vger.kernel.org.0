Return-Path: <linux-usb+bounces-15373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E92984DC0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 00:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9393D1F240C5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 22:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A176147C79;
	Tue, 24 Sep 2024 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=limotek.co.za header.i=@limotek.co.za header.b="hp2IllXf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.limotek.co.za (mail.limotek.co.za [93.104.209.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB248146D6E
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.209.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727216804; cv=none; b=uHfKhDn82ArhFuVtYBfnc7qoNe9z9wSOKY7OSNaVjxSkcgFDZcbTC+uogDcGE72lEcVjmkSCtJ4kLr0JAM5KmX05bCRHnh+prdo6l2h895CqFPOEStOYHSH4jsesADaoXCgudXFHbYZi7LFoT+/KB/2CnbKRK7g1lq6awo5uZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727216804; c=relaxed/simple;
	bh=kMqEKYs79GBdVtW1kcZL6y7oX7Hgi9e8Q6D8iw/FYJs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=mT5vBL+Faa5IMvqw1H6uPy5/KtQaqjUc+E3TOeZQk1SnAz5y0OMSdlDJ5IlT08OPv8lo/J8aOCvHWq51mCutcsZ2KoYN9hLaGZIwqrwA94u8ISVOzMBxRAK/qF+KGSAGrtaBvPwe7QcskxCuALAcNiEGmBlS6w4tPdq3PeIZ3tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=limotek.co.za; spf=pass smtp.mailfrom=limotek.co.za; dkim=pass (2048-bit key) header.d=limotek.co.za header.i=@limotek.co.za header.b=hp2IllXf; arc=none smtp.client-ip=93.104.209.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=limotek.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=limotek.co.za
Received: from localhost (localhost [127.0.0.1])
	by mail.limotek.co.za (Postfix) with ESMTP id B25612A99333
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 00:26:38 +0200 (SAST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=limotek.co.za; h=
	content-transfer-encoding:content-type:content-type
	:content-language:subject:subject:from:from:user-agent
	:mime-version:date:date:message-id; s=default; t=1727216798; x=
	1729031199; bh=kMqEKYs79GBdVtW1kcZL6y7oX7Hgi9e8Q6D8iw/FYJs=; b=h
	p2IllXfA8whlwTR9KboMPvtZ51W4bzHjDnMf+WGTnyc7vuRvYySqGVFJwF0+ZqHD
	fLD/IY6P+L0kVa6Q4ugBIKAWk5xDsjdkzO1bVvciBE22yHm8OlZNuHNjoH/XnWqe
	Jxk3DqsmoKleddhnXnd0F7C917pMrUR583grJwaHiUrZn8KQHkIvs35jD7essGKW
	P6jzS2l5rPiOXpdU+FyFxxUg1HdQUgijNBTw3LTJ3u1fkyiMaGMp9USPIgm+uP5c
	tg8c/OW2KHzhDPzC8RtDSrqLu74/5Q2YiyRynHfRq6bxeTL0OrpRxpVXi15u7X8o
	aeHMSIXgDkxyX82Zd/a/Q==
X-Virus-Scanned: Debian amavisd-new at mail.limotek.co.za
Received: from mail.limotek.co.za ([127.0.0.1])
	by localhost (mail.limotek.co.za [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id KBmN8d_HIvmz for <linux-usb@vger.kernel.org>;
	Wed, 25 Sep 2024 00:26:38 +0200 (SAST)
Received: from [192.168.1.101] (197-99-39-233.ip.broadband.is [197.99.39.233])
	(Authenticated sender: lukas@limotek.co.za)
	by mail.limotek.co.za (Postfix) with ESMTPSA id BE7972A992A7
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 00:26:37 +0200 (SAST)
Message-ID: <daa4f855-6492-447b-bf49-a21fd2d2f077@limotek.co.za>
Date: Wed, 25 Sep 2024 00:26:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Lukas M. Oosthuizen" <lukas@limotek.co.za>
Subject: Add Nations N32g43x usb to serial driver
To: linux-usb@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi


Can you please add the following device to a proper driver:

*/[  149.554092] usb 1-1.4: new full-speed USB device number 3 using 
xhci_hcd
[  149.661456] usb 1-1.4: New USB device found, idVendor=19f5, 
idProduct=3245, bcdDevice= 1.00
[  149.661476] usb 1-1.4: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  149.661489] usb 1-1.4: Product: N32g43xCustm HID
[  149.661499] usb 1-1.4: Manufacturer: NATIONS
[  149.661508] usb 1-1.4: SerialNumber: N32g43x
[  149.681694] input: NATIONS N32g43xCustm HID as 
/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4/1-1.4:1.0/0003:19F5:3245.0001/input/input4
[  149.741001] hid-generic 0003:19F5:3245.0001: input,hidraw0: USB HID 
v1.10 Keyboard [NATIONS N32g43xCustm HID] on usb-0000:01:00.0-1.4/input0
[  149.794848] usbcore: registered new interface driver cdc_acm
[  149.794862] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters
[  187.072026] usbcore: registered new interface driver usbserial_generic
[  187.072095] usbserial: USB Serial support registered for generic
[  187.072186] usbserial_generic 1-1.4:1.1: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[  187.072199] usbserial_generic 1-1.4:1.1: Tell 
linux-usb@vger.kernel.org to add your device to a proper driver.
[  187.072211] usbserial_generic 1-1.4:1.1: device has no bulk endpoints
[  187.072268] usbserial_generic 1-1.4:1.2: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[  187.072278] usbserial_generic 1-1.4:1.2: Tell 
linux-usb@vger.kernel.org to add your device to a proper driver.
[  187.072287] usbserial_generic 1-1.4:1.2: generic converter detected
[  187.072943] usb 1-1.4: generic converter now attached to ttyUSB0/*

*/
/*

Please let me know if you require anything else from my side.


