Return-Path: <linux-usb+bounces-2377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACFA7DC568
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 05:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B4921C20BBC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 04:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8D5110D;
	Tue, 31 Oct 2023 04:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K8NPu7dq"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841483D6A
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 04:40:46 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC049AB
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 21:40:44 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da2b8af7e89so3217559276.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 21:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698727244; x=1699332044; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYwnCg3MzOCxaL6syOpApDs7eXE4N92NMNfKk1723ok=;
        b=K8NPu7dq9Wrw4mgKePz0ZSQ5gLDyRZgC7oA32z/4lY34GcKiiuAAGt8DCuQHY6avEy
         hfuxxihnVr2n71/V7J3jnvBAaOYTfUtLvYmrjzdiDr4P84Uoz5pXXJQlZEDxqpCSbTWa
         C2ZqUBHyzoL9gDkplmwUv1IjokAMshlLW9ml6uAmkGBqjWpLcN2tuLsRDJhOA5/pl5Px
         Ps/XcfJF5oPGFQ+xt2gERTr+uG+poRkTyxnrXRLocFnCm5zT6aRelvb6VVF97gSoR7ox
         YnnVQxAUBjh8uifbME1DzfZbIiq5aS2X86mM6/Rv20TmgUqiIMGXdV41niL9vmYEjiMr
         7s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698727244; x=1699332044;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYwnCg3MzOCxaL6syOpApDs7eXE4N92NMNfKk1723ok=;
        b=ZqVV7KBhNEmnL5zQRYEqkVt9d7u50CpZp+vvqNHzVJ9RmrAkFLGi3jm/nztypRdZcQ
         0U+YVGMw9aJoDz3kXLLOoyGnwerjFjv3941/yOpbTJtr4TQ8LSapKuWb9sCw/zyPi2Ql
         IFg2l5ZIMH+XqznfWiglMx+NMwCpbG5nxT+m4jIbg1U5QHOsx139XLwSty3+rOOaBJj0
         RNl8Q6NgqqyBxRY9FJMaQpu2zXMbJ2Zg3xrUDPLADEnu5wCeWY5UehiV6PvrGXa2Izyq
         nS4YNMimRUWT4sMSvgnMQyut6PTvmUAcN+j5TyCMac8BVvmS736hANz+G4EyiyxziPMA
         zzfA==
X-Gm-Message-State: AOJu0YzO3r5zwr7AkJ2bzMCAMeczGR6kqjJ8XeEbeNIouHfxE+RW+PL1
	3ISySzqhJ/9WA+3GJ7osIyaiYdnzmXsS
X-Google-Smtp-Source: AGHT+IF1blIGUiwwYOg1/mXFkKE0MNTH6FvFkl8I66ichTIVYu+k5T3UQy8MezeW8HkSb6f9gfoFH86xoxvQ
X-Received: from mnkumar0.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:313a])
 (user=mnkumar job=sendgmr) by 2002:a25:d754:0:b0:d9c:66d1:9597 with SMTP id
 o81-20020a25d754000000b00d9c66d19597mr211255ybg.13.1698727243860; Mon, 30 Oct
 2023 21:40:43 -0700 (PDT)
Date: Tue, 31 Oct 2023 04:40:20 +0000
In-Reply-To: <20231031044021.1162403-1-mnkumar@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231031044021.1162403-1-mnkumar@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031044021.1162403-2-mnkumar@google.com>
Subject: [PATCH 1/2] usb: host: xhci-plat: Add quirk-no-64-bit-support
From: Naveen Kumar <mnkumar@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, 
	Naveen Kumar M <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Naveen Kumar M <mnkumar@google.com>

This patch exposes the existing quirk XHCI_NO_64BIT_SUPPORT so that dwc3
clients can also use this flag. Despite HCCPARAMS1 being set to 1 some
clients may not support 64 bit addressing.

Signed-off-by: Naveen Kumar M <mnkumar@google.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b93161374293..d5f37decb7da 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -249,6 +249,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "quirk-no-64-bit-support"))
+			xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
-- 
2.42.0.820.g83a721a137-goog


