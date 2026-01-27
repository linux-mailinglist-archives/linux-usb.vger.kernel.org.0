Return-Path: <linux-usb+bounces-32762-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFifOIAkeGlcoQEAu9opvQ
	(envelope-from <linux-usb+bounces-32762-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:35:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB738F0ED
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CB023007A7C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8AD2580CF;
	Tue, 27 Jan 2026 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="H7jBsBA0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865CC235063
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 02:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481337; cv=none; b=FsEmH+d7wsloQZ5CERRRkX/awwDlZ3paxS7fE1KDROO8zmlS+p9jrTjJdPxQPNYJ+F22a8xhG108gWflWfgaEDemcT9Dl95OIIMZfzX1opgdSCW2EdkuuP4hD9QjGzjYCsjh1zqYrqgFKMUkvcqZyZ8K+b4pFFkdj08e0N+JuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481337; c=relaxed/simple;
	bh=PvQu3/zGkCkPa06ec6qGzvdEVewlh/a91bXkofB5DSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLyzyk3FKaI9HI+4rT3KFmfZUnQ6y/u2+y2eUKWR/XSZ5dR25lw79241N+ZjImMgdY5Te7w+arCDUBM1kRseiKpJ87J3bUl4Y/ZT6va8p7YdDjZ5qJW1h8kq8SB2ts84ruqcrFDpknksVHea9l5Zp7VpyYCWU3TRvuh13KISgPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=H7jBsBA0; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769481296;
	bh=baCIfaBSpuMAuzXCixV2wvYGKqCaoIbx4X8AOxIvHFk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=H7jBsBA0uS+gVYya/HdacNpFFSSHEFE+dWHcL2Xj9JclYmsuVdZm4/C9fe/bcN4jk
	 FvhE28IV1RrDHzPml+ZCZUForW23yifdiuYQ4Q+loIucMIHAenUJG7vsDGIVIisW3D
	 o2O9/SsqCjDL22zSoiRTelBoMynEoSBGVnI7cDL4=
X-QQ-mid: zesmtpip2t1769481289t28d120f2
X-QQ-Originating-IP: a+VWZb8DHW8OavsffNMgF9FWwq9hf0piqWuXQLQh5rA=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 27 Jan 2026 10:34:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1920339116922897646
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
Subject: [PATCH v11 0/2] usb: xhci: route device to secondary interrupters
Date: Tue, 27 Jan 2026 10:34:46 +0800
Message-ID: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NTHY/YkN8c+xDQx04ZUyvuoYImYFq+dGNZSovFVNqvbHtWYU1NAHNrpd
	2kN3GyU14xWALGOtM3Fi6ZUmQmedI0TcUcQisxvXWwcG+ikRRwmMOM6M/i1PJPmLqMpHJ49
	EcMV9dpgQOYeAkwWBEZ8DlWQ7TswLWkR0wBPjRyZcf+WVSXlbA24XCzKiXi9YWYI9WLLueu
	Cyvgz7MyKNrIbzutKnLNY9T+qi4IjBEDpdN2wrD5Xz2lMFQ8fmLU/5ORxONg0zPEHs2fg9t
	+BkBzqftx/wnkhz/nOYtFBEVLiLI48RPeJkHNl7nBoCQJ0B4zfEIhACxnu92jNIVTRk3t+Q
	NPljW4B0wYzdrRlzHDV2D4F1RRy0ujDpxaA6kNWU3E/d7F0GWksdM58NIoOQ168FRTN3xle
	ps3Ss9h2i9U+k7XLYfYIS2XJvS+kuTPjl8wOLBB/Qvg27Yb5n2OZjwtMz6cHdx5Qn9j1TeD
	eMIxjlXCOHO42OPnE1RMnqzdF1fO3f1p4z4hRNNZ5S9NoLK9BiVF8j1dyk7CJzOANKmv2uG
	avxXuh44irhVBE2/8nGZlLKHwaxDr7syMA/HuA8cO8YMg2B0pRMKfoZTV2hCZi4wwwkjtUu
	kemrVD34oXdi93O+y+CEIE0q+9irkABP5/z4JQtaThZfAnR7jWJ647kO9r93sh0ZudfPIqf
	btK3O1T+3xBXXPkoZmjNyeQSHlO0joxK2Pr8cEqhXBCNa0OqrjVLYl7Nyy4kjBqKpEijt0D
	+OxMpkGWNl3LeOZsR5C2VenCjbY8sN3Hpw+jmxDEztEIos59e1K8vyKe/8EaGgyI75/jpy7
	DAJqRDtyPf/DI8fDbXS0UPr+9v8MbG+XWV+Hq8nmGxbohiA260JZ6x8PSmgpiDOdGRyWu+9
	4gPTXU1slrMEXI36/TbJ9r/KDn7ihOm1zatpC+7G6V9QieUAIbYHNOi+kI+8YNqDaddqMrT
	aqdNo5HuuzxxqvDoxlHqH20VQUDU5oilYf0TehnD8iwLqizyWIzgGVMhT5OnetOCpt9Vexy
	uR34ZA6ro4KFbxdsFaAHhEHrZGyVYr/IvK2x4El2QXQPB5tjhB
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32762-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com,panix.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EB738F0ED
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
v10 -> v11:
  - Fix build warnings:-Wsometimes-uninitialized.
    Closes: https://lore.kernel.org/oe-kbuild-all/202601262208.UybEjc9X-lkp@intel.com/
---
 drivers/usb/host/xhci-mem.c  |  48 +++++++++++
 drivers/usb/host/xhci-pci.c  |  57 ++++++++++---
 drivers/usb/host/xhci-ring.c | 156 +++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      |  37 ++++++---
 drivers/usb/host/xhci.h      |  26 +++++-
 5 files changed, 274 insertions(+), 50 deletions(-)
---

