Return-Path: <linux-usb+bounces-34056-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOyjGGdTqWkj4wAAu9opvQ
	(envelope-from <linux-usb+bounces-34056-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 10:56:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94D20F1ED
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 10:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 031B3305653B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A893C37AA7A;
	Thu,  5 Mar 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RXiDXQ18"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9CC3783B5
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704427; cv=none; b=NywHHdbmuc/j6oiQ+a4JTzJDnbXa1/wzl7A9xJ8FMdnJWYZFrHF9PR7+V08DQ1HrkhO/AiWtTcRzMlUo05ePWX2QpN3Tg88778mxw34lFKNTzm8SMVwa5P63l7rzDpn6U0k4XCQYld8IE+FJRD+c6+Pdrm0y8KBPx4i4iin+vYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704427; c=relaxed/simple;
	bh=sG60QjrCMm5xsvTaLTxtbMCn0kIVdTMRy5Wl3mbmv00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuhwvPWhjoME1E9v6SlLIdXhXWcccoetMbmg+rlRgFrdi6qJu8KXBOat7FUb83scTjQtN9pn0NVVLxuNPS0okK40ED/CjdGInqijmnHffyIKuubI69C5ZhPRgnimBpe+jtr/VElOzQ80WLjNkrGsOanOwgjmmAZX4YV8Z/Eyirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RXiDXQ18; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1772704401;
	bh=Ma5atvt63uXsv26j3mB++QPkdyCIJdGnN5ymHu73+r4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RXiDXQ18FbunE3vln4XylCL59iAQgu9t/b19dEqZz1KKLUn8y3LiYl/uoOiABaoAf
	 VJPFLM/MmZpkDIARYTbTlAPhES3G8D1bCgauB1oiKXcATJKuHQKtK2s1CKgeMu130l
	 2YYfw2BlBHXIIEEfCjEPmD6aTv6VDgcmo5s2mPc0=
X-QQ-mid: zesmtpip4t1772704386tf6f9e72d
X-QQ-Originating-IP: bXXFYcn3Ev4pfRuCsdxhWqo5harfCYIpuPXClP5ZQSc=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Mar 2026 17:53:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3191242563000423774
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com
Subject: [RESEND PATCH v13 0/2] usb: xhci: route device to secondary interrupters
Date: Thu,  5 Mar 2026 17:52:56 +0800
Message-ID: <8338541D6B5694ED+20260305095256.691595-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MIq1RSCuHBVZ1XhVT22Kxhu4esBV1fihu8s/tH7WwyAGoyYwRt6D/fVs
	lrkclSC1/il+SVkkboi5pdWqbf+6s6IcKR4jmtC0fOA17Ert5vVoj9JNWtx13W6wQFosW7D
	K7B2YcrQlFlMZL/p7OpXdKxXU00Ou0YR9BEVkAIILciYqo/SPNwbWHvYN22h1tpq5UdMZmW
	TGi+qmGMNYQsKWoCll6A+bOM60Flwa7Z/hJM/XaqqqeXtdeJ7PvZE0PUOmENXJyvXM+5Xq2
	BTP9g5FI0nYnaerhJr74CINijo241YdcnGPvv4AAXhnuThdIHmvo6ttE8DsrmS0N0BZXzMx
	weo1ihfsXn/wLGaW0oyEZEeAUtaMK8aBXSCA7HysGJCbjhG1//ijV1B0u0pvhTktvSdaIOL
	TRDN5tvlBIMnfPursVa45Fu5rUcTrp7rUFFi5kR3HZE2GOddWALKam5gJdH1W87s5LoPN0P
	GdGosu1KBB5NdpuzcdvrOWGz12C5TC4LCL0LvuV/Unx65YNfYFVo3Gqc8Evqfa3c0VU+r7N
	lTMV8uQApmozG7+y7P+CGx5SCA5u55RIY/SSxigq+Bvq5LvlA35EFvWCSuWdSP10ZTtX27r
	RuveyXTxHnJO+4i5BAJhhQeF6cVx2qL+U+7RDlUdmQFc2c5b6VX83/Eqiwk/QveZ8l/igET
	NM4/dZuRVYwr4i236AmaRpkg24bafwYqntYhkqVnt2exVt2TWYVXCI/CiRTavMe+D+gtE96
	1EFo86meOr6ASX5VtUTprEflIhNb6Kg4Q4NGEMOW0nXCNvgsVSKulBxuodMtSQ/T3lqGyhi
	p5/aODki8/bnNk0uA9e8O8Jy9RDNwW1zBYZmkFbejQU/BwuX7VbYvj2mDedGON2RomuGYPV
	xS4hnIGaRfx4ZKoniz7FKU0egyeKrCGg1Ljon6+WmRHyNky96+I63eKsfG80X73WwTq7I+8
	0DFvV7223kuSeqGb1m0k3QO6CdTaBJByVVyHnj/Tm/2vtqcCisYg/9S/NK+LTh2u5XX9HBs
	Ci3bGPraTcWN5dkd1SGwTqrebmehs=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: BE94D20F1ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34056-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid]
X-Rspamd-Action: no action

From: Xu Rao <raoxu@uniontech.com>

This series is split into two steps: patch 1/2 refactors xHCI IRQ and
interrupter handling to make multi-vector operation possible without
changing behavior; patch 2/2 then enables a small capped set of secondary
interrupters/vectors and routes transfer completions per device (slot) to
reduce contention on interrupter 0.

This feature is disabled by default: only the primary interrupter is used,
keeping the existing behavior unchanged.  To enable multiple interrupters,
set the GRUB kernel command line parameter xhci_hcd.secondary_intr=1.

Xu Rao (2):
  usb: xhci: refactor IRQ/interrupter plumbing for multi-vector support
  usb: xhci: enable secondary interrupters and route transfers per slot

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changelog:
v1 -> v2:
  - Bind interrupters to endpoints at enable time instead of selecting
    per transfer.
  - Store the selected interrupter in struct xhci_virt_ep and program
    TRB_INTR_TARGET() from the bound interrupter.
  - Use a single IRQ handler for both primary and secondary vectors,
    with STS_EINT handling restricted to interrupter 0.
  - Keep a common dev_id for IRQ registration to match the existing
    xhci_cleanup_msix() teardown constraints and avoid dev_id
    lifetime issues.
  - Clarify secondary interrupter teardown to avoid double-free or
    use-after-free during xHCI removal.
v2 -> v3:
  - modify commit information
v3 -> v4:
  - Bind interrupters per USB device (slot) via struct xhci_virt_device,
    program TRB_INTR_TARGET() from vdev->interrupter for bulk/ctrl/isoc.
  - Drop xfer_interrupters and unify on xhci->interrupters[] for both
    primary and secondary event rings and IRQ routing.
  - Allocate secondary interrupters in xhci_mem_init; on any allocation
    failure, rollback and continue with primary interrupter only.
  - Cap secondary interrupter creation with MAX_SECONDARY_INTRNUM,
    defaulting to 4.
  - Route xhci_msi_irq by irq handler_data token (intr_num + 1) to keep
    correct interrupter selection across resume/power_lost.
  - Apply MSI-X affinity hints for secondary vectors.
v4 -> v5:
  - Fix min() signedness build error reported by 0day CI.
  - Rebase onto v6.19-rc2.
v5 -> v6:
  - Route secondary MSI/MSI-X IRQs by storing struct xhci_interrupter in
    irq handler_data, instead of using an (intr_num + 1) token mapping.
  - Program Slot Context Interrupter Target (tt_info[31:22]) from
    vdev->interrupter to keep slot default routing aligned with TRB
    TRB_INTR_TARGET() selection.
v6 -> v7:
  - Add xhci_quiesce_interrupter() and use it for secondary
    interrupters in xhci_stop() and the power_lost path of xhci_resume(),
    ensuring IMAN.IP (RW1C) and ERDP.EHB are properly cleared.
v7 -> v8:
  - Sync secondary MSI/MSI-X vectors in xhci_msix_sync_irqs() with
    synchronize_irq().
  - Fix build errors by adding missing header includes for the IRQ helper APIs.
v8 -> v9:
  - Use PCI_IRQ_AFFINITY to let PCI core spread MSI/MSI-X vectors across CPUs.
  - Route each MSI/MSI-X vector to its interrupter via per-vector irq_ctx dev_id.
  - Fix modpost error: xhci_msix_set_handler_data undefined (0-day CI).
    https://lore.kernel.org/oe-kbuild-all/202601171743.omq3DpnM-lkp@intel.com/
  - Rebase onto v6.19-rc6.
v9 -> v10:
  - refactor IRQ/interrupter plumbing for multi-vector support.
  - add xhci_handle_slot_secondary_events to handle secondary event ring.
v10 -> v11:
  - Fix build warnings:-Wsometimes-uninitialized.
    Closes: https://lore.kernel.org/oe-kbuild-all/202601262208.UybEjc9X-lkp@intel.com/
v11 -> v12:
  - Patch 1/2: Keep the "Add allocated interrupters" initialization in
    xhci_init() to preserve the existing initialization flow, and fix
    intr_num to use the proper type. Also drop the meaningless code move in
    xhci_msix_sync_irqs() (no functional change).
  - Patch 2/2: Make secondary MSI/MSI-X vector request_irq() failures
    non-fatal by rolling back any secondary vectors already requested and
    falling back to primary-only operation. Refresh comments and add extra
    guard conditions in xhci_handle_slot_secondary_events() to better handle
    corner cases when draining secondary ring.
v12 -> v13:
  - Introduce a GRUB/module parameter to keep several interrupters disabled
    by default, enabling them only when explicitly requested.The commit
    information was also modified accordingly.
---
 drivers/usb/host/xhci-mem.c  |  43 ++++++++++
 drivers/usb/host/xhci-pci.c  |  68 +++++++++++++--
 drivers/usb/host/xhci-ring.c | 156 +++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      |  48 +++++++++--
 drivers/usb/host/xhci.h      |  26 +++++-
 5 files changed, 297 insertions(+), 44 deletions(-)
---


