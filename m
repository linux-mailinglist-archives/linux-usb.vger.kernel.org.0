Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D412FAAF3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 21:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394175AbhARUHD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 15:07:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:57304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390067AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D9B422BE9;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=03DJ2Xb4vsYJDuCHccpkiDCJVeNJxj4+xL4tAslZr+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RQTmTJdlmDK0BfNq+Skgf8pvxf0R3fhCnS9e3o0zqhOv2aJOd93/r8yz7DdEfX0h9
         i+ZIlfndlOnFDb+p4ZCfHeh7gi6yDL6x0c8lZ69mpFw3/3AC+eqdKjxVl5Mzux47RB
         HJ9uJLOVmKTVapRm//y61lGJkUlFfYmqRds2iuWhDG7HqqBcrtUwBbYw/jhb6olRXU
         i1rs/MX5M7brlDRBmMgWtFD4M+eEsDINcifQDafbsU+g1ITVVcYRICvxoVT/ykJZFY
         kMYy2Ga4NkJUYGBZsRZdinR77yGyxmp4sdQCSz66ILMpKm5vbdYNqfdsXLfrKhqA+z
         i6tAcDa5sDcIw==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUc-0001MA-BB; Mon, 18 Jan 2021 12:14:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] USB: serial: f81534: drop short control-transfer check
Date:   Mon, 18 Jan 2021 12:14:26 +0100
Message-Id: <20210118111426.5147-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to check for short control transfers when sending data
so remove the redundant sanity check.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/f81534.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
index 5661fd03e545..dd7e55e822ef 100644
--- a/drivers/usb/serial/f81534.c
+++ b/drivers/usb/serial/f81534.c
@@ -235,11 +235,9 @@ static int f81534_set_register(struct usb_serial *serial, u16 reg, u8 data)
 					 USB_TYPE_VENDOR | USB_DIR_OUT,
 					 reg, 0, tmp, sizeof(u8),
 					 F81534_USB_TIMEOUT);
-		if (status > 0) {
+		if (status == sizeof(u8)) {
 			status = 0;
 			break;
-		} else if (status == 0) {
-			status = -EIO;
 		}
 	}
 
-- 
2.26.2

