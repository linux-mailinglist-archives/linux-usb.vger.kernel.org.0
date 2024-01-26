Return-Path: <linux-usb+bounces-5528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499083D7E5
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 11:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADEA31C2DDE6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 10:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FCD59B4D;
	Fri, 26 Jan 2024 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln3JYH2d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25571B96E
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263208; cv=none; b=XaOs67f2X1zI8ahxiX2WhWwCYD/TCd5svM7AFucBy/B1xF2y+vjSIyALpJ1z8eoDosInd3PUAxI0BmSxSgSgJpq9lt0OhdlFajRAKToPBMRtr57VQxWcjCnWaukXXzEQoRsZ0VMl03CSZ/xjGd1ZLxi+9eeuseGSU58bTXijs5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263208; c=relaxed/simple;
	bh=w3cuBIRG0gag3KNzvgfWy5ClFnn6Mt0X3BnQmdaDak4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uvEvqN/1dSAh3g9ajVvx2vXRGJGXrFNTXqXuhiTxU45mH/T9kc2+DsO39/ND7IjaylLYSHTboheKdDgy6gtgcMP1X6IcohuisquRccdk3CCEmlZ1BRaDrKCubJbwAt1eYlwr+jez0OEQMvbn8wjProOjSBsFVwp6Eaty4+5ukDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln3JYH2d; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3367a304091so279645f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 02:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706263205; x=1706868005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZWsg3fjtkWAq8pT/5KlOGrb3pGIXgRI4K61Dpb90N4=;
        b=Ln3JYH2dMYWNoioCvYl+XrWSlHUYLDbmd/q0dv+36x9tStDzB3fZtDQTt426hz0IHt
         74MhpIo+TnBK0G41VREp06o04xCRMzfKrevbPTPs8LD0uVqBhu0p4ghuiNw/Wm26zATi
         h2RIqtJo+yGWHnVgkxg1NqYd1ABNUlcTKfrdwiX/SIxmSTnsFwwt+U9Bl3WGHQHdUqML
         k1m2M4OnXQxXVURx/uvc61PvvNBGRPOfkQrlGIIiNYkNl07VuZfIwKghtvcteS8NbxWK
         fJXAAlJR2U4okXBS+4PqrGPgSgg2NURztNEqDOvhsDqX0SP9t0FjfAftrYg1utnr+Ai6
         +iRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263205; x=1706868005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZWsg3fjtkWAq8pT/5KlOGrb3pGIXgRI4K61Dpb90N4=;
        b=jt8ZCpEudfn8uCkycOLowLQjubYZqsMVBenVclUKPN8mPl8ExT+wWy1ykATFI2gBrB
         aOr8MMOho0JLxVjsw5RyVltFoVdBi0qE7EwJYb/kFxttkhpUf2zxl4TGZ1dU328ItkEn
         LGZorwos12HJVSTNcr71hykGTjKOkHQGugWAx40SgphuNDl33hgfoTbJcFiDkGBqHW5H
         c7s+EJiMQ1dxq1wll59R9FlRrHp9iaONYkP7aUE580HaOZRQukT++BMnaAR/dysfFqsF
         uaOqcxnj7VxuIfEmyXCTWUdLX5MhHHNQZbZ9Js1XhQOuAfH3qVf2xIlnv0unGCiCMZaV
         aCsA==
X-Gm-Message-State: AOJu0YwRaYudmKu4u07ZfV3mwi5yI40Xl4Un9YsFuN1n9syTQCBpU8n9
	KTyLz8Qq1913ZNwjHUZqWL4JUaLp+S8l7AkFkm9tkfYe1/UwuNms
X-Google-Smtp-Source: AGHT+IG7x1HmlUMnamZM/+DE0Uj//NRJsE8CC68A3EHExLaSY8bNyO224adQ+7BF3k/P34vssbqTow==
X-Received: by 2002:adf:db10:0:b0:337:bfe1:16f3 with SMTP id s16-20020adfdb10000000b00337bfe116f3mr468441wri.13.1706263204947;
        Fri, 26 Jan 2024 02:00:04 -0800 (PST)
Received: from foxbook (bgu182.neoplus.adsl.tpnet.pl. [83.28.84.182])
        by smtp.gmail.com with ESMTPSA id jp15-20020a170906f74f00b00a2fde3a8097sm450253ejb.74.2024.01.26.02.00.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2024 02:00:04 -0800 (PST)
Date: Fri, 26 Jan 2024 10:59:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v2] xhci: fix matching completion events with TDs
Message-ID: <20240126105959.28d7848b@foxbook>
In-Reply-To: <20240123112230.4d9e1ef0@foxbook>
References: <20240123112230.4d9e1ef0@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A trb_in_td() call is used to determine if a completion event matches
any TRB of the currently executing TD. This function is told to start
searching right after the last finished TD, which is not at all where
the currently expected TD is guaranteed to begin, because some TDs in
between may have been cancelled.

Not only is a pointless work performed, but a bug resulting in the HC
executing cancelled TDs was seen to trick the driver into associating
events from a TD just cancelled with an unrelated future TD.

Since the ring is being traversed for the specific purpose of finding
a match with the current TD, always start from its first TRB. This is
the most reliable bit of information that we posses.

Tracking of HC's work progress is not affected, except for cases when
a misattributed event would have moved dequeue past a pending TD.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

v2: improved commit message based on new findings

I am now fairly convinced that this is indeed a good idea. Otherwise,
certain event abnormalities develop into several further failures:
- completion of TDs not yet completed can be reported to the core
- ... which may conceivably lead even to DMA-after-free
- ring->dequeue is progressed past a TD not yet released by hardware
- diagnostics are printed only on a later, actually correct event


 drivers/usb/host/xhci-ring.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9673354d70d5..d9be5023abe6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2809,7 +2809,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			td_num--;
 
 		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(xhci, ep_ring->deq_seg, ep_ring->dequeue,
+		ep_seg = trb_in_td(xhci, td->start_seg, td->first_trb,
 				td->last_trb, ep_trb_dma, false);
 
 		/*
@@ -2877,9 +2877,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					"part of current TD ep_index %d "
 					"comp_code %u\n", ep_index,
 					trb_comp_code);
-				trb_in_td(xhci, ep_ring->deq_seg,
-					  ep_ring->dequeue, td->last_trb,
-					  ep_trb_dma, true);
+				trb_in_td(xhci, td->start_seg, td->first_trb,
+					  td->last_trb, ep_trb_dma, true);
 				return -ESHUTDOWN;
 			}
 		}
-- 
2.43.0

