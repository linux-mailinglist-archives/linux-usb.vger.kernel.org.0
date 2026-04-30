Return-Path: <linux-usb+bounces-36730-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI+7ADT58mnxwAEAu9opvQ
	(envelope-from <linux-usb+bounces-36730-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:39:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63D49E2A3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D7B830262E0
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 06:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA49371071;
	Thu, 30 Apr 2026 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZLyGElr2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA159443
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531183; cv=none; b=l67B9evsF/X/fkjBVCTi62ylCu5ZiqKXqGOpCPSK8AJ7Csn3cl7YRR3ecZ5/TMnDZk5YfmUAuTVUqJWP25cN6DUl5L1ebdERBeCSGBd23Df28+5teLgOjkOObCVL1tdODTtDOyRNZNlwsOFgnnqkI8Bn1iKJJnIouhI5hOXI/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531183; c=relaxed/simple;
	bh=urkfHleBm79trkWUNAakAaq1BNlcM82x8m6Nf9fm+Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaFjCp8CsItqbyN7Ms72TrbmXixenCILyihcowcYWbEtwtzRK+QUGukGKbNTvKSUEb9/SSWpTg5u4SBBnBvSa9ixR/WxWtgfB6mTlgA1zlqD5eNFpDCZrI8UFAQQHRARnYX4weIUbMy9cFwQmkBp3RWeZVoFVkofXGnh1sYI7Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZLyGElr2; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777531148;
	bh=dYYpbWQwS5G2nHPMlQGhRlNT9RZY0V2w3GHnMBlC2KM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZLyGElr2GLnaxvUtX3UAqSf8kvA3bnzwmVrmY2uF85rqOZZlxjMIxhVBeJiUggEs9
	 otr+tJYZCJOM116I6fRGhKaiCJ1qYGCPDHmkrU4hGf4vh4kNkYJFxFEEeABPOprLZ1
	 vKXDpC53g30sTlT34XK/DUvgLzHQS48yMw2WlROc=
X-QQ-mid: zesmtpip2t1777531133t49c0b445
X-QQ-Originating-IP: DKd2frR7Eja5Tthb/wpyvkE/Xcm/L/DAVFMmiiHwY2M=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 14:38:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8590673320222264445
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com
Subject: [PATCH 0/4] usb: xhci: prepare MSI path for secondary interrupters
Date: Thu, 30 Apr 2026 14:38:49 +0800
Message-ID: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDjjYYC84KgIelTLT7Mao/YPJuFMpydkMJPUjnQDR8/htp3LI/HT/zBy
	vIuS/w/LE+nDYgpi63aybZ7h6xnnnonr2kwABXgWRCY2hqtzOofNif6h2ahLUfjQ8J+sbXe
	LuGzuafsOV3royEuWEKftFB+i8/IYp+BBycyiKLtrwYOgZr+qnQnuO8EOqsCxf+BDFemB+F
	WW76VhdnrgXxMArMUg2j1tTazLICHKUZKyTfkqdxJcUK220Q2IwkYjUwcwAMRpfIQ0VHEQI
	hsWljshMNLGkoNEk9rpt6RWfpeANWswC15VAFse5C0pr7DvzwDq42/vycZJQmAjzxbRQAyD
	gJjYmUiqrL73DOwGGdEJ0iqhzNdCrJbChOZSygLq7MASD5oeijnEfnD0saillZbpIJP/+W+
	Q/Xbk8VbH4B2ZeuiodelIarV2L50LiMlAqZyXmK0NCWI6pFvOCWcVr6CdNFtar48T3NQj5/
	4P2GR8UZKMVJfH073jz2t6n1Ve8vLFy1Ya4CGky532u7WgICPoFxVvvHv9xKvbc/wvsoLCe
	u8eTNdbzCfPBczdkxU7QKtfO5OabW0363vyTBI2yzts4njK04mkK7YnRC2UZxzs+/d1vtVR
	QPOtq+PN6uc+9qXOFLDjGGHCq//X+TwxMgp4UtflrMzSTIfjLOdzejlbLCKyOw1y7Kyj1Nb
	QdVSESk/ij61jEEdtLiy6mgjR4a9sGC868y/EEJIIfOEWrKVD57Dg+LQUwA5b960I9lwrw6
	cbgEQXaG4sgi4gQdoTNv9cMaRqDYmrLzrZNoxI19Kb1HRVunBvme+wHX2mOYKwBG2xzz/j6
	gzcfwYLAIoCChxB87hI0lTFVqiWzNkshr7bCI9EipyEgi6Tp4m9sQYu21YCXriBZP6Z585T
	tobWuL80OwWTl5S7jkqVNW37CgVmeiuKOWqPCoFuhpwrHJUmKhpTM0dd9OVFVgUOXWvEaB9
	GF1jKGQgNyUfviknMpMCzWVCHADCiU2+k4pGKAa6ZDidDTlQtth+ThUMt37UWhrlZNm5ZTj
	nOSxW7x4yayqW6EuFb/TWOyNtV7xT9j77iCmShhY2TQrlzQA3V4EP+YgHgbTcReuw9KT+Cc
	Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 5E63D49E2A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36730-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi,

This series prepares the xHCI MSI path for secondary interrupters.

Instead of using struct usb_hcd as the MSI IRQ dev_id and deriving
interrupter 0 in the handler, pass struct xhci_interrupter as the IRQ
dev_id.  This makes the MSI entry path operate on the same object that
owns the event ring and interrupter registers.

The primary path remains unchanged.  Interrupter 0 is still the only
interrupter used by the normal xHCI path, and this series does not
enable extra vectors, change IRQ affinity, or add any new routing
policy.

USBSTS.EINT handling is also kept on interrupter 0.  The bit is
controller-scoped, while IMAN.IP is per interrupter, so secondary
interrupters should not clear the controller-wide EINT status.

This is only a preparation step for future secondary interrupter users
and does not change the current primary xHCI interrupt behaviour.

raoxu (4):
  usb: xhci: store xhci_hcd pointer in xhci_interrupter
  usb: xhci: route MSI through interrupter context
  usb: xhci-pci: use the interrupter entry as MSI dev_id
  usb: xhci: clear USBSTS EINT only for interrupter 0

 drivers/usb/host/xhci-mem.c  |  1 +
 drivers/usb/host/xhci-pci.c  |  8 ++++----
 drivers/usb/host/xhci-ring.c | 26 ++++++++++++++++++--------
 drivers/usb/host/xhci.h      |  1 +
 4 files changed, 24 insertions(+), 12 deletions(-)

--
2.50.1


