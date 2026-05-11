Return-Path: <linux-usb+bounces-37227-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK9DITmCAWpObwEAu9opvQ
	(envelope-from <linux-usb+bounces-37227-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CEB508F14
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 697B13017FB9
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EF737C929;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TP7uthDL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFF3334C1D;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=WouFRL6+ktRUW3A8nvBoukH5M7T0EP8Of6BM5tM8gCFspmNLevOy9morARf13TbDMwH8I5DigAwkGSKoclielX0wwn3CpxFO/Tx/kZhX6FU3/YYpyneOEpUwDuLGivdBDfghy3C8mMCH2SPmzECSBIO99z8yYaYhNkgCMDByFHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=g4WiFbW4rFM0ssE0TY4zoMGdOT55hNU6u5+qQRhpHjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+RLyfTZuyLOxVemQcFWLLsiV7SxmVh5HneFjy5tzYRl+fdps/q4Nz8mcHmouprejuzri1gC1AKPQ93clrgZPcg8bohUKOeVvEbT2T1AypkhgennNvOC+1/r7J+chzPZ69b3wYJo4uXBMeD+YpXKXkjg1EuHSNkeNMRzLvPRGQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TP7uthDL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04D1C2BCF5;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=g4WiFbW4rFM0ssE0TY4zoMGdOT55hNU6u5+qQRhpHjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TP7uthDLNIRLJ0D5NXD3obNeJrSByvEGP6ZwkBXoOH7J3l0ZCskKkgHZ7ioukAMP2
	 ag7+EamRLv2ujcivwotPiZ+UrOKame8NWG4QNRg2TVS3CZzgoO1WwFGLRHDMOmUfDN
	 9iOzEJmJX+NBbvGkf6fDPmdX2aFGeTK09v2SOlm6x9hSgLOgSGU4d+01kFmiGZQKfb
	 qULS6p/D+J5CAY0Zmyf/Fbza/1f7MBlloy/XHvP8+KUmQSeelRslils7SmuTRNg1sj
	 B4RpAzisanoR5/g6hx0wdEIbsp3epK53aGCk71iYM1UilaapsiWPtUuwOSsRw59WrS
	 8FpD01l0JawHQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCa-33ab;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] USB: serial: whiteheat: drop termbits include
Date: Mon, 11 May 2026 09:14:48 +0200
Message-ID: <20260511071448.611875-9-johan@kernel.org>
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
X-Rspamd-Queue-Id: 36CEB508F14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37227-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The termios definitions are provided by the termios.h header file which
is included by tty.h so drop the redundant asm/termbits.h include
directive.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/whiteheat.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
index 106e9b5443d3..a2d83f69e00e 100644
--- a/drivers/usb/serial/whiteheat.c
+++ b/drivers/usb/serial/whiteheat.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
-#include <asm/termbits.h>
 #include <linux/usb.h>
 #include <linux/serial_reg.h>
 #include <linux/serial.h>
-- 
2.53.0


