Return-Path: <linux-usb+bounces-36983-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMgNHws++mmjLAMAu9opvQ
	(envelope-from <linux-usb+bounces-36983-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:59:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB904D2F5E
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9BFA309B1BE
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 18:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E500E4ADDAD;
	Tue,  5 May 2026 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mkfstUgh"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF422C15AA;
	Tue,  5 May 2026 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007392; cv=none; b=L+XwRTuJ/12xRNwtJWsRxqaH8XRg8kAl+BnVIOWdsCiX7vumN37/DxCADB6/zKpHwn1I5u9thKCJy+16+eVb775pxl+mJ8M96tQVPMXt9RO9SZOvxN9iaJXc+EcEWsUSs9yzxc4/2sQSjXjzUv6dfe6F6/FMP84d+rfvPytkFHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007392; c=relaxed/simple;
	bh=gA3TLx/FD/j9Nk85cVEGIDaCVLMIPzWHQozaOn/OvQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/secT3SBDPKjmGFhMGlF0HqI4BPdxFqpIXP/BQXzaA/A03+JFo1vM3ksg6kXr1RUpL9iOoDandQryC12ocHEXEgbD9C1o7LhbzL0a8xRFSYMqR6r9N+Z8yiZcC4HgHuwkV8K2slmfTeCJ83n142PXtLGuuEJmbZnQqwPv2ZgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mkfstUgh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U8Ge8W0clsVUZseFV/dvVZuEyWIUtDdNTUV+vBPz5bY=; b=mkfstUghyaYIk0jwIqVj9TirNF
	11jFUhUElFH7xCHUSecSo1JfGRhAL+/isrUcnZ7+Gi7nnW9BNqzH79mABwqSD83cCMCx9CgV6tInU
	F1cRWdvfpXP89BA7eVCkoddQgYeKYeClMkDtSURZigC6Sgz8u37Ctxk5zWzCqAHWN3mQm+PUsaNIg
	9qBnK1bshJey8je2BpNstzeAeVmqMBzrmS7PMjeIHt7SRtuL8a1CLwEOTSD+aYIvl65cxQDdAJySe
	Eh0bVM4c5ga3LL8MHRDKq0+W6jvz9AoQkP8hQRv8vzpDUcM5erNtX6gOFKmHp61klb06DzfbJp+mK
	i8wcbITw==;
Received: from 177-136-88-215.vmaxnet.com.br ([177.136.88.215] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wKKwW-006ZjB-Jz; Tue, 05 May 2026 20:56:28 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Date: Tue, 05 May 2026 15:56:03 -0300
Subject: [PATCH v3 1/2] usb: usbtmc: check URB actual_length for
 interrupt-IN notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-usbtmc-iin-size-v3-1-a36113f62db7@igalia.com>
References: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
In-Reply-To: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Pecio <michal.pecio@gmail.com>, Dave Penkler <dpenkler@gmail.com>, 
 Johan Hovold <johan@kernel.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: DDB904D2F5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36983-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.864];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

USBTMC devices can use an optional interrupt endpoint for notification
messages. These typically contain two-byte headers indicating the
payload format, but the driver does not check if these headers are
present before accessing the data buffers. In cases where the URB
actual_length is not enough to fit these headers, the driver will either
cause an out-of-bounds read, or consume stale leftover data from a
previous notification.

Fix by checking if actual_data contains enough bytes for the headers,
otherwise resubmit URB to the interrupt endpoint.

Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
Cc: stable@kernel.org
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
---
 drivers/usb/class/usbtmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index bd9347804dec..e15efd0c5ca7 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2306,6 +2306,14 @@ static void usbtmc_interrupt(struct urb *urb)
 
 	switch (status) {
 	case 0: /* SUCCESS */
+		/* ensure at least two bytes of headers were transferred */
+		if (urb->actual_length < 2) {
+			dev_warn(dev,
+				"actual length %d not sufficient for interrupt headers\n",
+				urb->actual_length);
+			goto exit;
+		}
+
 		/* check for valid STB notification */
 		if (data->iin_buffer[0] > 0x81) {
 			data->bNotify1 = data->iin_buffer[0];

-- 
2.54.0


