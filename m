Return-Path: <linux-usb+bounces-35332-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCFFI2wzwWm7RQQAu9opvQ
	(envelope-from <linux-usb+bounces-35332-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:34:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD92F1F90
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D901530723BC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C4539EF29;
	Mon, 23 Mar 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIB5PyFt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E79366558
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268890; cv=none; b=PdIE+K/Snpr/qv84OlVOvaxnJ18mt921zWjzGh9JvbWjmVm3Ic7aA2O03PloCaBWRTkjgt9gB/j1Ued2aSVkwm87bI+s/4LfDiEeb4fnM4T9XIcJYX//PpZhc6TG57ATOnXohXFLTQJPI/t1WUqWrmZ0a7t+su4LoeFewSTRYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268890; c=relaxed/simple;
	bh=/e6Ylb7cqosU/cFDbnmvr+w5gvfbJFp8fVcoYCs6s/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o8PVClsEtbUqt8+CIi7rzPcHCF8JaupFvIv0v7Uksz+hLdJpqg588sx901dgCxUiqxapL8NyaVpGdDLrhzcfrhttKdtxabhzsmm3SajDvgcg00g5y3dcE+CwKbLZIIf8haougPmAX1E+jFC4Ok07Ub7y9pUf214UM5xaP8iq4dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIB5PyFt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774268889; x=1805804889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/e6Ylb7cqosU/cFDbnmvr+w5gvfbJFp8fVcoYCs6s/A=;
  b=OIB5PyFtpWOeO9wl0vUYOK0P7M0LqRsemm02WTsMPHDnurpjt3XwnaEk
   iIrVH+LRDq1e6aS7pDe9zqHRkVBv9NSa99US68Q2v3EQ1QBQBpP7Harn4
   4v2+FlfzdJZ0LMJ6mG/b9ZHXVZvxYs7ig54whJmQi3HpzOVu6C6JaZomg
   4xOcGx3Tlqt3Sw5A93OpyZ1O5w7TCOJgVeocgNO/NGW0DpJwXY834o4CX
   tobuxVjKzF9JS+jMustkeRvGlQZjIKtD6zeKE7GVIG/0wRwTP7Ouyu1Rz
   1DToigtNhOX0SV9NP9VWVxb+q+XmANNyG1ZNxpsXA4BgB5xHSqBc+Y7vX
   w==;
X-CSE-ConnectionGUID: gulLQ0txQH6r27coXMgoqA==
X-CSE-MsgGUID: O6JmIWBPRWaBD72p3y5rKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75151937"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75151937"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:28:09 -0700
X-CSE-ConnectionGUID: ZQZhtnoNShCja4LTsMx3wQ==
X-CSE-MsgGUID: LhRRCUMNRCqz2qJR4musnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223083605"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.40])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:28:06 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>
Cc: <stern@rowland.harvard.edu>,
	Thinh.Nguyen@synopsys.com,
	michal.pecio@gmail.com,
	oneukum@suse.com,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFC PATCH 0/2] fix xhci endpoint restart at EPROTO
Date: Mon, 23 Mar 2026 14:25:10 +0200
Message-ID: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35332-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,synopsys.com,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 1DAD92F1F90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

These patches are related to the 'correctly handling EPROTO' discussion,
and aim to fix the xhci endpoint automatic restart issue.

It also makes sure that multi TD URBs are given back with proper
EPROTO/EPIPE status if a stall/transaction error is triggered on
any TD of the URB, not just the last one.

endpoints will still be restarted when a new URB is queued, this does
not fix the issue with BH URBs completion, but will print a debug message
if a new URB is queued before previous 'tainted' pending URBs are cancelled.

I haven't been able to test the actual codepaths in these patches yet.
Can't easily queue several URBs and somehow trigger stall or transaction
error on early URBs, but would like to get feeback on this solution early.

Thanks
Mathias

Mathias Nyman (2):
  xhci: prevent automatic endpoint restart after stall or error
  xhci: Ensure URB is given back when endpoint halts on a multi-TD URB

 drivers/usb/host/xhci-ring.c | 50 +++++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci.c      |  7 +++++
 drivers/usb/host/xhci.h      |  4 ++-
 3 files changed, 53 insertions(+), 8 deletions(-)

-- 
2.43.0


