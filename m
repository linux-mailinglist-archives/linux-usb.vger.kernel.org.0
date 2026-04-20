Return-Path: <linux-usb+bounces-36326-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKo0LFSk5WksmgEAu9opvQ
	(envelope-from <linux-usb+bounces-36326-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:58:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F91426A31
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D397303674F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 03:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0763806A0;
	Mon, 20 Apr 2026 03:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="aoguHVJr"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836A3806AD;
	Mon, 20 Apr 2026 03:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657454; cv=none; b=e/Bc0RX/1TYEWSIZ0pu4NEdgHgNDm47tuBged67yP1LZ8MQUzmFRxluVhnrhIKwQ8WP9uaiq12IOjGcYf4wWTa9D2OIgIBibIWqBEr8H7Ywvcx5YOvga65XceOa5rpRgRdlKoM3w4yu/nSBqZ2pDH2xB83LXMRVXVnZyUmfyUHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657454; c=relaxed/simple;
	bh=Rm6iwVuByTgoXkBLXpXePum6qM/JZgF65rTxYVDkxcw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZPMRLWPqFwlY6QTViDt6ONHergba8I7MbtxTw46MotiulHTGV+kxn7UAmQsV61YmbO8ZUizHXdhSdGPcu39Zoxr7nETfTljpt+7kLXGU/W1yil60zmKuUwyKBcans1uQHxSfDhbUhWfSsvqDxnfkRqeSZEOdguPUuwiM+cm56w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=aoguHVJr; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BYZw0QkU3WBRnmOWhS0OBKNqo5gQOBr3xM0MHICEVxs=;
	b=aoguHVJrKpOgIj15ZRKV/oFP7k9ud6pjFegboqsqM3bz1qNu5ZCukQyajQex9Dp6VYOyFeY2r
	2NtQ+y6Ezj73xAInEF/CxfzNweKHt2ry3PA09/oOYgRyhKd7Z3hv7I/3rBLNBcWBRb0CkuxM/q5
	PaW1tYK2Adz1xobbxPqXmNI=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fzWjz0FlNzRhQx;
	Mon, 20 Apr 2026 11:51:03 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B94440576;
	Mon, 20 Apr 2026 11:57:24 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 11:57:24 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 20 Apr 2026 11:57:23 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <gregkh@linuxfoundation.org>, <khtsai@google.com>, <hhhuuu@google.com>,
	<kees@kernel.org>, <kexinsun@smail.nju.edu.cn>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 1/2] usb: gadget: udc: simplify udc_lock holding using guards
Date: Mon, 20 Apr 2026 11:57:21 +0800
Message-ID: <20260420035722.1133418-2-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260420035722.1133418-1-lihuisong@huawei.com>
References: <20260420035722.1133418-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-Spamd-Result: default: False [1.34 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[h-partners.com:+];
	TAGGED_FROM(0.00)[bounces-36326-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43F91426A31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use guard() and scoped_guard() to manage udc_lock to simplify the code
in gadget_bind_driver() and gadget_unbind_driver().

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/usb/gadget/udc/core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index e8861eaad907..e3f27fb39e9e 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1614,14 +1614,13 @@ static int gadget_bind_driver(struct device *dev)
 			struct usb_gadget_driver, driver);
 	int ret = 0;
 
-	mutex_lock(&udc_lock);
-	if (driver->is_bound) {
-		mutex_unlock(&udc_lock);
-		return -ENXIO;		/* Driver binds to only one gadget */
+	scoped_guard(mutex, &udc_lock) {
+		/* Driver binds to only one gadget */
+		if (driver->is_bound)
+			return -ENXIO;
+		driver->is_bound = true;
+		udc->driver = driver;
 	}
-	driver->is_bound = true;
-	udc->driver = driver;
-	mutex_unlock(&udc_lock);
 
 	dev_dbg(&udc->dev, "binding gadget driver [%s]\n", driver->function);
 
@@ -1664,10 +1663,9 @@ static int gadget_bind_driver(struct device *dev)
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			driver->function, ret);
 
-	mutex_lock(&udc_lock);
+	guard(mutex)(&udc_lock);
 	udc->driver = NULL;
 	driver->is_bound = false;
-	mutex_unlock(&udc_lock);
 
 	return ret;
 }
@@ -1695,10 +1693,10 @@ static void gadget_unbind_driver(struct device *dev)
 	usb_gadget_udc_stop_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 
-	mutex_lock(&udc_lock);
-	driver->is_bound = false;
-	udc->driver = NULL;
-	mutex_unlock(&udc_lock);
+	scoped_guard(mutex, &udc_lock) {
+		driver->is_bound = false;
+		udc->driver = NULL;
+	}
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 }
-- 
2.33.0


