Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFB0243403
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgHMGZu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbgHMGZt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:49 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 765002078B;
        Thu, 13 Aug 2020 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299949;
        bh=aUkQhSpnz0EAP2TMP52WAGt/FB1bys0KsQpqMX4ZYEc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PEQcJ2olTquq2JY5moDfi2G3cztapOrJUB4QgBDyAy2tfCaTU8QxBHrr9q97ErQZ+
         pewWSOR07sAjx6Dx0yumoS5wFOqhGiah57rw4jD/N4WHH7Yxw5wDPOOUu+2MriqrPQ
         zelloZVbrxZ0pQRU4OwOU5JIH06SFHLfJL4xJRC0=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 09/11] dwc3: ep0: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:30 +0300
Message-Id: <20200813062532.829720-9-balbi@kernel.org>
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
 drivers/usb/dwc3/ep0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 59f2e8c31bd1..5bb4327ae237 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -105,7 +105,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 	 * IRQ we were waiting for is long gone.
 	 */
 	if (dep->flags & DWC3_EP_PENDING_REQUEST) {
-		unsigned	direction;
+		unsigned int direction;
 
 		direction = !!(dep->flags & DWC3_EP0_DIR_IN);
 
@@ -127,7 +127,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 	 * handle it here.
 	 */
 	if (dwc->delayed_status) {
-		unsigned	direction;
+		unsigned int direction;
 
 		direction = !dwc->ep0_expect_in;
 		dwc->delayed_status = false;
@@ -172,7 +172,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 	 * XferNotReady(STATUS).
 	 */
 	if (dwc->three_stage_setup) {
-		unsigned        direction;
+		unsigned int direction;
 
 		direction = dwc->ep0_expect_in;
 		dwc->ep0state = EP0_DATA_PHASE;
-- 
2.28.0

