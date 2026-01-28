Return-Path: <linux-usb+bounces-32874-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HGEE9fpeWkF1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32874-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:49:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7149FB16
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F7E9302D964
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9411E32ED2C;
	Wed, 28 Jan 2026 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="LGXYiVN1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033B628CF6F
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597353; cv=none; b=VUm/kTv6Z/pPPvpR65UZWjjEPl6QKA1O8HBYk5FC99NlUbc6i7+UWw2g0pyKKv6OFpEBunMF4fD9ve5Zu0gmwxQFvJX976LCA4hUIsel/YhM8/SYHc0jvXZsv/jFqDAus1cRAC8ZI+eN4VK+QGoasfxRFZ2DYDsjDQ0KSgqjxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597353; c=relaxed/simple;
	bh=uXXJZF+wkQGu5fVTjwNjO92I9DblA+KvIHt+WzmMZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQuulLNSa/8ObbJxQV6KCfjAQ9DtF62Cu64IwViNWN1hC/ERUyrPNR8gjXSNhnpRHszbNmpb46tmWWNslaqsLGlJ7e6jM5Fnpy5H1xdTVHIElRmtzHs1BYqJls/kFN5iuNAKeBAOsOz89TvEBMaMT1RBjoEAcwWjhuoq0ODF4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=LGXYiVN1; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769597305;
	bh=gKHxVP3HmG+O36kYZ114cRKwU4lpHEDveX4UCd1cE2s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LGXYiVN1mt09Lgs17Bd/PQ9Y7br8JmVx6NcBKoMz8Q2jSQT35cUH5cV1eyIJlQoBX
	 noZz9VlLjdBeBn9QAT6V7s5MfVppOI61eAFKrGn1m9In+Ckkrz9Hb3TH7jFMEgB2hD
	 3uKqonchDep+XwoX697VV/l2NOvh5jNqg/4At2uE=
X-QQ-mid: zesmtpip4t1769597299ta9eaa635
X-QQ-Originating-IP: OmwksQZD2ytpz3gGf0e9zHjGKgokjy7tnvL9VI6SbfU=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 18:48:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13200120327605676448
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
Subject: [PATCH v12 0/2] usb: xhci: route device to secondary interrupters
Date: Wed, 28 Jan 2026 18:48:15 +0800
Message-ID: <35BBAFB9EDB17421+20260128104815.2535380-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: Ni68Q0J6fxe2M2TGKrFMbeQUPjm33RsGsBScdJfQA4MdAw9pXmkQxo5A
	GhaGdDo7ladzznNeSS1qZlnxjvDv9LZCJVNnc0CuHT/URK23d0F4b6GRDljQR6Cdb9gn+we
	If1fwFmJzDAClMcQN5R8vmOTuL6Ly0avsM76rx5UMLqWGdTdDupFVbzE5ujXdZOvgjvjqWE
	OsHsrRZgLFPZDdjjpVf23va1LhqQxruF/E+Vga7rxo4p08zHG9fnwVGjGLQS1B/OUCHKQt6
	OSBWsl7MO/+2jCpZoC9En5ljtH73EIoJBs4gW1zPHWMlASFYSDriZPar0hAf9Xbp3Ra81Ou
	iT4fBFRDlZ00p14phUWhcuzlsJCwTDQzBzNcAD+iGDi4aEOT8S599/N9QaLXdlqaEP2AIlW
	DF7iVASmUVBguOqpDLJmyLdlSmSbbSyUWY/NwxUronRSjC9u3u/SWuMQHU89mYM1AB1VVkb
	MV1LquIjaPkY1Zu1LHfi6jp34fIZkXHx6uUNsPSS0pPul9tBGM2JUIKrSKl6RxFXNcDspzc
	IKbcKodiNBheyM2EeTiV5kbULBszJva2g+RRYsiWubTloENirZqaKFlp8ix30pOImr8ZbVZ
	ooU2yu/EUElbRh3oCVfzHbJZO+Nz+3GuVpvt78dGz989DI5Z+J+Vmdj5+T311ZwNYNVxNcR
	A65wjiysqLbUddwtiW0qe/ReDigMYLAcZFSF4PY4ppEI+l5KLbAg2xfs4nwxuSOPGjtVVJA
	jlrtrXWC6AGeLt+1V6TdtK+T4ZCpDwwCvUueVQSv2eMw9L1SVO1R/4dDxHwI+V2LKYDGdTm
	NiYghqdriXPIicF1VvCrBgqkD60rFaMBNATxo3uFE9CP6QCMttfr75qN9FH/sIyTjq/zjSe
	RVxGDBDnsUmctHzhwovPoxve8D/DmS40q4zeg8bPkAEPtTOuqoaExxcskpZK2KAQtWzoOs5
	IEVDVXAgDf2G8UmDPBUkfaQYOLWr/bbEPKqnfis+sGTD7tTl2jaFkfthjjnpHhANikXzl3V
	KG1AO2v0ShlUR8LpWcIRc/ohdrD/2aeovsR6zG3X6nZbG2aLsoLE6dInmXeYyQdde5PJtbQ
	AtU00ucMBOX
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com,panix.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32874-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC7149FB16
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
---
 drivers/usb/host/xhci-mem.c  |  33 ++++++++
 drivers/usb/host/xhci-pci.c  |  68 +++++++++++++--
 drivers/usb/host/xhci-ring.c | 156 +++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      |  48 +++++++++--
 drivers/usb/host/xhci.h      |  26 +++++-
 5 files changed, 287 insertions(+), 44 deletions(-)
---

