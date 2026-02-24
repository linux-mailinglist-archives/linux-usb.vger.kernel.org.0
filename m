Return-Path: <linux-usb+bounces-33676-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAcmO2kenml+TgQAu9opvQ
	(envelope-from <linux-usb+bounces-33676-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 22:55:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560718CF70
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 22:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FA143020FD0
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 21:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E32434251A;
	Tue, 24 Feb 2026 21:55:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E9341642;
	Tue, 24 Feb 2026 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970119; cv=none; b=YU9MgKjCfiW17Ch65LTGWVu70ZOUvAEW0K5YCDxXHdrH8mIus9eW0tsSrq+x4/+4MRk9pcW6hJEO8G9Ac3TVyTfFRBLBtqRWNOkPS8XwrB7uTphs68yJbzJTmBRLL1H0eOYHuFeD9Y0ABHhIgJTaUbUHgyCVhOcbD+2AU6yRQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970119; c=relaxed/simple;
	bh=VQGlgbWOd6hgVjz/scuAbiwqxES4rmBFm3AcIJWso/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AKlJtp7/MMEbWJD95HKDr8a1xFOh7M0g9yL2W8M2dwfxlsbgPRKruCbcVLoQXCsiL+m56HpO8uYoeil6iEvmfllX70GnZ+X+QkXmpz1bUKP0rxd2lJfKcCg6LzYbNEK1QWXCHCSYcYlL03vRIq9yNTVUirOSMP9ySPZ3mXPPhQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 0CB812338C;
	Wed, 25 Feb 2026 00:55:08 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH v2 1/2] USB: sisusbvga: Fix integer overflow in sisusb_clear_vram
Date: Wed, 25 Feb 2026 00:55:06 +0300
Message-Id: <20260224215507.1736020-2-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20260224215507.1736020-1-kovalev@altlinux.org>
References: <20260224215507.1736020-1-kovalev@altlinux.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[altlinux.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33676-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5560718CF70
X-Rspamd-Action: no action

The boundary check in sisusb_clear_vram():

    if (address + length > sisusb->vrambase + sisusb->vramsize)
        length = sisusb->vrambase + sisusb->vramsize - address;

is subject to unsigned 32-bit integer overflow. When address is close to
UINT32_MAX and length is non-trivial, their sum wraps around and the
guard evaluates incorrectly, allowing the check to be bypassed.

The overflow condition requires length > UINT32_MAX - address. Since
address belongs to [vrambase; vrambase + vramsize) where vrambase is
0xd0000000, and length comes from userspace via SUCMD_CLRSCR as a 24-bit
value (max 0xFFFFFF), overflow is only reachable when sisusb->vramsize
exceeds 1 GiB. A compromised USB device can return an arbitrary value for
sisusb->vramsize via SR[0x14], making this condition reachable.

Use check_add_overflow() to detect the overflow explicitly and return 1.
This ensures the driver correctly rejects invalid parameters instead of
proceeding with wrapped-around values.

Found by Linux Verification Center (linuxtesting.org) with Svace.
Tested with 'USB Gadget Tests'[1]:

$ TEST=sisusbvga-fops-svace-int-overflow
$ echo $TEST > tests/list.txt && make && sudo ./check.sh

[1] Link: https://github.com/kovalev0/usb-gadget-tests
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/usb/misc/sisusbvga/sisusbvga.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index febf34f9f049..89d566d192aa 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -1301,6 +1301,7 @@ static int sisusb_clear_vram(struct sisusb_usb_data *sisusb,
 {
 	int ret, i;
 	ssize_t j;
+	u32 end_addr;
 
 	if (address < sisusb->vrambase)
 		return 1;
@@ -1308,7 +1309,10 @@ static int sisusb_clear_vram(struct sisusb_usb_data *sisusb,
 	if (address >= sisusb->vrambase + sisusb->vramsize)
 		return 1;
 
-	if (address + length > sisusb->vrambase + sisusb->vramsize)
+	if (check_add_overflow(address, (u32)length, &end_addr))
+		return 1;
+
+	if (end_addr > sisusb->vrambase + sisusb->vramsize)
 		length = sisusb->vrambase + sisusb->vramsize - address;
 
 	if (length <= 0)
-- 
2.50.1


