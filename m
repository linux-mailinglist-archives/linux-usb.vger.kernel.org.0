Return-Path: <linux-usb+bounces-23855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39955AB2FCA
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 08:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABACF7A4242
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 06:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C394255E2C;
	Mon, 12 May 2025 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNJSwcGg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFA28F3
	for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031993; cv=none; b=bgl97OlX5Es0cMcg03Nn/1tU+2F78EFp567o2NPuteV/alADLM618eRv/v+1fUF18Afg7b8aPMrCWpI40a4eBS8uWg/9endEfS1h1KIgSF2efQ3kjRWjU6D3VWLq3TTfI5X3F2kJyddPRmh7brUfuUxWCUuG4KGPf9F5Imcc0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031993; c=relaxed/simple;
	bh=7ZPeGy5C8aEODzeJWjne+hd5BmZwVXPirOVN4J2iH9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e6cnjNkRRZEt6UC4C718QWFaFNK4OL8mwHfGVnwTgoLL8eG2Fgo98edwDce9HOW2VRL/ITjKDdHvGG9ZNL8xA0Xe7hWGPvJzmaxSLpRYHSGRW/Tp2BpjthyBME/4R5B+o6ZULwNUhzpibmly1KFobZAKrdnwNIpDlKOND9UZdxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNJSwcGg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30a89c31ae7so5387186a91.2
        for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747031991; x=1747636791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEOoKOpPNyi9SX0NKwiZp1Moj/9D/zk+9nUzD8bR49A=;
        b=dNJSwcGge9ZQ7h2ZSac6bCaqNTh0LD1ai5RRh/aQ0PvTqNK0kPzm/JD9rgFu/6d/7r
         rrARRNyxJj1HROFkNa/xGtaTC+tMfHJpyqsrLKhYV+rr43HJ1qlLzhOERitRDPaJUfCK
         sAJ31rcVK3d6zf847giX8kxrkyqTDeij2c5KTHdUmJ+ZepKwC4sjRWnwcGZAemD5hbbF
         eQoqgedCDua5kHHXgJJ5NrAcNywTtoIfo86QjNnIPtcGVtfRM5uPniQAiXP+p2MVaJGu
         COSuU8luRE7u5o6YtBiXq7zMHd3zuXGNwYB0rljdlUEasDx/GPQ5FWrYMME3cIxXIXxS
         epCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031991; x=1747636791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEOoKOpPNyi9SX0NKwiZp1Moj/9D/zk+9nUzD8bR49A=;
        b=A3g72QZ+F2no1zHPnBYJF8KT6HX+3hiRCi9vXZtmvH6r/ALMjH9HtU+JQHvgoFiDhE
         pAqMfsi8WWQBKuo7Qmn5CgbSJR35XwMZZvlMpgGdrKTuA35Q8xx6epSwh9FPQkDo9mKm
         5zl6rAEp3tCtnQKqeGPMiQctl67iOUiQdlPhAruaJQ+q2n9+UmtKCgyFulOgo0TzFwbe
         tNY0btHi/VJUZyLorFLpu4g/tfvzUBiin8AmDriuvl113BQ4FdrP5YEzWP05zvpXlhLu
         n1X7sQ8Yi+S1JeHLdFOJezGXL8mUiMKzmocZeTL1B1RVb9HDVjahzS3ZNZOgEpOOMMen
         xgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeHHcCV1oaE4o041bcxRhBCiqi5QB1VKzl83hIB6PxuKSFOz9YcCV07qkL2Ht0ZI7Kr7ELAYJMszU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxwQDjbsectGHi0Vd/5WtDuTALmU83wah/xeZe5C8lxZO4+ai
	wpTFvFnkaXurzw7wlrExku5tbmFDtxBH8LE78PLOlx2mSd81V4or
X-Gm-Gg: ASbGncuUWA2bU1iMRPpaVP3a4tbZDNwiywygqiX0VuJKCc6xztJgWQxncIi5l2zWoqk
	CIXprSp5nfCfdYPIYmCeEm0JAZk0oC4H9PrTeEZVwv4B/eXIiDUtkrReh7dCrwOGdJWoHxcyt2O
	8IZcU9gQwRxk8FplRR6hxbmshp8rWHmGXwSD0UP/3N4UCMND2MLaEI4tK3q9qAHyTm532rzDG5i
	wzv7lLGT4RvgVplc95TWm+4+cRqsrajLRpm/ivGiPCNrm4TGDDiH7j7ES+cwxgjCoR99U2aDv6x
	Z0330rvv39sN2s2oIpK0mayCkNTHOuhcJK71hIxX8N9MrwElYWciLVXKpCG/NRC0kvzg6dyUJVs
	62g==
X-Google-Smtp-Source: AGHT+IFKhy5XR0GP13mQ6f75cEmCm4V3918umE5CqjgXrYxUf7TmW/EMtfomYAR9w4jBEbMnEu6wHA==
X-Received: by 2002:a17:90b:390f:b0:30a:4c44:cc05 with SMTP id 98e67ed59e1d1-30c3cefe5dbmr18840742a91.10.1747031990425;
        Sun, 11 May 2025 23:39:50 -0700 (PDT)
Received: from rdbsd2.rdb.adwin.renesas.com ([128.1.49.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df385asm5889517a91.29.2025.05.11.23.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:39:49 -0700 (PDT)
From: Guan Wang <guan.wang.jy@gmail.com>
X-Google-Original-From: Guan Wang <guan.wang.jy@renesas.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	guan.wang.jy@renesas.com,
	Guan Wang <guan.wang.jy@gmail.com>
Subject: [ISSUE REPORT] xHCI infinite endpoint reset loop on full-speed after transfer error
Date: Mon, 12 May 2025 14:39:13 +0800
Message-Id: <20250512063912.3331082-1-guan.wang.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guan Wang <guan.wang.jy@gmail.com>

Hello,

Using Linux version 6.15.0-rc5-00032, I encountered an issue where the xHCI controller enters an
infinite loop while attempting to recover a USB endpoint. This causes the xHCI driver to get stuck,
and no USB transfers can proceed.

This issue appears to only occur with full-speed bulk devices such as USB serial adapters(e.g.,
USB-Serial or CDC-ACM class). I've reproduced it using CH340 and CP2102 USB serial devices.

**Steps to reproduce:**
1. Attach the device.
2. Start continuous data transfer (e.g., `cat /dev/ttyUSB0`).
3. Induce transfer errors via:
   - EMI interference
   - Sudden temperature changes
   - Long USB cables
   - Briefly shorting DP/DM lines to simulate a transaction error

After this, the xHCI controller enters an infinite reset loop on the affected endpoint. "Transfer error"
messages continuously appear in the logs, creating a log storm. The issue seems to improve or disappear
when an external high-speed USB hub is inserted between the host and device.

Do you have any comments or suggestions? The log is shown below:


**USB emulation dmesg**

[   41.109377] usb 3-1: new full-speed USB device number 2 using xhci-renesas-hcd
[   41.277651] xhci-renesas-hcd ee000000.usb: add ep 0x82, slot id 1, new drop flags = 0x0, new add flags = 0x21
[   41.277676] xhci-renesas-hcd ee000000.usb: add ep 0x2, slot id 1, new drop flags = 0x0, new add flags = 0x31
[   41.277697] xhci-renesas-hcd ee000000.usb: add ep 0x81, slot id 1, new drop flags = 0x0, new add flags = 0x39
[   41.286380] ch341 3-1:1.0: ch341-uart converter detected
[   41.305437] usb 3-1: ch341-uart converter now attached to ttyUSB0

T:  Bus=03 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 1
B:  Alloc=  0/800 us ( 0%), #Int=  0, #Iso=  0
D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1d6b ProdID=0002 Rev= 6.15
S:  Manufacturer=Linux 6.15.0-rc5-00032-g0d8d44db295c-dirty xhci-hcd
S:  Product=xHCI Host Controller
S:  SerialNumber=ee000000.usb
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms

T:  Bus=03 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=12   MxCh= 0
D:  Ver= 1.10 Cls=ff(vend.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
P:  Vendor=1a86 ProdID=7523 Rev=81.34
S:  Product=USB Serial
C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=104mA
I:* If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=01 Prot=02 Driver=ch341
E:  Ad=82(I) Atr=02(Bulk) MxPS=  32 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS=  32 Ivl=0ms
E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=1ms


**reproduced dmesg (any EMI issue during USB transfering)**

[  126.432551] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.432571] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=0
[  126.432581] xhci-renesas-hcd ee000000.usb: Soft-reset ep 2, slot 1
[  126.432593] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.432903] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.436538] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.436546] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=1
[  126.436553] xhci-renesas-hcd ee000000.usb: Soft-reset ep 2, slot 1
[  126.436561] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.436934] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.437631] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 4 on endpoint
[  126.437641] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=0
[  126.437648] xhci-renesas-hcd ee000000.usb: Soft-reset ep 4, slot 1
[  126.437656] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.438067] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.440624] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.440633] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=2
[  126.440640] xhci-renesas-hcd ee000000.usb: Soft-reset ep 2, slot 1
[  126.440647] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.441047] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.444624] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.444634] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=3
[  126.444641] xhci-renesas-hcd ee000000.usb: Soft-reset ep 2, slot 1
[  126.444649] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.445052] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.448624] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.448634] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=4
[  126.448640] finish_td: USB transaction error on TD 000000009ed82d11
[  126.448647] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.448654] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.449051] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.449060] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b000 (dma) in stream 0 URB 0000000046762d58
[  126.449072] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b010, cycle 1
[  126.449072]
[  126.449079] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.449084] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.449360] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b010
[  126.449370] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.449377] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.449389] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.449629] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 4 on endpoint
[  126.449639] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=1
[  126.449646] xhci-renesas-hcd ee000000.usb: Soft-reset ep 4, slot 1
[  126.449654] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.450067] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.452623] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.452633] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=5
[  126.452638] finish_td: USB transaction error on TD 000000009ed82d11
[  126.452644] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.452652] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.453048] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.453057] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b010 (dma) in stream 0 URB 0000000046762d58
[  126.453067] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b020, cycle 1
[  126.453067]
[  126.453073] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.453078] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.453363] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b020
[  126.453373] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.453380] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.453388] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.456623] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.456632] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=6
[  126.456638] finish_td: USB transaction error on TD 000000009ed82d11
[  126.456644] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.456651] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.457048] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.457057] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b020 (dma) in stream 0 URB 0000000046762d58
[  126.457066] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b030, cycle 1
[  126.457066]
[  126.457072] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.457077] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.457361] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b030
[  126.457371] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.457378] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.457387] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.460623] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.460632] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=7
[  126.460638] finish_td: USB transaction error on TD 000000009ed82d11
[  126.460644] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.460652] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.461048] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.461057] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b030 (dma) in stream 0 URB 0000000046762d58
[  126.461067] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b040, cycle 1
[  126.461067]
[  126.461073] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.461078] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.461362] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b040
[  126.461372] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.461379] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.461387] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.461626] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 4 on endpoint
[  126.461636] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=2
[  126.461643] xhci-renesas-hcd ee000000.usb: Soft-reset ep 4, slot 1
[  126.461651] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.462067] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.464624] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.464633] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=8
[  126.464639] finish_td: USB transaction error on TD 000000009ed82d11
[  126.464645] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.464653] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.465045] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.465054] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b040 (dma) in stream 0 URB 0000000046762d58
[  126.465064] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b050, cycle 1
[  126.465064]
[  126.465070] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.465075] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.465361] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b050
[  126.465371] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.465377] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.465386] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.468620] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.468629] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=9
[  126.468635] finish_td: USB transaction error on TD 000000009ed82d11
[  126.468641] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.468649] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.469049] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.469058] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b050 (dma) in stream 0 URB 0000000046762d58
[  126.469068] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b060, cycle 1
[  126.469068]
[  126.469074] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.469079] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.469360] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b060
[  126.469370] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.469376] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.469384] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.472623] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.472632] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=10
[  126.472638] finish_td: USB transaction error on TD 000000009ed82d11
[  126.472644] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.472652] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.473049] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.473058] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b060 (dma) in stream 0 URB 0000000046762d58
[  126.473068] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b070, cycle 1
[  126.473068]
[  126.473074] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.473079] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.473363] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b070
[  126.473373] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.473380] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.473388] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.473625] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 4 on endpoint
[  126.473634] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=3
[  126.473641] xhci-renesas-hcd ee000000.usb: Soft-reset ep 4, slot 1
[  126.473649] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.474064] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.476623] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.476632] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=11
[  126.476638] finish_td: USB transaction error on TD 000000009ed82d11
[  126.476643] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.476651] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.477050] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.477060] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b070 (dma) in stream 0 URB 0000000046762d58
[  126.477070] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b080, cycle 1
[  126.477070]
[  126.477076] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.477081] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.477360] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b080
[  126.477370] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.477377] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.477385] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.480623] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.480632] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=12
[  126.480638] finish_td: USB transaction error on TD 000000009ed82d11
[  126.480644] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.480651] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.481051] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.481060] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b080 (dma) in stream 0 URB 0000000046762d58
[  126.481070] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b090, cycle 1
[  126.481070]
[  126.481076] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.481081] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.481293] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b090
[  126.481302] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.481309] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.481317] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.484540] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[  126.484552] process_bulk_intr_td: USB transaction error on TD 000000009ed82d11, err_count=13
[  126.484559] finish_td: USB transaction error on TD 000000009ed82d11
[  126.484566] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[  126.484575] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.484903] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.484911] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04b090 (dma) in stream 0 URB 0000000046762d58
[  126.484922] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04b0a0, cycle 1
[  126.484922]
[  126.484929] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.484934] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[  126.485159] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04b0a0
[  126.485168] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[  126.485174] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[  126.485184] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[  126.485544] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 4 on endpoint
[  126.485554] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=4
[  126.485559] finish_td: USB transaction error on TD 0000000038987fa4
[  126.485566] xhci-renesas-hcd ee000000.usb: Hard-reset ep 4, slot 1
[  126.485574] xhci-renesas-hcd ee000000.usb: // Ding dong!
[  126.485922] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[  126.485930] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b047000 (dma) in stream 0 URB 000000002edc85e8
[  126.485939] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b047010, cycle 1
...
...
...
[ 1251.703007] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.703011] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 000000002edc85e8 TD as cancel_status is 2
[ 1251.703253] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b047710
[ 1251.703259] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 000000002edc85e8 TD
[ 1251.703265] xhci-renesas-hcd ee000000.usb: Giveback URB 000000002edc85e8, len = 0, expected = 32, status = -71
[ 1251.703274] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[ 1251.703289] ch341-uart ttyUSB0: usb_serial_generic_read_bulk_callback - urb 0, len 0
[ 1251.703295] ch341-uart ttyUSB0: usb_serial_generic_read_bulk_callback - nonzero urb status: -71
[ 1251.703300] ch341-uart ttyUSB0: usb_serial_generic_submit_read_urb - urb 0
[ 1251.705611] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[ 1251.705626] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=273535
[ 1251.705633] finish_td: USB transaction error on TD 0000000038987fa4
[ 1251.705639] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[ 1251.705649] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.705971] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[ 1251.705977] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04bab0 (dma) in stream 0 URB 0000000046762d58
[ 1251.705986] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04bac0, cycle 1
[ 1251.705986]
[ 1251.705991] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.705995] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[ 1251.706227] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04bac0
[ 1251.706233] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[ 1251.706239] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[ 1251.706249] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[ 1251.709611] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[ 1251.709626] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=273536
[ 1251.709632] finish_td: USB transaction error on TD 0000000038987fa4
[ 1251.709638] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[ 1251.709648] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.709972] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[ 1251.709979] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04bac0 (dma) in stream 0 URB 0000000046762d58
[ 1251.709987] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04bad0, cycle 1
[ 1251.709987]
[ 1251.709992] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.709997] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[ 1251.710226] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04bad0
[ 1251.710233] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[ 1251.710239] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[ 1251.710250] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[ 1251.713611] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[ 1251.713626] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=273537
[ 1251.713633] finish_td: USB transaction error on TD 0000000038987fa4
[ 1251.713639] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[ 1251.713649] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.713971] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[ 1251.713977] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04bad0 (dma) in stream 0 URB 0000000046762d58
[ 1251.713986] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04bae0, cycle 1
[ 1251.713986]
[ 1251.713992] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.713996] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 0000000046762d58 TD as cancel_status is 2
[ 1251.714227] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b04bae0
[ 1251.714233] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 0000000046762d58 TD
[ 1251.714240] xhci-renesas-hcd ee000000.usb: Giveback URB 0000000046762d58, len = 0, expected = 8, status = -71
[ 1251.714251] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[ 1251.714613] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 4 on endpoint
[ 1251.714620] process_bulk_intr_td: USB transaction error on TD 00000000ed91d91d, err_count=99057
[ 1251.714626] finish_td: USB transaction error on TD 00000000ed91d91d
[ 1251.714631] xhci-renesas-hcd ee000000.usb: Hard-reset ep 4, slot 1
[ 1251.714638] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.714986] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[ 1251.714992] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b047710 (dma) in stream 0 URB 000000009ef56dc1
[ 1251.715001] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b047720, cycle 1
[ 1251.715001]
[ 1251.715006] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.715011] xhci-renesas-hcd ee000000.usb: xhci_giveback_invalidated_tds: Keep cancelled URB 000000009ef56dc1 TD as cancel_status is 2
[ 1251.715252] xhci-renesas-hcd ee000000.usb: Successful Set TR Deq Ptr cmd, deq = @4b047720
[ 1251.715259] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: Giveback cancelled URB 000000009ef56dc1 TD
[ 1251.715265] xhci-renesas-hcd ee000000.usb: Giveback URB 000000009ef56dc1, len = 0, expected = 32, status = -71
[ 1251.715274] xhci-renesas-hcd ee000000.usb: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[ 1251.715291] ch341-uart ttyUSB0: usb_serial_generic_read_bulk_callback - urb 1, len 0
[ 1251.715298] ch341-uart ttyUSB0: usb_serial_generic_read_bulk_callback - nonzero urb status: -71
[ 1251.715303] ch341-uart ttyUSB0: usb_serial_generic_submit_read_urb - urb 1
[ 1251.717610] xhci-renesas-hcd ee000000.usb: Transfer error for slot 1 ep 2 on endpoint
[ 1251.717622] process_bulk_intr_td: USB transaction error on TD 0000000038987fa4, err_count=273538
[ 1251.717628] finish_td: USB transaction error on TD 0000000038987fa4
[ 1251.717635] xhci-renesas-hcd ee000000.usb: Hard-reset ep 2, slot 1
[ 1251.717644] xhci-renesas-hcd ee000000.usb: // Ding dong!
[ 1251.717972] xhci-renesas-hcd ee000000.usb: Ignoring reset ep completion code of 1
[ 1251.717979] xhci-renesas-hcd ee000000.usb: Removing canceled TD starting at 0x4b04bae0 (dma) in stream 0 URB 0000000046762d58
[ 1251.717988] xhci-renesas-hcd ee000000.usb: Set TR Deq ptr 0x4b04baf0, cycle 1
...
...
...

Best Regards,
Guan Wang

