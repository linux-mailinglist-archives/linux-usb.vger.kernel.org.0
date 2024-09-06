Return-Path: <linux-usb+bounces-14782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4F96F430
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 14:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80421C22360
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 12:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D241CC8B3;
	Fri,  6 Sep 2024 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6pIGM5B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D41CB313
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625405; cv=none; b=B6m9DikXZhUczmfxsD2P9fabUJK/ygzh/wSaFpXd+KI8XAFG8dxMnpZDR1rCoaRJro/NJyBPNvfY1WEWKpbL8ng8Q44n652Wlnevn458tsy1bsbSWmg7TkfEwvCJ8RozWKZgmJ7fkgNTKQ4qBnLwyYnBC8t35KFKVd5vQVS3lQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625405; c=relaxed/simple;
	bh=VSJ8IsWX4Xg9UADtMUcZ314xyCxKPEdrqBYKYco1U7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=aqcNOXAkc2IAXWfApjQZdRw27uApBx0lQmKHOlmqwO0UlSdEW+ufGjdOo/Xir44Igk/+sEoqfND9s9FK/QDEyvf988P07qzO/xvsrXFhMjUeVT2yzNoGaDkjWsJGs+55VEuzd00fnRJbG+P0CV9yC57el8U3zimSbgwQNh1akCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6pIGM5B; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-45815723c87so1716161cf.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725625403; x=1726230203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xux5zEoTRnmQnsPEodGciIIQs3MyMeQV04K7jKIachc=;
        b=L6pIGM5BbgZsfA0JpRxhJ5WLukCj8988Chj2wkTyDOruWJf/HT9YBKTBFB+YCecO09
         /9GVgWPm4/HsiJn0TC1gLJ2sYeAAxZ+UMOiWc/bo+eAHAqiobGuYY3Sf1GgcsUL7fRlc
         n1GuXTTQClgJPMPZiVmgWn784hgCHWLu7K0w3yf8j5kKlYsXuQK0G7vzRgJOWWbrQik1
         x7ue9wD18SGkLJqpWU/9EXi3YRydIVOyGXP1TDB7CpYIcz8AjlEqUXFSunDRcu5Z5flo
         cAbf0vUMlWZTQWCxlzLBWbz0zVcvFu7qbeZIONLOGsS+DkFNh0QEaNV22cw6ORKradQk
         NMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725625403; x=1726230203;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xux5zEoTRnmQnsPEodGciIIQs3MyMeQV04K7jKIachc=;
        b=ASY0lBAkBs/UYKnagFNApSrbb/deFcizt1DCYa1VymbgLjV2bYa+gE5lI8MyDOBRo0
         S5YX6Rxk9XZp8tVdQKq8J/4KN0swPnr1rDktR8bQVFCqbhJoQqI6QOFtGe8ZkgdAprdg
         X4IsiTO60zVYHSlUdfEQc7Z6E3hUBogS969i9OvBCZSytyQLCzmbK6iw/oKIK7gKn2D4
         elZbOxnDx1rRnEvSniH6AnVP8i5qgA5ghe1ypA2kdtVRh3DvfI70SPzdHfJzaEtj/pW7
         1IMFfR6GPx8tjYnD+Y5yQ+abXxm4xgjciUT5KzW2bdvuXoNVVOxgr1PErAu1qofNAqaa
         Q6dA==
X-Forwarded-Encrypted: i=1; AJvYcCVGnYe9NvbNQj775sOEb8pQYItDUzCR1m7KOEDwY0N6Uyeh40kY2InXEyzdcAuT7qeBHC/bvBnJ5Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJDwSkGqEMXsVvQom4sLIjX+5xuluovkStYX6ERo2pbQ70eCb
	kmMcWYlc+iBgbUBMQNn8pki+joDAE4nzJH91bPOeLWNyXyUVQp2eic4TVw==
X-Google-Smtp-Source: AGHT+IH6aB6jhtF6h1BucYST5y+O/MbGaWar2F4GNH5Lf8qzGxQyUKbXrIY4FODw56ffncrCF9TN3Q==
X-Received: by 2002:a05:622a:1482:b0:456:8d37:a272 with SMTP id d75a77b69052e-4580c3da6edmr38449981cf.18.1725625402500;
        Fri, 06 Sep 2024 05:23:22 -0700 (PDT)
Received: from foxbook (bgw197.neoplus.adsl.tpnet.pl. [83.28.86.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45816f17942sm1334551cf.40.2024.09.06.05.23.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 06 Sep 2024 05:23:22 -0700 (PDT)
Date: Fri, 6 Sep 2024 14:23:16 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: mathias.nyman@linux.intel.com, niklas.neronin@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 10/12] usb: xhci: adjust empty TD list handling in
 handle_tx_event()
Message-ID: <20240906142316.3b00e4f1@foxbook>
In-Reply-To: <20240905143300.1959279-11-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

>@@ -2761,35 +2761,25 @@ static int handle_tx_event(struct xhci_hcd *xhci,
> 		return 0;
> 	}
> 
>-	do {
>-		/* This TRB should be in the TD at the head of this ring's
>-		 * TD list.
>+	if (list_empty(&ep_ring->td_list)) {
>+		/*
>+		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
>+		 * extra completion event if the device was suspended. Or, a event for the last TRB
Is changing this code perhaps an opportunity to clarify its comments?

This is just confusing. A stopped endpoint doesn't generate any "extra"
events since it can't be stopped again. Commit message of a83d6755814e4
suggests that this was about stopping running but idle EPs (as is the
case of EP0 before suspend). So briefly and to the point:

/* Ignore Force Stopped Event on an empty ring,
   or one containing only NOPs and Links */

>+		 * of a short TD we already got a short event for. The short TD is already removed
>+		 * from the TD list.
> 		 */
>-		if (list_empty(&ep_ring->td_list)) {
>-			/*
>-			 * Don't print wanings if it's due to a stopped endpoint
>-			 * generating an extra completion event if the device
>-			 * was suspended. Or, a event for the last TRB of a
>-			 * short TD we already got a short event for.
>-			 * The short TD is already removed from the TD list.
>-			 */
>-
>-			if (!(trb_comp_code == COMP_STOPPED ||
>-			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
>-			      ep_ring->last_td_was_short)) {
>-				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
>-					  slot_id, ep_index);
>-			}
>-			if (ep->skip) {
>-				ep->skip = false;
>-				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
>-					 slot_id, ep_index);
>-			}
>-
>-			td = NULL;
>-			goto check_endpoint_halted;
>+		if (trb_comp_code != COMP_STOPPED &&
>+		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
>+		    !ep_ring->last_td_was_short) {
>+			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
>+				  slot_id, ep_index);
I would add trb_comp_code here if touching this line.

> 		}
> 
>+		ep->skip = false;
I don't like that the xhci_dbg() has been removed. If skip debugging is
to be reliable, it should report all state transitions. And this is an
unusual one, so maybe very interesting. Skip debugging is valuable, as
the logic is tricky and has known problem cases. More below.

>+		goto check_endpoint_halted;
>+	}
>+
>+	do {
> 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
> 				      td_list);
> 
>@@ -2800,7 +2790,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
> 
> 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
> 				skip_isoc_td(xhci, td, ep, status);
>-				continue;
>+				if (!list_empty(&ep_ring->td_list))
>+					continue;
>+
>+				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
>+					 slot_id, ep_index);
This used to get the empty list warning, but now it's mere xhci_dbg().
Throwing out all queued TDs is not the common case and it may easily
be a bug. Indeed, I can readily name two cases when it is a bug today:

1. Force Stopped Event on a NOP or Link following the missed TD. Then
trb_in_td() doesn't match subsequent TD and the rest is trashed.

Actually, this is a v6.11 regression since d56b0b2ab1429. Although past
behavior was bad and broken too, it was broken differently.

2. Ring Underrun/Overrun if new TDs were queued before we handled it.
If ep_trb_dma is NULL, nothing ever matches and everything goes out.

Arguably, these are rare events and I haven't observed them yet.
And one more problem that I don't think currently exists, but:

3. If you ever find yourself doing it on an ordinary event (Success,
Transaction Error, Babble, etc.) then, seriously, WTF?

Bottom line, empty list is a very suspicious thing to see here. I can
only think of two legitimate cases:

1. Ring X-run, only if nothing new was queued since it occurred.
2. FSE outside transfer TDs, if no transfer TDs existed after it.

>+				ep->skip = false;
>+				td = NULL;
>+				goto check_endpoint_halted;
Isoch EPs can't stall and aren't supposed to halt on errors, 4.10.2.

> 			}
> 
> 			/*

