Return-Path: <linux-usb+bounces-34689-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AgcCCHZsmlDQAAAu9opvQ
	(envelope-from <linux-usb+bounces-34689-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 16:17:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A5274220
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 16:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4AB93119F05
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 15:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555863C873C;
	Thu, 12 Mar 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kEuQ69cK";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kEuQ69cK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CAA3C6A5C
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328020; cv=none; b=P0y1o3WVUtkMGTLT9kFcT1TIdKWqqPA9jj4ffeiB4pmpyjwkxBZ0B3HkV2dsB1y45W3dr8zLgTP8HYv8lWcg1CudxVdXJp+thMMsKWzoq3FlTcUnUAvt6zozuILg4JMtCxYhsyKUhEMoySiLrRzu2ZO/Xd4HsGjY/1aRvfNUcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328020; c=relaxed/simple;
	bh=UhS+ZXRDm1NvzaiZU4VQhyH1LKwmhRbgBhZi9UpM1pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+KUPRm811BbEZFbmSOSVP5Uyks6ZNaISdL979ALX7UgXpIMqyhynJ+kpPAhez8tt+z+1n0OnOSMccEN5Q9K2Vjp38SvrnnSwVnbcPkhNuEk4vIUSOBZBthzOyU2Ep7u9BkmDLEJ2XhNUEUx9tp619rJE0hnqKGVpk7XcMcqzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=kEuQ69cK; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=kEuQ69cK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C205A5BD27;
	Thu, 12 Mar 2026 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773328016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JrZBlRApQ8BlqdBU+D8iikxRc5QHkOh+xYuJjPpSc8o=;
	b=kEuQ69cKX/T0WaJswao4RNQ3psaCvKb20HJRRg56+HrVHdpqyyYJ2899Ngg87f56mu4CQu
	v2a/yxhXp2A8LlLjngwa2apeQ1+OEpPJtQ4CpmjpQWxQMlz7XWcEXwzkJgcKB8eAgkp9ge
	nVKfGAwfDDptEsYU6FIDCMiJmfBjdcs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=kEuQ69cK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773328016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JrZBlRApQ8BlqdBU+D8iikxRc5QHkOh+xYuJjPpSc8o=;
	b=kEuQ69cKX/T0WaJswao4RNQ3psaCvKb20HJRRg56+HrVHdpqyyYJ2899Ngg87f56mu4CQu
	v2a/yxhXp2A8LlLjngwa2apeQ1+OEpPJtQ4CpmjpQWxQMlz7XWcEXwzkJgcKB8eAgkp9ge
	nVKfGAwfDDptEsYU6FIDCMiJmfBjdcs=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A16D04001D;
	Thu, 12 Mar 2026 15:06:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Js1ZJpDWsmnVHwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Mar 2026 15:06:56 +0000
From: Oliver Neukum <oneukum@suse.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: xhci: use BIT macro
Date: Thu, 12 Mar 2026 16:06:22 +0100
Message-ID: <20260312150649.2138749-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34689-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: B46A5274220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have the macro. Use it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/host/xhci.h | 123 ++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 61 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b0796f6d00e..0278598b8726 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -12,6 +12,7 @@
 #ifndef __LINUX_XHCI_HCD_H
 #define __LINUX_XHCI_HCD_H
 
+#include <linux/bits.h>
 #include <linux/usb.h>
 #include <linux/timer.h>
 #include <linux/kernel.h>
@@ -125,17 +126,17 @@ struct xhci_op_regs {
  * PCI config regs).  HC does NOT drive a USB reset on the downstream ports.
  * The xHCI driver must reinitialize the xHC after setting this bit.
  */
-#define CMD_RESET	(1 << 1)
+#define CMD_RESET	BIT(1)
 /* Event Interrupt Enable - a '1' allows interrupts from the host controller */
 #define CMD_EIE		XHCI_CMD_EIE
 /* Host System Error Interrupt Enable - get out-of-band signal for HC errors */
 #define CMD_HSEIE	XHCI_CMD_HSEIE
 /* bits 4:6 are reserved (and should be preserved on writes). */
 /* light reset (port status stays unchanged) - reset completed when this is 0 */
-#define CMD_LRESET	(1 << 7)
+#define CMD_LRESET	BIT(7)
 /* host controller save/restore state. */
-#define CMD_CSS		(1 << 8)
-#define CMD_CRS		(1 << 9)
+#define CMD_CSS		BIT(8)
+#define CMD_CRS		BIT(9)
 /* Enable Wrap Event - '1' means xHC generates an event when MFINDEX wraps. */
 #define CMD_EWE		XHCI_CMD_EWE
 /* MFINDEX power management - '1' means xHC can stop MFINDEX counter if all root
@@ -143,9 +144,9 @@ struct xhci_op_regs {
  * '0' means the xHC can power it off if all ports are in the disconnect,
  * disabled, or powered-off state.
  */
-#define CMD_PM_INDEX	(1 << 11)
+#define CMD_PM_INDEX	BIT(11)
 /* bit 14 Extended TBC Enable, changes Isoc TRB fields to support larger TBC */
-#define CMD_ETE		(1 << 14)
+#define CMD_ETE		BIT(14)
 /* bits 15:31 are reserved (and should be preserved on writes). */
 
 #define XHCI_RESET_LONG_USEC		(10 * 1000 * 1000)
@@ -155,22 +156,22 @@ struct xhci_op_regs {
 /* HC not running - set to 1 when run/stop bit is cleared. */
 #define STS_HALT	XHCI_STS_HALT
 /* serious error, e.g. PCI parity error.  The HC will clear the run/stop bit. */
-#define STS_FATAL	(1 << 2)
+#define STS_FATAL	BIT(2)
 /* event interrupt - clear this prior to clearing any IP flags in IR set*/
-#define STS_EINT	(1 << 3)
+#define STS_EINT	BIT(3)
 /* port change detect */
-#define STS_PORT	(1 << 4)
+#define STS_PORT	BIT(4)
 /* bits 5:7 reserved and zeroed */
 /* save state status - '1' means xHC is saving state */
-#define STS_SAVE	(1 << 8)
+#define STS_SAVE	BIT(8)
 /* restore state status - '1' means xHC is restoring state */
-#define STS_RESTORE	(1 << 9)
+#define STS_RESTORE	BIT(9)
 /* true: save or restore error */
-#define STS_SRE		(1 << 10)
+#define STS_SRE		BIT(10)
 /* true: Controller Not Ready to accept doorbell or op reg writes after reset */
 #define STS_CNR		XHCI_STS_CNR
 /* true: internal Host Controller Error - SW needs to reset and reinitialize */
-#define STS_HCE		(1 << 12)
+#define STS_HCE		BIT(12)
 /* bits 13:31 reserved and should be preserved */
 
 /*
@@ -182,17 +183,17 @@ struct xhci_op_regs {
 /* Most of the device notification types should only be used for debug.
  * SW does need to pay attention to function wake notifications.
  */
-#define	DEV_NOTE_FWAKE		(1 << 1)
+#define	DEV_NOTE_FWAKE		BIT(1)
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
 /* bit 0 - Cycle bit indicates the ownership of the command ring */
-#define CMD_RING_CYCLE		(1 << 0)
+#define CMD_RING_CYCLE		BIT(0)
 /* stop ring operation after completion of the currently executing command */
-#define CMD_RING_PAUSE		(1 << 1)
+#define CMD_RING_PAUSE		BIT(1)
 /* stop ring immediately - abort the currently executing command */
-#define CMD_RING_ABORT		(1 << 2)
+#define CMD_RING_ABORT		BIT(2)
 /* true: command ring is running */
-#define CMD_RING_RUNNING	(1 << 3)
+#define CMD_RING_RUNNING	BIT(3)
 /* bits 63:6 - Command Ring pointer */
 #define CMD_RING_PTR_MASK	GENMASK_ULL(63, 6)
 
@@ -200,9 +201,9 @@ struct xhci_op_regs {
 /* bits 0:7 - maximum number of device slots enabled (NumSlotsEn) */
 #define MAX_DEVS(p)	((p) & 0xff)
 /* bit 8: U3 Entry Enabled, assert PLC when root port enters U3, xhci 1.1 */
-#define CONFIG_U3E		(1 << 8)
+#define CONFIG_U3E		BIT(8)
 /* bit 9: Configuration Information Enable, xhci 1.1 */
-#define CONFIG_CIE		(1 << 9)
+#define CONFIG_CIE		BIT(9)
 /* bits 10:31 - reserved and should be preserved */
 
 /* bits 15:0 - HCD page shift bit */
@@ -235,9 +236,9 @@ struct xhci_intr_reg {
 
 /* iman bitmasks */
 /* bit 0 - Interrupt Pending (IP), whether there is an interrupt pending. Write-1-to-clear. */
-#define	IMAN_IP			(1 << 0)
+#define	IMAN_IP			BIT(0)
 /* bit 1 - Interrupt Enable (IE), whether the interrupter is capable of generating an interrupt */
-#define	IMAN_IE			(1 << 1)
+#define	IMAN_IE			BIT(1)
 
 /* imod bitmasks */
 /*
@@ -267,7 +268,7 @@ struct xhci_intr_reg {
  * bit 3 - Event Handler Busy (EHB), whether the event ring is scheduled to be serviced by
  * a work queue (or delayed service routine)?
  */
-#define ERST_EHB		(1 << 3)
+#define ERST_EHB		BIT(3)
 /* bits 63:4 - Event Ring Dequeue Pointer */
 #define ERST_PTR_MASK		GENMASK_ULL(63, 4)
 
@@ -356,15 +357,15 @@ struct xhci_slot_ctx {
 #define GET_DEV_SPEED(n) (((n) & DEV_SPEED) >> 20)
 /* bit 24 reserved */
 /* Is this LS/FS device connected through a HS hub? - bit 25 */
-#define DEV_MTT		(0x1 << 25)
+#define DEV_MTT		BIT(25)
 /* Set if the device is a hub - bit 26 */
-#define DEV_HUB		(0x1 << 26)
+#define DEV_HUB		BIT(26)
 /* Index of the last valid endpoint context in this device context - 27:31 */
-#define LAST_CTX_MASK	(0x1f << 27)
+#define LAST_CTX_MASK	BIT(27)
 #define LAST_CTX(p)	((p) << 27)
 #define LAST_CTX_TO_EP_NUM(p)	(((p) >> 27) - 1)
-#define SLOT_FLAG	(1 << 0)
-#define EP0_FLAG	(1 << 1)
+#define SLOT_FLAG	BIT(0)
+#define EP0_FLAG	BIT(1)
 
 /* dev_info2 bitmasks */
 /* Max Exit Latency (ms) - worst case time to wake up all links in dev path */
@@ -463,7 +464,7 @@ struct xhci_ep_ctx {
 #define EP_MAXPSTREAMS(p)		(((p) << 10) & EP_MAXPSTREAMS_MASK)
 #define CTX_TO_EP_MAXPSTREAMS(p)	(((p) & EP_MAXPSTREAMS_MASK) >> 10)
 /* Endpoint is set up with a Linear Stream Array (vs. Secondary Stream Array) */
-#define	EP_HAS_LSA		(1 << 15)
+#define	EP_HAS_LSA		BIT(15)
 /* hosts with LEC=1 use bits 31:24 as ESIT high bits. */
 #define CTX_TO_MAX_ESIT_PAYLOAD_HI(p)	(((p) >> 24) & 0xff)
 
@@ -498,7 +499,7 @@ struct xhci_ep_ctx {
 #define CTX_TO_MAX_ESIT_PAYLOAD(p)	(((p) >> 16) & 0xffff)
 
 /* deq bitmasks */
-#define EP_CTX_CYCLE_MASK		(1 << 0)
+#define EP_CTX_CYCLE_MASK		BIT(0)
 /* bits 63:4 - TR Dequeue Pointer */
 #define TR_DEQ_PTR_MASK			GENMASK_ULL(63, 4)
 
@@ -661,18 +662,18 @@ struct xhci_virt_ep {
 	struct xhci_ring		*new_ring;
 	unsigned int			err_count;
 	unsigned int			ep_state;
-#define SET_DEQ_PENDING		(1 << 0)
-#define EP_HALTED		(1 << 1)	/* For stall handling */
-#define EP_STOP_CMD_PENDING	(1 << 2)	/* For URB cancellation */
+#define SET_DEQ_PENDING		BIT(0)
+#define EP_HALTED		BIT(1)	/* For stall handling */
+#define EP_STOP_CMD_PENDING	BIT(2)	/* For URB cancellation */
 /* Transitioning the endpoint to using streams, don't enqueue URBs */
-#define EP_GETTING_STREAMS	(1 << 3)
-#define EP_HAS_STREAMS		(1 << 4)
+#define EP_GETTING_STREAMS	BIT(3)
+#define EP_HAS_STREAMS		BIT(4)
 /* Transitioning the endpoint to not using streams, don't enqueue URBs */
-#define EP_GETTING_NO_STREAMS	(1 << 5)
-#define EP_HARD_CLEAR_TOGGLE	(1 << 6)
-#define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
+#define EP_GETTING_NO_STREAMS	BIT(5)
+#define EP_HARD_CLEAR_TOGGLE	BIT(6)
+#define EP_SOFT_CLEAR_TOGGLE	BIT(7)
 /* usb_hub_clear_tt_buffer is in progress */
-#define EP_CLEARING_TT		(1 << 8)
+#define EP_CLEARING_TT		BIT(8)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
@@ -954,7 +955,7 @@ struct xhci_link_trb {
 };
 
 /* control bitfields */
-#define LINK_TOGGLE	(0x1<<1)
+#define LINK_TOGGLE	BIT(1)
 
 /* Command completion event TRB */
 struct xhci_event_cmd {
@@ -968,13 +969,13 @@ struct xhci_event_cmd {
 #define COMP_PARAM(p)	((p) & 0xffffff) /* Command Completion Parameter */
 
 /* Address device - disable SetAddress */
-#define TRB_BSR		(1<<9)
+#define TRB_BSR		BIT(9)
 
 /* Configure Endpoint - Deconfigure */
-#define TRB_DC		(1<<9)
+#define TRB_DC		BIT(9)
 
 /* Stop Ring - Transfer State Preserve */
-#define TRB_TSP		(1<<9)
+#define TRB_TSP		BIT(9)
 
 enum xhci_ep_reset_type {
 	EP_HARD_RESET,
@@ -1017,13 +1018,13 @@ enum xhci_setup_dev {
 #define SCT_FOR_TRB(p)			(((p) & 0x7) << 1)
 
 /* Link TRB specific fields */
-#define TRB_TC			(1<<1)
+#define TRB_TC			BIT(1)
 
 /* Port Status Change Event TRB fields */
 /* Port ID - bits 31:24 */
 #define GET_PORT_ID(p)		(((p) & (0xff << 24)) >> 24)
 
-#define EVENT_DATA		(1 << 2)
+#define EVENT_DATA		BIT(2)
 
 /* Normal TRB fields */
 /* transfer_len bitmasks - bits 0:16 */
@@ -1038,36 +1039,36 @@ enum xhci_setup_dev {
 #define GET_INTR_TARGET(p)	(((p) >> 22) & 0x3ff)
 
 /* Cycle bit - indicates TRB ownership by HC or HCD */
-#define TRB_CYCLE		(1<<0)
+#define TRB_CYCLE		BIT(0)
 /*
  * Force next event data TRB to be evaluated before task switch.
  * Used to pass OS data back after a TD completes.
  */
-#define TRB_ENT			(1<<1)
+#define TRB_ENT			BIT(1)
 /* Interrupt on short packet */
-#define TRB_ISP			(1<<2)
+#define TRB_ISP			BIT(2)
 /* Set PCIe no snoop attribute */
-#define TRB_NO_SNOOP		(1<<3)
+#define TRB_NO_SNOOP		BIT(3)
 /* Chain multiple TRBs into a TD */
-#define TRB_CHAIN		(1<<4)
+#define TRB_CHAIN		BIT(4)
 /* Interrupt on completion */
-#define TRB_IOC			(1<<5)
+#define TRB_IOC			BIT(5)
 /* The buffer pointer contains immediate data */
-#define TRB_IDT			(1<<6)
+#define TRB_IDT			BIT(6)
 /* TDs smaller than this might use IDT */
 #define TRB_IDT_MAX_SIZE	8
 
 /* Block Event Interrupt */
-#define	TRB_BEI			(1<<9)
+#define	TRB_BEI			BIT(9)
 
 /* Control transfer TRB specific fields */
-#define TRB_DIR_IN		(1<<16)
+#define TRB_DIR_IN		BIT(16)
 #define	TRB_TX_TYPE(p)		((p) << 16)
 #define	TRB_DATA_OUT		2
 #define	TRB_DATA_IN		3
 
 /* Isochronous TRB specific fields */
-#define TRB_SIA			(1<<31)
+#define TRB_SIA			BIT(31)
 #define TRB_FRAME_ID(p)		(((p) & 0x7ff) << 20)
 #define GET_FRAME_ID(p)		(((p) >> 20) & 0x7ff)
 /* Total burst count field, Rsvdz on xhci 1.1 with Extended TBC enabled (ETE) */
@@ -1535,9 +1536,9 @@ struct xhci_hcd {
 	struct xhci_interrupter **interrupters;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
-#define CMD_RING_STATE_RUNNING         (1 << 0)
-#define CMD_RING_STATE_ABORTED         (1 << 1)
-#define CMD_RING_STATE_STOPPED         (1 << 2)
+#define CMD_RING_STATE_RUNNING         BIT(0)
+#define CMD_RING_STATE_ABORTED         BIT(1)
+#define CMD_RING_STATE_STOPPED         BIT(2)
 	struct list_head        cmd_list;
 	unsigned int		cmd_ring_reserved_trbs;
 	struct delayed_work	cmd_timer;
@@ -1578,9 +1579,9 @@ struct xhci_hcd {
  *
  * There are no reports of xHCI host controllers that display this issue.
  */
-#define XHCI_STATE_DYING	(1 << 0)
-#define XHCI_STATE_HALTED	(1 << 1)
-#define XHCI_STATE_REMOVING	(1 << 2)
+#define XHCI_STATE_DYING	BIT(0)
+#define XHCI_STATE_HALTED	BIT(1)
+#define XHCI_STATE_REMOVING	BIT(2)
 	unsigned long long	quirks;
 #define	XHCI_LINK_TRB_QUIRK	BIT_ULL(0)
 #define XHCI_RESET_EP_QUIRK	BIT_ULL(1) /* Deprecated */
-- 
2.53.0


