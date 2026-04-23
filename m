Return-Path: <linux-usb+bounces-36454-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PgWLG5f6mmrygIAu9opvQ
	(envelope-from <linux-usb+bounces-36454-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 20:05:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A843E455E31
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 20:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 993273003838
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C9A3A9DA5;
	Thu, 23 Apr 2026 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="f4LTNxSz"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F5B3A6B82;
	Thu, 23 Apr 2026 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776967530; cv=none; b=MvN/v8PqT6wA8nB3ZdTFAimgf3bBPWNXaYf8WsAVDs4RuNKIRzqgQUOtwHV5zPv4MR/x7K6qIobbGebGIRgQz0M81nGnfev7cLiwkkZRWNeYA9oi5oQUSjgyuAPrJe7JFRlWFXk2MqC7CiVGVVuUvFOqvCGe+1ShV/sjqguZF3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776967530; c=relaxed/simple;
	bh=gRQZNg3RsExKCvbQv3X792/waVzT7cCCaadLipHXalE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bLUoupcoeYlsPpLP815Wx5llPR1tD3yZctchfs/x10qZbGPy+fdah0V8TH+1EztUCMR6rHQvDhtZ2VtCSPquelAbknJJ7wxWktl70K3vyBPoe4qQGiX/AGCY0u7NI+UK5Hkt0m90H/ss8DjCzH/7DwIxRA74P4ygYGGvoNeiUqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=f4LTNxSz; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KnVcWgALz4nPjr0rNicg0PL0owuMDrTdd1YN+smFvVo=; b=f4LTNxSznZHxHWGdWyomtsjNzy
	JapbRgOxW3HCiQfReW36IlOSiya8OYqG69dCp6yWiEyfaYE5qd7n9IUjyHYG4YOBs9SMknNHqw0xE
	U94p2GA7cUlymPxYAT+a9WWUCHoshJv19hdmQ2BT8Zo28ZInZETsaHgE3Rs0TfJFlGIg4uLSNZVFT
	IYrYHB9NHSVY2kGYQWVtXDvI/MPSWIGsGto6YqJXwUkBwfpBV7Gznbzf19ZbvXiz0FDH5In6FE9Rr
	UAJTITfNoyAJ377ah/JNtZaUBtsGAhMSht1W/hsLy4LqYQVoJ7zSu2R9kmgAfcDWM+aSL89hHdDX4
	rg0RTS0g==;
Received: from 177-136-93-33.vmaxnet.com.br ([177.136.93.33] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wFyQW-001DVH-BG; Thu, 23 Apr 2026 20:05:23 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Date: Thu, 23 Apr 2026 15:04:38 -0300
Subject: [PATCH v2] usb: usbtmc: reject invalid interrupt endpoints
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CQAxFr0K6toYZR6KuvIdhUcoANcKYKRCVc
 HcB1y5f8v77E6iP4hUuyQTRj6ISugXsLgFuqKs9Srkw2NRmqbMWBy36llGkQ5WPx8oQVamjjB3
 DsnpGX8lrK97yH+tQ3D33a2Y1GtE+xPd2OZrV+18fDRo8luxc4Q6nM9FVanoI7Tm0kM/z/AXD8
 5cawQAAAA==
X-Change-ID: 20260422-usbtmc-iin-size-f1aaf04a6c4c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, 
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36454-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.496];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: A843E455E31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USBTMC driver allocates the Interrupt-IN buffer according to the
wMaxPacketSize value obtained from the USB endpoint. If a USB device
advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
or an endpoint constructed by syzbot), the buffer will not have enough
space for the mandatory headers and will trigger an out-of-bounds read.

Fix by rejecting devices advertising interrupt endpoints that don't fit
at least the mandatory headers (bNotify1 and bNotify2).

Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
Cc: stable@kernel.org
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
---
Changes in v2:
- Instead of ensuring buffer size, reject devices that advertise illegal/invalid interrupt endpoints
- Link to v1: https://patch.msgid.link/20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com
---
 drivers/usb/class/usbtmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index bd9347804dec..d851c1d76d5b 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2431,6 +2431,10 @@ static int usbtmc_probe(struct usb_interface *intf,
 		data->iin_ep_present = 1;
 		data->iin_ep = int_in->bEndpointAddress;
 		data->iin_wMaxPacketSize = usb_endpoint_maxp(int_in);
+		if (data->iin_wMaxPacketSize < 2) {
+			retcode = -EINVAL;
+			goto err_put;
+		}
 		data->iin_interval = int_in->bInterval;
 		dev_dbg(&intf->dev, "Found Int in endpoint at %u\n",
 				data->iin_ep);

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260422-usbtmc-iin-size-f1aaf04a6c4c

Best regards,
--  
Heitor Alves de Siqueira <halves@igalia.com>


