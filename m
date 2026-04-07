Return-Path: <linux-usb+bounces-36025-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ohGqJIte1GmrtQcAu9opvQ
	(envelope-from <linux-usb+bounces-36025-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 03:31:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D93A8B70
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 03:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 827F5302A068
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 01:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7070E1F30A4;
	Tue,  7 Apr 2026 01:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X8UdPNZa"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39961C695;
	Tue,  7 Apr 2026 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775525507; cv=none; b=OreqbxxZh4C2vTpu7jnqdDjqkx2SjVxewMDAoeOqS6sAuholGzZMA/r6iBEoDBiJMRTsk+GOHQgLI4M9aZcxO5DSy12rNkYKLgW/a3horVwpRunG1rXiPd+0ECxuIHPL0+IF1UEl8B2QvNb28gy7tlCxMC3cHhl+eVd1qgAxClQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775525507; c=relaxed/simple;
	bh=YuLEa5IRbu4lPqbcTLse3Mv9OnvByTRwrQlqXIkADCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d0xLa4ECK2kBblSmfOwEFJ8e/7hXy/DtVcmFg9JORYIfM9+dOWULe86Az5kQ/vBKL4gntYgKhqZmG1HrwN3/eZDPq1HSi0zR3VqJXhpsq1talTWq+mWcRjlJ5Db4RwkYrBG7yB1koWH4waHn4z7uFm/6QhMWRJiNGo1kRS9piGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X8UdPNZa; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9T
	U6nIR/eUUFXJPqt2PO5xrWEs486ZAY4PyrVBiccwg=; b=X8UdPNZaXd+hORY8zk
	n8RZw02FUypDrIB13256QFhfu0A3gkWtPHvHQaBVZIU2tDKZnkQ0gXYihnPvPrv3
	L18iIROI3MosvuxpEaCYNd6fK2hdXX6ZC6deWJJtJkJuhqLfCIQKcDr5ceWwhck2
	67O/90aOTN7lvFOo1RhyV4/Us=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBHNHFtXtRpKUsxDg--.56472S2;
	Tue, 07 Apr 2026 09:31:26 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] USB: of: Simplify with scoped for each OF child loop
Date: Tue,  7 Apr 2026 09:31:22 +0800
Message-Id: <20260407013122.1296818-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHNHFtXtRpKUsxDg--.56472S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1kCr4fKw15Kw4UtFyxKrg_yoWDXrg_CF
	s29F97Wr48KFWSgrsIvw4avFWvkwsF9Fn5JFZ3tF4fJ3WUuw1rGrnrZryrX345uFsrJryk
	Kwn2yr15Wrs7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_VWl3UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7A5C5WnUXm4CJgAA3s
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36025-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0B8D93A8B70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/core/of.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 763e4122ed5b..a6ee20d8774e 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -79,17 +79,13 @@ EXPORT_SYMBOL_GPL(usb_of_has_combined_node);
 static bool usb_of_has_devices_or_graph(const struct usb_device *hub)
 {
 	const struct device_node *np = hub->dev.of_node;
-	struct device_node *child;
 
 	if (of_graph_is_present(np))
 		return true;
 
-	for_each_child_of_node(np, child) {
-		if (of_property_present(child, "reg")) {
-			of_node_put(child);
+	for_each_child_of_node_scoped(np, child)
+		if (of_property_present(child, "reg"))
 			return true;
-		}
-	}
 
 	return false;
 }

base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
-- 
2.34.1


