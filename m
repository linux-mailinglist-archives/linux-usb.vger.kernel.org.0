Return-Path: <linux-usb+bounces-2372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A07DC281
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 23:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55A05B20EA5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 22:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC691A700;
	Mon, 30 Oct 2023 22:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uScaisRt"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDF1DA2D
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 22:32:06 +0000 (UTC)
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b0])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFCFFD
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 15:32:03 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698705122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dX/CNNGfQ6c5dPpCwI6UOaZajkT8HSm2ODmF0tBLXhk=;
	b=uScaisRtxc5f6AxWz0R5aDz611fTWv469IFtr/9dW7S9xusx288MD3RyerH5qDTRPO8jya
	Z+arpJXjJIjVI45nX2tmbTlrMkHzZPjDNkvS28ac0RLP3wwWOH6SEd2afXdlWwhrDPAFwH
	pj0kFs68VWruzszKBSMnFDwo6/ea56I=
From: andrey.konovalov@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: raw-gadget: update documentation
Date: Mon, 30 Oct 2023 23:31:58 +0100
Message-Id: <20231030223158.36636-1-andrey.konovalov@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Andrey Konovalov <andreyknvl@gmail.com>

A recent patch added reporting of more event types to Raw Gadget.

Update the documentation to reflect that this feature has been
implemented.

Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
---
 Documentation/usb/raw-gadget.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
index 818a1648b387..59b2132b584d 100644
--- a/Documentation/usb/raw-gadget.rst
+++ b/Documentation/usb/raw-gadget.rst
@@ -81,9 +81,6 @@ feature must be kept in the implementation.
 Potential future improvements
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Report more events (suspend, resume, etc.) through
-  ``USB_RAW_IOCTL_EVENT_FETCH``.
-
 - Support ``O_NONBLOCK`` I/O. This would be another mode of operation, where
   Raw Gadget would not wait until the completion of each USB request.
 
-- 
2.25.1


