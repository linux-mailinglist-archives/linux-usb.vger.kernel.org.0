Return-Path: <linux-usb+bounces-23212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B2A9243C
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 19:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547323B60BE
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 17:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B50D2561C5;
	Thu, 17 Apr 2025 17:40:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599112561B3
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911640; cv=none; b=Im7sN5SxqJ6CD1slVy4bvI0Bw9UV5QVbGvSh01yhr0RRE69ucOrpePXyU0KSntLHL2HQmUdux4UY/AlZp6zwnwZlw3bVWxim6oDeJFm5J6RWyKhgqJ9hWrHIT/llO+c1iegLBgDf3Vur06tw2/S7GH9nWKTmreEyy8rTALpBnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911640; c=relaxed/simple;
	bh=KQBKxbaVe63fu/O/4ha9V5nRgofS7Z/e1L61wF48buY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZVZJyqQETXXGBS7g/RjJ4DllpZ+PANf/z2RI2k+rqJbvO5UOPqi0q983XFnGSaFnOrskudHi6nO8buTcWjEesLko7m8oiJ1QyIiijgAj3GrcdvuYJWLp3yOOADs0Vw/E9kYmebLZai0zPuXRuO0lOz8xG0NcmFI0PFs3Qz/pYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u5TDv-0006JN-BW; Thu, 17 Apr 2025 19:40:27 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u5TDu-000n0w-1O;
	Thu, 17 Apr 2025 19:40:26 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u5TDu-00198A-1A;
	Thu, 17 Apr 2025 19:40:26 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Thu, 17 Apr 2025 19:40:17 +0200
Subject: [PATCH] usb: dwc2: also exit clock_gating when stopping udc while
 suspended
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-dwc2_clock_gating-v1-1-8ea7c4d53d73@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAA9AWgC/x3M0QpAMBSA4VfRubZiaHgVSevsbE402oSSd7dcf
 hf//0CkwBShzx4IdHLkzSeUeQY4a+9IsEkGWcimqEslzIVywnXDZXL6YO9EozrdKovGdhWkbg9
 k+f6fw/i+H0CLtAFjAAAA
To: Minas Harutyunyan <hminas@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=KQBKxbaVe63fu/O/4ha9V5nRgofS7Z/e1L61wF48buY=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBoAT0J9MbWVW8dLjn/LbXr1wAnJ/DiRji3wFbGA
 sB43PgAqouJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCaAE9CQAKCRC/aVhE+XH0
 qz15EACsplTgm8stnjnf6hPHvNH2VW7uzCctFYkG2IDAit5VFrM2v6VE3N1FbN3AKxPrkXxWWNh
 Za6XRHApz7fYNeVuK1yNEl+vzuAcwC/1vzHxRS6+mKWdLf7GQzDTv4g4mQu2PMgNFiCjiKfT0WJ
 zwhijIM9QmAabIirhwclhnOsTP/mko936jSSL6dkMHOaH/oGQ/6DA7uAxJtJqGnlU2TNQ7dybDe
 48z03U+P0eN/JlVe63yvKWRGO0zKAUZk7LHcYPaflqGSaSRax+nbLAtII+/F5M86d2B9W/hf8Yt
 D2TiOnz1VZXtso+tO9Pk5ESs4b58Bu8B9wnZfydtX/ol/u3en1CSN7I3l9u25m71cwZrU3OmZSl
 sBgAZgkW9sdof4QbBwm8mZTjmba+fz3C1PLMU9w+tc87p3pywgCo8SQM1V2UcZSTORbXWLu5zmv
 fD+6nD++otTfPHW0hbwXPCXfK3aqQlFqAwn/PiJ05GvMx3MRsjppDxJK1BY0F0swMkVwx9MwI6X
 aLRCZRFr3VrdC1w9oHWL/W3Qt0KBIpqyVnvmJVAKJGFujg7/wWg3rzxm9l3QOip1iL+lpukiDDu
 7ESitrWIkkPWxKHdX0XX/ewctS/qPt0nvLzr/9NbAWC207o+iuy+yGqTuBm7Bz0R0tK2d/GLFrR
 KESLDqS2tiG7T3A==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

It is possible that the gadget will be disabled, while the udc is
suspended. When enabling the udc in that case, the clock gating
will not be enabled again. Leaving the phy unclocked. Even when the
udc is not enabled, connecting this powered but not clocked phy leads
to enumeration errors on the host side.

To ensure that the clock gating will be in an valid state, we ensure
that the clock gating will be enabled before stopping the udc.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc2/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 300ea4969f0cf..f323fb5597b32 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4604,6 +4604,12 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 	if (!hsotg)
 		return -ENODEV;
 
+	/* Exit clock gating when driver is stopped. */
+	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
+	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
+		dwc2_gadget_exit_clock_gating(hsotg, 0);
+	}
+
 	/* all endpoints should be shutdown */
 	for (ep = 1; ep < hsotg->num_of_eps; ep++) {
 		if (hsotg->eps_in[ep])

---
base-commit: cfb2e2c57aef75a414c0f18445c7441df5bc13be
change-id: 20250417-dwc2_clock_gating-579a87fcdf93

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


