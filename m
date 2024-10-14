Return-Path: <linux-usb+bounces-16196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DE99D70C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 21:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C06A2839DF
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 19:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F791CC158;
	Mon, 14 Oct 2024 19:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV4eOpdj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220C231C83
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 19:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933091; cv=none; b=JDrA+8TNtOegzK3lp8cwvacEIqNzOOuQHTu4stxT5IYJgsNsHMCBFafGkwz2UnRi/690Y9ZqDZyz0yThwqOJggfhquDHu0QPnCI1AzKUzs3xYIUH6cuFf7xdF3fWw2OIftYjRWnXTU9tZ59SsjYWwSRDRwGa+rVImUXE7BIs5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933091; c=relaxed/simple;
	bh=1AYIHJSpJh14tBrc3Ys8p22E2Im9tFbWdQZh9k97sHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sbjn9PiPBweDQ0eISoeLuR4HEFFRd/saxEyfu/wWqOop7jqM3QP3t3DxJVZwGQK5YyvH/sPmvdh1Unn5z3IUG9iqmTumTnbZbOUFN1ptXSeoW94cbd9baojevRLfAQXJEKc4s1zZUHBxoPnN+AtOq+xVJSDM4jDvXKHAFSPKWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CV4eOpdj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1739701e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728933088; x=1729537888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOwYcmRXYNdjT3Unt6w0j33ZegmKcYuSEHukuwkGS2g=;
        b=CV4eOpdjc9DcPtC8cqojC/KJxmnvTorko4A/qTRdyQdyj/sn0FQJ+z6PSfTPUz4VHN
         SO5asEn+og5OlYr2f4APK6yjJAR7S/V8V9ycvBoc+oHsLP52T4VNn3AJsYUbxErOjGRt
         cELgnJJTWMbUeE8i+w/Dvt6ssJ+gtjTYYACvJzyvG9vG32rpC/6XGY2cH4yJgST3GoHu
         wRGSAjUCQXpXHe5KR2GfrM67w1wgBmJWZ3iejG4khRz/8t8z+N+DS24z3G3t5uqlDn/J
         IqCWscpR8rsZ0HQhoNvqUOUFEsVTKWjguRpvjZai9ZKtIeWQ2a+zCyjdZo1E97WAf1OD
         v0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728933088; x=1729537888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOwYcmRXYNdjT3Unt6w0j33ZegmKcYuSEHukuwkGS2g=;
        b=GX+GS0dcMI+bzsa+NAoIsbg8mrWeHy/qcj40Tmos2MSH+8xtrbiO+laGJw8mSfe2Cy
         z+Q/flT0hBBSxroG/lTUjbJjtHW3+1Lcvlg23OvqEdAOKYNXQiIlyYKp+bfoW35NWQ1r
         Dirn2N34eQGU4Q3duH7NNVC0RBkPekL7bZo7dHrNfJCgYnwWWD07trARBQuSwEyXu4qd
         RKBreem/TRZ45d1q8CQ4rQMAlUaZGek76tinTUACtPaPP2LpRG40bitTXqAX3tt5GS/L
         XcylC+mpu8NoU097w2jO4B6IgJZOYXk7btSANkjIeoVTQry9oRK80C54JtLddNoGcmxO
         dCeA==
X-Gm-Message-State: AOJu0YyoTaIBqbRimRG0HqgvRIn0lTwzKz0eU1ky94n0cT6fzQTbLPGg
	Rtaxx+5fo7RZR0VoXw/8dsuhZ6GsK8dChuJQw21a9sMS7pEpWZlU
X-Google-Smtp-Source: AGHT+IGzzvGz/j+W7ZuEOpkTascHOd5M1oGHbb1Ei9lC2W73QfEpKrsDPBd9JncgCc9/r/QaAbYyTw==
X-Received: by 2002:a05:6512:2212:b0:539:a353:279c with SMTP id 2adb3069b0e04-539da4ccf94mr5797385e87.28.1728933087786;
        Mon, 14 Oct 2024 12:11:27 -0700 (PDT)
Received: from foxbook (bfe48.neoplus.adsl.tpnet.pl. [83.28.42.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539eb912069sm786695e87.62.2024.10.14.12.11.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Oct 2024 12:11:26 -0700 (PDT)
Date: Mon, 14 Oct 2024 21:11:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: xhci: Warn about suspected "start-stop" bugs in
 HCs
Message-ID: <20241014211122.7cb5b133@foxbook>
In-Reply-To: <20241014210840.5941d336@foxbook>
References: <20241014210840.5941d336@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

NEC controllers have a bug, where stopping an endpoint soon after it
has been restarted doesn't quite work as expected. This forces us to
track whether each Stop Endpoint command is expected to fail or not.

Reuse this infrastracture to warn about similar bugs on other chips,
if any are found.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c0efb4d34ab9..c326b86d713c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1186,8 +1186,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			 * So keep retrying until the command clearly succeeds.
 			 * Not clear what to do if other HCs have similar bugs.
 			 */
-			if (!(xhci->quirks & XHCI_NEC_HOST))
+			if (!(xhci->quirks & XHCI_NEC_HOST)) {
+				xhci_warn(xhci, "Unhandled Stop Endpoint failure on slot %d ep_index %d\n",
+						slot_id, ep_index);
 				break;
+			}
 			fallthrough;
 
 		case EP_STATE_RUNNING:
-- 
2.43.0


