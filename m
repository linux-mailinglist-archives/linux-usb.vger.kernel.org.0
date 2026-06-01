Return-Path: <linux-usb+bounces-38238-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNhiAMxlHWqwaAkAu9opvQ
	(envelope-from <linux-usb+bounces-38238-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 12:58:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F861DFCA
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 12:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B2463058E43
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 10:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8882A399340;
	Mon,  1 Jun 2026 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTqmeSFr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05787312825
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311025; cv=none; b=P+PK2f7D96qGibxT6YKRiKA6WYBZl3oJtliBrc2b1QJeJ+x2bZTxLDLc06f+6DSVB1VNwDg30Wdh43cfWEahHKTFotQTvN1DShfXobYEEv7YHPHA3FSpoTZO6Mxaikh5lhU9ryr7mkoN3byZU7g/v5rQ8tay/D5Af5eTFezgq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311025; c=relaxed/simple;
	bh=wzYIlGMphw+GxzLcmg2W8ubJCzYUFEuvzmljQQWUGMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyBVB4oY6jKo25bXzD1Ci+LrG9LO5dyu+JRwk3wlQIhhz7chFvkqLgnjYwxQ5U2wBRUyGFDS9KvqfEFbvC8SAhVmFuNVAT2f1RCdWZEudUSX6+Y4kqM6/go7+P2QzZkhp9zA2bm0WbKbeMGq785pdzxDH++VNnWc4d6bCMKCkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTqmeSFr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780311024; x=1811847024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzYIlGMphw+GxzLcmg2W8ubJCzYUFEuvzmljQQWUGMI=;
  b=RTqmeSFr/GGLOx7+BR0WaTuWRR0PiGWzeRRvfiHmcq2Uvws2MlRd51CJ
   H2Jp5Ii2DkpyeuSxBb9XbSzfPHLxUak+6eIU58eeWgJRLqFzwH/AyorfT
   /9uPcSb69NXocMghjc8moehZEGNWeeVIBWqg+UJ0cHJ15Ah8lPdzoABjB
   DWg0HL704QeX8JWkpGRml3jBwtV3/3fBRsk7gzaJmE7tr1+JpIvx6u3NI
   +MQuDEZScy5SkTAXiP3tzn2y/SCi7TYuRHnX9627vxpinUsLy1xy+Lxm0
   TtFY7j2kwUicz9wLavpEKUGbInpzKPXLvMtiq9DL43+C3MSBqrERye7fQ
   A==;
X-CSE-ConnectionGUID: MrDNNxYYS76sPQgJ8ugpyQ==
X-CSE-MsgGUID: ipA+2jKgQzC8+CZryGdwSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="68600337"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="68600337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:50:24 -0700
X-CSE-ConnectionGUID: l2lBeEm+QoSUq6Eqz0PMQw==
X-CSE-MsgGUID: egF26G+DSa+JKLDD+YYm3w==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jun 2026 03:50:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E7F3295; Mon, 01 Jun 2026 12:50:20 +0200 (CEST)
Date: Mon, 1 Jun 2026 12:50:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v7.1-rc7
Message-ID: <20260601105020.GR3102@black.igk.intel.com>
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
	TAGGED_FROM(0.00)[bounces-38238-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 686F861DFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

The following changes since commit 928abe19fbf0127003abcb1ea69cabc1c897d0ab:

  thunderbolt: property: Cap recursion depth in __tb_property_parse_dir() (2026-05-11 11:32:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.1-rc7

for you to fetch changes up to 4db2bd2ed4785dbadaeeab9f4e346b21ac5fb8eb:

  thunderbolt: Limit XDomain response copy to actual frame size (2026-05-26 15:18:31 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v7.1-rc7

This includes more fixes to harden XDomain message handling against
possible malicious hosts.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Michael Bommarito (5):
      thunderbolt: Reject zero-length property entries in validator
      thunderbolt: Bound root directory content to block size
      thunderbolt: Clamp XDomain response data copy to allocation size
      thunderbolt: Validate XDomain request packet size before type cast
      thunderbolt: Limit XDomain response copy to actual frame size

 drivers/thunderbolt/property.c |  6 ++++++
 drivers/thunderbolt/xdomain.c  | 14 +++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

