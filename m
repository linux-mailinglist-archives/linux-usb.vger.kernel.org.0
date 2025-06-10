Return-Path: <linux-usb+bounces-24666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F413AD3944
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 15:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2053D1BA502E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 13:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F01F23ABAD;
	Tue, 10 Jun 2025 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="R/SCdmfb"
X-Original-To: linux-usb@vger.kernel.org
Received: from forward205d.mail.yandex.net (forward205d.mail.yandex.net [178.154.239.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2A18D643
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561787; cv=none; b=TnjNZLw+t0lbhLkVyzeysAMycAIHh2ocAkr3gH5g67jglYYBmstEJGxC5G+au6HqoxDNdCjZzCVt3Vh3+CNwaFUY9LOqVtDGMUqV2/HE/csP5n2yFS187hlbXZm9CZrn00Xdcm/uGVuYGAGvTnrXNAH/YMZ3iXssmud3q4ssWgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561787; c=relaxed/simple;
	bh=M9mo6qOr2o0n5+HXfeyXmP4uFyBghmSFrY3YMwhmS60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVK0d+4jwgV/TgGq7r6X7YfCEIM2nJoNg9lXm3GBMRN3ASQEWk4Fe97H6rvINXxiVCvq26eBWdafRdOdnckVFw0xl/2YqzjkWqEgeLTcEiETr8mXVqcnNd9zBzJK+gTM6TnxDi6mi7n4SqEwzFgLBUIFaaqQmm29SwyaxwPs6bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=R/SCdmfb; arc=none smtp.client-ip=178.154.239.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward205d.mail.yandex.net (Yandex) with ESMTPS id CC0B16586C
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 16:17:51 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:c94:0:640:bcb2:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id AB49C60B1B;
	Tue, 10 Jun 2025 16:17:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id gHic2wnLla60-kLqW9olX;
	Tue, 10 Jun 2025 16:17:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1749561463; bh=HczdRNqElkjFEw/GnXyAmysehwpe6UP9h9oclPCJs50=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=R/SCdmfbqBmSG3z6p7mSfokv2icTMUkR5p0iyvoxrnhNZgJK++srte+eNoXyg7LEh
	 E9yBSc7xJsAfCCNvPuP8qAKPtjYh8pK2lvsow19D954xymlvz1c7P6ky5NRC8OwNd4
	 0bVVMScPFS7w5ez+W8yeLL5ET5RzERGhqyRkKXb0=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Yuyang Du <yuyang.du@intel.com>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com
Subject: [PATCH 1/2] usbip: vhci-hcd: do not show port status if the latter is not ready
Date: Tue, 10 Jun 2025 16:17:16 +0300
Message-ID: <20250610131717.2316278-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'status_show_vhci()', do not go further if the port is
not actually running but just emit 'dev_warn()' instead.

Reported-by: syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/usbip/vhci_sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index d5865460e82d..8c8e90646e6b 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -76,6 +76,10 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	}
 
 	hcd = platform_get_drvdata(pdev);
+	if (hcd == NULL) {
+		dev_warn(&pdev->dev, "port is not ready\n");
+		return 0;
+	}
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
-- 
2.49.0


