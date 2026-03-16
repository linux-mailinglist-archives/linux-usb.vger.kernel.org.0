Return-Path: <linux-usb+bounces-34875-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFM3IY4TuGk7YwEAu9opvQ
	(envelope-from <linux-usb+bounces-34875-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:28:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A929B5AB
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F038330238D7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93600282F29;
	Mon, 16 Mar 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myuzKewb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FC1A9FA8
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671265; cv=none; b=foakD6gT7Vu3Ghk72vJOn3UJ6Fv7i1+szBpvm/IRvb9I0Vo8xC6xYMXTKelFoVR+/jaD9ciGry8DTrz9htJQPlD/wHVvol0SZQQWD4hHV6tWt1NTvhFNjlRZflqClu5CBNDIkpPjoqMvKbkTuZlSwPis5hn3ncBc30tUJbmI5TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671265; c=relaxed/simple;
	bh=4YoteaQvlo+mw9bsSrpChd1OirmsvzHIuUnmvmuytpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZxY015aAoqRMsbLQ1+a6sBpf+6+dLvTYR0h0t2WCluCfafE+s/SGN7fenLf+ux5FqjCg7w09pJCNGsINnT9qX4XL+f5tX0Goi2SFvR25njSBD+fP2jxvUuzwL4vh3WwGzl7c2JIfQaaKIOip6CKc11PQSHUCnmcrZiPeCXZrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myuzKewb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773671264; x=1805207264;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4YoteaQvlo+mw9bsSrpChd1OirmsvzHIuUnmvmuytpc=;
  b=myuzKewboey2L9/94B+fChxX07EdLSD7cG3nVKAWWZ8JYrQ3gNPf68Qx
   TogW4l4Y3QiVjGPQtblWV8LApx4/9nmoFT7vtc/RXbeTqXDfO8vltC126
   y1leVEdXu707xqZddSN+vYLJRebm3UPkiRlxvIJN0/dpt9z3FaJnst6iN
   tups3fP5Xe+iqjpLlOKixJxyn5yezTVKlujwmM1QaI6zZbUkJs6aYGeve
   jNahRNTURwubotTFXF094TjE440yO0TXsIR34dN3zvRAgaiMbMgBJgU0y
   dUUAR3+53zJLTShe+nmZ6f1U1g8VaeKSCblf9iyJ9EB3fFRadm92DYuXk
   w==;
X-CSE-ConnectionGUID: iMQy7UdLQjmj7SSON2juNw==
X-CSE-MsgGUID: +dykQshNSemsmygCRWYXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78537836"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78537836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:27:43 -0700
X-CSE-ConnectionGUID: JvaSPpMTTViNiwcY+w9YRw==
X-CSE-MsgGUID: 1Q2H5kC2QtiNidxr/VqWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218182574"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 16 Mar 2026 07:27:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id D4C5E98; Mon, 16 Mar 2026 15:27:40 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/2] usb: xhci: correct Command Abort bit handling
Date: Mon, 16 Mar 2026 15:27:18 +0100
Message-ID: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34875-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 0B7A929B5AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Address problems with xHCI Command Abort bit handling.

First patch reworks the Command Abort procedure so that the CA bit is
asserted without modifying Command Ring Pointer under any circumstances.
It documents and corrects all previously encountered corner cases.

The second patch refines this by using writeq() for the CA write on 64-bit
architectures. Since writeq() performs a true atomic 64-bit MMIO write,
it should avoid the split-write hazards that have historically caused
Command Ring Pointer corruption.

Niklas Neronin (2):
  usb: xhci: fix Command Aborting
  usb: xhci: use writeq() for CA write on 64-bit architectures

 drivers/usb/host/xhci-ring.c | 47 ++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

-- 
2.50.1


