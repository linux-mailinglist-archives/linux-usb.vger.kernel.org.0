Return-Path: <linux-usb+bounces-36982-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIXbEPY9+mmjLAMAu9opvQ
	(envelope-from <linux-usb+bounces-36982-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:59:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA44D2F50
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F02383054F4C
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 18:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AFF4ADD81;
	Tue,  5 May 2026 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Wp7EOrzf"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1E3BED19;
	Tue,  5 May 2026 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007391; cv=none; b=u6rtTNx6R19FqEUWdEW2LZQBlfQvH/FO2DqcrMWo7vnLb9JwIYH4L4p74Xomrutfmz6UUATdiQyctyS0bfoHU2jMdzZTzEwS9k7MkLiaD1lh++BASZem3npPA3N3WAFeFD1vjf1DweRpQ0g1XpAPrfC+kGJAtkExeS645qrT8ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007391; c=relaxed/simple;
	bh=EOx5SKBm0fyEIhBa17G/AY4peXZ8ik+xZr5fQwTDBME=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HPNFYMvrpEBICA96HDR7vvTqNHB6/xKnbgYYQ2Bg8AB1zbVtnf750Eg6vyl7+IjtAwnwrAl+uOZcXoyN2/J5f5P0F/ZlEds4kksxFlBceqGdJ8SyUScazN4gleM5Vf8M6RTHyXCciPyX9b2M2gn0eWCvgRDuYPLXs7kJfhCXr6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Wp7EOrzf; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ldS96RrKmNNsOD/yzOFPOqOUq9syJBSHCyCE054Ggck=; b=Wp7EOrzfImZsHlqSLMXD3CMB3A
	Yn+aAh8YPzdKbfe1NVDhC58UIkiw1DUbvQruwHzWAXHiaum66ivu6R9uAZtj9XVYYYNQLIp6pnUFS
	Xe1FDQnCMzl/7MmNhXqOK2VqvR311JkgdYw/hUSAPe58cpGPvXDY7a35O4J7wjP96tq5/DNBsidOc
	nzSee+ZnW8beLriBjsrA1D4nY03gOj+hRAm/vwAjRX6CeCFnvjHceihPNkf0NlFL8wA17bLq+R+0x
	BQZHYYZvGWReSvknTi8U/q3AS1j1A30Ei4CnpMhMUJ61DtdmTFRMBWI2WTiiESyCmHClo66dlVjQ5
	hb4RBfkw==;
Received: from 177-136-88-215.vmaxnet.com.br ([177.136.88.215] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wKKwT-006ZjB-Vr; Tue, 05 May 2026 20:56:25 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Subject: [PATCH v3 0/2] usb: usbtmc: add sanity checks for interrupt
 endpoints
Date: Tue, 05 May 2026 15:56:02 -0300
Message-Id: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6CMBCF4auQrq2hZQR05T2Mi6G0MEbAtNCoh
 Lvb4kZjXP7Jm29m5rQl7dghmZnVnhwNfYhskzDVYt9oTnVoJlOZpyAln1w1dooT9dzRU3MjEE0
 KmCtQLFzdrDZ0X8XT+d1uqi5ajZGJi5bcONjH+tKLuPuve8EF39UKoIKs3CMeqcEr4VYNHYu8l
 59A9gvIAGQCDUJZgCnEF7AsywtnugzUAgEAAA==
X-Change-ID: 20260422-usbtmc-iin-size-f1aaf04a6c4c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Pecio <michal.pecio@gmail.com>, Dave Penkler <dpenkler@gmail.com>, 
 Johan Hovold <johan@kernel.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: BBDA44D2F50
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
	TAGGED_FROM(0.00)[bounces-36982-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.917];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

Dear maintainers,

This is a v3 patch for an out-of-bounds read originally reported by
syzbot in [0]. After discussion, I've split the original fix into two
separate patches.

The first patch is a more conservative check against each URB in the
usbtmc_interrupt() path, to ensure enough data was transferred to
include the necessary payload headers. I've tagged this one for stable,
as it shouldn't impact existing devices besides fixing the out-of-bounds
read. Devices that eventually raise problematic interrupt notifications
will be able to try again once the URB is resubmitted.

The second patch is more strict, as it rejects devices that advertise
interrupt endpoints with wMaxPacketSize below 2 bytes. This approach was
suggested during v1 of this series, as these devices are unlikely to
exist and won't work properly with the current usbtmc driver. This
approach is also more aligned with the intent of the USB488 spec, as
interrupt endpoints should ideally be setup with enough space for
the payload headers.
While the first patch is sufficient to fix the out-of-bounds read, there
seems to be little point in having those interrupt endpoints configured
if the driver will ignore all URBs from it.

[0] https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2

---
Changes in v3:
- Split into two patches:
  - actual_length check in usbtmc_interrupt() for the syzbot fix
  - wMaxPacketSize check in usbtmc_probe() to reject quirky devices
- Link to v2: https://patch.msgid.link/20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com

Changes in v2:
- Instead of ensuring buffer size, reject devices that advertise illegal/invalid interrupt endpoints
- Link to v1: https://patch.msgid.link/20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com

---
Heitor Alves de Siqueira (2):
      usb: usbtmc: check URB actual_length for interrupt-IN notifications
      usb: usbtmc: reject interrupt endpoints with small wMaxPacketSize

 drivers/usb/class/usbtmc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260422-usbtmc-iin-size-f1aaf04a6c4c

Best regards,
--  
Heitor Alves de Siqueira <halves@igalia.com>


