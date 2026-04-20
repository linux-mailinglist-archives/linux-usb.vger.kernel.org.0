Return-Path: <linux-usb+bounces-36327-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIYYH1uk5WksmgEAu9opvQ
	(envelope-from <linux-usb+bounces-36327-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:58:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8C426A40
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3E33038A7A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 03:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996AB3806A7;
	Mon, 20 Apr 2026 03:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="eBU0B3cu"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA683803D1;
	Mon, 20 Apr 2026 03:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657454; cv=none; b=ulCWkT4GoMHPKP53qDka0rBCg+epjxFqqs7A7Vk5FYPi960qLYrMrPk/kyVkS86/yoAXdETdRUcHFuHMGV5fKFtMZKC34AhncGBg0xx6I+QptLjYHUC/sgVLqny1r8vDmg+UsyeCq1t980IjJwv7qkJOg8ophjjDRm1ga5ZwhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657454; c=relaxed/simple;
	bh=/DwIQWfY5//owc51JwHn7VqUePVGUACM6pw0ea8nNhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KvGLTdgR3JFJBqIN3IZIt7zhiiDmVRYPDwsy1Hto8FoYbtcNdlwC23waJGrhXmbtH6+zzGrSyWC1hRbtfauQ3PfJkP8HRclcavNjUDoUV+bRZsjHCsVZaVM7Yfa1K2Op77V4YBp62GwPbH1XzGMV9Sx/7cwyoVSI928SkhRtAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=eBU0B3cu; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=63b7WHVxZ4IhGyqurm703PYoxhN4AhlIQm8VHhGUeBU=;
	b=eBU0B3cuxm2ItmR+w9kxRiBecQ/DALu59kuiJns2cV2sPw8jnswiXvwZCMtHUbJJEcn8KbHGz
	ZXCZB4GdHYVKsNaVHGuAZQgOUM0A10CLgkr+DeYbxzLJJIP7p7mblBEDYS33pKMIyBHRods5WbV
	o708VKPUrnBHfScyDrNQGtQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fzWjz4tNSzRhQx;
	Mon, 20 Apr 2026 11:51:03 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id E729E40537;
	Mon, 20 Apr 2026 11:57:24 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 11:57:24 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 20 Apr 2026 11:57:24 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <gregkh@linuxfoundation.org>, <khtsai@google.com>, <hhhuuu@google.com>,
	<kees@kernel.org>, <kexinsun@smail.nju.edu.cn>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 2/2] usb: gadget: udc: simplify connect_lock holding using guards
Date: Mon, 20 Apr 2026 11:57:22 +0800
Message-ID: <20260420035722.1133418-3-lihuisong@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[h-partners.com:+];
	TAGGED_FROM(0.00)[bounces-36327-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14D8C426A40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use guard() and scoped_guard() to manage connect_lock to simplify the
code in gadget_bind_driver() and gadget_unbind_driver().

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/usb/gadget/udc/core.c | 53 ++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index e3f27fb39e9e..1d615a870907 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1630,31 +1630,26 @@ static int gadget_bind_driver(struct device *dev)
 	if (ret)
 		goto err_bind;
 
-	mutex_lock(&udc->connect_lock);
-	ret = usb_gadget_udc_start_locked(udc);
-	if (ret) {
-		mutex_unlock(&udc->connect_lock);
-		goto err_start;
+	scoped_guard(mutex, &udc->connect_lock) {
+		ret = usb_gadget_udc_start_locked(udc);
+		if (ret)
+			goto err_start;
+		usb_gadget_enable_async_callbacks(udc);
+		udc->allow_connect = true;
+		ret = usb_udc_connect_control_locked(udc);
+		if (ret) {
+			udc->allow_connect = false;
+			usb_gadget_disable_async_callbacks(udc);
+			if (gadget->irq)
+				synchronize_irq(gadget->irq);
+			usb_gadget_udc_stop_locked(udc);
+			goto err_start;
+		}
 	}
-	usb_gadget_enable_async_callbacks(udc);
-	udc->allow_connect = true;
-	ret = usb_udc_connect_control_locked(udc);
-	if (ret)
-		goto err_connect_control;
-
-	mutex_unlock(&udc->connect_lock);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 	return 0;
 
- err_connect_control:
-	udc->allow_connect = false;
-	usb_gadget_disable_async_callbacks(udc);
-	if (gadget->irq)
-		synchronize_irq(gadget->irq);
-	usb_gadget_udc_stop_locked(udc);
-	mutex_unlock(&udc->connect_lock);
-
  err_start:
 	driver->unbind(udc->gadget);
 
@@ -1680,18 +1675,18 @@ static void gadget_unbind_driver(struct device *dev)
 
 	udc->allow_connect = false;
 	cancel_work_sync(&udc->vbus_work);
-	mutex_lock(&udc->connect_lock);
-	usb_gadget_disconnect_locked(gadget);
-	usb_gadget_disable_async_callbacks(udc);
-	if (gadget->irq)
-		synchronize_irq(gadget->irq);
-	mutex_unlock(&udc->connect_lock);
+	scoped_guard(mutex, &udc->connect_lock) {
+		usb_gadget_disconnect_locked(gadget);
+		usb_gadget_disable_async_callbacks(udc);
+		if (gadget->irq)
+			synchronize_irq(gadget->irq);
+	}
 
 	udc->driver->unbind(gadget);
 
-	mutex_lock(&udc->connect_lock);
-	usb_gadget_udc_stop_locked(udc);
-	mutex_unlock(&udc->connect_lock);
+	scoped_guard(mutex, &udc->connect_lock) {
+		usb_gadget_udc_stop_locked(udc);
+	}
 
 	scoped_guard(mutex, &udc_lock) {
 		driver->is_bound = false;
-- 
2.33.0


