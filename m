Return-Path: <linux-usb+bounces-32706-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCG5NGIsd2nacwEAu9opvQ
	(envelope-from <linux-usb+bounces-32706-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:57:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6385AAA
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E65E300E735
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 08:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D606313E11;
	Mon, 26 Jan 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WAtwVNPc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5C23033E5
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417791; cv=none; b=fKmNP+0ArWl+9whLq/J+XFCrEBA3ltZfj1IRDNZykQSYT7rAfv09XyvAnqJ/ZfwPqRlE8FZ/tabBzWFP/oiDPynzvvEbw+5LjI4oGrI1w8MaBR3Q0xH3uOP2PTXnfGBsqA21xnZE708rdAGkbn+DEMfGNzJ9ZrJwnnjDoKFxM0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417791; c=relaxed/simple;
	bh=X8B3VSmzcqDG4wyW4IsnrLatpB7DbYTSzhgjsL8WVUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7THwUHwx1JHeuHG8PrEof5SF4ex1kHFlzwEWZ/Cr0v9DmNFceL/PLmxyFFEDWK+498VfaU2hZOg1/44MvLG/GFKyZEo1Ivyc7+nOUSqBkL9k9NkrI/MmSFilAVF0EjEQzbbaPaQCTPz9QoMBJHWXhQWDfIH5cHqxvCG/Sk9CKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WAtwVNPc; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769417733;
	bh=1lYqztMW8F74U6AOMNfT/LKQvVMmBU43btWlSO4/6+M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WAtwVNPcomr1g17TSDdkjadLPeGJTCo2h4lSazjj/oH3R95MrXjC2MgFXkTslAb/L
	 1EGQiwNhejQrn+MwnsxFgrWqyGK2CF+q0Aa6aNGugGAXviXwQIIv3n1H2U31bPmpKA
	 VCPn6Xm/oA7wap5CQ9MnU93MT8OkZOCwEun+TCas=
X-QQ-mid: zesmtpip3t1769417727t14dd8288
X-QQ-Originating-IP: ALPHqD++/+0FIbOWAxXkONHda9CvS6A2ULaT+AwRaYo=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 16:55:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1486744162075086168
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
Subject: [PATCH v10 0/2] usb:xhc:route device to secondary interrupters
Date: Mon, 26 Jan 2026 16:55:23 +0800
Message-ID: <B08F9D33F619A2D3+20260126085523.799849-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MGvbISg46CTeCQx6C6qz/s5bk251CaKGHVN/7CczGdrXknPZBwyPS+HP
	Z+uVjfrNixwU5qAuT/Blkq/RfSQ/IfII5y9aMNcvTbj1/tzoNi4bZWib/diM9aWnFmVvC4V
	xQ5NPrVgn20DlQ9F/KTHVc9uOYDATucQMuJO5VKa/iCLnKMi5kA/T/+40mKqJdlG0UBM2br
	AkTYX7QLa1QYavCNUqxUcXcszu55lBltzVIU9Z9nmlz4OlN/ww+Nwsby2jB2HVEgHISMjwX
	y+Ilpd0cZcfHm//gTRg03Glv9l4SbPctp5wfb/G9Qdjzd1kNFc+vXt32Mj8z+OZL2DnW1mV
	vHtuUzMfLxLud3smXCD1fHOLA3Ik/tkEEmozB88d5l+XdyoTaPoN69WbVYyqXunQLXkg9MS
	BcqSFI7dFWcZREwATvc6b7bYAuCnxiEjql2C/slJTcc319Rnbmnbj/5Y5Qv7pNksfy7dZE3
	5WlRZ2gHsesOP8+1EcgnhlsTR2aA1nk/z+S9UwPnTZ6VCYs2E1O6U83hAo5bLaQXTR6gRj1
	xyZuJZgPk0e4nsegr0jV4OFp2G889M/CIWLdpuDocPwIs52nawEsurN4QriYfYYH80A4aKV
	kcRvafRrcKmY/dz071GG1sR7yT55z1z1ew2jxLgqvqKbUYvx/jsE/PiL1oebxXq5kdL23sW
	wTUXm6GNm9ns+Hs40A9kBjU3CVxoWaAEYMQe3RM+pKNnE7NO2pcFch0Gdxjbt9G6+ZoV+mo
	sTKoGXqnTljO/J+NuXQ7tzkLBoASJrbG/lwOZAfIL9pIrya8TRuvqZ9NjVSTLCA+CAXDiHL
	OOR78hVNMY3VUp6GsQwk/trEVvk/xq6c2/PNO06qfVj4jSi7VaqhI2orrNmutA5jtg4pQqI
	5ebC8htREgZvQFf0mubBPV7EyAgO6D5sRJJK3ZgHto8mBww3JDNOBPhv7Z6PVHKIRhCM8Ls
	1RJrIYs3uR4wcjOdRcW38qacjE3cyPsFyoUfUdRIe+IkFeAJskWQaFvQWALAZk3aYgclPix
	C5YCanAvWSnVe2OEfC1JbIc3+Efy+Y2UayiDb8mppaUEkEFhMzhxnPMpPMQeU=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com,panix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32706-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 44A6385AAA
X-Rspamd-Action: no action

From: Xu Rao <raoxu@uniontech.com>

This series is split into two steps: patch 1/2 refactors xHCI IRQ and
interrupter handling to make multi-vector operation possible without
changing behavior; patch 2/2 then enables a small capped set of secondary
interrupters/vectors and routes transfer completions per device (slot) to
reduce contention on interrupter 0.

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

