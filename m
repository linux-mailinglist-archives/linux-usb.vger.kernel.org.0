Return-Path: <linux-usb+bounces-35621-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EacNDS8yGmlpwUAu9opvQ
	(envelope-from <linux-usb+bounces-35621-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 07:44:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047E350D96
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 07:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A13E6301DEC8
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 05:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328FA28C037;
	Sun, 29 Mar 2026 05:43:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m10180.netease.com (mail-m10180.netease.com [154.81.10.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268626B098;
	Sun, 29 Mar 2026 05:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774763006; cv=none; b=BKBsjItbKe3sPdNo34SyoDeAOt+BmdfLhbwL0DR1GmJi4qBXG+TMAwmoJOYvPW16f6iHTydbjk+ITADf0RooLR1UeZEpWBIAcZI3RgBr3LUKmQEKG+/4k8kQVwT76pWYjt/f4QDP7w0Q3nLajjxewOuH0B2qkGWrbey+vDBdrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774763006; c=relaxed/simple;
	bh=SzjoRZlOaJcRlw/LxZ4/SYx8TZ57WRGdV2lLPmSuPSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOhAiV7dWKRDNawjcJdxp91/X1LIZMqZ4pzhmGNMsu8DaTpyP95gKnIcKPyq1AFF5Z6HgfjzUb6/VcKDdIqwWFOIJGh3LB5o04DEE61n5jmi0cber810xDVbToQf522+ip6SAOMMa2KoxhP5tnIWt4lPZQCAQgKI2ypo1aLkRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com; spf=pass smtp.mailfrom=autochips.com; arc=none smtp.client-ip=154.81.10.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=autochips.com
Received: from H20F120008.autochips.inc (unknown [223.244.89.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38afbaa21;
	Sun, 29 Mar 2026 11:20:52 +0800 (GMT+08:00)
From: Yongchao Wu <yongchao.wu@autochips.com>
To: peter.chen@kernel.org
Cc: pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yongchao Wu <yongchao.wu@autochips.com>
Subject: [PATCH v2] usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
Date: Sun, 29 Mar 2026 11:20:24 +0800
Message-ID: <20260329032025.126086-1-yongchao.wu@autochips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d379bd2ec03ackunm88deb0ee2295fad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQhkeVkhLTU0fHx9NGhhPH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUhVSU9PVUNCVUlPTVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[autochips.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35621-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[yongchao.wu@autochips.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,autochips.com:email,autochips.com:mid]
X-Rspamd-Queue-Id: 5047E350D96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the gadget endpoint is disabled or not yet configured, the ep->desc
pointer can be NULL. This leads to a NULL pointer dereference when
__cdns3_gadget_ep_queue() is called, causing a kernel crash.

Add a check to return -ESHUTDOWN if ep->desc is NULL, which is the
standard return code for unconfigured endpoints.

This prevents potential crashes when ep_queue is called on endpoints
that are not ready.

Signed-off-by: Yongchao Wu  <yongchao.wu@autochips.com>

---
Changes in v2:
  - Fix author name format (use "Yongchao Wu" instead of "yongchao.wu")
---
 drivers/usb/cdns3/cdns3-gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index d59a60a16..96d2a4c38 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2589,6 +2589,9 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
 	struct cdns3_request *priv_req;
 	int ret = 0;
 
+	if (!ep->desc)
+		return -ESHUTDOWN;
+
 	request->actual = 0;
 	request->status = -EINPROGRESS;
 	priv_req = to_cdns3_request(request);
-- 
2.43.0


