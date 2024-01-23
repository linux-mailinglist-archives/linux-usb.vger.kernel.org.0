Return-Path: <linux-usb+bounces-5398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F7838B9D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 11:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0A42885AA
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 10:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DD95A780;
	Tue, 23 Jan 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSfSfEZi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E159B5B
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706005358; cv=none; b=XA+TIoGrE4zZ+RmcR9qi1XiKxicfn+qZap91+IrTTGv9IhQF9F4yLTOVL7X2YcMSYE5H6sr+gmLpy9/MJpp6/Tu0OPjtA4sLeIK2nBUaWAOVxsoHp+cEHA9V08Z+482DfTGKAC4bB0h+5foqmi8P3gtB029XtTtQpr/gmkRd/yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706005358; c=relaxed/simple;
	bh=1+3AMWPNRTR/WNNHs4A6JjspnAIWExpadkFW32p+7b4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HxSGLByDQ2Oivrfvzp7JDvQbqC9txy5/erPtU7jUpOFFn8s3+WRqqadwo6EERorAQZ1p+DZHf8ZU+Wq9VSC5rjJJY2xGq6FBYBQgDd2BvOsNNbr5kJPhdMqyLdWg5Wg/4r9Bya6i7utuHF9SGk7oNpqNRXZG/FRTv0iO/H42QDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSfSfEZi; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a539d205aso4409802a12.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 02:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706005355; x=1706610155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K4pL+PuGKgJlhrW8Qy1g6fxEnVtUoUbkRxs9LJDf/wY=;
        b=NSfSfEZi3R+tR0JnFZEJ1lcx8Gc+eJymSf2pqenDooo1uMo4cD9T5iBzIxgf+RsIgP
         s+l/2YtFp4bb6ps07WGEihw2Adrd1a9n/VO3OE983vcOImKq43trW3Q3Rj+MlzKz1zf/
         F6+rs9A1Y97Kv816BOr5YXhzuzDlXnwOOownzLEN+/9k2sSMeacGtFkbChSQlJFKZiAl
         cOD9W0qR3JuyS01A1x0nqHqIjLh62Q/ZIcZJ1HAr25lX00QaLXYR4ROo34gg7hsMHDYP
         ANonUnI1qa2fjl0vSkmfYsu3FLbmZw/yLNVEIPLlHYmdF+lcfHBMf3fR/t8gfLs5M+dY
         uH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706005355; x=1706610155;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4pL+PuGKgJlhrW8Qy1g6fxEnVtUoUbkRxs9LJDf/wY=;
        b=T73uRkCtS1AwmpGmTIpHCU9tx3X9i2XgAO+PzB+o8+el9Jj7d0Kv1hkedZTXD7eDcW
         T67FsidiYLWtuz3zM4nSsac8veCIWtBLuesLBG4hBGavL0K/bZBDbF7/cP55E8wp+lMa
         IKlY1GYwD/gJOzL9rlhtPS/uhOjY37R6fnYDJj/jZy3mNoliiPpgupcYZijrHAkgBjRQ
         RndgCbBPXqUj8V4MYkkMUxX6YQOXwvkBCe/YDSPU7E8HRpZg+QEANd0Sb5cGXcQGkW/p
         w9btXiSnDOzeSrPPHgB4HOXMbDov2GZH+9cSr5dAsr7MMPfHx5Rtg2ePkDWjXSDg7K61
         WeTA==
X-Gm-Message-State: AOJu0YzFX44gmkEiiHQX4AmGyVt9rg1PEcp7fq2ZBSpmgDrESEn+XKxe
	Dod6Lcacqxg1+URZFK2fcUsHdKkaZNtRCcOvx5Xs2hQLP9Z4C3HG
X-Google-Smtp-Source: AGHT+IHvwqNAaz2s5OiD5tDsG72xzlcjdkM8dMVqMuMpGRONiWLN6gx2UIACZ2hKml1LA6+c6dVbeQ==
X-Received: by 2002:aa7:c398:0:b0:559:da2d:c24a with SMTP id k24-20020aa7c398000000b00559da2dc24amr762281edq.48.1706005354582;
        Tue, 23 Jan 2024 02:22:34 -0800 (PST)
Received: from foxbook (acgj208.neoplus.adsl.tpnet.pl. [83.9.237.208])
        by smtp.gmail.com with ESMTPSA id a5-20020a50ff05000000b0055bff4843casm3454607edu.49.2024.01.23.02.22.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2024 02:22:34 -0800 (PST)
Date: Tue, 23 Jan 2024 11:22:30 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [RFC PATCH] xhci: fix matching completion events with TDs
Message-ID: <20240123112230.4d9e1ef0@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A trb_in_td() call is used to determine if a completion event matches
one of the TRBs of the currently executing TD. This function is given
ep_ring->deq_seg and ep_ring->dequeue as the starting point to search,
but these have been observed to be out of sync with td->start_seg and
td->first_trb of the current TD under some circumstances when the EP
is being stopped.

Consequently, spurious completion events have been observed to become
erroneously associated with an unrelated pending TD.

Since the ring is being searched for the specific purpose of finding
a match with current TD, always start from current TD's first TRB.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Questions:

Is this a good idea? Is it useful? Or am I missing something?

Should a diagnostic be emitted when these pointers don't match? Or when
they don't match AND something else is also wrong?

And yes, I am observing unexpected completion events when stopping an
isochronous endpoint on NEC uPD720200. They used to retire the current
TD and "TRB not in TD" appeared when its true completion arrived, now
they correctly give "TRB not in TD" right away. I consider it progress,
though the origin of spurious completions is still unknown.


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

