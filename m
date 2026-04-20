Return-Path: <linux-usb+bounces-36328-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKkdHHyl5WksmgEAu9opvQ
	(envelope-from <linux-usb+bounces-36328-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 06:03:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF458426A92
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 06:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E3763022F9F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 04:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0263815CE;
	Mon, 20 Apr 2026 04:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="MwDlRQyW"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3213B584;
	Mon, 20 Apr 2026 04:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657748; cv=none; b=eY6vOJrdTfQl8vl9hX+OmiHkrGv0skmCno5WTmt9i7RbU5/TF2CRzHhP644a/QscNAxlraVK5LVmpnNncRcMTyJPQOasVihWyOvHpEmPBXvu487uDqX5hmgEwiRr1qaMx6VJyKH/bXgvyHGsnnMPgQmSCHVm0B2HSNHBUHsPNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657748; c=relaxed/simple;
	bh=LUWwGPZPp+QtOTnXX7aMXIprLEd63YJ1rmLFDoIbOQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NTYpISw2U4H50TlxLVkMw33dh96l265WyO4EdVovi+nI7iGGz/oHemXO+kNJiJWnhpz7Aoaj9T+Bbptrnk9Hy8sbGtONSwwCd/VLhNNzDXgvhZ/LaD5dxQluzw047OqNJfbKyPNFUQV5PpnSYS2wpTCJrb5qcjou/E/pJLG2ubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=MwDlRQyW; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yYXakRZzxGtXcwY8nswP5J1yWRYzqxnLHuEhZlZWe4w=;
	b=MwDlRQyWI+9oSTHU0j1td2WebHQ/ETtz2l1W5UXKbgjjb3sCPT55LFOa6f7HkwejPntJLxPWQ
	W/CZUzAuKk/aJtmZE+k+QCryDHabaKSDp9l1C4kPR06d8phMvnsWTUKnQ00DSq56/2584fj2KfU
	Qg9/93QdhzdFSd/7vN34vZ0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fzWql58bGzpT0j;
	Mon, 20 Apr 2026 11:56:03 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8463340576;
	Mon, 20 Apr 2026 12:02:24 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 12:02:24 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 20 Apr 2026 12:02:23 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <gregkh@linuxfoundation.org>, <khtsai@google.com>, <hhhuuu@google.com>,
	<kees@kernel.org>, <kexinsun@smail.nju.edu.cn>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH] usb: gadget: udc: Fix overwriting the gadget driver of occupied udc
Date: Mon, 20 Apr 2026 12:02:23 +0800
Message-ID: <20260420040223.1232745-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
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
	TAGGED_FROM(0.00)[bounces-36328-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: DF458426A92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In gadget_match_driver(), the core only validates whether the gadget
driver is already bound, but it doesn't check the current state of
the UDC. This leads to gadget_bind_driver() (the probe stage) being
invoked for an already occupied UDC.

In gadget_bind_driver(), the code proceeds to overwrite 'udc->driver'
and forcibly modify the UDC speed without checking if the UDC is
currently in use. This results in state inconsistency and disruption
of the existing connection.

Fix this by adding a check for 'udc->driver' in
gadget_bind_driver().

Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/usb/gadget/udc/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index e8861eaad907..47e50fe1b75b 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1615,6 +1615,13 @@ static int gadget_bind_driver(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&udc_lock);
+	if (udc->driver) {
+		dev_err(&udc->dev, "UDC (%s) is already in use.\n",
+			dev_name(&udc->dev));
+		mutex_unlock(&udc_lock);
+		return -EBUSY;
+	}
+
 	if (driver->is_bound) {
 		mutex_unlock(&udc_lock);
 		return -ENXIO;		/* Driver binds to only one gadget */
-- 
2.33.0


