Return-Path: <linux-usb+bounces-22987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C79A86184
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 17:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A4CD173AB2
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4FA1F3BA2;
	Fri, 11 Apr 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6NxnDoA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666120C009
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384502; cv=none; b=jx1eJY4pg8G+KuZm7sxoeVGU+qU3+vAPvb0XeQw/t8mLUMis/1SvJIsB+HyzMgfI4kKy0nBfCxrCooBUEygxBVhYkmfCs81gizMRC5B/Dc1ckzgE09l7tg+xx7vU2isZa5vajR2lokEruzvXVIlczJzyXyCDr179nQn3pVwQ4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384502; c=relaxed/simple;
	bh=nslGB3Z57N25JCPonoffwFkMxpSXQ0qRKzroD9wQZf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkFkhNG4OolUAMsA3AquKcJUCTJe7MluN9zHsYXJChuH5xnKppotx1reV2ThDqomUCbzsEPUfhgkBmyOaIO+eiWSCleys5oOGSpHrKwepF0VwkWfmjR9LsA7RKCehgejYgavEIZHAUTsKIASJCtnQg2wDgzND+iVD4gvvD7+5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6NxnDoA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B37C4CEE2;
	Fri, 11 Apr 2025 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384502;
	bh=nslGB3Z57N25JCPonoffwFkMxpSXQ0qRKzroD9wQZf4=;
	h=From:To:Cc:Subject:Date:From;
	b=B6NxnDoAU7l+9vn4WrN8QieU4ESkVHfiI0qOIG9VY5iB/XRfoy25/XGGjNHHm+eSv
	 62Q42CCDkgYRPu/ATfZCSaiS/K40GweR4HmsFC6cY/fOlkkaGea+v8MD+gjTi5ZzLe
	 ak/CrzOawa1MKoUJmv0ewEwlxW9JlkwOrvBK6q7Az+7rnMgLD1+2G6PaeeCpT6I3+c
	 ZI2pwPWKWsvwiWjCrhkEngBAjnmj9cF79xLs9yve48m+lckWR22+UcQlkOA3nGNRnj
	 Ek9ZUDS/bE+4fgtxKQ4miWhTMIhufMXyXmc8B7TnZ0TbGBg+RbCLg6RU1aJDjdwb4K
	 fUEZ81Haoi1MQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	rajat.khandelwal@intel.com
Cc: mika.westerberg@linux.intel.com,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix a logic error in wake on connect
Date: Fri, 11 Apr 2025 10:14:44 -0500
Message-ID: <20250411151446.4121877-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

commit a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect
on USB4 ports") introduced a sysfs file to control wake up policy
for a given USB4 port that defaulted to disabled.

However when testing commit 4bfeea6ec1c02 ("thunderbolt: Use wake
on connect and disconnect over suspend") I found that it was working
even without making changes to the power/wakeup file (which defaults
to disabled). This is because of a logic error doing a bitwise or
of the wake-on-connect flag with device_may_wakeup() which should
have been a logical AND.

Adjust the logic so that policy is only applied when wakeup is
actually enabled.

Fixes: a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect on USB4 ports")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/thunderbolt/usb4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index e51d01671d8e7..3e96f1afd4268 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -440,10 +440,10 @@ int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags)
 			bool configured = val & PORT_CS_19_PC;
 			usb4 = port->usb4;
 
-			if (((flags & TB_WAKE_ON_CONNECT) |
+			if (((flags & TB_WAKE_ON_CONNECT) &&
 			      device_may_wakeup(&usb4->dev)) && !configured)
 				val |= PORT_CS_19_WOC;
-			if (((flags & TB_WAKE_ON_DISCONNECT) |
+			if (((flags & TB_WAKE_ON_DISCONNECT) &&
 			      device_may_wakeup(&usb4->dev)) && configured)
 				val |= PORT_CS_19_WOD;
 			if ((flags & TB_WAKE_ON_USB4) && configured)
-- 
2.43.0


