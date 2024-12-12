Return-Path: <linux-usb+bounces-18419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CA9EE4DA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 12:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BF84280C20
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 11:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3910A20E02D;
	Thu, 12 Dec 2024 11:15:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE691C5497
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002150; cv=none; b=RmR+G01mp6OsDvzbY7ujayJRpNOJb6GxHlW/VMnkXazmG7jKesCWkf+N8O5d4JxuX+AXdufmHxhf1H2Tl1rI8yT+4PaObFUwvD0ERa60S5VPnSOtDSSqnvEvOszcllwPy6gXkTa0Vk8m74Km4clVOTfOVsWGFqgaLaSOT2ytxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002150; c=relaxed/simple;
	bh=msvDEelk8BK5mdnHG6ztH5vQz9qQ9wp90PjcB2UM7/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rdq33ILMKrcPaNmlsWabQW27m2lfnCRh1ZGJYjxCwPmKizZ+/sTowqu3Fdg37/pnD7NRVnA7g6piKtZaOR2UO+XRpvcSsPpnMxvGKWoFFgyEyVmlcd5IT5ZGGnGOuMWI6n9ozTcg2DYZmKQuQtmH6xOi/kiuD4oYQpkdiE0RSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id E9CA04270ECC;
	Thu, 12 Dec 2024 12:10:14 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH] usb: gadget: configfs: Ignore trailing LF for user strings to cdev
Date: Thu, 12 Dec 2024 12:10:04 +0100
Message-ID: <20241212111004.7901-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1734001815004

Since commit c033563220e0f7a8
("usb: gadget: configfs: Attach arbitrary strings to cdev")
a user can provide extra string descriptors to a USB gadget via configfs.

For "manufacturer", "product", "serialnumber", setting the string via
configfs ignores a trailing LF.

For the arbitrary strings the LF was not ignored.

This patch ignores a trailing LF to make this consistent with the existing
behavior for "manufacturer", ...  string descriptors.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 6499a88d346c..fba2a56dae97 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -827,11 +827,15 @@ static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
 {
 	struct gadget_string *string = to_gadget_string(item);
 	int size = min(sizeof(string->string), len + 1);
+	ssize_t cpy_len;
 
 	if (len > USB_MAX_STRING_LEN)
 		return -EINVAL;
 
-	return strscpy(string->string, page, size);
+	cpy_len = strscpy(string->string, page, size);
+	if (cpy_len > 0 && string->string[cpy_len - 1] == '\n')
+		string->string[cpy_len - 1] = 0;
+	return len;
 }
 CONFIGFS_ATTR(gadget_string_, s);
 
-- 
2.47.1


