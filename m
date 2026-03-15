Return-Path: <linux-usb+bounces-34821-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML96NhKXtmnMDwEAu9opvQ
	(envelope-from <linux-usb+bounces-34821-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 12:25:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52667290857
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 12:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31CB301DE20
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C433F33A6E0;
	Sun, 15 Mar 2026 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4dwVUJ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E11267B05;
	Sun, 15 Mar 2026 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773573899; cv=none; b=Oh2s3AkDxbGjuLbZeSxbjg5hdG58fWqt/Q/doVOLkbG6uDNHei92dIa7QApnE/69Md9F3VTwcOTSzB2XswUqHd4390JZCzPL9YXS5eW5HlfkO/gZc38hPm0RGV95BlrQDWihIp7KwKM3Exl85NdBUCppKAHw6+jSnfGROA0o21w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773573899; c=relaxed/simple;
	bh=tlATkbd1A5yjwsckAb+9heaam6KZoma++SSiJPJWNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N1ortLOL6maf1j0I/VHsqeIsZQeCuHu3WtzI6aWg/wCBZSxDBYJIIcbZm+DbNwdLIXgBJcnSGCR37h6K7JNpgsHiJsQGVGD7XvEUH8FiNdG+fIaVpQO6fmAs1HY4mEcrLIHTIirpVo5Bv+xF9ed+Bhm4Y97cZLRjq2EYokyds10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4dwVUJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2888C4CEF7;
	Sun, 15 Mar 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773573899;
	bh=tlATkbd1A5yjwsckAb+9heaam6KZoma++SSiJPJWNE8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G4dwVUJ8H7My09OI6BtGQkYSg5UZUlgMTxFfg+nqzdc9ohNquwgWrwSNPtQXfiKgQ
	 G0kXyIJ3C3oXFOdNXKVMcNjA4X5+PRvkGt9HNv6I29Lm060gZVeMdEYVI3vDo8OjWk
	 QRyZlxoc0CXieGMqYXt7fAjNe3oUk3DdqlSHqSwwnbqV/jbNtdAfk7B3zr78Xp9yuw
	 50b3HuPLmkZqcCLnr14kmGDdzDXYB/HHSxsME1hDkHDDrVT5QMCg5hlIDRAHXAgzX7
	 yizIhNNBCL5zA3PYHfCt7RThhkLP4vBOuc9j1hFf7FGA/cYV6m9qxnuXK/0CHszi95
	 opCTYJXTwQYuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7188D58B1A;
	Sun, 15 Mar 2026 11:24:58 +0000 (UTC)
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s_via_B4_Relay?= <devnull+bence98.sch.bme.hu@kernel.org>
Date: Sun, 15 Mar 2026 12:24:44 +0100
Subject: [PATCH v2] USB: core: Use krealloc() in usb_cache_string()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260315-usb-krealloc-v2-1-32f83e090409@sch.bme.hu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNzQqDMBCEX0Vy7opZxWJPfY/iIUk3Tag/ZVelR
 Xz3RqGHwlw+mJlvVUIcSdQlWxXTEiWOQwI8ZcoFMzwI4j2xwgLrotQaZrHwZDJdNzqoqNKlx7I
 xjVdp8mLy8X3c3drE1giBZTO4sJ/0RibivRiiTCN/Du2i9/rPgP+GRYMGf65tgylVgVdxIbc95
 WFW7bZtX7kHnaHCAAAA
X-Change-ID: 20260311-usb-krealloc-4e413f239a9f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773573897; l=4191;
 i=bence98@sch.bme.hu; s=20260213; h=from:subject:message-id;
 bh=2kZ+PbbmbSbJa9UFioo3zinMoPidNiiYW8i/CUabtoE=;
 b=U4YeXma1jMRkhsd3BfahbVB9heC7qc9cqfIEry8ybQADDtelwJmnR+tnml/DXzp6zuJcD6oog
 205Pr+HIxvVAK5cFPVsE5iPIMXVfD0ERUyLdQ9UGNwJKMGCoHti4pVV
X-Developer-Key: i=bence98@sch.bme.hu; a=ed25519;
 pk=rtWE8PtqZ5ZMyUVCckDq8i1ASLxgUbV2fwDA8KaOli8=
X-Endpoint-Received: by B4 Relay for bence98@sch.bme.hu/20260213 with
 auth_id=636
X-Original-From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
Reply-To: bence98@sch.bme.hu
X-Spamd-Result: default: False [-1.45 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34821-lists,linux-usb=lfdr.de,bence98.sch.bme.hu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	HAS_REPLYTO(0.00)[bence98@sch.bme.hu];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bme.hu:email]
X-Rspamd-Queue-Id: 52667290857
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bence Csókás <bence98@sch.bme.hu>

Instead of "shrinking" the allocation by kmalloc()ing a new, smaller
buffer, utilize krealloc() to shrink the existing allocation. This saves
a memcpy(), as well as eliminates the temporary `smallbuf` allocation,
which guards against allocation failure under extreme memory pressure.

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
---
Tested on an AthlonII X2 PC running Arch userland with Plasma.

  $ sudo lsusb -vvv | grep -P 'i(Product|Manu)'
  can't get debug descriptor: Resource temporarily unavailable
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ohci_hcd
    iProduct                2 OHCI PCI host controller
    iManufacturer           1 Hewlett-Packard Company
    iProduct                2 HP USB Smart Card Keyboard
  can't get device qualifier: Resource temporarily unavailable
  can't get debug descriptor: Resource temporarily unavailable
    iManufacturer           1 PIXART
    iProduct                2 USB OPTICAL MOUSE
  can't get debug descriptor: Resource temporarily unavailable
  can't get device qualifier: Resource temporarily unavailable
  can't get debug descriptor: Resource temporarily unavailable
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ehci_hcd
    iProduct                2 EHCI Host Controller
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ehci_hcd
  can't get device qualifier: Resource temporarily unavailable
  can't get debug descriptor: Resource temporarily unavailable
    iProduct                2 EHCI Host Controller
  can't get debug descriptor: Resource temporarily unavailable
    iManufacturer           1 USB
    iProduct                2 Disk 2.0
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ehci_hcd
    iProduct                2 EHCI Host Controller
  can't get device qualifier: Resource temporarily unavailable
  can't get debug descriptor: Resource temporarily unavailable
  can't get debug descriptor: Resource temporarily unavailable
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ohci_hcd
    iProduct                2 OHCI PCI host controller
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ohci_hcd
    iProduct                2 OHCI PCI host controller
  can't get debug descriptor: Resource temporarily unavailable
  can't get debug descriptor: Resource temporarily unavailable
    iManufacturer           3 Linux 7.0.0-rc3-00355-g94926a68d237 ohci_hcd
    iProduct                2 OHCI PCI host controller
---
Changes in v2:
- Update msg, remove backticks
- Add testing results
- Remove ?:
- Link to v1: https://lore.kernel.org/r/20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu
---
 drivers/usb/core/message.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index ea970ddf8879..a0c77709aa36 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1005,7 +1005,7 @@ int usb_string(struct usb_device *dev, int index, char *buf, size_t size)
 }
 EXPORT_SYMBOL_GPL(usb_string);
 
-/* one UTF-8-encoded 16-bit character has at most three bytes */
+/* one 16-bit character, when UTF-8-encoded, has at most three bytes */
 #define MAX_USB_STRING_SIZE (127 * 3 + 1)
 
 /**
@@ -1026,16 +1026,18 @@ char *usb_cache_string(struct usb_device *udev, int index)
 		return NULL;
 
 	buf = kmalloc(MAX_USB_STRING_SIZE, GFP_NOIO);
-	if (buf) {
-		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
-		if (len > 0) {
-			smallbuf = kmalloc(++len, GFP_NOIO);
-			if (!smallbuf)
-				return buf;
-			memcpy(smallbuf, buf, len);
-		}
+	if (!buf)
+		return NULL;
+
+	len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
+	if (len <= 0) {
 		kfree(buf);
+		return NULL;
 	}
+
+	smallbuf = krealloc(buf, len + 1, GFP_NOIO);
+	if (unlikely(!smallbuf))
+		return buf;
 	return smallbuf;
 }
 EXPORT_SYMBOL_GPL(usb_cache_string);

---
base-commit: 1c9982b4961334c1edb0745a04cabd34bc2de675
change-id: 20260311-usb-krealloc-4e413f239a9f

Best regards,
-- 
Bence Csókás <bence98@sch.bme.hu>



