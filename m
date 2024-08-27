Return-Path: <linux-usb+bounces-14195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF09615FD
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47D71F268C0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACEA1CEAAF;
	Tue, 27 Aug 2024 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJ6IYi6t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2C1DDF5
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781208; cv=none; b=GrCiHhlBHcCmldQUQSK65gzXuaIwQATwcugBBEoPKJDiusEtMQ3w+7/QJ714d9GPk0hVXETrUcWjd33t9A76ExD+smDcp961SwZB5ieJKWBcSCvo5FIJoCwKZ0sRI1irwDbD1G7x2o5dcZGZ/9SpXiS5GkjMP0V9nKP9URG2A1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781208; c=relaxed/simple;
	bh=XgYzwOdqMOEe7LnOM0EEk37+DaRG0Yqxa9VbacFZhuU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZCaC5uMm60xosKUeiTIjTNJhQQ9Vi/rNp54/Jl6tTKfdSg3cnDp9oMIxd7sezbiNaLgPh3m8temkHVFNnNbXH/VZTW/UIEXM/CP6aCADosRJSf5Xgq6YtfFWkOxunv4Yp5Q9BsG2g28njF9OJ1zjbIVEDK13w2wYpbSRyujJbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJ6IYi6t; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-534366c194fso5084037e87.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781205; x=1725386005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdIU7HOFVa+70h5icTT2C6f8W08/j5KcmpOrK1A2oqg=;
        b=jJ6IYi6tEr5VI6iI2jaog+yPngEQURAiqtT2+1YaXnIXyJ2x7B7swFzgHsxMli2ir4
         XhDrmjgDwMV4xW+n6wUPXI2ybrwufCFhx46GKPMtW/HFZHbFhCXb5ixrSK8bC65B26UV
         L2CEtM1aY6owFOhvnq7Paak7k2X+or7ObrrZEsWJgJPiRKeFHnJzsVTnducAPQD/+Kr4
         BJzlENLqyk5EMpaz8FVf7B4VL36fV8mod8d5h6K6LCBlyK9TngNdc08p55c2RPUweNDL
         Wpgj1B9NTbGnvZxtZKBqgu1X6trFgCVTTHq53ucHsuIHdxzS7soUQh/LIHjjY8007MdC
         VSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781205; x=1725386005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdIU7HOFVa+70h5icTT2C6f8W08/j5KcmpOrK1A2oqg=;
        b=K/dJQ5Gki8yAn/bGaAU6koFs5hG+t4aOM2btns2pYISfblujQX4Wg3sGcNmQRE4/b4
         EHr0zqersyWU0zyboGDrwd+sbptJhcBDtkW8bSlFNluXQIpBy8IAJdzTGoLVZBLIdk3f
         cfM2q0DY1oZR4LtfeSu4rDWC8R+hwjrdHkl8JkQoleFX2oqCONZyN2SbEovKQXmf/Vwg
         SmVoAQSuDSnzePZXQ8K4n5P4/6Q2SfnzIR0+gasNTEo6aiDKE9PU3MGUVNekDIbGUkLE
         tF/4VPjaOgJtu4sbMoORsoNWYcohIsW72cpq7AQ9u9VCeEW73igjeKkA844lUO6VW6sj
         AWiw==
X-Gm-Message-State: AOJu0YxKwyTY/ER7KFG8dVkM+ky739gO/FFMuIEKidRcCjsIQcRVeklY
	eWOZIVysHWWwASIBXFYSminSYGEFYv2rV+do1FxM+YOm4QmCZYggbFs1hw==
X-Google-Smtp-Source: AGHT+IFwXWsvEJuzu+IQ4FEu8GKWPBu0drcBfDxd7rzwfs1UF2yVa2M9PiwaZ7l3sw6TFEKwyHxFzw==
X-Received: by 2002:a05:6512:3a93:b0:52c:d9a3:58af with SMTP id 2adb3069b0e04-5344e4fb00fmr2479878e87.49.1724781204905;
        Tue, 27 Aug 2024 10:53:24 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea2930asm1866168e87.52.2024.08.27.10.53.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:53:24 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:53:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 7/9] usb: xhci: Don't lie about trb_comp_code in
 handle_tx_event()
Message-ID: <20240827195322.558bba67@foxbook>
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

This variable normally is an endian-corrected copy of the completion
code received from hardware, except for one case where it is changed
in order to trick some later code into setting some flag.

This can be confusing when analyzing or debugging the function and
the false completion code is sometimes written to dmesg too.

For even more confusion, functions called by handle_tx_event() also
have same-named variables but they initialize them from scratch from
the hardware event, undoing this change within their scope.

Use a dedicated local variable instead of such machinations.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e19c8a17b59c..58e6d0280e00 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2613,8 +2613,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
+	bool short_packet = false;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
@@ -2645,14 +2646,15 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * transfer type
 	 */
 	case COMP_SUCCESS:
 		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0) {
-			trb_comp_code = COMP_SHORT_PACKET;
+			short_packet = true;
 			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td short %d\n",
 				 slot_id, ep_index, ep_ring->last_td_was_short);
 		}
 		break;
 	case COMP_SHORT_PACKET:
+		short_packet = true;
 		break;
 	/* Completion codes for endpoint stopped state */
 	case COMP_STOPPED:
 		xhci_dbg(xhci, "Stopped on Transfer TRB for slot %u ep %u\n",
@@ -2896,12 +2898,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		trb_in_td(xhci, td, ep_trb_dma, true);
 		return -ESHUTDOWN;
 	}
 
-	if (trb_comp_code == COMP_SHORT_PACKET)
-		ep_ring->last_td_was_short = true;
-	else
-		ep_ring->last_td_was_short = false;
+	ep_ring->last_td_was_short = short_packet;
 
 	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb);
 
-- 
2.43.0


