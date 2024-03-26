Return-Path: <linux-usb+bounces-8426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9B88C887
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 17:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF4D4B21AFA
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F34C13C8F9;
	Tue, 26 Mar 2024 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f0QLWlFH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91BB3D98E
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469030; cv=none; b=hT/hXHC8UcochnWAeKmmR+36oge78/amCFOmNfwi/j00Dko/1U8GCPYs3a/kYVXISgsEelkAsuLRDD+5LtgdZzFbpEL8qdcYpeYifPRtiortpQzAHJ4XN9r9PcKUWVd6IitaxrG8jk1pV/xMCoVmfGeEfIkyuTrXVihoIuBfFNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469030; c=relaxed/simple;
	bh=QvJl+W3Ut5hHOIEh+X0iFEBGXuIDBq8Qf+jqtoUT6MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxLG9wc1+JdMqevjYukZOJ6iuO1ppl7XyeH0S4c6vyrhorVmC6Qfgy5BKS96EcTalEAEEocuDXQ1FlUBw4wBDW5QAjHBzcxvM2Brn/2TRhfpNJndSf9svydOyaqLjl+27neNtbkNaUuFhVfRtLT6bRYrvh3Tv33fPBylNf0lN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f0QLWlFH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7992C433F1;
	Tue, 26 Mar 2024 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711469030;
	bh=QvJl+W3Ut5hHOIEh+X0iFEBGXuIDBq8Qf+jqtoUT6MI=;
	h=From:To:Cc:Subject:Date:From;
	b=f0QLWlFHCoUnhRXYYvfZuKg1e6Kb7coAlEAMjHKnaNz/+KchSCxkwS0NnnlYR8vy4
	 wJk9SairXu0/PTvsC2flm4LJlEdR/rvYGfdmLDYuj+Uw/GszI978IEPckdqmxjsD0/
	 BnTkb4YESn+PXOEsNncw08sZWHzBV24Ta9vVgjaU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ira Weiny <ira.weiny@intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] USB: gadget: dummy_hcd: switch char * to u8 *
Date: Tue, 26 Mar 2024 17:03:43 +0100
Message-ID: <20240326160342.3588864-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270; i=gregkh@linuxfoundation.org; h=from:subject; bh=QvJl+W3Ut5hHOIEh+X0iFEBGXuIDBq8Qf+jqtoUT6MI=; b=owGbwMvMwCRo6H6F97bub03G02pJDGlMH+/FHLC7cOeu981vr+X9r7zVNmP2erJD/E6pwu8PB hL7vaN8OmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAimWwMc4U2bMrev+qC9Drr hdJsPZ/98zn1vzIsWJqjanpWkcfk9YrmBEvPG391L0qeBAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The function handle_control_request() casts the urb buffer to a char *,
and then treats it like a unsigned char buffer when assigning data to
it.  On some architectures, "char" is really signed, so let's just
properly set this pointer to a u8 to take away any potential problems as
that's what is really wanted here.

Document that we are only using the lower 8 bits for the devstatus
variable (only 7 are currently used), as the cast from 16 to 8 is not
obvious.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Jakob Koschel <jakobkoschel@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 0953e1b5c030..1139fc8c03f0 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1739,13 +1739,13 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
 		if (setup->bRequestType == Dev_InRequest
 				|| setup->bRequestType == Intf_InRequest
 				|| setup->bRequestType == Ep_InRequest) {
-			char *buf;
+			u8 *buf;
 			/*
-			 * device: remote wakeup, selfpowered
+			 * device: remote wakeup, selfpowered, LTM, U1, or U2
 			 * interface: nothing
 			 * endpoint: halt
 			 */
-			buf = (char *)urb->transfer_buffer;
+			buf = urb->transfer_buffer;
 			if (urb->transfer_buffer_length > 0) {
 				if (setup->bRequestType == Ep_InRequest) {
 					ep2 = find_endpoint(dum, w_index);
@@ -1754,11 +1754,12 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
 						break;
 					}
 					buf[0] = ep2->halted;
-				} else if (setup->bRequestType ==
-					   Dev_InRequest) {
+				} else if (setup->bRequestType == Dev_InRequest) {
+					/* Only take the lower 8 bits */
 					buf[0] = (u8)dum->devstatus;
-				} else
+				} else {
 					buf[0] = 0;
+				}
 			}
 			if (urb->transfer_buffer_length > 1)
 				buf[1] = 0;
-- 
2.44.0


