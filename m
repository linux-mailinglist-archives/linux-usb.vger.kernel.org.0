Return-Path: <linux-usb+bounces-24665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B925AD3941
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 15:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7599C4E73
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F123ABAF;
	Tue, 10 Jun 2025 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Zc8sCQz/"
X-Original-To: linux-usb@vger.kernel.org
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6365246BC4
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561475; cv=none; b=IFX4cLzPnusLvk2QZcb+Wi46M2wX/0AIloT7WueRkQ5j3h43ODv31+FwbWpbOSTXIC/94dQO80eA7aMRAhB1S0kiti6ItuyVkOt6PzprhhpMszYMHmbU2j+2jShuGXEcJ/ncMq9SXBSZTSIy1os38xY4tX1Y2dRsMmtPgxAtKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561475; c=relaxed/simple;
	bh=dgnJk6wmLW4XwPG1ru9thQ6RaGFhSIeighu6cZwXtPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3pa59WBYkY3MGHRxdws3hjhml4uYhIkJG+T6lo0j7ObPwKZFc531YxYGs46X/iVVuxXYPw7EguowCDJgcVmgdj8wBK0/k/Lo8Prww4KfGmPMKk9f0L7jKa6XvQZ9Z+0mvrcGjhkvCZwB7+N04Ua6RKwB13YSkoUSEhDyyAvwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=Zc8sCQz/; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:c94:0:640:bcb2:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id 5CFB56097F;
	Tue, 10 Jun 2025 16:17:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id gHic2wnLla60-xKKhqgDf;
	Tue, 10 Jun 2025 16:17:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1749561463; bh=e4xRIwTi3m3lodnzoHEI7Y5y1+4nnj1njTgyMnl9VZA=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=Zc8sCQz/ljbbomWtPKI9xVYD0tFJCoVRXrDdBhvGbNx+1tsX/s9X7QkiandvWpwOW
	 wZnsg0L1cGxqUVbXzIHibZOtvN6jAk9/BGZl/ZrkXjHX/+OmZMDO5B8Mup8J8Drnsi
	 MNEpCsZeCmdd1d8N9XQ0jSVC0NJFclsWwh71Zub8=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Yuyang Du <yuyang.du@intel.com>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/2] usbip: vhci-hcd: zero sysfs output if port is not running
Date: Tue, 10 Jun 2025 16:17:17 +0300
Message-ID: <20250610131717.2316278-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131717.2316278-1-dmantipov@yandex.ru>
References: <20250610131717.2316278-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'status_show()', do not emit the header if no data was appended
after (i.e. by 'status_show_not_ready()' or 'status_show_vhci()'),
which makes sense if backed port is not actually running.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/usbip/vhci_sysfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 8c8e90646e6b..9aa54d1d6e4a 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -151,11 +151,12 @@ static int status_name_to_id(const char *name)
 static ssize_t status_show(struct device *dev,
 			   struct device_attribute *attr, char *out)
 {
-	char *s = out;
+	char *r, *s = out;
 	int pdev_nr;
 
 	out += sprintf(out,
 		       "hub port sta spd dev      sockfd local_busid\n");
+	r = out;
 
 	pdev_nr = status_name_to_id(attr->attr.name);
 	if (pdev_nr < 0)
@@ -163,7 +164,8 @@ static ssize_t status_show(struct device *dev,
 	else
 		out += status_show_vhci(pdev_nr, out);
 
-	return out - s;
+	/* Do not emit the header if no data was appended after. */
+	return r == out ? 0 : out - s;
 }
 
 static ssize_t nports_show(struct device *dev, struct device_attribute *attr,
-- 
2.49.0


