Return-Path: <linux-usb+bounces-4969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7A482C773
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 23:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A41A51F23C38
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 22:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E760518B1B;
	Fri, 12 Jan 2024 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMKeb15n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237C18B0C
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 22:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e67e37661so9420188e87.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 14:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705099929; x=1705704729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMifX3Cd9ihnszcyzjJn07lsY4XZxpuZkb7ryJt6VaU=;
        b=gMKeb15niGhuKFLk09GoGvTKI9/PAfdnsi9iKEmXy0ZFZH55jV60W7pxV15HZJUbWD
         2ZWYE31BdPynpd9Dh13n3jCYS+cNNxmd6QCcei+fX9qkjls8hLb9Y2ngd6IW944iwGOF
         D3v63drm/ZSK/VolJUQGZ5BVgK7o1/iGc0XSAqy+4T38rjEPTK5SkdPbhjizUHFs86YU
         +dyXCBv+F2/xRDx7CoklpTKkYBY+AyWZ4dAxChnjq4HJh8t2YJGz9cvqti1sA7uyFhcN
         G846CYInYGwCZKggRz2fjqHBgEY8tnpO46Zl8/RmL4h1Ub8adD2MLHt/2VVkFjSYzBd9
         TdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705099930; x=1705704730;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMifX3Cd9ihnszcyzjJn07lsY4XZxpuZkb7ryJt6VaU=;
        b=j+ak5lW+k5/oohjQoedfXo1y9Ww+F2+vxVB3Pi1yesWgKOP3ijC7+UIibcHF04s9bU
         v0Jq6oNDvIJPlS03Wd90+6KxukDVaRvZ1tzcpoQuWvgHQrxTEk7W+/hKHLWN8QIOzBSk
         KTyaameWNyLkRkB3HhwftA4mImTzAhsD6mm6dqvfmmB8xK+eZzluoJMxGqC5bgbnVUAw
         B1a+9lYrFOOXIMxVqOHJE3IQoIvWrLRpoShPSeMRyhJ33wFcX2sxQlAOLLqxAGradACa
         +pA3GntKoNr3OJ6Ngd2W85+7SDmQQ1nmAvCvLyz9+nG2PtvtwbHZ3zvzU2PzgufFq1WW
         ugXQ==
X-Gm-Message-State: AOJu0YzxkMqbS0qVZXKyIMmon0yhZgjJZZR38x2o7vFGr6sqnbtCTt3S
	GHdP5XLAC5VA2TQk7zqydxT7t7rmUAo=
X-Google-Smtp-Source: AGHT+IGZt6rMtvoLGglmNkkV05eaeL0FfVadlRSF5k7yrZr0Sf0HKUbvutdHXb6PkkHp8E4S7J/Mzg==
X-Received: by 2002:a05:6512:1243:b0:50e:8137:9a10 with SMTP id fb3-20020a056512124300b0050e81379a10mr1321359lfb.129.1705099929371;
        Fri, 12 Jan 2024 14:52:09 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id fb21-20020a056512125500b0050e7f646004sm622130lfb.301.2024.01.12.14.52.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2024 14:52:09 -0800 (PST)
Date: Fri, 12 Jan 2024 23:52:05 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-usb@vger.kernel.org
Subject: "Transfer event TRB DMA ptr not part of current TD" spam after USB
 disconnection
Message-ID: <20240112235205.1259f60c@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,


This is a long standing issue seen in many kernel versions up to 6.7.

Disconnecting a high- or super-speed UVC camera from USB 3.0 port during
recording prints a lot of these errors (usually much more than here).


This appears to come from handle_tx_event() and it is my understanding
that the function tries to look up a transfer request previously issued
by the driver which is pointed to by a completion event received from
the hardware, and the pointer is found to be out of expected bounds.

It is a consistent pattern that problematic event-dma pointers are
within segment bounds, but they start one slot past trb-end and grow.

Comments in the code suggest that "the HC is hosed", but I suspect the
real problem might be the driver failing to retire the _previous_ TD
after it completed with similar errors and continuing to wait for its
completion events forever, or something else with similar outcome.


Or, at any rate, I *hope* that it's a harmless bug and not some memory
corruption... I only have very basic understanding of XHCI.


Any thoughts or suggestions how to fix or debug this further?


Thanks,
Michal


# camera connected
[ 2968.873423] usb 8-1: new high-speed USB device number 54 using xhci_hcd
[ 2969.155383] usb 8-1: New USB device found, idVendor=0bda, idProduct=58b0, bcdDevice= 7.01
[ 2969.155393] usb 8-1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 2969.155396] usb 8-1: Product: FULL HD 1080P Webcam
[ 2969.155398] usb 8-1: Manufacturer: Generic
[ 2969.155400] usb 8-1: SerialNumber: 200901010001
[ 2969.162076] usb 8-1: Found UVC 1.00 device FULL HD 1080P Webcam (0bda:58b0)
# recording started
[ 2978.289442] usb 8-1: Device requested 3072 B/frame bandwidth
[ 2978.289461] usb 8-1: Selecting alternate setting 7 (3072 B/frame bandwidth)
[ 2978.291230] usb 8-1: Allocated 5 URB buffers of 32x3072 bytes each
[ 2978.910333] usb 8-1: Device requested 3072 B/frame bandwidth
[ 2978.910352] usb 8-1: Selecting alternate setting 7 (3072 B/frame bandwidth)
[ 2978.913549] usb 8-1: Allocated 5 URB buffers of 32x3072 bytes each
# camera disconnected
[ 2988.728338] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.728348] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d313890 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.728449] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.728452] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d3138a0 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.728527] usb 8-1: USB disconnect, device number 54
[ 2988.728573] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.728576] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d3138b0 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.728698] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.728701] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d3138c0 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.728841] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.728844] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d3138d0 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.728948] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.728951] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d3138e0 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.729073] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.729075] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d3138f0 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.729197] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.729199] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d313900 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.729322] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.729324] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d313910 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.729447] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.729450] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d313920 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.729572] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.729575] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d313930 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0
[ 2988.729697] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4
[ 2988.729700] xhci_hcd 0000:02:00.0: Looking for event-dma 000000012d313940 trb-start 000000012d313870 trb-end 000000012d313880 seg-start 000000012d313000 seg-end 000000012d313ff0

