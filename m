Return-Path: <linux-usb+bounces-18274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBF9E9DF0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 19:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22C5C1886D4C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 18:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6CF155C8A;
	Mon,  9 Dec 2024 18:19:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2990A14D283
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733768383; cv=none; b=StAGSMqBvsBq1edxFjVhKjxZa4Ox4JCAFs4SuZyYTskfDsZQ6aMRXPOB2sLLk4ch67A5HultRiPIAJFPvLByTdKfdZFv5om3BrAfAFzyt1e0SWnDMjY1VtaJeiiQvTBdNs76lTP36UoNMdCdzxe5ggy0HVnNOPgCvBP5+bGqIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733768383; c=relaxed/simple;
	bh=DarDF4zEMR2xqCMgYMEITzUAUEulrMnPavagw+nCF/c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OztlKlAjDru48LwSU9iTCPnWMnYi9pP3FQipad39GZ8ze7AwlRKmI/Q3nMh4SVPBunzfkOPtPlx7oNBAkY4ddcZW3as2xwORTIBcPMgCGurAmxl+jZI1iJGADqUmExypgbk00M+UdVQRH1Tbp8XB7xYnUE41w1I7OYr2rwZnTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plauener.de; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plauener.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef66a7ac14so50318037b3.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2024 10:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733768379; x=1734373179;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7eZpq7xx/Q0grD8wadUoe8fR5DWqQFqW2yevManx5M8=;
        b=DTokg0S3kV+5/yaRttYE/KNOVC7Ob2OI3oi3TMT6y1C8nZsAlQ2j+BMhzlvpsllW9J
         9gJC7kQ6wfC83FZv68KJJYzTn9WDrtp33nqjVftSkoPBDxs1JQAI2nCXfmzsnQHuBE3a
         qluTyZzEztZ6litonTAV1KvKI6bhMC+AhMPEQRhuHifHQRh39v3ant9/IimTR+X/W/Kv
         /jB39rPUQirxQh0STZc/wGSpYNogOTdboowx5RDKliYRRCmwaZoLz+2n1L2x4hn2SFa0
         pVb08jqHSYgISC07Zi3xKyalwPMGHKZsJsp1uz+YWyqp9smtlNGrPJGQOti/j69vXZEY
         o5wQ==
X-Gm-Message-State: AOJu0Ywh5VBlzG0S9iA0D6NgLv/kFmeKhpk5NGdyeb8Ee1RuXAqD/SX1
	ApvfenECSPxVTfaoJLj3+IxMsaXY3xHOewdut/vgJPdRRVL7dBLXWYITsD5Ap9Qd+7oMWEDGVgw
	00f81gsC2ZwJxhGVY5hjc/H8Yr2ID9pKM
X-Gm-Gg: ASbGncvqBGTDuUsq1/gpb/CPXA0Ge1Z6jafIqBIjdKgURI9/5+H1O5uvKo0TpBYyQ1L
	6M08BFWi5MRzBez0oBkgzEIcf/wYnG5gNNTUfS8VmK6xogvChFZeKiU4dMDumhmts
X-Google-Smtp-Source: AGHT+IEYeMQCfo7BwMzsAQSWpITUOwWKaWZANBURdZ94wnK7iHrzKr1HsY249cV2wD3yl6VtBsTbvf/QCeH6iNAkuS0=
X-Received: by 2002:a05:690c:3612:b0:6f0:f05:686c with SMTP id
 00721157ae682-6f02587d9a1mr2919177b3.15.1733768378950; Mon, 09 Dec 2024
 10:19:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Christian Krause <chkr@plauener.de>
Date: Mon, 9 Dec 2024 19:19:28 +0100
Message-ID: <CAJugSwwpWKFbniGkdDCcGtKAbeYhoCsP=rMdmfaWGdFiFGEB0g@mail.gmail.com>
Subject: Different speed of USB control transfers for HS USB devices depending
 on used USB port
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello USB maintainers,

I've seen the following unexpected behavior with respect to EP0
control transfers:

The speed of control transfers for HS devices varies quite much
depending on which USB port of a system is used. The problem can be
replicated on different systems with different chipsets and for any HS
device I have tested.

Here is a concrete example:
- mainboard: MSI B550 GAMING GEN3 (MS-7B86)
- Linux kernel: Fedora's 6.11.10-200 kernel

The mainboard has two AMD USB HCs:
02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 500 Series
Chipset USB 3.1 XHCI Controller
2f:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB
3.0 Host Controller

I have monitored the USB low-level transfers with a HW USB analyzer.

a) control transfers slow: HS device connected to back panel USB2.0 port (black)
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 480M
    |__ Port 010: Dev 042, If 0, Class=Mass Storage, Driver=usb-storage, 480M
- the USB transactions (SETUP, IN, OUT, ...) happen every millisecond
and there are 8 SOFs between each of them
- the USB analyzer shows the following transactions (e.g. for a
GetDescriptor transfer):
    - 8x SOF
    - SETUP transaction
    - 8x SOF
    - IN transaction
    - 8x SOF
(depending on the descriptor size more IN transactions interleaved with 8 SOFs:
    - IN transaction
    - 8x SOF
    ... )
    - OUT transaction

b) control transfers slow: HS device connected to back panel USB3.x (red)
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 480M
    |__ Port 001: Dev 043, If 0, Class=Mass Storage, Driver=usb-storage, 480M
- same behavior as a)

c) control transfers fast: HS device connected to back panel USB3 port (blue)
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 001: Dev 046, If 0, Class=Mass Storage, Driver=usb-storage, 480M
- there is only a single SOF between between the SETUP, IN and OUT transactions
- multiple IN transactions are combined in one frame (e.g. for larger
descriptors)
- the USB analyzer shows the following transactions (e.g. for a
GetDescriptor transfer):
    - 1x SOF
    - SETUP transaction
    - 1x SOF
    - IN transaction
(depending on the descriptor size more IN transactions without SOFs)
    - IN transaction
    - ... )
    - 1x SOF
    - OUT transaction

Note: The timing can best be seen with a HW USB analyzer. Monitoring
/dev/usbmonx with wireshark still gives a good indication in the "Time
from request" in the "USB URB" section: for cases a) and b) the time
would be 2-5ms and for case c) it would be < 1ms for a GetDescriptor
request of a simple HS USB stick.

The behavior of case a) or b) makes control transfers with larger data
stages approx. 50 times slower.

Is that behavior an expected HW limitation or does it point to some
kind of SW issue?

I'm happy to help debug the issue. If you want me to do any debugging
steps or provide any additional information, please let me know!


Best regards,
Christian

