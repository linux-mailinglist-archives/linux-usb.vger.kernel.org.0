Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3372433FC
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgHMGZl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgHMGZk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:40 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3F0D2078D;
        Thu, 13 Aug 2020 06:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299940;
        bh=4uTIK2w8MtZvJJn/E0Mq5SkQK2HfkkABx1AyI5zNJKk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Aw5rvs+/6S/WPNiqgmQodMpDOUJjASmwQDOhlHkOr7Y8niLeE83+ntqX9EUMU71d6
         QHQ1Mb0I2BWBTMhF1Th0f3Rs+CPS24ewY/x75LOEGEdEhlLDUZ0Z6d1E/p/EolABdy
         35mnYNDngNo7yagX4eYTsd2FmcOfPiQq2dNMUbgE=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 02/11] dwc3: debug: fix sparse warning
Date:   Thu, 13 Aug 2020 09:25:23 +0300
Message-Id: <20200813062532.829720-2-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

Fix the following sparse warning:

drivers/usb/dwc3/trace.c: note: in included file (through drivers/usb/dwc3/trace.h):
drivers/usb/dwc3/debug.h:374:39: warning: cast to non-scalar

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/debug.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 3d16dac4e5cc..8e03bcb77da8 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -371,7 +371,9 @@ static inline const char *dwc3_gadget_event_type_string(u8 event)
 static inline const char *dwc3_decode_event(char *str, size_t size, u32 event,
 		u32 ep0state)
 {
-	const union dwc3_event evt = (union dwc3_event) event;
+	union dwc3_event evt;
+
+	memcpy(&evt, &event, sizeof(event));
 
 	if (evt.type.is_devspec)
 		return dwc3_gadget_event_string(str, size, &evt.devt);
-- 
2.28.0

