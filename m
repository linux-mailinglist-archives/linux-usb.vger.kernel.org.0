Return-Path: <linux-usb+bounces-32650-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJjZEbmIc2krxAAAu9opvQ
	(envelope-from <linux-usb+bounces-32650-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:42:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B87731C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9315C303A4B1
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 14:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A911C32D44E;
	Fri, 23 Jan 2026 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vv9AFG7a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3746E32C92A;
	Fri, 23 Jan 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179248; cv=none; b=jiiZnTR5022Uep1KxllXp5SPYKwx3q6YIz3HHowKzjF8pTa1FMnZpkJQWG3+tvJdHv4D5Kbgsoupv/FVEMg7aQfC+gtkoHPkQe7k8vVc4yOuKLZAqeZZo467RYeAx/4EhXtWwkl6z+lu/u9R39QJ2OhltnT+rWU7mgAaH7wol8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179248; c=relaxed/simple;
	bh=zz3D8eHdXxx7lO+TeKxeRXvlXgOLC2OIWaDHWOdpDUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRmDjVl8ki9KOWYCIkwKw+KFmaMYpiGrV/t4yHPVdcCZYqE0SC5mH1oTMRa8JR1zEMVBMFH5dW9/mbOA55ZBkfEOsa/eZWiyE6Pp5NaJf95FFzjLadokmDKhtwwJv7J6IedS4VQmZo5Gi9kYGpnUP3UsXXOJ/hUvfMZ6ghO53VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vv9AFG7a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7B3C19422;
	Fri, 23 Jan 2026 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769179247;
	bh=zz3D8eHdXxx7lO+TeKxeRXvlXgOLC2OIWaDHWOdpDUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vv9AFG7a3IyKAN5Vl5pZcWenMqubyzjYgitWr8ar4z2C5elXq6k+6Qy4kxtkdkOU8
	 mtJNaZIM9JJ+CDbJ+k14FNMP/eq/sVo/gtUIuDFkq7TRV15LwV5/A05Q43SKfRgbZN
	 5bzzBLUrnv51vSrx0/rAHuYPsOQ2ph9iTDwCOmGJOrGPvr76A9LD9anI4rcOxVkSSR
	 Yg1D4deikWZhLC5fcq9P6Er+Xgk0V8udg4ZN4GgtSrme+p0HKtRc0VmzDJNo/kmJj+
	 VHiyFG551Kn93psKacJt2ZW+I88oWZd8myi/ogBT9IibAZ0iTr8+hCBwGnEX2vAF6R
	 SJS8nAXP0Ne3Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: gadget: f_tcm: Add a prefix to log messages
Date: Fri, 23 Jan 2026 22:22:21 +0800
Message-ID: <20260123142221.14285-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123142221.14285-1-jszhang@kernel.org>
References: <20260123142221.14285-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32650-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D93B87731C
X-Rspamd-Action: no action

Similar as last patch, add a prefix to log messages so that users can
convienently know where's the msg from.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 6e8804f04baa..760f5a02e6af 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -6,6 +6,9 @@
  *
  * Author: Sebastian Andrzej Siewior <bigeasy at linutronix dot de>
  */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/types.h>
-- 
2.51.0


