Return-Path: <linux-usb+bounces-35550-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO46MuF6xmmjKwUAu9opvQ
	(envelope-from <linux-usb+bounces-35550-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:41:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8A3446A8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7892E301079F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4E81474CC;
	Fri, 27 Mar 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGK7js8q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EF13C918
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615260; cv=none; b=V0oKQxZMJRM0nD7gxHpGW+9N9BcJeRvqU1RT03QbWkU+RazOfEiQKldlY5ND+dIkPlPt2c6e2Ehbt3ZZED1Qtok6a3FuVfd6naJPnRzP8WcJYvDuR/prL1sZrM3eEcuFAGsLkUkiu3qioHTw6kM0sSaA9BFBjQabj9vIkhlQvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615260; c=relaxed/simple;
	bh=leHQ92ICaWLioa6Ap2LRlPxta6XR+K1fsTzgQj2xvOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4sIW+TZxyOjIN0PYU4PykCc4b9yhd6p5mIG4hjRR6zMss67DZ1ZgITKS8chrznwxAYDYBkOVQGOnOf7DmFgZMihAWU0mdz+OEdYfZCjIOXL46KvjVnHO1FnFNc6yHDEg4wyAhQm7gbp9xt5WEgR0IXUt4XSo7laA/iU+LEs8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGK7js8q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615259; x=1806151259;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=leHQ92ICaWLioa6Ap2LRlPxta6XR+K1fsTzgQj2xvOU=;
  b=aGK7js8qzSTgNcOo/nikDpwXeLesqEjr6jA1z+f38zMW8bs4bHgvw525
   ZVblV49NMxFhxrWRJra/CSc5Kn1RjApQg/M2HpPJr0+pVe3fofcl9Y9lO
   0tRcG+x5MzG4hkXE1B+1t8V2L5qqFfPw7DMoELySJvN5S6+CnrcYwEY7X
   uiuLx5RGa2ITcaisL9hKK3Raecaaoo0PAK2tvuvraJ95H6/4dJqefjWQH
   jT5B4pKhfegd1P/mP1BnmJVq5O9Vp4rMFR7FQCUm//ErBPo8jjTUWp/H5
   XqWySSnSdjHfqh+wWcao3jeBkYp5aoFCItNheey0mNgym6kfymixxCobU
   Q==;
X-CSE-ConnectionGUID: AGUa/Ot7Tj2Su7A0oYRZwg==
X-CSE-MsgGUID: pV69ioi+T12tPsqJce6GDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87160599"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87160599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:40:59 -0700
X-CSE-ConnectionGUID: ywwGKnAuRk6Vz3BPzcRKGg==
X-CSE-MsgGUID: 1rYFe91tR/SNHqR9PwT37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248347643"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 05:40:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id ADE5E98; Fri, 27 Mar 2026 13:40:55 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/9] xhci: usb: optimize resuming from S4 (suspend-to-disk)
Date: Fri, 27 Mar 2026 13:34:31 +0100
Message-ID: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35550-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50F8A3446A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On resume from S4, the xHCI controller loses register state, but the
driver currently responds by tearing down and fully reinitializing all
xhci data structures.

This is unnecessary. Instead of freeing and reallocating driver structures,
simply reset the required memory and restore the hardware registers that
lost their contents across hibernation.

Changes since RFCv2:
 * Fix virtual device itteration from max-ports to slots.

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


