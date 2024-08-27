Return-Path: <linux-usb+bounces-14193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F199615F4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FA67B22916
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BDC1CEAAF;
	Tue, 27 Aug 2024 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOmcayY0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB2464A
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781104; cv=none; b=FfWccrFi1Y7oDDM0nLg57bJfdGV0bYSDKV1Hg2k8HoF/l9t0q3EQ9Ac/vry0uwsSftlFbYrAM57NMpTkd9JQSxk85iOAIdrZ1E57pgWmuS6tG4RoViI/Qy7h9IeBageSGT10T3fXA1iWb1D8jYW1otX52yHa4sebGzJ+MlXWaRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781104; c=relaxed/simple;
	bh=DXzDBKtxPymdALo95TtDZg+Y0fTm4sl0XyGKbn2iFzY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZc+WzUErQ0fAuTcD3fAd03oitw12rXVPor/N0XOEswU7mjmxz8wgZQuxsGhSFUqSEVFwAxIi742N3wNvqlDjUnWQCjm8/OJTgXPkH69wgbB8YRtnrB5F1g8cO3U7H0OagUkZciGOKjixjUm97+XFBfnv5ENSqbbq05FqLF0jn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOmcayY0; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-533462b9428so9875358e87.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781101; x=1725385901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45HTGQJVSBp5kQg+4OTSk7U8sPIgi6UhdgMThKsrpN4=;
        b=kOmcayY0OWxIis8fTtjHjE1qVTBduaSw2TTtmg4uZaFwn8Aijh8qsxJ7aTFZ3yWP0/
         w87XtJCs5Q34eA7uMBnysIs0Kq0dhWk+NwvBGO62h3dy5IJyfvw7qncGb5T0R4TUzAYH
         H15Cjw2t//2XkGrr3yGdts2O2vanwCXwn+CUiI3qyXT/HReSlobKpmZMXDtqBsDAmwQU
         qKVc6XebDdgMuBb8no/a+QuqSjiVnyMo2g+X0npDRYmHNy5WuL/I6h0CIqrskUrEZQ0V
         vX3zbcNuVJUFqHAZcqk4mFLlwSB1zDI4h07ZLLp8Q6pnggAOK942yvZ7VPSKDvxtDqwR
         eA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781101; x=1725385901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45HTGQJVSBp5kQg+4OTSk7U8sPIgi6UhdgMThKsrpN4=;
        b=vpXym5VduE4Zk/4Uw+zrlBmnPCcOuzZje9VplyRgtNvynDN5sCuzhmsdFfTGwJzpEv
         iBy1122IY1YqbkGoC8leZt3Th1tl0AqfYi5XvYsuwRJVT61gnuecpVCHWoM9HR9Ap8z8
         STChZjFX5OirnXHCmi9kurTX5yU3Xd4eFs1RpF0OXB9NVtTV2sABATmNgJqdVu1mDr3o
         jnsDNZXhRr7nb6R+HH/r8MvBxNVCngV+YsVWO5ZLp2hv8pln4lSmH9hgrJXPrMmB3Mxw
         NaCE65YPh9klAUTqbHTIFOMO5/yI0hLoYFG1HHG32mk9gmCfeNyHlfT5CwI34LONc308
         AYjg==
X-Gm-Message-State: AOJu0YxpfnEV4NZr53GG+85mw6rCUOV7gkDzUUdSW/gETxYsM8ZZhyEU
	upBvzXWpJOYSNpnY2tu00mon6Q9Vbo1yLSZmp0RbyWdo4cVqT4Qp
X-Google-Smtp-Source: AGHT+IHWHb2VlAKbSypOv/8AboV5MAF06nXdMOxKUy2dHv5XHUqXLKuogiqVjGkU0chjmfWlFoOEhg==
X-Received: by 2002:a05:6512:308a:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-53438851b52mr12526602e87.33.1724781100395;
        Tue, 27 Aug 2024 10:51:40 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea296c6sm1852890e87.56.2024.08.27.10.51.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:51:40 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:51:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 5/9] usb: xhci: Simplify error_mid_td marking
Message-ID: <20240827195136.45ffd31e@foxbook>
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

It doesn't matter whether we set this flag or not on the final TRB,
because the TD is about to be immediately "finished" anyway.

Without these checks the code looks cleaner and easier to follow.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index cc0420021683..c777cb897579 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2410,26 +2410,23 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		sum_trbs_for_length = true;
 		fallthrough;
 	case COMP_ISOCH_BUFFER_OVERRUN:
 		frame->status = -EOVERFLOW;
-		if (ep_trb != td->last_trb)
-			td->error_mid_td = true;
+		td->error_mid_td = true;
 		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		frame->status = -EXDEV;
 		sum_trbs_for_length = true;
-		if (ep_trb != td->last_trb)
-			td->error_mid_td = true;
+		td->error_mid_td = true;
 		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
 		frame->status = -EPROTO;
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
 		frame->status = -EPROTO;
 		sum_trbs_for_length = true;
-		if (ep_trb != td->last_trb)
-			td->error_mid_td = true;
+		td->error_mid_td = true;
 		break;
 	case COMP_STOPPED:
 		sum_trbs_for_length = true;
 		break;
-- 
2.43.0


