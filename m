Return-Path: <linux-usb+bounces-5529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81483D852
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 11:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D229A1C25AD3
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 10:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467A210A3F;
	Fri, 26 Jan 2024 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGibNPW6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E7125DD
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706265476; cv=none; b=sBTkzY2cy3zZ8MjY0kt8w1PUrMd865WamIuLEwgXG3O+0RcfcOIeBh/NO8Mw1v3yfJpfFPTDoujAvEtrSGnecrxjhW+Fdp1cxGhQ432I4+faAIdgMVH0YE0b1cPPjU38w1OeI1XgvcdQfMkkcUi2G4NQVTag3NHt/PHIdRo3IHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706265476; c=relaxed/simple;
	bh=vmxhAJs3VRTcROtPYUShwH96nV2J6Rhg2Od0/WJqAMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jVajplw3gF69M/JDrxS0975z7Rb14J7xsvRPJI/T69VRgWEGo/TEKHiIiUB+ZB7KhtJpDLvCrmqJzm44ZxlxlwXrUWeUAqzMTOWnrl7938yU53SeralOFfyQyD8w987yxHwPkTrZWSgSkPI9lXhDRRrRFMVVSeXtQSzApbMj9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGibNPW6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a350a021120so15797966b.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 02:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706265468; x=1706870268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffnMR5srb6CFL15JGQcLBEoZsOJ8X9PNpgByQaqHXOQ=;
        b=AGibNPW6SgG1nr+CdwzKJhbTEEkX9GdQjNp2YdL0GJOBZ/xPyg6aCDuT/rpE7RMwDK
         OVepBTHDHqjZF9jh1wWvJccs4h3WXS/Re3PCkDrtOVKGxfwtMy6p97UA/AC6bs5So9Nq
         QznPs9qU2sXKAWYw/uuDOikWM82uR/YJCs3yVsIedz5FYkh5ZW+CV6RDWikY4P/EjhxS
         QM3mMkppBX5m4CKJXtcjDkd1J4e5gKhVS6w9QBTIHP1QpYI7gb8D7nrP47URp6GhuRPv
         KXUnBBt0SC4fra9KAYNfynxi/JccAstgx4N/BrB8VLIrHESY5oKt5DDDryKNZAYeh7CH
         mt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706265468; x=1706870268;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffnMR5srb6CFL15JGQcLBEoZsOJ8X9PNpgByQaqHXOQ=;
        b=it7CTbZUqzE2jm2grfLKK1vqxFTGPPMuwMxP2nhmsoGgPH3Of2cRj+SKeFC53N0y7I
         tipcHqmONXJZV5YjeWAY+EJ827Lo0nqRK0nlXNcm0QvAOAAQ0xXJPzV6ZGkGu2sr5k9g
         b41ybeNtju9hqTwiGd9Jg2Ewh1V+AR5PlURgr4KMqvc1j6QKY8cLztNK8TVHlrgSJViy
         Sd9ZVFN/WdzozSh7TGgLf1sIFyW3tl65SbrWbSPX5L0q+Tdkt11gW++mlzj2nGAnij+A
         B1ScfFiFfhS5uvKcnRbI2WZOTMyHztWr3IpBgCCf+AhIDpK4HIKtAUmFEnClxdFO4+nA
         7cbQ==
X-Gm-Message-State: AOJu0YyHa/K8IA44vV5Mweq/zKQDFr3bSgXDNhiszeTFYIXLlHQSkou0
	IUSIfpVAT7+jcENZOtzVtE3bmzR+3DFLC7zv/2vNtzteJawXw6cpmLIjk8Hs
X-Google-Smtp-Source: AGHT+IHBfwuWvJHDjbbt1PEpNIpTZZZGZiB6AdESolxbzq8/y2VB8xjwk5ljewDwKA9X4fKV0Y/C7g==
X-Received: by 2002:a17:906:19db:b0:a31:7aca:a429 with SMTP id h27-20020a17090619db00b00a317acaa429mr540372ejd.4.1706265467762;
        Fri, 26 Jan 2024 02:37:47 -0800 (PST)
Received: from foxbook (bgu182.neoplus.adsl.tpnet.pl. [83.28.84.182])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709064a8a00b00a312e32c4a3sm480027eju.221.2024.01.26.02.37.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2024 02:37:47 -0800 (PST)
Date: Fri, 26 Jan 2024 11:37:44 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] xhci: retry Stop Endpoint on buggy NEC controllers
Message-ID: <20240126113744.7671c52d@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Two NEC uPD720200 adapters have been observed to randomly misbehave:
a Stop Endpoint command fails with Context Error, the Output Context
indicates Stopped state, and the endpoint keeps running. Very often,
Set TR Dequeue Pointer is seen to fail next with Context Error too,
in addition to problems from unexpectedly completed cancelled work.

The pathology is common on fast running isoc endpoints like uvcvideo,
but has also been reproduced on a full-speed bulk endpoint of pl2303.
It seems all EPs are affected, with risk proportional to their load.

Reproduction involves receiving any kind of stream and closing it to
make the device driver cancel URBs already queued in advance.

Deal with it by retrying the command like in the Running state.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

This should be my last patch for NEC eccentricities since everything is
working smoothly now. I may or may not find something interesting on the
VL805. It still crashes sometimes for no obvious reason, needing reboot.

I thought it would be prudent to trigger this on uPD720200 only, hell
knows what bugs other controllers have. Note that the NEC quirk applies
to this specific chip only - its successors have vendor ID of Renesas.

I feel a little dirty retrying something with no obvious stop condition;
is there anything that prevents this from trying forever if things go
really wrong? Same question for the "running" case. I figure a counter
could be easily added for both, if necessary.

I typically see 1 to 3 retries before the command succeeds.

[  +0,000008] usb 9-2: Selecting alternate setting 9 (20480 B/frame bandwidth)
[  +0,005639] usb 9-2: Allocated 5 URB buffers of 32x20480 bytes each
[  +0,292400] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000051] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000109] xhci_hcd 0000:02:00.0: It worked!
[  +0,000087] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000047] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000117] xhci_hcd 0000:02:00.0: It worked!
[  +0,000040] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000040] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000045] xhci_hcd 0000:02:00.0: Retrying STOP on buggy NEC
[  +0,000123] xhci_hcd 0000:02:00.0: It worked!



 drivers/usb/host/xhci-ring.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9673354d70d5..7edd655cb6b4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1147,6 +1147,15 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 				break;
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 			return;
+		case EP_STATE_STOPPED:
+			/*
+			 * NEC uPD720200 sometimes sets this state and fails with
+			 * Context Error while continuing to process TRBs.
+			 * Be conservative and trust EP_CTX_STATE on other chips.
+			 */
+			if (!(xhci->quirks & XHCI_NEC_HOST))
+				break;
+			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
-- 
2.43.0

