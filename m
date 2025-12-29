Return-Path: <linux-usb+bounces-31791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53862CE5A89
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 02:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACF423006AAD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 01:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB11E0DFE;
	Mon, 29 Dec 2025 01:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XWal3SkJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416943A1E99;
	Mon, 29 Dec 2025 01:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971020; cv=none; b=X57Z12X1v2r7ptHt0nsVO6yeUV+AFmwFrRt30Ei2AHMh02Drg9Qd95moyQCNh68LVN9D41P4Ywa65Det5fyLi11eAGirfmOHz79mr094t+pXVVvt/UVJjPBwK/15KFAhKbFoi/5v0FWoPJaGpDTqSw4Q259Af6JEsEuEQ/MRu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971020; c=relaxed/simple;
	bh=GsqiO1dlmXSxSXkrGCNN9JoRLx3kBa5JhbuUvR+dx48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TvHvno5gs/WGEn1d2C/J3QIJ57r5yAncAHifbOHiyumWaCwq1UO8jOdW65VMlqtQhyg3qxjdIrwuRcjl05+pip7dPrEohLknvI76ub9kSBhmn+vurrHcgKOqM2e1c0py+R//WNncRxshc+2txu6KhvZ+VAk5h1lp/0P81e4uRqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XWal3SkJ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=76
	qem/aKL/wEIk5T6rRZUUx66AXDU8O/Hm5H1rG7iN0=; b=XWal3SkJBPeao7bpHx
	OWZyHQS200pAMzaAHTP7KI6h3PHh/aKJts79+c5aCpweOA3PB1u6shQvp9A45oNK
	9OjgTn7+2WwIJDoKp2q8331uYy9xCKbbFm6X0OAA1J6qdyITrhYYFtPJAqVTyB6U
	DlCxq0zW9QIbQsG2JPmFuZreM=
Received: from ProDesk-480.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXKfZp1lFp19WvJQ--.140S2;
	Mon, 29 Dec 2025 09:16:33 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: badhri@google.com
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] tcpm: Fix a typo
Date: Mon, 29 Dec 2025 09:16:22 +0800
Message-ID: <20251229011624.146700-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXKfZp1lFp19WvJQ--.140S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyktF4fAry7tF47Cw47CFg_yoWDKFX_uF
	y8Cr17Ww4F9FZxAw17CF9IvrWay3Z7W3WvgFnYqanxCFy2yr1Sgryqvr1kJwn5Ka9rJF98
	WrWDJrWIkw1rWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_AwxtUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhGA3mlR1nEVJwAA3k

There should be a space between the two words: Responder and supports.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4ca2746ce16b..6acb69a158fb 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1808,7 +1808,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt,
 	/*
 	 * PD3.0 Spec 6.4.4.3.2: The SVIDs are returned 2 per VDO (see Table
 	 * 6-43), and can be returned maximum 6 VDOs per response (see Figure
-	 * 6-19). If the Respondersupports 12 or more SVID then the Discover
+	 * 6-19). If the Responder supports 12 or more SVID then the Discover
 	 * SVIDs Command Shall be executed multiple times until a Discover
 	 * SVIDs VDO is returned ending either with a SVID value of 0x0000 in
 	 * the last part of the last VDO or with a VDO containing two SVIDs
-- 
2.43.0

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
branch: master


