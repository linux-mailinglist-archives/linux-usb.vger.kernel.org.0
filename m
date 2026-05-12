Return-Path: <linux-usb+bounces-37292-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dkHiKnabAmrhuwEAu9opvQ
	(envelope-from <linux-usb+bounces-37292-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:16:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F365051933B
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCAEC302BA47
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819772248A0;
	Tue, 12 May 2026 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZU9WQUkP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE21F5EA
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555762; cv=none; b=GlmY02LNS99/Dd7rgYjNxtUbTe465htoKUe1clmz4fM+YAau6uRm/L9Tqp50wIr+mZehZ1dCW15EPjZRlCcslWpt7gdkdhyj/YQCk6qfQHKmJAsqTRcqaMPCXs7i9/bR51Va06I3p5GEdmeuDieRTUOniz897nOdx81c3qRGlso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555762; c=relaxed/simple;
	bh=s6vk4XFhq56gsFPF6epH7jwnh8SKRAr5osYtQuyNo2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqne7n3/vtHyJoNDLsv7vTSo4sa1pPK4oAtU7JgqWkA/3544Ej2aXy2Vjt3w294uG1A6U86nF6GxA6Bd9RGlgoYoYPzUqID+SOCyon51Oe3D88eW05BWKf3+Km7rPNzeMHjJpzVo3oG/NUm9KPhTfQxA8CfNsmtSGIjTDd0WXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZU9WQUkP; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778555718;
	bh=mT0u88U/aZ1lq1x3h49Xcq2hmPqHP9PPWaDZmx/xWww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZU9WQUkPAPjZJ8bfiAGoMKur/apCzF+DT/aq1C1+3Cfbk7p7xpCOH9MIYigZv2oOC
	 Gqk/blxGGHURmZm1b3PmKyjL2dKhGjzyzVYQrYsOmVHF7U7tzDNgRrPeNf3lMdqWfv
	 uk3j4jKo5JTpnLS57FM1l5d4dUH7Y4M1VG4YQowI=
X-QQ-mid: zesmtpip4t1778555702t249f633a
X-QQ-Originating-IP: vcWSOCh9rYdAPztNQ1OqHA42hMOtHsLRLUwkntv3trQ=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 May 2026 11:15:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13157583043698133172
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com
Subject: [PATCH v2 0/4] usb: xhci: prepare MSI path for secondary interrupters
Date: Tue, 12 May 2026 11:14:54 +0800
Message-ID: <4EB0C0803AAAF502+20260512031454.3892011-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NzSvc8JXj5/NhSaC9JQBJCjgZ1iPHdxwGWA6VCo4Rf9cnGz9Jq73dxgw
	Je5zvih21NY1ObudDplpFXFY071hUfeEE1GvDNVpmNYfxRHaxUTVQAh1SDuLDZ9itJ4eoZJ
	/fwtV9ViO7Hb5iJgnVt3hb0MGmDbPto3FZ8gWQetIUK5fHYmmIUsqcs/EmLpfbFiwT4l4hY
	KUwfAPuh6P4Xs0sh7oRDmUbZoXjats4HrF4U2rmFwJ6x0x2qb6CRQylgmXUSzw/3kvN5JML
	JPf2cPUKobk4xD8F0lZBmp1MyDRASRpbyyEdwmbpHAzgPDvBsJXIWxmVJAyDJOIONwDNj0y
	UPFXBPUQ4YOZRNpXZybARQ9QhsV06lYNH8dn9k4VUWKBXu55ZFekcYhFQQD7RVYbfxEuUah
	UvfqgLfzU+wYRAriUb1BFogajfhDxeiWha2lTM6hgwPOCUSRW8FxGZPB4jYUKI9NwQJalbb
	GY+iGXSt+rZw2qE0DDvYlF7LiXxFwmRrgiVL3QlqHyNTUpzdh0TJm8NfHytIXvBUMUQP4Cn
	cvb4WHZlqkLbeHsOg2twhgzLk+u8E1ngFX1zUJQizrfPCvCfrwgh47BhCTVLzbHx9hKIn7Z
	IuJi3LS6ECYfHRbYRN2lUVaOurIXWPCxwoPaYoUbxSZ0j25EPWmifpvssj2map2AUL/tUuO
	+/PLlN4uGqX+vxXkzNYR7eMbQx0KNj+b8P0SCM0Rla33sGiVOYCVtITI7jZmFOBUHiwRR3G
	AHc3S9fGOGjVffZBVApVOdBab97lelm9OCu8cUTk8itiYo/aZlgAW5FDd0QTupcpA/TA/GP
	KxIbdXCba4rh7yY2Jd4t0h5+r67OLuaGQXxz9N530CdWTzrQ/k7jmHJ/ihZEf8qG8PloVCN
	vFzDVwAGLqYaD3PZvmIM60y7UI9J83UeqqRQTyfe5rzJL3OeoKnRlDBWyFBM9ilmAqckdSl
	78yQbyLvrb6xqRrUpPKCDiuUEr07W4+g+Zbw=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: F365051933B
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
	TAGGED_FROM(0.00)[bounces-37292-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

This series prepares the xHCI MSI path for secondary interrupters.

Instead of using struct usb_hcd as the MSI IRQ dev_id and deriving
interrupter 0 in the handler, pass struct xhci_interrupter as the IRQ
dev_id. This makes the MSI entry path operate on the same object that
owns the event ring and interrupter registers.

The primary path remains unchanged. Interrupter 0 is still the only
interrupter used by the normal xHCI path, and this series does not
enable extra vectors, change IRQ affinity, or add any new routing
policy.

USBSTS.EINT handling is also kept on interrupter 0. The bit is
controller-scoped, while IMAN.IP is per interrupter, so secondary
interrupters should not clear the controller-wide EINT status.

This is only a preparation step for future secondary interrupter users
and does not change the current primary xHCI interrupt behaviour.

Changes in v2:
- Patch 3 disables the primary interrupter before freeing the MSI IRQ,
  so the interrupt source is quiesced before releasing the vector.
- Patch 3 exports xhci_disable_interrupter() for xhci-pci module builds.

Xu Rao (4):
  usb: xhci: store xhci_hcd pointer in xhci_interrupter
  usb: xhci: route MSI through interrupter context
  usb: xhci-pci: use the interrupter entry as MSI dev_id
  usb: xhci: clear USBSTS EINT only for interrupter 0

 drivers/usb/host/xhci-mem.c  |  1 +
 drivers/usb/host/xhci-pci.c  |  9 +++++----
 drivers/usb/host/xhci.c      |  1 +
 drivers/usb/host/xhci-ring.c | 26 ++++++++++++++++++--------
 drivers/usb/host/xhci.h      |  1 +
 5 files changed, 26 insertions(+), 12 deletions(-)

--
2.50.1

