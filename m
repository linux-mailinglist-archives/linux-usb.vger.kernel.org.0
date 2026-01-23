Return-Path: <linux-usb+bounces-32647-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHI9HG+Ic2laxAAAu9opvQ
	(envelope-from <linux-usb+bounces-32647-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:40:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39D772DB
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A8A530098A3
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 14:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E643033F0;
	Fri, 23 Jan 2026 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMIsjO2H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596318871F;
	Fri, 23 Jan 2026 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179243; cv=none; b=Xm9qfuZO9Ccm3zslz04FqjyrwQg/WjI/Fd072lpKprRGLlsYwQMt7aO8a3aLeYygUE5eSOTk8joxzefVdjBe6gqxv/d7mOQ2oW6aDkj+IpKkyLaxQiWfQP615P9eP80/43vxz5n8cjVcxjh8Xbm7oraP3Zgk35FMpbw3uJS+YFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179243; c=relaxed/simple;
	bh=RM/u0mMYX/c6heLOS8lzSGY+Fvd3U44e6SbPjj271Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APDLptam7NpTD3N4VaWZTFQIdcd2Mv9DlI8yTv8FsDCbSNfFlEt1YEtEMA6IrGtPw+maUKZARUhSMk3w6dfUEvUhbeOul+m0xXr5QwrOoUGcZEZJIWZ8zl6IggkFlOln1X1X6LnVCvCgMzavD2PEJ3npyX9fXq6FpqUBFrg65Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMIsjO2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F3AC4CEF1;
	Fri, 23 Jan 2026 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769179242;
	bh=RM/u0mMYX/c6heLOS8lzSGY+Fvd3U44e6SbPjj271Q0=;
	h=From:To:Cc:Subject:Date:From;
	b=QMIsjO2HyUc3zH50tM9476/unXR9kcpHVerxjLwLjzZCKghkjEHGfReeGUh9WeAe/
	 AmvUAVqvxxNKQxhoQz3+x5hbd/Cyh2mUIUONriGufg+80xmN1S9eHLJ/sgASBLgTgJ
	 CdB9iyzq9LIoow6Rb4C8Ai1ks29W7LCDWRlmEJH8Gz0VKBb5156vypXOsDTIqDONl6
	 ryyA90Xiq2L2HIO20US7VSS7KcwjLmdxUpggjZglgF4G9d7+1AThmAV59uoMg3xbwL
	 9QSQ8z7mtGLWr/jQLDbvnmHDJnQdvbtX8S9oMi9ucGGmu5nZjJyZ2iooT8+pwIwx2I
	 mK0mX/maHaJTQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: gadget: Add a prefix to log messages
Date: Fri, 23 Jan 2026 22:22:18 +0800
Message-ID: <20260123142221.14285-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32647-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A39D772DB
X-Rspamd-Action: no action

I met some log as below:
[  581.262476] read descriptors
[  581.265558] bcdVersion must be 0x0100, stored in Little Endian order...

To be honest, if I'm not familiar with the usb gadget framework, I dunno
which component is complaining. Add a prefix to log messages, so the
above messages will be look as below:

[  581.262476] usb_f_fs: read descriptors
[  581.265558] usb_f_fs: bcdVersion must be 0x0100, stored in Little Endian order...

Then solve similar issues for f_mass_storage and f_tcm.

Jisheng Zhang (3):
  usb: gadget: f_fs: Add a prefix to log messages
  usb: gadget: f_mass_storage: Add a prefix to log messages
  usb: gadget: f_tcm: Add a prefix to log messages

 drivers/usb/gadget/function/f_fs.c           | 2 ++
 drivers/usb/gadget/function/f_mass_storage.c | 2 ++
 drivers/usb/gadget/function/f_tcm.c          | 3 +++
 3 files changed, 7 insertions(+)

-- 
2.51.0


