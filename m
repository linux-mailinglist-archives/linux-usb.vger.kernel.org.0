Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762742433FE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgHMGZp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbgHMGZo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:44 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7012206B5;
        Thu, 13 Aug 2020 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299944;
        bh=sDrMmYcP4o7K9LD9J2okuR9gIb8aKW38EpjKeOsy/90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pGYF8w4EZHa8EWzUiOBPqO+R+yoPZOQ6N0T+ryJjnEo40LpY33FhjvVIUY4ta6FgG
         0IkB3Z2qJQax9She9ANU7nC5Ydj8U+mj7Mlh3erq6L7ow1PmnAbiGDTBUQVYQI6pLF
         A4yeC6HeCu2n0LN1XqYR0TyhWUy75sgQj+2IwNDY=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 05/11] dwc3: trace: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:26 +0300
Message-Id: <20200813062532.829720-5-balbi@kernel.org>
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

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/trace.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index da1be01637c8..97f4f1125a41 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -104,8 +104,8 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 	TP_STRUCT__entry(
 		__string(name, req->dep->name)
 		__field(struct dwc3_request *, req)
-		__field(unsigned, actual)
-		__field(unsigned, length)
+		__field(unsigned int, actual)
+		__field(unsigned int, length)
 		__field(int, status)
 		__field(int, zero)
 		__field(int, short_not_ok)
@@ -246,6 +246,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
+
 		switch (__entry->type) {
 		case USB_ENDPOINT_XFER_INT:
 		case USB_ENDPOINT_XFER_ISOC:
@@ -291,12 +292,12 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 	TP_ARGS(dep),
 	TP_STRUCT__entry(
 		__string(name, dep->name)
-		__field(unsigned, maxpacket)
-		__field(unsigned, maxpacket_limit)
-		__field(unsigned, max_streams)
-		__field(unsigned, maxburst)
-		__field(unsigned, flags)
-		__field(unsigned, direction)
+		__field(unsigned int, maxpacket)
+		__field(unsigned int, maxpacket_limit)
+		__field(unsigned int, max_streams)
+		__field(unsigned int, maxburst)
+		__field(unsigned int, flags)
+		__field(unsigned int, direction)
 		__field(u8, trb_enqueue)
 		__field(u8, trb_dequeue)
 	),
-- 
2.28.0

