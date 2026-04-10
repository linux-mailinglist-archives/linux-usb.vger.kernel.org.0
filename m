Return-Path: <linux-usb+bounces-36128-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBuuLf2X2GkgfggAu9opvQ
	(envelope-from <linux-usb+bounces-36128-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 08:26:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C923D2BF5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 08:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D18653011A73
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 06:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600C4370D43;
	Fri, 10 Apr 2026 06:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYmx4ToD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712C226D02
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802358; cv=none; b=ZX5/wsnG9Q8TK3i0gJZ4OGYGGo0WZsXdBFze+0Z9R1iWPjcGCp1TT4UcB+QjVwZEAFKcv63ShdORk8pHOB/YZ8eGfAfH7TzxM6n32RSrMD19l0qDKGPovXReZSnXSujr2XGetuExzCd57cHu2JaTDnnR7YbL0sMKWgmbC9BKyWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802358; c=relaxed/simple;
	bh=vtsaUPO8NheVCDEDwdor+TUMSk16PzgI55viKa1zLBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3sggBRRjUCx3OmJIV4xlbnZ3md/J7041FMbREMFzwTsb74VFTWQsE3seCrFQKkIjoETaEFFD8Dok48Sw34jggZVfi8S6whokp2p6lxH+eKrZpOTG5fVa64UIlYGBp7fcFCa9qfkipBguKSrmYepd+G1+dTDgGLRYPtwIt5iMfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYmx4ToD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775802355; x=1807338355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtsaUPO8NheVCDEDwdor+TUMSk16PzgI55viKa1zLBY=;
  b=UYmx4ToDQPLTkcuOXf0qOFIf7QA9dMYwksh1VbUiNwt+W57GDcFnQCUa
   i1cKnxdkYd23++G1xGHrs0XcjWCLwTfe3o0qt+s6CcxjtNMJYvnEqkQKj
   8cLGQIrosxmaKBnd9Oj/1ysyWJ9yjNFO+Mv7xMfOPCgXGInJamCO7WJQh
   taeKFZWSQDiJLGN6NRCKDBbeHyQAwcDjjM44Fo7aqtNNb6ZhwktwCla9U
   vD4ugygtZlvzOJ7bbw5zAZbayUx2jP4MawUXiIGDtnR2sre1o1X5ZtBcr
   eP+uPPgyihvUip+qNlCl64etAxjkUtEdsCTxIvNd6YNuh0VfuUqkghOzR
   w==;
X-CSE-ConnectionGUID: my4lBEjdToCnE8NL+zkRkg==
X-CSE-MsgGUID: L+xk9VdtRB26fFBp0wJXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76780970"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76780970"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 23:25:55 -0700
X-CSE-ConnectionGUID: S1oUKD20TAGfkaVnE4CLBw==
X-CSE-MsgGUID: dHIXmsCtTzOeQlQGshdObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233930738"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 09 Apr 2026 23:25:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2E52795; Fri, 10 Apr 2026 08:25:53 +0200 (CEST)
Date: Fri, 10 Apr 2026 08:25:53 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v7.1 merge window
Message-ID: <20260410062553.GK3552@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-36128-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 29C923D2BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.1-rc1

for you to fetch changes up to 498c05821bb42f70e9bf6512c3dec4aa821815d0:

  thunderbolt: tunnel: Simplify allocation (2026-04-07 09:00:26 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v7.1 merge window

This includes following USB4/Thunderbolt changes for the v7.1 merge
window:

  - Disable CL-states for Titan Ridge based devices with older firmware.
  - MAINTAINER update.
  - Simplify allocation of various structures with kzalloc_flex().

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Dave Hansen (1):
      MAINTAINERS: Remove bouncing maintainer, Mika takes over DMA test driver

Rene Sapiens (2):
      thunderbolt: Read router NVM version before applying quirks
      thunderbolt: Disable CLx on Titan Ridge-based devices with old firmware

Rosen Penev (3):
      thunderbolt: dma_port: kmalloc_array + kzalloc to flex
      thunderbolt: Use kzalloc_flex() for struct tb_path allocation
      thunderbolt: tunnel: Simplify allocation

 MAINTAINERS                    |  2 +-
 drivers/thunderbolt/dma_port.c | 15 +++------------
 drivers/thunderbolt/path.c     | 28 +++++++---------------------
 drivers/thunderbolt/quirks.c   |  7 +++++++
 drivers/thunderbolt/switch.c   | 30 ++++++++++++++++++++++++++----
 drivers/thunderbolt/tb.h       |  5 +++--
 drivers/thunderbolt/tunnel.c   | 10 ++--------
 drivers/thunderbolt/tunnel.h   |  5 +++--
 8 files changed, 52 insertions(+), 50 deletions(-)

