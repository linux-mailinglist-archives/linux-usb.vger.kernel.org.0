Return-Path: <linux-usb+bounces-33677-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHitEHgenml+TgQAu9opvQ
	(envelope-from <linux-usb+bounces-33677-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 22:56:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F018CF80
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 22:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7CE23095545
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 21:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7276D3446B6;
	Tue, 24 Feb 2026 21:55:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC034107E;
	Tue, 24 Feb 2026 21:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970120; cv=none; b=S11sZu5ZBvK+xbIH+a5Gs7cs14YFUFntvgTVgsAx5R/OyQtrA4hYhOlkIvSeq0DOWMxqeP3me/zThUN2UWoQl/cWL737f6xA7khLO4kqjfWuoDUXxCNR/rdyCkhXxZfXjvg+skHrqqg3yD7UzMGDxr/IePmq61hL5whLPb2VP/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970120; c=relaxed/simple;
	bh=CNk9HIZSLGI29vt9avohT0zTyP+ESDDVU4T46jgcJBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOf7knZw3qvy31tUPg/nWG8zgkEM4C9901Lhaj/Ysec3DceIVxM3hNxUxOeAwk9aBp9D08MP+M0F36rzFN9ZF6VRmE0JwNIRcBZszaMps5Z/LOr/JT0zLwWKUvQO9ga5vrPNOOj6d3DmNAXQTx+dFwB0mNaJbTspz/8mpYR7HFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 6843C2338D;
	Wed, 25 Feb 2026 00:55:10 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH v2 2/2] USB: sisusbvga: Fix NULL pointer dereference in sisusb_read_mem_bulk
Date: Wed, 25 Feb 2026 00:55:07 +0300
Message-Id: <20260224215507.1736020-3-kovalev@altlinux.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[altlinux.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33677-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,altlinux.org:mid,altlinux.org:email,ispras.ru:email]
X-Rspamd-Queue-Id: AB5F018CF80
X-Rspamd-Action: no action

sisusb_read_mem_bulk() accepts two buffer parameters: kernbuffer for
kernel-space data and userbuffer for userspace data. The function's logic
assumes at least one of them is non-NULL:

    if (userbuffer) {
        /* userspace path */
    } else {
        /* kernel buffer path - dereferences kernbuffer */
        swap32 = *((u32 *)kernbuffer);
    }

However, when called from sisusb_read() with buffer == NULL, both
kernbuffer and userbuffer are NULL, causing immediate kernel panic:

  Oops: general protection fault, probably for non-canonical
        address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  CPU: 3 UID: 0 PID: 370 Comm: sisusbvga-fops- Not tainted 6.19.0-next-20260217 #1
  RIP: 0010:sisusb_read_mem_bulk.constprop.0 (drivers/usb/misc/sisusbvga/sisusbvga.c:1171)
  Call Trace:
   <TASK>
   __pfx_sisusb_read_mem_bulk.constprop.0 (drivers/usb/misc/sisusbvga/sisusbvga.c:1092)
   sisusb_read (drivers/usb/misc/sisusbvga/sisusbvga.c:2396)
   vfs_read (fs/read_write.c:572)
   ksys_read (fs/read_write.c:718)
   do_syscall_64 (arch/x86/entry/syscall_64.c:94)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
   RIP: 0033:0x7f335af3fefc
   </TASK>

Add parameter validation at the API level: reject the call with -EINVAL
if both buffers are NULL.

Found by Linux Verification Center (linuxtesting.org) with Svace.
Tested with 'USB Gadget Tests'[1]:

$ TEST=sisusbvga-fops-svace-null-deref
$ echo $TEST > tests/list.txt && make && sudo ./check.sh

[1] Link: https://github.com/kovalev0/usb-gadget-tests
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: <stable@vger.kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
v2: Move NULL check into sisusb_read_mem_bulk() and
return -EINVAL (suggested by Fedor Pchelkin)

v1: https://lore.kernel.org/all/20260218005523.1259725-3-kovalev@altlinux.org/
---
 drivers/usb/misc/sisusbvga/sisusbvga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index 89d566d192aa..abda425199ee 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -1098,6 +1098,9 @@ static int sisusb_read_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
 	u16 swap16;
 	u32 swap32;
 
+	if (!kernbuffer && !userbuffer)
+		return -EINVAL;
+
 	(*bytes_read = 0);
 
 	length &= 0x00ffffff;
-- 
2.50.1


