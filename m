Return-Path: <linux-usb+bounces-29378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CABBE4947
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 18:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 62A8D4EE777
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 16:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD45B2E2DF4;
	Thu, 16 Oct 2025 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUrEno1f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28832D0E1
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632101; cv=none; b=KosBQeAUigIA74NG5kcEZaH8YIA8jzZ2m1RnZJJSEK7xfydob6xGqUGS3V7K7iFFL6+1ZaUxFodXatrsj9QgVTXrhGIIoITCz7sq0cvTtrZarALy7LlFLBUWx9tYR0FNajChH1Ab7z2xKKTk+pTGGpE0Z7QBndN+N0ffHXWIMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632101; c=relaxed/simple;
	bh=meGSvo83bG/NgH1eFgQhP6mPo1S2SQAlpXZ3KoB0rBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ODg+WzKY8SWAIjD2YCvlI58d/OaMbxgzzu+meNRjQ1I+cQ+sIDKKN1GGr5DU/5hxmUYTV0FKGSP6zbPm2z7JGLQZdwI13gAPUno1va8Fb003P1McFARDnhye4eItwd4yfk+RJJ4caPWdUlVmZms8Cq3gtHFBMhZflX9LdBGVPro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUrEno1f; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so2003679a12.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 09:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760632098; x=1761236898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdboLAzTskrjae4eiT/OIfkDxQ2xcmShr3Pp4Denv80=;
        b=lUrEno1f9wFV+zq31arrFHExmxhxhjDVMjwPhJV9YDHuJeuw09ySXnlhLc+pgFZsb7
         I6tK5rApH4BiuhNlFmUtWF4vU2FhVH/TqUbcOi0+aqxBKynOXcdFXttfAL9vE68YXrOH
         YbLbDkz6p2+TJk9xsTThtmDL9Hf6SvbY31TNqveBJhtLVkT2kWO2mSkW0S0NGttcx7TT
         d6MdGD96yovQ411IjBmVAAeWaW1NI1FyEZ8ZxC7DVPTLhHigPGo/3Uhss5Mv5wbH4PAK
         OyUp/JtsrIhvORbBHh4FDJ9P4CtGdod2MWuekYX2ymZGz0raWOiGwwnPPiU7QVDL04bq
         0Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760632098; x=1761236898;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdboLAzTskrjae4eiT/OIfkDxQ2xcmShr3Pp4Denv80=;
        b=C543VtyMed1hyPAZlmbY8XAK5498CwXkfP41fNYLZXZNjRtzVRUoeX8aoDBza9fo+c
         MUomn/ehocchsPYwEGX/6GvDWprY/ifH3ojbqlweN+Jvuc25EkkDLy8biOWrjCy/dp/Z
         +vAttSn4qY1kEHOAjq2pXpJ/ApPhRG8pdJtnzWUknu9nkAbFhURS7hIZFLNDgZ/dkFpv
         +4LNdfGJb6ZHLRb0475vAMAIGampkAJbL1q8SGUE7VfkSgYG1WWUQINdBlkYe2Gb+k3e
         Yp7KSqzOs1CNcQPbOJ+Zkfv5S14ejXddxsXKJjE9jbvtVSrdSHqScYg9fiGrmermkCaq
         NIfA==
X-Gm-Message-State: AOJu0Yze5jriZGp0Xp68SzDQG9q7yG1TbC0F+QKA8oYy/huTJSscXeJk
	YBPknFWiBz486AB0yspCKt83Tvrz92Auhs8F98QOntj9xl+o3O9Egnj6iDRjeg==
X-Gm-Gg: ASbGncvoQ+4CbPZtg5lR1uz83Bm0Sb6UeV8ESf0SUHhrWjPE+/I7uYP52PHzOG7Yv5W
	fw5nJ04NbgMnkVjEAHAJsRXD3X3zmnw9I7EZo0D7zDwCavD3gssI6CDsH7VFCJ1H5zFWAGHYRLo
	rlZdhfDpRqardKYVnY9DPOHgii4OOqNz1PpimsOm8VC2IQ7jWg+y2SVebys2/y6mmFM2qOY4wbK
	BxWSJIBtjJv4/rt5oDqEx5wnC6B08CryK4BkXzOZaGRC7wEAEZCiUaAWIFl1GgFHm/kXHnKVPcQ
	oRV4fQ0mDVkoWBQpgSpt9G7YYMMjf3LMbec1VfasCNXXLAp9QbsLYMue7JVVGahwFjHJCBWexqh
	l1YF04KgPN0caK9VaYizn55uWlc3XcH7lkKvgbZMZcnmUX3hbKCqHEkCDZMJg0rwpImaRbkz7HD
	X3hTUs6r+49htURmcnwjrUhXFFLb0=
X-Google-Smtp-Source: AGHT+IFkesBBmGrxbOhWiH0VCGaQxymq8uVdnn+1XAd1sMn+v+QIXeaDW2R29/rjoB8bmqXuf9pC7w==
X-Received: by 2002:a05:6402:5c8:b0:63c:1170:656a with SMTP id 4fb4d7f45d1cf-63c1f6d6428mr444251a12.37.1760632097713;
        Thu, 16 Oct 2025 09:28:17 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f860sm16416411a12.15.2025.10.16.09.28.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 16 Oct 2025 09:28:17 -0700 (PDT)
Date: Thu, 16 Oct 2025 18:28:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usb: xhci: Fix a format bug
Message-ID: <20251016182813.3d10a8a3.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The width of 'addr' depends on kernel configuration and gibberish is
printed in traces and dynamic debug on some 32 bit systems like ARM:

  Removing canceled TD starting at 0xf9c96eb0 (dma) in stream 0 URB 54e247b5
  Set TR Deq ptr 0x205400000000000, cycle 0

  Successful Set TR Deq Ptr cmd, deq = @f9c96ef0

Fix it by casting to 64 bits. No effect on unaffected systems.
Remove the newline which casuses an empty line to appear next.

Fixes: d1dbfb942c33 ("xhci: introduce a new move_dequeue_past_td() function to replace old code.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c7f658d446cd..6d799a5a062d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -776,7 +776,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	ep->queued_deq_ptr = new_deq;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-		       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
+		       "Set TR Deq ptr 0x%llx, cycle %u", (u64) addr, new_cycle);
 
 	/* Stop the TD queueing code from ringing the doorbell until
 	 * this command completes.  The HC won't set the dequeue pointer
-- 
2.48.1

