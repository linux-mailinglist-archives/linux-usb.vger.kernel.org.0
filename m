Return-Path: <linux-usb+bounces-35614-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPvxJ9byx2lMfQUAu9opvQ
	(envelope-from <linux-usb+bounces-35614-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 16:25:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C834EDEB
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 16:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3F8B305E319
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 15:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE02F34A774;
	Sat, 28 Mar 2026 15:21:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49204.qiye.163.com (mail-m49204.qiye.163.com [45.254.49.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339F3446BC;
	Sat, 28 Mar 2026 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711283; cv=none; b=Y6QIrGi0AoTsP3CNO2w3flMNlisDlfSyadRPiELWm36mj90mr9mPaEzj+1/yzvCDeN+z7JB6r7gTCqpTIh0agRCRvAMN+cCVRZMg3XjtpDKRwPlKDW0Zi8+Ume1nLx/bBD47a+HKvipo2gQya84I3F5EFPGNKQ03yLzoA51pHp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711283; c=relaxed/simple;
	bh=xGPwdfXHzKe8y015Nop31mQCc5qA9KhNFhj8uO1vIZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pu2DR1V/1pO0LfaX8vilgSN2KzVd710wOOuNQ2LMrukb4b/fDr/ZKi6oNjmOHPuDiv/OzifLVsfBdcQtYD8bdTK1fyFdXYqDrW0z1dOjIDsvh0uQbiyGqtGAjOHcAztWWbmKcsy2XjCG1wF0aCQyd7zgHZ0LeSeZeHUr8Q+/P+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com; spf=pass smtp.mailfrom=autochips.com; arc=none smtp.client-ip=45.254.49.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=autochips.com
Received: from H20F120008.autochips.inc (unknown [223.244.89.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38a9b8708;
	Sat, 28 Mar 2026 23:15:59 +0800 (GMT+08:00)
From: Yongchao Wu <yongchao.wu@autochips.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yongchao Wu <yongchao.wu@autochips.com>
Subject: [PATCH] usb: cdns3: gadget: fix resource leak on gadget init failure
Date: Sat, 28 Mar 2026 23:15:50 +0800
Message-ID: <20260328151551.61228-1-yongchao.wu@autochips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d35042e8803ackunme8c0037b2187eb2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGU1LVktNH0geSh0YTkofSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUhVSU9PVUNCVUlPTVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[autochips.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35614-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[yongchao.wu@autochips.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 009C834EDEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When cdns3_gadget_start() fails, the DRD gadget is left in an
initialized state, causing a resource leak. When switching to host
mode, the stale state triggers a synchronous external abort in
xhci_gen_setup(), leading to kernel panic:

[  1301.377716][ T5000][E] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
[  1301.382485][ T5000][I] pc : xhci_gen_setup+0xa4/0x408
[  1301.393391][ T5000][I] backtrace:
    ...
    xhci_gen_setup+0xa4/0x408    <-- CRASH
    xhci_plat_setup+0x44/0x58
    usb_add_hcd+0x284/0x678
    ...
    cdns_role_set+0x9c/0xbc        <-- Role switch

Fix by calling cdns_drd_gadget_off() in the error path to properly
clean up the DRD gadget state. This prevents both the resource leak
and the kernel panic during role switching.

Signed-off-by: Yongchao Wu <yongchao.wu@autochips.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index d59a60a16..4cc3f2ffb 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3428,6 +3428,7 @@ static int __cdns3_gadget_init(struct cdns *cdns)
 	ret = cdns3_gadget_start(cdns);
 	if (ret) {
 		pm_runtime_put_sync(cdns->dev);
+		cdns_drd_gadget_off(cdns);
 		return ret;
 	}
 
-- 
2.43.0


