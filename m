Return-Path: <linux-usb+bounces-32713-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOJHHLA0d2nhdAEAu9opvQ
	(envelope-from <linux-usb+bounces-32713-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:32:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C4860BD
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2C51301CFB4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D04C314D0A;
	Mon, 26 Jan 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="S8RrThW1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD8316189
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419772; cv=none; b=gYhWPMx8oSUD1R19nQszMxgc3T870qHZ+PZcJj/2Su+omFxOa+UKFQGi4dDzIE6O9LZYFM3l2H1mdGft392aqdKQlttfT/rC5SUA77w6gQHkqonL1IhsouL4B2WVg2REBRciuD6oni+o1npUUGCnkI0+8Lsi3ldxbr2TYSrYJTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419772; c=relaxed/simple;
	bh=KM3swLQIzx752AGEJVo6h6Jm0liJOfoi5+yKVH/FMFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyctOG6mEWXtKdtowFOgCwesM99SGPg/TePDMQ2E4WwrHIqVvGwMM9bikhTx1QDpau0S8yG6L8IvkeDtLflT5y0sYVOUQ1XO+Cd5KeyiXnZhJeVGkqPyfmOt8kRf8fudfbQv6+Xr/gLuVE9WFeHMfm8PDbr33lknALKcPxeNWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=S8RrThW1; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769419745;
	bh=iAxEVp+3IE18YmGn8fKiqRZW7viEHbpzwQnx8XfT1Kw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=S8RrThW11cbN743+QniAipCmzIjySmo8osu6KDqZB8DdjWtl+E3tAzuyoi8ZTWekw
	 Tvkb2629Pb/z90cgg3K3MRisQfIajNJqC5Go1VqCPKm53Zb5QQqBLvWazFdvF+1/mm
	 f8fOl8Bd8hl0XSSFQDO2kEThA4la1CBgaFjAXDYA=
X-QQ-mid: zesmtpip2t1769419595tc746b6f1
X-QQ-Originating-IP: oUzc8CC7dszDtIU1k8tndckjw8cfjWwYZL+DNd4NDME=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 17:26:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15291661052979257107
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com,
	kenny@panix.com
Subject: [RESEND PATCH v10 0/2] usb:xhc:route device to secondary interrupters
Date: Mon, 26 Jan 2026 17:26:31 +0800
Message-ID: <F7E7CE9569AE17EF+20260126092632.841308-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: OF+5ANVWyzE4thPTDqFkyyTdBYZW0WqEUQUTdAyEbV1NedZ+KAU8GbuQ
	wcC2sP+cZp9at2Ld4lPezkXCb7gDnj5kG+pMBhpCHKf7/kvo8bFUz1SyQRtZhmUR/+rI7yH
	r1GvY5wAmhsPZfjAViBAPlupeKHAOLV1WmuLN209/W5vhuIpuFsZzSa/56mnPuTXkPBA/VY
	fbDZDgMFbFoPsBeSZh1ZLsl+/8L9MCZPYxaNeZrRcgbK5EAckB/qXZQURcTBwxGzJ14024Q
	LCQtsuOcpZErxhcGKXi8XQ7rWR6UpEZTuU06ZPCRCxOtzEtNRbveQas4VZ9F0kAPr7wTrzb
	bNkimbkR7XA3hYQcp1+tDgESBY97ERrpguF33H8T93CBNLifmz2GaSXB+XeUathkQNkKJ+k
	3kGM0VFwMnEcs7ftPJU1Aci49EZ/jiakhwvidOctbXtW6Ci3+eDrsEAU88xJdYLSHRBOIyU
	4EdKSAlu4zIkBRtEHuDNWxZIcy/Y8Xm34q+D8PN+RatvACRxeeQFkLotD2YTL/6outV4xcr
	f0rgvCiHdMGkskAw2l1ZjH7wbZY/yjqCy6qj1OZCLB1vrA+322e5thsOPd8nhmYMr9d9R0e
	Xs+GD5Ane/5LlkhrWulx/jjH4b/gfB4V8fdWgNpDRw+MAh+r3Yh304hnLPbnofNyb17J/U3
	4vl7WYPRuZfxQsSNxoMR3LVvAJZxkiSspGVGLp1XFP2+YB8qJSMlzkMPaa7Wfj2jwxg6S99
	s4RYfd3JeYu3j8a7/6Lck8YCfh9v1qqTS3GxtGpnPtleGWrpvd6n+5W8/R0DVx9JKIqLK3H
	AwEClRbORbkpA/btfObnosHmHjJd9IezostnARbO5WiWw6eQpQpKPJPLD7TmmD8MX3FwmL5
	llUPNSCWsl4EBozt1zMChkNNgu5lyOawnLQYi52Ku+saqj9cO023eJFT/RCwuRoah7ZmTKh
	2cCljlPDIVgoRessbFcOepnrwQZ6rncHwGjnHk4yPsPIqCx09kfL2hAn9tX0keP4oN0RcQP
	I32rYR9jQzkCDeydzmaDadmEDGzmArovZepxFWcBLyxd57a1hD6HYZDol/aVn9M3hN0KKkX
	mtctS4ODzolAX5dMeiEYCpyXreh1Z3O8wiRkmuIZAQ9
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com,panix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32713-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C51C4860BD
X-Rspamd-Action: no action

From: Xu Rao <raoxu@uniontech.com>

This series is split into two steps: patch 1/2 refactors xHCI IRQ and
interrupter handling to make multi-vector operation possible without
changing behavior; patch 2/2 then enables a small capped set of secondary
interrupters/vectors and routes transfer completions per device (slot) to
reduce contention on interrupter 0.

This is not about increasing USB link throughput, but about avoiding a
driver-imposed single hot spot. On hosts that already provide multiple
MSI/MSI-X vectors and independent event rings, routing all completions
through interrupter 0 creates unnecessary contention (serialized event
handling/locks and coupled moderation), increasing CPU cost and tail
latency under many active devices/endpoints. Using secondary interrupters
simply matches the hardware's design, similar in spirit to merged
xHCI-sideband work: exploit available parallel paths rather than
funneling all events through one.

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
---
 drivers/usb/host/xhci-mem.c  |  48 +++++++++++
 drivers/usb/host/xhci-pci.c  |  57 ++++++++++---
 drivers/usb/host/xhci-ring.c | 156 +++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      |  37 ++++++---
 drivers/usb/host/xhci.h      |  26 +++++-
 5 files changed, 274 insertions(+), 50 deletions(-)
---

