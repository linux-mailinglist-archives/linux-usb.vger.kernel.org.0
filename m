Return-Path: <linux-usb+bounces-33029-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIp7Md+XgWl/HAMAu9opvQ
	(envelope-from <linux-usb+bounces-33029-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 07:38:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63210D559E
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 07:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3880430715F6
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 06:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C538C37AA9A;
	Tue,  3 Feb 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="As1ymXXC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C25230264
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 06:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100306; cv=none; b=UFLVQerua7kxUhqZsFUP4Xt6jVfv7dv1ddOH4M232F1cVSrtmcVJzjH6K0h75XsTmmaU60luuKd4wsYzyk1/xf9A3Rki2TeHmpFZKcLxfb5yv2T35ZiutcEaREZAXJXmx+ma9c9+qPyroTqL3M4kNnSdMRABbF4FvULEW+UmduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100306; c=relaxed/simple;
	bh=alSP2AwXeF4zNLc0IviqA9htN/Ac/fsc3p05p8kPCaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iv1sdDcZly/9Uyk5M1dFLVBkEmgyL3yAGCNcAvYUtSP0yyKwb0BpOpgV+MOkv6p+KkcmnwAOQX/VhzZcDK84ozkWsOGdJJQym5QJ7XUBOoqGu+f+L9jq35/J1JcV+vKr6nngneZsmiodIr409hU7z1qp9JLJdZeRUd+btptaD4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=As1ymXXC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770100304; x=1801636304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=alSP2AwXeF4zNLc0IviqA9htN/Ac/fsc3p05p8kPCaA=;
  b=As1ymXXCc9zpOYaQTAWAV2YcWzkfgmWkciFXJJ/yCNIvvTzA61fNCoLC
   EGwbxjRLFoL7f9F40Iw2980hf+G96uzU4gvDizlwF+KpcuA2Wd0dlpNSS
   1YxVlVxS+pV3vZSZAf/fnbtydzFMCcAqW8aE+eDLPoQvVXYW/vjHq3zQP
   LwPsJr5UQdjO6lQEqmHaXIT8kylda41Ri3+dNuKH9BVL9GaqiZqOyUfzH
   b7QHfgshsCY6wZUAbk6vhjUQfaMAloYkcdM7SDe4TCk3YT0qnuaoV3hvJ
   HEUri1lox9XQqvigIKy+Dtfuxg3HwyKpvYH+NaifitB7vnssEUcIBdBBe
   Q==;
X-CSE-ConnectionGUID: 9pps0p/AS1itPKY/2l0Exg==
X-CSE-MsgGUID: k5R0fu++TriHIy+ooLt1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73861039"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="73861039"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 22:31:43 -0800
X-CSE-ConnectionGUID: C6gfVeR2QSKYcsvLK2Fm3A==
X-CSE-MsgGUID: QLJzZRLgQea+puPEXfuKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214288933"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2026 22:31:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6B09098; Tue, 03 Feb 2026 07:31:40 +0100 (CET)
Date: Tue, 3 Feb 2026 07:31:40 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.20 merge window
Message-ID: <20260203063140.GC2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-33029-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 63210D559E
X-Rspamd-Action: no action

Hi Greg,

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.20-rc1

for you to fetch changes up to 062191adfde0b11b01656ea6db51a9385fa3d104:

  thunderbolt: Log path activation failures without WARN backtraces (2026-01-05 12:14:43 +0100)

----------------------------------------------------------------
thunderbolt: Changes for v6.20 merge window

This includes following USB4/Thunderbolt changes for the v6.20 merge
window:

  - Tiny documentation update
  - Switch to use tb_warn() when logging path activation failures.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Chia-Lin Kao (AceLan) (1):
      thunderbolt: Log path activation failures without WARN backtraces

Jaime Saguillo Revilla (1):
      docs: admin-guide: thunderbolt: Replace ifconfig with ip

 Documentation/admin-guide/thunderbolt.rst | 2 +-
 drivers/thunderbolt/path.c                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

