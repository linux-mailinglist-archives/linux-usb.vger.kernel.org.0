Return-Path: <linux-usb+bounces-24183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C3ABF665
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB327500674
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB4427C15A;
	Wed, 21 May 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pwd9TbuK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB922F769
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834903; cv=none; b=pG0GEa6nLTUq9JpX1DRwrLJFOlM1Bsf1lyIz9JVQBNdT0n3/pK+g1o3a5r0+MlTCVKWgwtunxXrDwOQ3mLynpG6m5WLYqhNwIMx3TBD5ChbysXUwDf7aV1HmKHtF01WHt+HNn5W1dFFtGIU8+oH2mLvtGrJoO/yY1Yo7FgidHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834903; c=relaxed/simple;
	bh=/c+kPONU2z0jwfBLVx4ZlK6KsuwneGOraN2rlGVjLcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ro87zrhb3m4aEAvSNnxlIHnm3drRldvSVwDRmqiQtv0nOZaVTmtrOMphXRCRXDcPp0VgA0KRMssWeQGHMBRnfS3P/cKU/zE2OdoLqC3vnFFstfw33kl1DjnvUTmyAsdn9CR0iQ+SYaeaa7uEIZqSWQecS5d1AlFAUOHWvR1Z+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pwd9TbuK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2951C4CEE4;
	Wed, 21 May 2025 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747834903;
	bh=/c+kPONU2z0jwfBLVx4ZlK6KsuwneGOraN2rlGVjLcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Pwd9TbuKUl23zXpVQcTjrMtvPgFliBD2C5g2DHNV9/2ZVjC3PdZVAtYGFFoK5XODn
	 xFvbx5GEcLW70GCpEHC4DmBwk0vOLevCYl3sEKdg0CZEtyx0m5/CGUpQGIbThknNk2
	 ZvaqiyifbSoTRR2JrV9tKC5UuAlJY6L+k3wnO96M=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: gadget: udc: fix const issue in gadget_match_driver()
Date: Wed, 21 May 2025 15:41:40 +0200
Message-ID: <2025052139-rash-unsaddle-7c5e@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 25
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=/c+kPONU2z0jwfBLVx4ZlK6KsuwneGOraN2rlGVjLcQ=; b=owGbwMvMwCRo6H6F97bub03G02pJDBm6N4Q3mpRL6L1m2/ujd8oJdbVmh2NKzysVXAPSnqixr 50dvsGrI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACayvZ9hfu3qyK3SWea8/rfK jkeeX1ewmDVjJsOC+e2fV7Ju3JU2SVlTsfiheU/j+aYbAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

gadget_match_driver() takes a const pointer, and then decides to cast it
away into a non-const one, which is not a good thing to do overall.  Fix
this up by properly setting the pointers to be const to preserve that
attribute.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 4b3d5075621a..d709e24c1fd4 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1570,7 +1570,7 @@ static int gadget_match_driver(struct device *dev, const struct device_driver *d
 {
 	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
 	struct usb_udc *udc = gadget->udc;
-	struct usb_gadget_driver *driver = container_of(drv,
+	const struct usb_gadget_driver *driver = container_of(drv,
 			struct usb_gadget_driver, driver);
 
 	/* If the driver specifies a udc_name, it must match the UDC's name */
-- 
2.49.0


