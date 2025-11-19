Return-Path: <linux-usb+bounces-30698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8780C6ED5C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44CC24F1BB1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B055635A12C;
	Wed, 19 Nov 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3g/j2J5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1E35B144
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557762; cv=none; b=tQ6HACUNec9Z/XfKxw3baLHhN9FpcQ0PPaZ0t/XiM5g0VOnJyozzxb3JtqjinCmDGsCzRmpQJexbWcDhl4Hcb5rsL5xqpf2emuG6lGmxfFyFUHFkXYRrd2oB4QN2ttVtR8aTZggp7vETdci4kGVp8Khpr1LBBhyMQs/9k55fHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557762; c=relaxed/simple;
	bh=0Gyh0QsWpdhCfDK9gC2hRQiRG8neNDMu8HdtyKuH2yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTIjgcskfuUyLXdFMoMraQpkAfh+Pgz7gWIeYCCw4Wrnnx0eeWmJU1quNfuFIdrsMXOMYqJgQzHNWfoRww0Pb7WW1w9mW60M0iYiTY4yIIMRmNOai5kqrERbwkKmnamZxY0D1bxWoL5hWW6ftJyKSn+Tfr1xBiN36kI0v4Ndic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3g/j2J5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7ba92341f83so3250748b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557760; x=1764162560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZYVsLL6wWFXxTI5h+FOLRQVY+WCanrDEO2Tz+FBfiE=;
        b=c3g/j2J5m3JuxWSPmEfqULgE/UkMt8B6/VObHs8M3R8NyoxHCx2TT/6MgY8IoHcWvp
         Y7/j0uu8ZAr7Ai8juGvjMu5B8JzLCMI07jeiQbavnm8am9u9UbZuPB/bto9iULUQ5MSW
         rhRa2o6gdUgtM++QR6Q7wdoWmgwOUGrcusnmBcJr8+UpLef0Z+1w/wPB3Neylsf4u954
         CGdvQsV4bNBZ98Ps8X181Qv244NOmMr9aVlHWo2tWsFUSDLd0QXdj8R5BbSUNF0Hapoh
         V6ITfk3PG8+NEzlRfnUslOuoqIXaAOXKv5TRaZq0PV9Ue21TQx78g6fHkmSY4LAN3Q65
         GZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557760; x=1764162560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZYVsLL6wWFXxTI5h+FOLRQVY+WCanrDEO2Tz+FBfiE=;
        b=FyrqMPDvTcczmK8Ym5PNBQZtv4EuWdSFD7g2RWdJDRhJLcrtqUSqYrWsA02xyfPIb3
         ZTffuTUg1AnKDuAwVm7hoZJddvNPgsgI1Ax+DPfsmGnQyl29vg108UW8rwbJPf2WRlkS
         U6ppLg872qqWwZYpIiwOP0IyN9ZOD/4FPPCRau/pg8oEIHeAG/3kxyDbFVz5BHi/x1KA
         j4LSc0clN2YuMg5mRbHK2A9MpZwYhyeu/B3t6K4VHz5d0HRE/E1644O6YfRhULysMcQF
         qA8lAY1R55yY5ysHtNg9bXDLJ7uu7V4/fXZv+n79hMiBtYzRdYpPIW0bQL1VAmWsCSAw
         Ex5Q==
X-Gm-Message-State: AOJu0Yy4Giy85j4A+v46Z3TE1wq9hTCL6ql+iFoXKA2NIthP+9BbiOSA
	EsG3YbvQxcDj1tYnCg5F36Xe5rooharl6weS11EqWXmVoVTLqjQ5e7az
X-Gm-Gg: ASbGncvgmp4dmOAEfAYpmO7f9PyB0FzqJgJnwvCdcve2hroIRZ3D6ecCD57Z2EVdwMk
	7rTNrZVEwuUaFL9xey9l3tPdcimsTit9uVRq8l2NDlWc96bgZgqkIs86n8LbweuD09sfCr1zwzW
	lsE2/3VWkTXxwDUAQR5hQTs9sqCvp8qF6UOv28/OY9yYqqw5KOlsh+p4yysLt5c8xZ6xmLHvNwZ
	qaPM2gmTFqhMnTS1mcyXQQ0fHd9BfdJF3/DSQEet7MMDlvzuDwZLtb6OaFaX32EEZJK7RQdrjCO
	goS22I/sdr/lncjfX00ryvG3aQsIBEKl6WQRR5ipTR6QMJJb7USpDX00uKwBYY+FLaH1XYBhxpT
	PTGtaMdUBdVQ+UhxdRaU36qn28OWlk/OzIMbEXoH5W+y3eNFdI8hRox4gwFVZbZh53HmPQk7fsH
	APyCvwjXq08CYwwOXnjBe919aYy30ffQWd40JXHLJmoIqvTw==
X-Google-Smtp-Source: AGHT+IFI5Iixx+eyHlV2iuHwmtrmKBaOi8SAI5kZLeU+B97GC1Qy/+Ng+6dg+PQgCgUtsLq42ih8SA==
X-Received: by 2002:a05:6a00:c93:b0:7ab:653a:ca0e with SMTP id d2e1a72fcca58-7ba3b7a9fb0mr19063978b3a.23.1763557759764;
        Wed, 19 Nov 2025 05:09:19 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:19 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 7/8] usb: gadget: dummy_hcd: remove unnecessary 'else' after return
Date: Wed, 19 Nov 2025 18:38:39 +0530
Message-ID: <20251119130840.14309-8-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'else' after a return statement is redundant and unnecessary.
This patch removes the 'else' in dummy_set_halt_and_wedge(), making
the code clearer and compliant with kernel coding style:

- Return early for the -EAGAIN condition.
- Place the subsequent code at the same indentation level instead
  of inside an 'else' block.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1840dd822..1114dfe61 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -803,10 +803,10 @@ dummy_set_halt_and_wedge(struct usb_ep *_ep, int value, int wedged)
 		return -ESHUTDOWN;
 	if (!value)
 		ep->halted = ep->wedged = 0;
-	else if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
-			!list_empty(&ep->queue))
-		return -EAGAIN;
 	else {
+		if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
+			!list_empty(&ep->queue))
+			return -EAGAIN;
 		ep->halted = 1;
 		if (wedged)
 			ep->wedged = 1;
-- 
2.43.0


