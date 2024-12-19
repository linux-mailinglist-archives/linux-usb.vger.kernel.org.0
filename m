Return-Path: <linux-usb+bounces-18681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64A9F7DC3
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 16:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6089B188306F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8068F22579B;
	Thu, 19 Dec 2024 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="K5CnuqIl"
X-Original-To: linux-usb@vger.kernel.org
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5741C64;
	Thu, 19 Dec 2024 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621153; cv=none; b=D76CwuOIp9CIa9r1Iaj4gGqMi+n0lFyT2DoKUy79RJQGweeAIKiqiErBJSsw1jRFiU2s9haaBCFqjuCDMyTA84Hkk+SMieATElKI2NOb+apssyOIKuh64KSbCVnW+2MNzffvy2FcA2oZDoZHoEBenerJvyWHzDRlM6dXYFnV/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621153; c=relaxed/simple;
	bh=UGd6WjXfopsF+CAhJg6PHIQChesAdRt7UZYFV9Y78fw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ELVoRq+LuP/9KzP77nVNDBkUVvmQzcvyMgJhct9VWcECFVy3IY6AKpsutN7wdBg1ItGw47CzcxpbHzNhKRUzi12LgMR5xa3v4Mw9+00lZZAydPNEBdHNVU0oaR9RhBW5cdEFQVz84rj4YuKQk40Id9QUAQaWDC1CLBddOr4936I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=K5CnuqIl; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1734621146;
	bh=gztq0FmO3SMdmwGEI60BHOfGaZ1cOVf9xf0Mf/XKnQM=;
	h=From:To:Cc:Subject:Date;
	b=K5CnuqIlqPh+Xwv3+jeYLqc4DcdLx79+zbDnJKfEJp7lxekQFp77w4KBHAy3M4nzl
	 3Y7hXOhScoVMtY5frWlUmIZasgcgMhkc9egZ2Cg70z0RXy3CgMTONGJGQ6SQrED7Ak
	 eHj8QlR4EkS5rBTdHkPodkQJGg8yhpjjoneaJfkY=
Received: from localhost.localdomain ([171.223.167.17])
	by newxmesmtplogicsvrszc25-0.qq.com (NewEsmtp) with SMTP
	id 3180D2C6; Thu, 19 Dec 2024 23:12:24 +0800
X-QQ-mid: xmsmtpt1734621144tx1e60rpx
Message-ID: <tencent_0BEB55520D6C9419EC1AC6647AF19BF34E06@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntuj4oBgfGwzeNZpm2Kt9Z2uo83/YK6eqRDBZibDz7lMWcRqWkfcah
	 mXu4/KUnb9+TlOrS7KjkaUlLIkIzh7UfSVnSkxzVHkghHjoCuh0X9gcM3Wsb3/mmoS0mBzwRWL5h
	 CRoN6HJmPtgTC50+qCKn0u+28YBbTFEVWBCO5cqxQIepm5aP+oqgldwNFUbVjjhP7IJiLSIYyray
	 ZPacHO8Dr4jW6wHQCZ6tYfh8ER1+Bypd9tGrJF+ejpfNxz86FhZeTjn9Cx2LUh8WBQfEkSDTH32z
	 y9sDssK7c11ix6z0WB7qg+KVMc3ecLlFHjfEW83yAHxPciy18ClHSVn30Ziy4yettqz6ibYrcuOT
	 f6vLyvi208cGu4nZ8eCljg9sRzAR6ArUideX+LLAm0xBsOewzeh5An27kAT8XAQs8mK4HsBWvSM2
	 QPCY8GwZwwUd+dFkvsOkYSg88fjRI+4lSJMNhtZi9JbMJCzgBWlhm3Aapa4z7rThkM3cNNv9DHHK
	 5yy+4OTNj6Pf1pXPr90jzvVgfR93QCDA+yDyI4ZMMHm6a/X48rAa+g3rPsJrX2K0leEf5/C/Cqrk
	 lI2giJfP+wIc3Z61uIKFUcVbJ4eO1ITX++LauCRSpFa+LYWdaPVoqqW8F1nEt02NJgBPG4uric0B
	 KuzS1bIZJLpq0HfOFAxfWQ1yejSgVB7P6jEpKZxcjFuNIjjC76B0tW5OKxUPgDeB6zRx7R1pnIwP
	 76pCIF4KyR0wRFw01ilZDhJ8ml0apjR8SJUH5NOZw73z/VFAASTnzySUYYHMnKFqrMoazhjdlfe/
	 RrknSblwBYdYa4vWv2eT1Nzy2KMqUd6U+b7KlioeWeLG4DsnVQuWVqUyux9Hso/EvsiRfLcxkUQE
	 2IhMhafcVD8ACF+G+8VZiZ0YCgpihmRZot8u+sf84mR+xe9Yc044wX85336j2QNIE4fAqjBrpMcg
	 /9HkFFGj5RlwhKx2hdbmQFJLlkZ+LH69uKBW8qghwfzRDPYz44wA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Renjun Wang <renjunw0@foxmail.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] usb: dwc3: gadget: remove not used field dwc3_request.sg
Date: Thu, 19 Dec 2024 23:12:22 +0800
X-OQ-MSGID: <20241219151222.6287-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on commit 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling"),
the field dwc3_request.sg is no longer needed and not used in any
other files, remove it.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/usb/dwc3/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..3be069c4520e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -956,7 +956,6 @@ struct dwc3_request {
 	struct usb_request	request;
 	struct list_head	list;
 	struct dwc3_ep		*dep;
-	struct scatterlist	*sg;
 	struct scatterlist	*start_sg;
 
 	unsigned int		num_pending_sgs;
-- 
2.39.5


