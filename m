Return-Path: <linux-usb+bounces-28875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B1BB4B4B
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 19:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD6A2A5D5B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 17:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458DE2737E1;
	Thu,  2 Oct 2025 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Nzrdo/xZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921BA26FA6E
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 17:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759426560; cv=none; b=rI2AasbQGJWqWA26zjIoQFXKyZC3z7JLB4dRnJemD1RphlByROrI+jSNGx53CdLB764yZu5TE7aZ7Bf6S+dNDBjdikaFuU81xO0xQIn7jNxCRWnfxq9tM5APmCecxHrLGlusua2u9eBSLVYLJYDMnf/QEt7Dizcl08F3hmq5cBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759426560; c=relaxed/simple;
	bh=q+2gycPPhS/NXmq+pccIU874tD4r8YzK6KhJaMPgm7g=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X3aBAgWutzu+5/oafC/FA9iwb/O5YC0Xyh+bPD1kUkwedz+otkuTJramvzRgT8rCKMrHi55Zvnb/x8kG0N+YZ+LfxDWpIMGHt+r2aoLPUon19YsIcCZSxsL+f/vOR3rVbgHuDh8Vr8+20HFIjV4CLMEA0qLj2oFebqiVY3jYUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Nzrdo/xZ; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1759426550; x=1759685750;
	bh=z15ojxfpDIwcTHJzOQG6KVgjylqu21VWFYD9yzHQoB8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Nzrdo/xZvCpjOGV0TZ6TPbS0WOU4RjiZV0DGIUwj6G5taCsNwKvvjN1niSDXiR7gu
	 4gdFEJaESsFeynl1a47pukEaPfy7SYf3M9O6jJt4tFrkGtIibOuBvyfz659W6Dz0YE
	 QcZDm2qyLX1y0Z0cJwJm8CTLkpxWwWDPe6pWyp1qiS6/FxgC9SwAVOVfOAfHta682B
	 ZTTS2RbIPoBfPJQxzwTm/rGT7b8gBgC2jLclPXZ5iBDmXFUJjyrmDMA7OnzpZq+E7y
	 smtD5IwrDOXP7Wl3JeJSJnbi8OIHgdf6q9WfPwf5FM2It2plXxYPOMrYBIYS2vVCQv
	 WolJY3+oXyZjQ==
Date: Thu, 02 Oct 2025 17:35:33 +0000
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH] thunderbolt: Fix typo in tb_eeprom_ctl_read documentation
Message-ID: <20251002173459.68542-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 05a15cb56fb37a86cf43e784834e6e7bf4c7b2a0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix presumed copy-paste typo of tb_eeprom_ctl_read documentation
referring to tb_eeprom_ctl_write.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/thunderbolt/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 1af65fece495..5477b9437048 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -21,7 +21,7 @@ static int tb_eeprom_ctl_write(struct tb_switch *sw, stru=
ct tb_eeprom_ctl *ctl)
 }
=20
 /*
- * tb_eeprom_ctl_write() - read control word
+ * tb_eeprom_ctl_read() - read control word
  */
 static int tb_eeprom_ctl_read(struct tb_switch *sw, struct tb_eeprom_ctl *=
ctl)
 {
--=20
2.43.0



