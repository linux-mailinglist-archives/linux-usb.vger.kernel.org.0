Return-Path: <linux-usb+bounces-34067-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKh/FiFnqWlN6wAAu9opvQ
	(envelope-from <linux-usb+bounces-34067-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:21:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C087F21083D
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1A1130525FE
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDDF38836F;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHk6dSF3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF303845CF;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=fz86w1lGCxVZP9ZWuJECM/rhD5HOTAxtGqTCeiQD/a4iOfgKH8p5VUDYfTKHF9BVFFAfCb8vfWf3nZIKcUtaHhTSmrom9cxx4T/RuYtDjWgVdB5/PdK4lDAOKSl5dEWBROot17LYB0a8VQcOL38XBgGhxEU920oWUA9OWFHDYMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=fNCpqWa805aA4ypNNtrZcmOLXAGPYsiL3MrOXZwOok4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmfnW1ZSJb7uk8PIFVk8hvvCF7AZYeDOJEybZapmpX90qui+pbiD1aNC7NOo/axEEveqc/HqTHYGuFc+b2hZ1ThE0Ki3vOv3rJHTn1A2d+Cy18lN6TzGd+M7R7CCGPfoKzZYjQ5swG5Wk3TciBx85lZBqov0C2BqlmnjUU8pw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHk6dSF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06950C116C6;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=fNCpqWa805aA4ypNNtrZcmOLXAGPYsiL3MrOXZwOok4=;
	h=From:To:Cc:Subject:Date:From;
	b=GHk6dSF3M7G+vadbbVx6FVNmNUoNiR9X+0RhaulbyK44u2UmEXAbItSPzXldfW/qT
	 Dfh940JoJLePS7XaO+86i2ypPaYmQCmKglVwc7dKq54cOXee5E2fXKygEvo6Jbk676
	 9OHSk5OFs6HmszE/++axMRo5YfhFjtKtarIENiKXg5jbFeAdFDAJB8SNS4E3QF14S5
	 RgsmjhA2Iaw+sLQBvVQvKnEvT9hXQQxDewm6f+eOhII3Y4+ywWyGhcT7lp3AXkMqcj
	 BZWY1H54WhLNZxrhNw3JUwRrGDeUyBwwWbX6waYG2jKplEFtCCXRwxte5mbo0FaWek
	 +NNz2Mju5Y4Iw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004nb-3fY0;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: drop redundant references
Date: Thu,  5 Mar 2026 12:15:06 +0100
Message-ID: <20260305111511.18386-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C087F21083D
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
	TAGGED_FROM(0.00)[bounces-34067-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop redundant references to reduce cargo culting, make it easier to
spot drivers where an extra reference is needed, and reduce the risk of
memory leaks when drivers fail to release them.

Johan


Johan Hovold (5):
  USB: cypress_cy7c63: drop redundant device reference
  USB: cytherm: drop redundant device reference
  USB: ljca: drop redundant interface reference
  USB: trancevibrator: drop redundant device reference
  USB: usbsevseg: drop redundant device reference

 drivers/usb/misc/cypress_cy7c63.c |  4 +---
 drivers/usb/misc/cytherm.c        |  4 +---
 drivers/usb/misc/trancevibrator.c |  3 +--
 drivers/usb/misc/usb-ljca.c       | 15 +++++----------
 drivers/usb/misc/usbsevseg.c      |  3 +--
 5 files changed, 9 insertions(+), 20 deletions(-)

-- 
2.52.0


