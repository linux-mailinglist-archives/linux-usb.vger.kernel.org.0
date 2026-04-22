Return-Path: <linux-usb+bounces-36425-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JyXIFBK6Wl1XQIAu9opvQ
	(envelope-from <linux-usb+bounces-36425-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 00:23:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD81544B41A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 00:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27958306EC7D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 22:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A467345749;
	Wed, 22 Apr 2026 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RiYrlUv7"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87CC31A56D;
	Wed, 22 Apr 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776896551; cv=none; b=KvNpEPK5xbOZbQm1EZWf+Imaqd0AGwdO26mF/Pb9P7pBIPjYHQYh2sloeH7SwqHv15JTC4kry8EmAkCkH0An+ewZjPPlVdUBLds0VUKbblHTIFNXKBCRWzyDvrnRQP656ZVBakDpWpo0Esh7laLcEPUFM14pE33xiOxGbXpsP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776896551; c=relaxed/simple;
	bh=mySrrGpsV94xAvpH+X4XlcQKwQ29kAU0hJ9DU3CY2bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C4EyScDhWo56vGk7Vzxb4IDRf7WNsjiNd0FGTsfiEBqiYF/0lInsKhpEyv7WKCbU6Sofd5iz2VhOEiET/pJbpfVemfH8fEcbUatIu763RCmh5qa+wHnO5sgMu8O7VZZgb0PbHw9+jWMHxRRWFTSUPOoej3bm8Nw4vbZA3D/RAvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RiYrlUv7; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PJxmFD7oVhowjFfRLMd/wJWbXNgSckWUxtHXXfyc+o4=; b=RiYrlUv7UE8f6KVaY2hxtR3ODM
	mq0oSCxtqaAix7fGuhTSjHE41CssQJaA3/tGa4OHWZZFaO8lGrlZJudnYtb5RZlfHe/bAur6+4743
	ZUEE4/G+TCRgcBzCgE0M4xqWHRqMxdM0NGwJuFPOdEmt/CW/FTo1iEXQpV8CM1SV2FSrl7H59LNwr
	SMEeLOAu4BEr6CUnmaNoBjLae7T8EEGT80R0Rq0RqJ0I00v14XcJjYcgGBSxDUZgkUeKYyQTMWTzk
	N5CqCK6E8Op5QPOXq3RInvGEbKy+2xUmwYu5wPsdvvv0v4WhDxnVqDTnWtPq0dV6hWfFlkNgb8uf5
	HCVvl0Ig==;
Received: from 177-136-93-33.vmaxnet.com.br ([177.136.93.33] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wFfxh-000TZ2-Me; Thu, 23 Apr 2026 00:22:25 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Date: Wed, 22 Apr 2026 19:22:09 -0300
Subject: [PATCH] usb: usbtmc: Allocate enough space for interrupt-IN buffer
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQhJCFV5Eu4jjREUxLRkupe
 HejXb7F/zsoF2GFttmh8EdUXrnCPhqgKeaRUYZqcMYF453DTft1IRTJqPJjTDbGZHwM5Alq9S6
 c5Hsfu+ffuvUz03pt4DhOpaPekXMAAAA=
X-Change-ID: 20260422-usbtmc-iin-size-f1aaf04a6c4c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, 
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36425-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: DD81544B41A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USBTMC driver allocates the Interrupt-IN buffer according to the
wMaxPacketSize value obtained from the USB endpoint. If a USB device
advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
or an endpoint constructed by syzbot), the buffer will not have enough
space for the mandatory headers and will trigger an out-of-bounds read.

Fix by ensuring the driver will allocate at least enough space to fit
the headers for Interrupt-IN packets (bNotify1 and bNotify2).

Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
Cc: stable@kernel.org
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
---
 drivers/usb/class/usbtmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index bd9347804dec..22efa74008f8 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2452,7 +2452,7 @@ static int usbtmc_probe(struct usb_interface *intf,
 		kref_get(&data->kref);
 
 		/* allocate buffer for interrupt in */
-		data->iin_buffer = kmalloc(data->iin_wMaxPacketSize,
+		data->iin_buffer = kmalloc(max(2, data->iin_wMaxPacketSize),
 					GFP_KERNEL);
 		if (!data->iin_buffer) {
 			retcode = -ENOMEM;

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260422-usbtmc-iin-size-f1aaf04a6c4c

Best regards,
--  
Heitor Alves de Siqueira <halves@igalia.com>


