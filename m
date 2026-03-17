Return-Path: <linux-usb+bounces-34942-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AuUGq5suWm8EgIAu9opvQ
	(envelope-from <linux-usb+bounces-34942-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:01:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B52AC95C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 008A23028C16
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E8E3E929F;
	Tue, 17 Mar 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzmpvfD2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F573E959B
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759372; cv=none; b=cQyMgv2m6YRVUb271i2h4a1kbc2uzOFvb8ez+jW9+Sihg+YzSa3Y66dCT4IfZX7KOpbt80Tow/09wTFnYRw8OfCLsJMx52qKy2MPSpr5CroVV/pO9DKk6n2TXkMpOvX1viC9D0Oq/pHQtQHrPg3mZENjJVfD/lMzNZUmx6eLCgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759372; c=relaxed/simple;
	bh=vVlu3eczkKX0M5rG276ke4TrpMj1Fev/Vr8r8zFHdgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+kaDyCv/fS1FmdEwGO3Kk5gaq2F/b9bNWEOZsYcxQzw1byLvyNJg/dTKjGujNIdE/pM3JUrw7MbihamkIBQxRxWILihbxwu1lKhASc/I4jQ1i0glCT1XKQn2H+BXyV7+2m8yYomCvPHdXMXj75FphMCHFvcXPtBo0cnBop0IVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzmpvfD2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759370; x=1805295370;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vVlu3eczkKX0M5rG276ke4TrpMj1Fev/Vr8r8zFHdgw=;
  b=RzmpvfD2qxEAC9RIu8NrKq9GpNiHnSXmAsVUH95s7AO/9uFqUi5hS1Zu
   oBg5VnnYuaLYW56P8LlNsHsp8AKDhga39xrXRI+yLGSirZR60UuOaCyIW
   kQuaSyUngf5QWHVlurwo9hEncuOVQXBDINJfs92MGqWNiSurAXBnlLgNF
   4kG9IJdeyL3X899X/gCSpEALmQlnn8ClEEwmtX3LIYwCJ9nvZ6M1ZWxs6
   ROBDSIUApKJoW7g4CVgNMFIdC6RfPbp+v4CGb9K5zKbDAY9oc7XIWZMqb
   DQCvZUVx8n7mmTMDWVnJg+IH8URomyN3Ok6Td20sGBD3qfvsTFfIcbilp
   A==;
X-CSE-ConnectionGUID: aihDIeZnSJuvth6LDoONWA==
X-CSE-MsgGUID: o37TDN89Tzy5Ib9FrzDRFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491161"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:09 -0700
X-CSE-ConnectionGUID: f8UNlNvLRiOv1AyMdSMrRQ==
X-CSE-MsgGUID: w9GnLJNpTcyM+8QLMs7ZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="245312670"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 07:56:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id DBC8E98; Tue, 17 Mar 2026 15:56:06 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH v2 0/9] xhci: usb: optimize resuming from S4 (suspend-to-disk)
Date: Tue, 17 Mar 2026 15:55:35 +0100
Message-ID: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34942-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 743B52AC95C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you Michal Pecio and Xu Rao for your reviews.

This series is now split into two parts. This first part avoids freeing
and reallocating xHCI data structures during hibernation resume.

The second part, which lays the groundwork for secondary interrupters,
will be submitted separately.

v1 -> v2:
 * Drop "simplify USBSTS register reset" patch.
 * [RFC PATCH 3] New patch
 * [RFC PATCH 7] Re-add function comment to xhci_init()
 * [RFC PATCH 7] Moved xhci_mem_init() and xhci_init() start/finish debug
                 messages into the functions themselves.
 * [RFC PATCH 9] Cleanup 'cmd_timer', 'cmd_list', 'tts', 'endpoints'
                 during S4 resume.
 * [RFC PATCH 9] Fix commit title.

Niklas Neronin (9):
  usb: xhci: simplify CMRT initialization logic
  usb: xhci: relocate Restore/Controller error check
  usb: xhci: factor out roothub bandwidth cleanup
  usb: xhci: move reserving command ring trb
  usb: xhci: move ring initialization
  usb: xhci: move initialization for lifetime objects
  usb: xhci: split core allocation and initialization
  usb: xhci: improve debug messages during suspend
  usb: xhci: optimize resuming from S4 (suspend-to-disk)

 drivers/usb/host/xhci-mem.c |  82 +++++++++-------
 drivers/usb/host/xhci.c     | 183 +++++++++++++++++++-----------------
 drivers/usb/host/xhci.h     |   3 +
 3 files changed, 148 insertions(+), 120 deletions(-)

-- 
2.50.1


