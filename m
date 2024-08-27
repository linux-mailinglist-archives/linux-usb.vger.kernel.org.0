Return-Path: <linux-usb+bounces-14196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F37961607
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119281F23296
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D751D174E;
	Tue, 27 Aug 2024 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNrfi0Ut"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BB1CFEBC
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781260; cv=none; b=Flsn4+Eby1YGDHQI2LCBRlYXvfVCMouWa9W/kdpqdLurb82ocqJKoO+pMEYDX6zxRo49bgwrWDzoigryX6Izvw04PXT4IxoenAO3a971t+h0IUPoO+21bXHtcq0Btexvmv9vqHHY7aQx1HDhzxaNP6yhRN5vX/4GceC2aU3tCEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781260; c=relaxed/simple;
	bh=lgA9DGxoPPKLn64ZG/9dGB7kFf1Wi67NHRBaC0D+st4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uC7EV3mTYqcvNT7n/gYrgT8ZrfmZN7dQSNIPwLUAXQe3VI6IT8bBnztQ3mRXaLoTlYRpqdBcgV5zU2d6gju27ZVUAduP5ouRZUZ36pI/YYX2DFgsUbp34CnaXFyxqSD/xDv4BF0h/EtGdCq9+/cwILVdbotoefuul7AN4mrClfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNrfi0Ut; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533521cd1c3so6682893e87.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781257; x=1725386057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FJnR96/FCs/s6YIt57QA4Eo8HE54w5Rgc1hfOw05tc=;
        b=bNrfi0Ut9uh6nGpX800eNcxNtBqM6I9n+r8TqTeDBeuG4YW74bKiA5QV6surOzZM0z
         g6GYP5CpMRcABZcw/bZPavAOEnyJXPMUEYURis7+JBxd/ihMA/ndXfDEVCUFiJ43R2Mm
         q7086X2jx6FnXosQ4C7qDhuyXBbHHc9h82j8A2CrFNeNKomLAkVyAhlHa+9eiL7wMR//
         oTk53rkfz3XW6cIYFavu0eQsHtrLXkSmfaYgImMI67kvniNWHlXpBcB54gbxLFXpAphn
         eA3eLVSmrZLB8mlkujd+UVvrGCpnIfKkhqY5xoEAaOatK3nQ/IDdb+tZWx94H3+crUyD
         Zs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781257; x=1725386057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FJnR96/FCs/s6YIt57QA4Eo8HE54w5Rgc1hfOw05tc=;
        b=XRJ6sNECKkUAcioC5aHGLaQ9HflT0fPhwAnVfncLEYflVrM6JbBv9D13b+oahlyI8W
         vNkL+d9FdifYsjDk2U+emeKg1LiG9W813cEGROAEsXoBlPBoCqCS5rkDzUfLaO5DHjDU
         EY9UkZLLKAt0HVwM0LQXT0pUMmgDviBg1n0IS0u7vUodTA4Qw24qCB7ulhlnjk41nfcu
         Wb22ZY3kx6ytyewg7bgg9+250xIoFHYOYbA/dPG0qCwZvVQLSc9PESD+FzjfWuU8Nohb
         5whe094eyrWDM5qUrJFeJTb69pcoDniJr2LSl6WoMansZ+ooOHZqTVu3b6i3hz5kCAIS
         sPag==
X-Gm-Message-State: AOJu0Yy3WC832LTqWgio9fbbhvjkSXXBfHkx8R3PDbFNkiZi6tu6cbUu
	VBb8aWZZMGcV5xWDuqSGnAUj3M0syqhxPkwh7RNaWxSwtsrWDeVn
X-Google-Smtp-Source: AGHT+IF4gSUQCSpa8ixavG799n8aWyEjxSqai6C2JijMvc2iVifKk75LSM5kM0Lpe1ErPwD3FmpHBA==
X-Received: by 2002:a05:6512:220f:b0:533:4676:c225 with SMTP id 2adb3069b0e04-5343887e15amr12849577e87.41.1724781257126;
        Tue, 27 Aug 2024 10:54:17 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea3630bsm1861104e87.68.2024.08.27.10.54.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:54:16 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:54:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 8/9] usb: xhci: Print completion code in the empty ring
 warning
Message-ID: <20240827195414.057e09dd@foxbook>
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

This gives a better picture of what was happening when the ring
was found unexpectedly empty.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 58e6d0280e00..9d1af76955cd 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2789,10 +2789,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			if (!(trb_comp_code == COMP_STOPPED ||
 			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
 			      (trb_comp_code == COMP_SUCCESS && ep_ring->last_td_was_short) ||
 			      (trb_comp_code == COMP_SHORT_PACKET && ep_ring->last_td_was_short))) {
-				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
-					  slot_id, ep_index);
+				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d comp_code %d with no TDs queued?\n",
+					  slot_id, ep_index, trb_comp_code);
 			}
 			if (ep->skip) {
 				ep->skip = false;
 				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
-- 
2.43.0


