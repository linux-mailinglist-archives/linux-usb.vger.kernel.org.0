Return-Path: <linux-usb+bounces-25067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A244AE67DE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 16:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6608F3A7403
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 14:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3282C325C;
	Tue, 24 Jun 2025 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="SWvRsrU7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692828ECE2
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774195; cv=none; b=reNHi3LELaTpipv79qFF0Nk/97mXnViwj53jfCEI193zd1/IiriTCQlEBrX3DySFMw1RzEzrdPz4jJE3w/N6JOPyo6JAJN7tTYAH87neCdwGCoI85oNB3cfqIzmhyleQdmoH+Of0xusBKPaHbkK8VMm+Vm1X6CAij6S+ePlFL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774195; c=relaxed/simple;
	bh=lC5cRjaojZ5t/DeqN4fUzCwenXZ0a0iWp5ap87muVhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lpv3cepNhq6KfX0bQEOITkH1Z+pWxxcnXfqelZ+rUOTs5waCDiDPIwZpGS3607FnBkzjz03Pb/L1VKBlobyTwvW/ig40UXS5b4N8OwZO4Y8G91wm6cK8GR7LGBtYJbhjXNnvvsn5r4r0pxucd6KfuA44Z5o1UMi214h6NQvAaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=SWvRsrU7; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5792078a12.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1750774193; x=1751378993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur3pkSe32TVriqGAIz7br9BFdD6ELIY4joveCHedb2Y=;
        b=SWvRsrU72zhFSUL3An21JgXMNui1ef6wozDOevdKciWMA2Ho7t5vwQ/znPdcPUXTOr
         l2rGTiai4tIIMsOVjziV4sxp/WljqQdk1Yil2mP+f8PdH8ueE68kvCFbnrB2RFPcQgvD
         HBu2/mYGxwy5kNu7oxZ4jKOQZ1qraHHb9N5rD3hig1Wxw2D9yAGMSccpbSR3hLrU+VG4
         uzUrRXJzWZ6DBuXX7GQ9N9y0nfbN7osCEJZbvETOrbuWiDRuQvSdKU5rMbYJEOV0Codp
         W2sgVFP0guqMbRaoM4gNVc4g5FADYbWSg0a7id3bX0rIL8PdO3z/Q+SnJsZNrBV6DQNK
         lSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774193; x=1751378993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur3pkSe32TVriqGAIz7br9BFdD6ELIY4joveCHedb2Y=;
        b=CLsL/Cm2BqqJedoqu9Cbc8FINV3v6TjH+ZPqOU8jgidfqma8L/dSOU6bRS6qCI0LiH
         SpZcbnx0u16mFejPDXDpWqubTrLaF+rvbI+0kwrn1EiaqLe6v/Em0kWqzmFQ+qaIx2LR
         kXlldmvMgk3td5gtRUsTNH6NoyXwrttnRRoC0BAh/CbVspUCHzDv5oEnUAntZasown2E
         h+W4jVtuA26YxCGwVdzVlfDzGSYzNA0hrShl3+z30SiJTZG12YW73AMR4Kx23BUilvkl
         nl2jhkAtHvdzTcHnjm8JT5mKx1FWld4uw711k9tlMexWOdqqm4tbrUpO8u6D6+okZSFS
         HrtA==
X-Gm-Message-State: AOJu0YzRJKawSGpw+2I7xFSOL1Fg76m3AEQ9KLy4TL2TyqS92/n9CF96
	wFSJuam6eo9xyH6D1zaeXzyN1RhafAcxLqPwLCTLu6cY9Khklnsg0SkRiPSOeh8D/w==
X-Gm-Gg: ASbGncvu0pmPQSmKC+Jrl9OyqpohL0k2sWtnS+wFz+LCAOUWXiKU8ZSIDqorPwV8G73
	CYIsfdzTDjiOhJM9Il7hPFFhUxmYVyUtF6RyNu8tRzyquS+ibDLbdmP57U6DffIM10ja1sfDCxL
	lRpDSsz9d0KyB9luPek0VoSF/UD9bJEH3L7A+ahG0RjBuQCCyckhL9h0kS/Mx1Ae2sIhUkNmvFV
	9q2YUmT8ZcaTimKwGRWezbFRReKV2+pBSyK4/AwlfbaV2J8aWL3P7pRRf4T7GAJUhXAgM+XUXkM
	y+6wHhru1AF2btYhSkmiSljYbmNzbvIoaFwmkMCNg4oHxzPe4LC73ehRLOQmHdS7Wn6ipioT4bO
	Bm6xiIK3+LNTWwkw33XEyUJcQIW5EkZHwjgom/t8cfLfPux0nlwqx+f/nVZpI
X-Google-Smtp-Source: AGHT+IEEg7l4G6SUorjlq4/b8X8X+akKFfbR+kWJrhsVArb1J01hupz0jyLFc8JQcBOKyckjtmGZIg==
X-Received: by 2002:a05:6a20:7284:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-22026f162a1mr24443721637.20.1750774192878;
        Tue, 24 Jun 2025 07:09:52 -0700 (PDT)
Received: from system.mynetworksettings.com (pool-71-126-161-43.washdc.fios.verizon.net. [71.126.161.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e42ad8sm1982115b3a.70.2025.06.24.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:09:52 -0700 (PDT)
From: Drew Hamilton <drew.hamilton@zetier.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Hamilton <drew.hamilton@zetier.com>,
	Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Subject: [PATCH] usb: musb: fix gadget state on disconnect
Date: Tue, 24 Jun 2025 10:09:30 -0400
Message-Id: <20250624140930.25887-1-drew.hamilton@zetier.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unplugging the USB cable or disconnecting a gadget in usb peripheral mode with
echo "" > /sys/kernel/config/usb_gadget/<your_gadget>/UDC,
/sys/class/udc/musb-hdrc.0/state does not change from USB_STATE_CONFIGURED.

Testing on dwc2/3 shows they both update the state to USB_STATE_NOTATTACHED.

Add calls to usb_gadget_set_state in musb_g_disconnect and musb_gadget_stop
to fix both cases.

Tested against 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3.

Co-authored-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Drew Hamilton <drew.hamilton@zetier.com>
---
 drivers/usb/musb/musb_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 6869c58367f2..caf4d4cd4b75 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1913,6 +1913,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 	 * gadget driver here and have everything work;
 	 * that currently misbehaves.
 	 */
+	usb_gadget_set_state(g, USB_STATE_NOTATTACHED);
 
 	/* Force check of devctl register for PM runtime */
 	pm_runtime_mark_last_busy(musb->controller);
@@ -2019,6 +2020,7 @@ void musb_g_disconnect(struct musb *musb)
 	case OTG_STATE_B_PERIPHERAL:
 	case OTG_STATE_B_IDLE:
 		musb_set_state(musb, OTG_STATE_B_IDLE);
+		usb_gadget_set_state(&musb->g, USB_STATE_NOTATTACHED);
 		break;
 	case OTG_STATE_B_SRP_INIT:
 		break;
-- 
2.34.1


