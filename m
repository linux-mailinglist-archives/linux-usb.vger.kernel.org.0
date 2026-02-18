Return-Path: <linux-usb+bounces-33417-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JJbKG4QlWmkKgIAu9opvQ
	(envelope-from <linux-usb+bounces-33417-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 02:05:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C515271C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 02:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C155830488EF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 01:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44C52D9EF3;
	Wed, 18 Feb 2026 01:05:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9A1F419A;
	Wed, 18 Feb 2026 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771376707; cv=none; b=SnAhp5CkJThV9SBb45C6KOgQiUSQFruaKLQORfVeJzzOuaiyQ/jWIPreVOW/kTzP7KHmokrLzhyyqs0Q6tnD5QKhyhoqLD0eXY1Nz65JK1tzDdcg/IX96MA/XWPearA9jRXq/0q2YxdtTwKOhDqE3/o27ubRtHyuS52BC5dEJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771376707; c=relaxed/simple;
	bh=KswyICADuDiho3CrT37JRbSmtMbfLJS8Kyd24ZNsXMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rHXXDbAG+gP2ZRysEWJsp/8sdlkxODV0/z77wF9ONg+3c8XNrF8lxkb6bqpWC8SaQViR9YqULQpjz/oA4gCIMKdskAs4vCVg87gWs7VmV/jUduocG4pPzIr3ZE5mihRqw5SDoyckiKNp8GbF3JCbUyZ2KW6FgCJfwwqzejSdAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 21664233AB;
	Wed, 18 Feb 2026 03:55:26 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH 2/2] USB: sisusbvga: Fix NULL pointer dereference in sisusb_read
Date: Wed, 18 Feb 2026 03:55:23 +0300
Message-Id: <20260218005523.1259725-3-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20260218005523.1259725-1-kovalev@altlinux.org>
References: <20260218005523.1259725-1-kovalev@altlinux.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[altlinux.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33417-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-usb@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,altlinux.org:mid,altlinux.org:email,linuxtesting.org:url]
X-Rspamd-Queue-Id: 040C515271C
X-Rspamd-Action: no action

sisusb_read() passes the user-supplied buffer pointer as 'userbuffer' to
sisusb_read_mem_bulk() in two branches:

    /* VRAM path */
    errno = sisusb_read_mem_bulk(sisusb, address,
            NULL, count, buffer, &bytes_read);

    /* MMIO path */
    errno = sisusb_read_mem_bulk(sisusb, address,
            NULL, count, buffer, &bytes_read);

If buffer == NULL (e.g. read(fd, NULL, count) from userspace), both calls
reach sisusb_read_mem_bulk() with kernbuffer=NULL and userbuffer=NULL.
The condition:

    if (userbuffer)

evaluates to false, the kernbuffer path is taken, and the subsequent
dereference:

    swap32 = *((u32 *)kernbuffer);

panics the kernel:

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

Add a NULL check after the existing sanity checks, before the first
branch, to guard both the VRAM and the MMIO paths. Release the mutex
before returning, consistent with the existing -ENODEV path above.

Found by Linux Verification Center (linuxtesting.org) with Svace.
Tested with 'USB Gadget Tests'[1]:

$ TEST=sisusbvga-fops-svace-null-deref
$ echo $TEST > tests/list.txt && make && sudo ./check.sh

[1] Link: https://github.com/kovalev0/usb-gadget-tests
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/usb/misc/sisusbvga/sisusbvga.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index 89d566d192aa..e14deb1955d9 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2319,6 +2319,11 @@ static ssize_t sisusb_read(struct file *file, char __user *buffer,
 		return -ENODEV;
 	}
 
+	if (!buffer) {
+		mutex_unlock(&sisusb->lock);
+		return -EFAULT;
+	}
+
 	if ((*ppos) >= SISUSB_PCI_PSEUDO_IOPORTBASE &&
 			(*ppos) <  SISUSB_PCI_PSEUDO_IOPORTBASE + 128) {
 
-- 
2.50.1


