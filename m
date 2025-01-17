Return-Path: <linux-usb+bounces-19476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0AA14AFA
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 09:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 201097A23EA
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 08:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6861F890F;
	Fri, 17 Jan 2025 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wEuXbdsR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E361F8905;
	Fri, 17 Jan 2025 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101840; cv=none; b=RWzb/Du+hrHJRU+wuaMD1HrXVFxjW+aChne0gf06FPxFwd7OgR86djtWq0N044edgNBxxF3OTN28XlmLDnFpfZZ5ue9SCTxqRDsdlL0mpGPxENREsJ/DA3XgpIL0StwtoEc4ojToyGUWcL3WGhE85fVYCEPM7Ad05qlwC22fWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101840; c=relaxed/simple;
	bh=evxPk6YBAPIRtVTYM5TYrRY35HAy2xFOXsHK0JjxBlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qt52C6TMcyZ3giIjoJBCJYZW1TWP0NAEP38Dk+q2O8BFn+M+imkk66pQeYs84KrF5SO5xy5GAsiMeNzVTz51Z+c7kJj/068zk6S95kniLAdqQvoidMXI9q6A0hf3a2hfYGbC5Rg+iqOTgihaz+1SGEnJqzRSCWi+zfWycKhQL/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wEuXbdsR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ABAC4CEDD;
	Fri, 17 Jan 2025 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737101840;
	bh=evxPk6YBAPIRtVTYM5TYrRY35HAy2xFOXsHK0JjxBlw=;
	h=From:To:Cc:Subject:Date:From;
	b=wEuXbdsREcUdorLvehKtRlmQ75mm8S5N2F8zlnz5aczgIrfw9FQ+OsNSaRMYFbwzs
	 p6tsYYT62z8/MI5mhXgj/zPugwKIRKFIMLxd6BqMi1az3UtGwAxrGC0nqPoCJSq65m
	 tXEl3RC6Ee0a+kwk+NKDWutGnPC+5zP031wOqJ5U=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	stable <stable@kernel.org>,
	Lianqin Hu <hulianqin@vivo.com>
Subject: [PATCH] Revert "usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null"
Date: Fri, 17 Jan 2025 09:17:12 +0100
Message-ID: <2025011711-yippee-fever-a737@gregkh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 41
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=evxPk6YBAPIRtVTYM5TYrRY35HAy2xFOXsHK0JjxBlw=; b=owGbwMvMwCRo6H6F97bub03G02pJDOldQhwaJ54G/356QMHkdNXltQwqZy9/2uZxaoe+99x+6 y+nb5XO74hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJRCxlWHBp6p8rnxo2W+68 GhX7J/psYe5+3TaGBTv+Pua4JPGD9abwm7Mv6xtZf95tegkA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

This reverts commit 13014969cbf07f18d62ceea40bd8ca8ec9d36cec.

It is reported to cause crashes on Tegra systems, so revert it for now.

Link: https://lore.kernel.org/r/1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Cc: stable <stable@kernel.org>
Cc: Lianqin Hu <hulianqin@vivo.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/u_serial.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 5413882b1498..36fff45e8c9b 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1421,10 +1421,6 @@ void gserial_disconnect(struct gserial *gser)
 	/* REVISIT as above: how best to track this? */
 	port->port_line_coding = gser->port_line_coding;
 
-	/* disable endpoints, aborting down any active I/O */
-	usb_ep_disable(gser->out);
-	usb_ep_disable(gser->in);
-
 	port->port_usb = NULL;
 	gser->ioport = NULL;
 	if (port->port.count > 0) {
@@ -1436,6 +1432,10 @@ void gserial_disconnect(struct gserial *gser)
 	spin_unlock(&port->port_lock);
 	spin_unlock_irqrestore(&serial_port_lock, flags);
 
+	/* disable endpoints, aborting down any active I/O */
+	usb_ep_disable(gser->out);
+	usb_ep_disable(gser->in);
+
 	/* finally, free any unused/unusable I/O buffers */
 	spin_lock_irqsave(&port->port_lock, flags);
 	if (port->port.count == 0)
-- 
2.48.1


