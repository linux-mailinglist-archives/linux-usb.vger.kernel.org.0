Return-Path: <linux-usb+bounces-32929-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGgtL2pbfGkYMAIAu9opvQ
	(envelope-from <linux-usb+bounces-32929-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:19:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D1B7D66
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9878F301ABBA
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 07:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ACD309EF9;
	Fri, 30 Jan 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="h0X/MasD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E12620E5
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 07:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757540; cv=none; b=QSvmOmh/5PNNjqA5zOb1Y6BFSJZjz5ypLa2EDlvHFvQqJzsz5VCSIy0t/zPIgPX8XuATxtwpiGQHJOyiQ0z9n80aSTxT4OJoSX6XkH/QxxNSqvEDW+qUM7FKo7fsu0z0R01dd7VITMv3+KyZMOmZan+dFeACVia9eCGN0SiExZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757540; c=relaxed/simple;
	bh=sG60QjrCMm5xsvTaLTxtbMCn0kIVdTMRy5Wl3mbmv00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UA0/dckR2IURILYnxm2rCWpOnQKhvWkz0nTBhT6fXGvCDBBcPODbi+NI+nMLPWy1XxCCHq+2VVGXPBX1MTsRRyY5+YLm5sNEXKkWx72wfcR7kQdjjm3KORtW4uC6c+ew/u+p/ke2gububvPoRhBkXx/cqhWhClZprRXNAGrsVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=h0X/MasD; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769757495;
	bh=Ma5atvt63uXsv26j3mB++QPkdyCIJdGnN5ymHu73+r4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=h0X/MasDd4b0W0qhVn8+8nkZULlTNHrG0/Rld7AAfmS4lQijzj25DryuQXZJn1j7l
	 w15JZIE94REsQmdVwzJE4/DdHF43rdqHFK4VZP153T7AHzUmJW26GoOtjCGOQ0zZJH
	 TeEvBa9mMBkVx+H+XkNyPiLU4SjS6ozuAWehpNEo=
X-QQ-mid: zesmtpip4t1769757489t5c3d7e50
X-QQ-Originating-IP: urPlvC/Xu+NJ8HGUDXKfe3WLSPQvGITjm2ufvZNQTew=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 15:18:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12351927677429069261
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
Subject: [PATCH v13 0/2] usb: xhci: route device to secondary interrupters
Date: Fri, 30 Jan 2026 15:18:06 +0800
Message-ID: <774DE05348EDA32D+20260130071806.7608-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: OWhN4QRntHSGuYcMV8IRAwSIrMZCaqmHtfkZ7zWVJmP6FWkj0LPlfSok
	63la/oXRs5p9BU6Kxk5NJ+Yfg4pwahyTBq+D04f3rRKBgM5OxgiOzMr/flJc4p3vvNYQ2//
	bFupmaauEaRide+eR2ktts0uK6NtoDf7xo4S8PKVe0TEs1C2QC350lU2DK6cOYwo94cyzQ6
	PJRPeMJFuRc5Zozc4eztc3NkdgNTD67bgfDanHdZxsh2ZOiJueAjOGiPiNyG0w1TkHp577t
	Gidh3ShAEKpx8NRe1QVrCamFZvynGOnEBWoYzKKv2QDoGZm0J+ccSHi9/FDykpUEsBF65vn
	sn8fySegygNtm7U9z4xkSg+2vRzstnaF28/yLlQe8Vf9Md1nn0b1ntm5SWiZSUCsCt3tdKj
	CUm5cG6BtB0NjhtrNGVWOXr92tf0hrc7SBZ6pEIcpXnLAFQdVZb59FjSuNnvGIxy6tR1ZUO
	Aj9PRc7N1L0aDgrQIqW1DD/adt1mcuBcTHnEao/Uc5YDyoZdjfkcZFyOwgjiLfL22+4Nyt1
	8YpQAry9fPx8FGsBD1oXYVCY/f/X3RG8DXWbD6x1T9+dAA2jqa0soUo+Xope3kJY+rxunXF
	qh5Ku1MxmKSVf0DJRhEUgWDUUbNTDVCoW7tbBcosE5T6pd2TDA2W/+sH4rExEylvjL0outd
	VST2Ww8JU8y15XDm78C8xujc0ovjA7BhhfHqcy2CV0gG40dxUvjjKqcsbAlDSyYSrzCizNB
	4siKsOovynvFmiFN2Ff+cg97JxSteyRHe7AHEQ7J66SUVptqTqNA5Iaz0GekcfIIB+wd5pY
	Nlh9lzzEVtgb0fGAJI1SiHu1xv0YHs5QIDWoi+XKWOcDj5FXlECQri9W0X5ACILDXyf0Xgo
	G9YL7xltfZjGXq1hhhGWFSfdqxS+ju661dEP5hJI7t8boI+b8FDqyEAa9yEjEjPEwjuR06e
	Ii1yrlNcKUhqcqgGX1sNZmTSbvLKfCu8gVP4eEzmg08wqzm0JAmGmXjddaOhHD1nNE38K0w
	ST7HJKsY9a3FKSp1glBVbspBC6dyqiLkMJOZFF7aEPAbGanjx85O88yVmpPpDggLr9QdZyA
	zE67GT1JO5q7/Q9rJBwW9M=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32929-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com,panix.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E73D1B7D66
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


