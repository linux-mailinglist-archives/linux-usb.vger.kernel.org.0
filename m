Return-Path: <linux-usb+bounces-5212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2B8317D1
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 12:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57637B259DD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 11:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B993924206;
	Thu, 18 Jan 2024 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBt7TLxk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07702033B
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705575636; cv=none; b=HhSS2aH0nLtDel9Fha+S7V+EGUzT12ya48cysGh65A69hMjZNhzq89wZPEjquPzCv2vsBingJE+y1WiglJSuPu3sOS/NGs77fjaP0gw8uyHGRaPwIjbrNitnbMaS5hEleXT9VQ6FzaX0RkxpvlMCDM41e/0uQAOJd1vo4hsvulc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705575636; c=relaxed/simple;
	bh=/KQptx5B8H3/GC4oU9ANo/zEYXsCFwUqrPe4p2Fr6vs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=J2ggupRt65Uk5DzDyyf3TAqEX7swHWxvCKIwgMmiJVPGALUidGhjvbY1vogavUPHn5OIwrrUJArETsA0G66kHLSTeFYr2DPC00/W9d4hR2CkKpWEcllQrHgLAnx7YdrDBzD0C+2gPduSgGt7y/Ie5xXNxCBCnPKZIxD/7CkD9lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBt7TLxk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so623007a12.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 03:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705575633; x=1706180433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIo/vbcT3Wa3IvObTxXdzmJhk9hloGgDlGBDFIEM00U=;
        b=BBt7TLxks0yQDcO6Hh+i+ilJeuge4zr3jShVWSWwBAw07Fl8wabBLAkXYHUwBJTEmr
         Jx+P1ZRQbYtXfe68kXZr6lk0TsXaXLvd1uSr4TwrOffCrVWrpJShyHn/U2rJR3+RsC1h
         oikNGTOjR61Kq00scp/2vwTBX/xhHVWRfgVyna7AN+pd0KdzBSv4tILsx7St2ZDnh6bc
         ctMTzbHxToqOVCJuuTQ3kaAi/zN+Y0V8+O4UCNrQMfkt6d34QylE/+xWrWZrkyHrHAEx
         URsmRRm9oFjf9tBdfIvgE+qYfowNr9my/hTNDdA9lfvMrC5LXiQ9gxuVCuXrLcvDzaWb
         rW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705575633; x=1706180433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIo/vbcT3Wa3IvObTxXdzmJhk9hloGgDlGBDFIEM00U=;
        b=UWE1wIX5VR4RtWrESl3f/w2HhgcJK+z626tPty7p78rUirgNLgOWCB0HJrOb0PQEbD
         VwxjzBdPGqWT/lRaQNVR3tTog5byYo8bt4dmyfQd03aXGe4XTjL1FRB+V6Qhs4phQMuA
         2du6AklNCuprZUYxDPSRY7WOjxuw5utSChmU1dooMFfmL5/jSwognpzGNqXkEYZYD7Q4
         cCdwrIY5QQ4qeen45F+zt/laFoqxFSjAs8VEbSmvTlVy3lebB7IZKvKM552l28TsriFh
         VFp7BNqXqYGNhOni8kl6r70RqDGc/wwymX+KA12lGHsSQVoJFcJf027QN8y3MwfJ3d9j
         IoTQ==
X-Gm-Message-State: AOJu0YwVc4nS1WWN9U/rCKJIZ+ftFkmK82tg7G7L31LZaRXhxUqF9vZ7
	Rt26qh3V8klbonRloPtt1Lg3VN0IzFgOMs3pcN09txsLdIK35EJmeKednaKM
X-Google-Smtp-Source: AGHT+IFi10ja41716vMcSn7bN0+zX1IbKY0SOl5uDEtjxHlDsSDIHEE+KcWuQHi5TWOXGT12dL4B0Q==
X-Received: by 2002:a05:6402:1643:b0:55a:fa2:e80d with SMTP id s3-20020a056402164300b0055a0fa2e80dmr289949edx.39.1705575632751;
        Thu, 18 Jan 2024 03:00:32 -0800 (PST)
Received: from foxbook (bfg166.neoplus.adsl.tpnet.pl. [83.28.44.166])
        by smtp.gmail.com with ESMTPSA id fk4-20020a056402398400b005576a384b46sm9347688edb.10.2024.01.18.03.00.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2024 03:00:32 -0800 (PST)
Date: Thu, 18 Jan 2024 12:00:27 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Isochronous error handling bug on VIA VL805
Message-ID: <20240118120027.5bc498b5@foxbook>
In-Reply-To: <20240117184905.1800b1cc@foxbook>
References: <20240115172709.0b6f2bba@foxbook>
	<20240116153618.2527463-1-mathias.nyman@linux.intel.com>
	<20240116232045.76da750b@foxbook>
	<f6542354-d6d1-be22-82ed-5dfa57aa8337@linux.intel.com>
	<20240117184905.1800b1cc@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I concurrently executed plan B for dealing with my NEC issues, which is
to simply order a host controller with other chip (VIA), and now I have
two controllers and three problems.

One is that it sometimes "dies" and requires a reboot, probably nothing
Linux can do about it.

The other is that it reports successful completion of the final TRB and
the driver overwrites frame->status set by prior errors. This seems to
only affect isochronous again, though I'm not 100% sure.


This change on top of yours takes care of it for transaction errors.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d2fe1f073e38..fce67493dfdf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2375,6 +2375,12 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
+		/* Check for earlier errors; see xHCI 4.9.1 */
+		if (td->error_mid_td) {
+			xhci_info(xhci, "Got SUCCESS after mid TD error\n");
+			/* don't overwrite previously assigned status */
+			break;
+		}
 		if (remaining) {
 			frame->status = short_framestatus;
 			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)


Interesting questions arise:

1. Should this be a separate patch?

2. Are there any errors that may need error_mid_td treatment on NEC?
Maybe BABBLE or others, unfortunately it isn't easy for me to produce
them and see what happens.

3. Are there any errors that may need "not success" treatment on VIA?
Any chance that these error sets aren't equal and I can't get away with
reusing your error_mid_td flag here?

