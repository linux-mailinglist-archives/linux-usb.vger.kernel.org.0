Return-Path: <linux-usb+bounces-19130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065AA057DC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BC503A6709
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECFF1F893B;
	Wed,  8 Jan 2025 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOTlOwFN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603881F8685;
	Wed,  8 Jan 2025 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736331358; cv=none; b=lCjY9B+s8axQYUvQdcjitdWhdztuk4W4P1ziK870Rg6lu+ui7jgJlNOPcXQL65HeB8LljV8PvoVkUUiYb9Jj6423CZAkp2y9XuwZ3r3/qTL3rHcS79CFS0mbTmeFj9M/5oucySumfirudsJq2mubUgna7hlny8ee4TeKOShYaQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736331358; c=relaxed/simple;
	bh=TXka2TDyZ1Zkc+gLKl2/25u/T5sTqdWMMG21qvvJuWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOxiaLIqUFlLE8QM/kQLJaTIfUyYExBDtw4D0z4MUjo/TmJvBhcLPmq/0aWMvHwmadoElfoSoiGUx53FxItCPFCXh5MGPwVvJFQdqdil7UgUAbIwDNZijCYUbJDjqTw/e6RexK3AAGcqZTBSJlXhqiA4W8KEzjsZBNdLhJleThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOTlOwFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04560C4CEE2;
	Wed,  8 Jan 2025 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331358;
	bh=TXka2TDyZ1Zkc+gLKl2/25u/T5sTqdWMMG21qvvJuWM=;
	h=From:To:Cc:Subject:Date:From;
	b=dOTlOwFN718LANxXx5mY3bGv4h4ykNbwhqsM/Iy3bttEvWEfcgCu6NON2GmbVRh55
	 5zmZnUmNhTZjAYwxQEP3KzqjOY35VqXMVL0+zmUuKXJ06t0DdenjQLroZN2L9GDGrr
	 LE4Z1SzWpfW/9cH9+AGQ0dnYBcP/iEVG1IqX9dJWb+bMzz5L6Vu2XCg6ms0LvZlEJz
	 K4YKN9tSNGqhihsQ/cMRq0f8j78u0JcMGVupdQw9ID1GKxJzjnCl7iCOxjwgGCnlTg
	 qup5XTcE2ZnueZe37oZoyJkqgmFHqnkiURLlz6vPgjfenNTuNbYRS4hA/mgphAhrMn
	 QngqzBqRLa7PA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVT6T-000000007yw-342Z;
	Wed, 08 Jan 2025 11:15:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Lode Willems <me@lodewillems.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: ch341: use fix-width types consistently
Date: Wed,  8 Jan 2025 11:15:18 +0100
Message-ID: <20250108101518.30607-1-johan@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use Linux fix-width types consistently and drop a related unnecessary
cast.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index ac74b353b26d..7cc36f84821f 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -660,13 +660,12 @@ static int ch341_simulate_break(struct tty_struct *tty, int break_state)
 
 static int ch341_break_ctl(struct tty_struct *tty, int break_state)
 {
-	const uint16_t ch341_break_reg =
-			((uint16_t) CH341_REG_LCR << 8) | CH341_REG_BREAK;
+	const u16 ch341_break_reg = (CH341_REG_LCR << 8) | CH341_REG_BREAK;
 	struct usb_serial_port *port = tty->driver_data;
 	struct ch341_private *priv = usb_get_serial_port_data(port);
+	u16 reg_contents;
+	u8 break_reg[2];
 	int r;
-	uint16_t reg_contents;
-	uint8_t break_reg[2];
 
 	if (priv->quirks & CH341_QUIRK_SIMULATE_BREAK)
 		return ch341_simulate_break(tty, break_state);
-- 
2.45.2


