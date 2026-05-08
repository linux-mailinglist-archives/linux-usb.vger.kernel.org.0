Return-Path: <linux-usb+bounces-37120-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id METzBtCr/WlOhgAAu9opvQ
	(envelope-from <linux-usb+bounces-37120-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 11:24:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 692B94F436C
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 11:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5C23044806
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 09:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C043A5426;
	Fri,  8 May 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EvGYKEbf"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA113A3833;
	Fri,  8 May 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778232082; cv=none; b=jhP20qUM4gZZTkvuYZ1v68OyHir5znLFmPi+VAaXxW+vfcb1Alqj2f+FIT0BeZDfOlz6WFEmnJACNl12S5OjX7ZjYYh3jFGdMJt0R1Ie+LIRtalNtfHT4i0gNfNdrvZqwlEcYgHeKtgwnC0FRSTveyWXDIirxlIVXyG1jWFW2HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778232082; c=relaxed/simple;
	bh=l7lhpDECfNT7HqZNFmLcYUZ3ly8Z8qClLJSAliKeA8k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vw+IitODriXT5f6YThS2s+vCCS+nePqiOcjcI8GWf+ivVYSP13v4HgAh3mGVA4LtIJzNXIaupGmTqOHyzSq3fKXw6cvSTejEaY+Glqx0E4pHJP1vFFXlmXpNdxLnY75vGP4W98pTPGd2JDZUB3LQQky49k9iFn3S4Wz7/FxMGv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EvGYKEbf; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=051ya+EB5ok/BOV5S7k3vyiDHHOZBrGQyJBZSY/e3Vw=;
	b=EvGYKEbfoiF2r8o3QOz8lNV3xMkmvKUtchBPuhBgOlBv9WuyXxwgeZZDAy0+8vzG+Ym2ufVj5
	t0pQY757896tqGpDAMinbnySRgUisG+Qg+yme7/vRVQuhe9pcfCvp+rCt097HZLG/rrXiNtsI36
	h5cUy1I5z+XOhZg140GiNIU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gBk1t4Cr7z1K97g;
	Fri,  8 May 2026 17:13:38 +0800 (CST)
Received: from kwepemr500015.china.huawei.com (unknown [7.202.195.162])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D58240573;
	Fri,  8 May 2026 17:21:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemr500015.china.huawei.com
 (7.202.195.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 8 May
 2026 17:21:10 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <heikki.krogerus@linux.intel.com>, <nathan.c.rebello@gmail.com>
CC: <gregkh@linuxfoundation.org>, <kyungtae.kim@dartmouth.edu>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number in ucsi_connector_change
Date: Fri, 8 May 2026 17:20:26 +0800
Message-ID: <20260508092026.1364820-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr500015.china.huawei.com (7.202.195.162)
X-Rspamd-Queue-Id: 692B94F436C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37120-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[lihongbo22@huawei.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
typec: ucsi: skip connector validation before init") add the bounds
check when do the connector change both in pre-init notification and
the forward notifications. But they are difficult to backport to
early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
Instead, we choose to validate connector number in ucsi_connector_change
directly to avoid out-of-range issue.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b88f4e179a7a..4f5a72a1fbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -960,13 +960,20 @@ static void ucsi_handle_connector_change(struct work_struct *work)
  */
 void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
-	struct ucsi_connector *con = &ucsi->connector[num - 1];
+	struct ucsi_connector *con;
 
 	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
 		dev_dbg(ucsi->dev, "Early connector change event\n");
 		return;
 	}
 
+	if (ucsi->cap.num_connectors && num > ucsi->cap.num_connectors) {
+		dev_err(ucsi->dev, "bogus connector number in CCI: %u\n",
+			num);
+		return;
+	}
+	con = &ucsi->connector[num - 1];
+
 	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
 		schedule_work(&con->work);
 }
-- 
2.34.1


