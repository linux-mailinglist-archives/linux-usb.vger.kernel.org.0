Return-Path: <linux-usb+bounces-14189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D95559615C0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17C6B1C23280
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D281CE6F9;
	Tue, 27 Aug 2024 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bftXrIaq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9745126F1E
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724780874; cv=none; b=oy8j0Acp8iAl2JrCueu/bwxyGbS4YQFsiXFR30bUbj3tHk8Xn6hrZJWgQjt45bwbN9pHwlNHH5kkLDtOOrb21rchKlR3XiG6bwSKsN6IEoMW8estkqgbfqJVgt9VnssodOyXoWXiyly6KxPjEL0l7DPV3s7AM6tEQBsBf6ANepQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724780874; c=relaxed/simple;
	bh=R9VtU7sUrvULGTa/fT9R1zipBdrOY2kn7d26z1twkO4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgWMbThheZ3NIxRZgeIppkEybrE6mKaJik/Rhbgc9qCDXe2rOpjsElKW7U2XtawN9ZCl1l1mw4h61ir0Y9ZL5Fwx7BqKD8jPVg4xh667xc0sK80/AQ2mxKZTfXMQLrRCo9ngz+voxj5dHc6nK1HD3C0UYA248OxITkH5Mh4PPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bftXrIaq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f50966c448so33242991fa.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724780871; x=1725385671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcK2DE6OvHJg2Aa3M6TjPuN4vHu2Shd9E4BSp/NGuwY=;
        b=bftXrIaq0BhU5kz2V2Gi7lsR1Z5dlNQXY3/7gSPu1pHH7aJDXYmyIKlmZvvrDmxBDv
         7CY6vzXRRXECZ4tLy0ETkBkoTmY5WncQ9Gd1CguK7uwBJiyovHLTRs5XPRlPyQ72Gvz2
         tv0GfxyB6kQie87CBPPRLJZLqkm3Y0H9u5pPU1fyKWqFE5RyWGgNeetki5OjLDqly0+D
         x7cjBkLFC1/FNhZLGBAVdRwuNOVW7OhDwiG6ncK6nM48mJkpIT5kYsmGtiScl+QBkhR7
         VeQ79IcLmF60k0OEnMAvtIpMWflVsg3+Gg87KUFQ+lA5rTLJPBhvAhPkFf/TG87ffE/w
         Xc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724780871; x=1725385671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcK2DE6OvHJg2Aa3M6TjPuN4vHu2Shd9E4BSp/NGuwY=;
        b=YTNWD6gBoyX6Tgr2JbKlch56IaEdy2fEGLOwtEjdCzI+DJpzuMuex50X0sVLD2DKtf
         wqAusxtTATXRDeNjjBt/8HM3aUEWCKXOjTZ1stbx2oaX2ykvnJ9hzUcDRy3blIXuVt8p
         FTooq9QeR11bo6FFvsnu9wcjp9uVT2Cs8DIQAXRvPo7HOkqACQ6Dw8BFo9Aw1XmgKW4W
         HU/Ql6/iM4Fhx97bJkkBi1XPMpKs0u9jFzE/GTDRTvXG2oVEhBUXqY6nw/PglKXk1yJe
         wNaopHunuPHRtJKyg/Bl2SqE4ZxLGGjzr5G8g80BSO/RqLnmu1X8I6a55ASoHxe+hKbQ
         oGEQ==
X-Gm-Message-State: AOJu0YywhaAjC9ReQljl1rxmwSKm3YbM/yaT8i23N1X01l6cqHNdPpaW
	H7NhLXd4c4vYCgKtZR2J+ESjYnTzJpkpiEDVqbDF8RBnOqhlzjyi
X-Google-Smtp-Source: AGHT+IFHX5AGo7DqA8jJH6SBKXHFlwrUFA0ovJYb5LLANHWzMJFgK9zGyRA4Di9PDrG9K0u9M03dOg==
X-Received: by 2002:a05:651c:198d:b0:2f0:1a8f:4cd2 with SMTP id 38308e7fff4ca-2f514b92e5cmr34992831fa.33.1724780870679;
        Tue, 27 Aug 2024 10:47:50 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047c6741sm16633421fa.50.2024.08.27.10.47.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:47:50 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:47:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 1/9] usb: xhci: Fix double newline in a debug message
Message-ID: <20240827194747.42142227@foxbook>
In-Reply-To: <20240827194625.61be5733@foxbook>
References: <20240827194625.61be5733@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xhci_dbg_trace() appends a newline to the format string,
don't call it with a newline terminated string.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..e960609dcf51 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -723,9 +723,9 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	ep->queued_deq_seg = new_seg;
 	ep->queued_deq_ptr = new_deq;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-		       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
+		       "Set TR Deq ptr 0x%llx, cycle %u", addr, new_cycle);
 
 	/* Stop the TD queueing code from ringing the doorbell until
 	 * this command completes.  The HC won't set the dequeue pointer
 	 * if the ring is running, and ringing the doorbell starts the
-- 
2.43.0


