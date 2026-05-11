Return-Path: <linux-usb+bounces-37229-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJgpBWSCAWpObwEAu9opvQ
	(envelope-from <linux-usb+bounces-37229-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCE508F4F
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2C233020858
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C64537E31D;
	Mon, 11 May 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGa/YDUy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F072366065;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=Y7tRFA3hDMGMnsUq0hOtgdJ6Cvi5qRGX6tBdTvD36tK58vOE25SgINwbqztuT7ETz/U6xpo84flk598MTQ8MDZczfb6WXpuOjI+7zf2+FahIBho8TNdqTePNxuzxBp7HldQMUdQh2lhbjuFF9L7Tn8gwjQGOfrLhCdGmta71JZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=SzhOhRLcmaGWyKR+iz1WDkmVDQQA6T9FLNslphxROLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dczYBnGkNYTLeB5DnWukwIy1K/1IoTHFXRr1xngpzX5kINvhlpbuG+DZBMzcMxUQOEMUhGpMpvQNjHFrlFC4cp7xBWzFo86RB0Z/Rhhn+RJkvU3LtadhRSsqXcnc9y9hgmriV8KyqNfwLqnZAjVP6lPMuOlRQyFf9gimmCe5DqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGa/YDUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DF5C2BCFD;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=SzhOhRLcmaGWyKR+iz1WDkmVDQQA6T9FLNslphxROLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGa/YDUyQA+b4aTdYyIU0zZtk9mL/AMkgw3S4yiDaL65slU2zu9WnwVzr37ymuaaY
	 NbbGUSqra6nRLMd4VYv4p2ShdySiERPWZYalPEkcq+ZxfOhvfx3Jp+GOwX71dV5RRS
	 Maw1JkUSMByjOau+2HhvLOG/nPdzWkehgZko2pklJtO0fBgRx3h3AHQvzgQd2zoMff
	 IGONWy3EqG6Nt0nUD1yGO1iExe6RnNDqKQ6AsMpgCUIFyowwDGHThWWyh06ixmaV2e
	 i/dZstm2OkWcrPSxdyNEWdVFAMp9+dam0x/Vp+XPB7LlHp7ZIMqo9R+jR3h+iIolyM
	 Dp89XpqS2HZAg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCT-2wSR;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] USB: serial: drop unused moduleparam includes
Date: Mon, 11 May 2026 09:14:45 +0200
Message-ID: <20260511071448.611875-6-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 83DCE508F4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37229-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

These drivers (and usb-serial.c) no longer use anything from
moduleparam.h so drop the unnecessary include directives.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/f81232.c     | 1 -
 drivers/usb/serial/metro-usb.c  | 1 -
 drivers/usb/serial/oti6858.c    | 1 -
 drivers/usb/serial/pl2303.c     | 1 -
 drivers/usb/serial/usb-serial.c | 1 -
 drivers/usb/serial/visor.c      | 1 -
 6 files changed, 6 deletions(-)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 3a32f93a9738..dcceb95d7d99 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -14,7 +14,6 @@
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index 5fcd89f57ef3..35473544f1c8 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
-#include <linux/moduleparam.h>
 #include <linux/spinlock.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index 77f34d7651d6..c6364e8ff71f 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -41,7 +41,6 @@
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 128c80f11f49..0bcbdcea52af 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -18,7 +18,6 @@
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 45e8a0b8d438..17edc057a311 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -23,7 +23,6 @@
 #include <linux/tty.h>
 #include <linux/tty_driver.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 75f290a67cb4..5706c46c49c2 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -16,7 +16,6 @@
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-- 
2.53.0


