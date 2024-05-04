Return-Path: <linux-usb+bounces-10026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223C8BBCA4
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2024 17:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BD01C20D3B
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2024 15:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D54F5473A;
	Sat,  4 May 2024 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="KlFw4HAP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078CE4F88C;
	Sat,  4 May 2024 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714835004; cv=none; b=aNRH6o1yk6pk9Q/fQi+s0tKxL48dmhVfUzNV0TD1h4dD6NflxSojw0Mm4bIrPMnrQIm/YYrYK6OY+VEN1TTkwdRFWBBx/RBAKc1DXAQGRY/S36nZl20tubCr76bHacZv8AcwPkKrn8Ub3730++JJktDTtj0WctvMAiai6D6/jNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714835004; c=relaxed/simple;
	bh=kLcNP1M1+W5nk0/OLLoVrMbqlISqkONaxKGslNX8z6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCeSgJvnpJKden5mA9GMA14xdpAu50v7XwwPEvXQ/xjNlp2wHoKyhVoSOYslte/FgxV1si3IQohMeCj2G8LLmjqGAWNBfpXpFP1Ur83aWdxFjk4jXKhnsEZjSYtbwdLFZto3eKzWV25bUta6pLCnbZ91n5G1o1N/10SOL7BqkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=KlFw4HAP; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=g0WbdKNjCehdCeRJHZ2paTLwnUugU8MB7EB+xl8jZe4=; b=KlFw4HAPDr7amoLO
	o3X79WcNRMuVEDhJpBSFJh+7dDVuzz7vh3y3g+0vMkWXF6gWdO1U+T6D5sFXrU1L5+sXFun0z/YVA
	o2nzWI0MfcBE4/zVd3c56ajdgz1Pc9dIhkRc8uOU0kCksgaertYYmKLAGZOz9zrEH2x/xbgPXHSBo
	PgA5Mus4PTcAlZyRh5gKeFNxNbgwgShA3pHziOFSy0QyOYFN2Njofdind/6/j337+xOJMfaLSC4tE
	eGAAj3yB6ZwuKLkQi8Q+cI3vXtaw6YfRXQhTHeO4roYBv/8RAI35vhz95gUU1TZpDy2EKO7TrmM7Z
	JGIedcKETSpYnwzdAw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1s3Gv0-004hjR-0Y;
	Sat, 04 May 2024 15:03:18 +0000
From: linux@treblig.org
To: b-liu@ti.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] usb: musc: Remove unused list 'buffers'
Date: Sat,  4 May 2024 16:03:15 +0100
Message-ID: <20240504150315.77598-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Remove the unused list head 'buffers' and the
'struct free_record' which is also unused below it.

To me it looks like this has always been unused, but I've
not dug into why.

Build test only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/usb/musb/musb_gadget.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 55df0ee413d8e..bdf13911a1e59 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1156,15 +1156,6 @@ void musb_free_request(struct usb_ep *ep, struct usb_request *req)
 	kfree(request);
 }
 
-static LIST_HEAD(buffers);
-
-struct free_record {
-	struct list_head	list;
-	struct device		*dev;
-	unsigned		bytes;
-	dma_addr_t		dma;
-};
-
 /*
  * Context: controller locked, IRQs blocked.
  */
-- 
2.45.0


