Return-Path: <linux-usb+bounces-33675-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCx7CFMenml+TgQAu9opvQ
	(envelope-from <linux-usb+bounces-33675-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 22:55:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B029A18CF68
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 22:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F68E306B9D7
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 21:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A753342160;
	Tue, 24 Feb 2026 21:55:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06906341041;
	Tue, 24 Feb 2026 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970119; cv=none; b=OD9U7ILVQnD5lmch9GkIC6EGWaVQq4jeV5whIl58L8SOlur8o0tZeOv95A/6L7DTyPJp+Q2tk1gzP8pS6qdqxIeqLcew/DLmHIuQsnu++g1cMQHEUIPRECr7HzUKJvDJS5k5qH/nVcMG5o35Cu+JnVZ2PNPaXM3Shi2wI6GXzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970119; c=relaxed/simple;
	bh=7Hf7qhSgheZ1cYXKewudhyuLhyRCrjovlcamlqIB0w4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fudIZmbH+NaLSpBP8Y3W44/Y4FvQYjyQY3Iye72NUqBBT035AAMcM/pAZGtlFz4LNHb6cLesl7n4uy5p+TSnFlh7s0F8h4yzagvYQukOzvQc5qkIzvNOd6A1CTXW9aXe64r126q1dDBn57BiPHTzXkSsEHqN7UXQeTsBDklbGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 209852337A;
	Wed, 25 Feb 2026 00:55:08 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH v2 0/2] USB: sisusbvga: Fix integer overflow and NULL dereference
Date: Wed, 25 Feb 2026 00:55:05 +0300
Message-Id: <20260224215507.1736020-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[altlinux.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33675-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B029A18CF68
X-Rspamd-Action: no action

This series fixes two issues in the sisusbvga driver found by static
analysis and confirmed through testing with USB gadget emulation:

1. Integer overflow in boundary check of sisusb_clear_vram() that can be
   triggered by a compromised USB device reporting inflated VRAM size.

2. NULL pointer dereference in sisusb_read_mem_bulk() when both
   kernbuffer and userbuffer are NULL, causing immediate kernel panic.

Both issues are reproducible with the 'USB Gadget Tests' framework [1].

v2:
- Patch 2/2: Move NULL check into sisusb_read_mem_bulk() and
return -EINVAL (suggested by Fedor Pchelkin)

[1] https://github.com/kovalev0/usb-gadget-tests

Vasiliy Kovalev (2):
  USB: sisusbvga: Fix integer overflow in sisusb_clear_vram
  USB: sisusbvga: Fix NULL pointer dereference in sisusb_read_mem_bulk

 drivers/usb/misc/sisusbvga/sisusbvga.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.50.1


