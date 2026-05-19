Return-Path: <linux-usb+bounces-37678-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCA7MzQ7DGp8aQUAu9opvQ
	(envelope-from <linux-usb+bounces-37678-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:28:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32C57C37F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 123EF305FBB2
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C5A3A383A;
	Tue, 19 May 2026 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZwaoPmi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA546258EC1
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185935; cv=none; b=Owm7/zOuvSawxvigBUmjnp3i4spjkhWt0EDGuFBsb6U5Gdrbg/ydNPmNykOycwIepL0loDIxYI9m3s9JvObAVRe626eT3bKyw0MA/xmuAo7tTIMKB71hJXZAWS8NcCeomOScysG8TXx25PQ6e6bAaSjFjrntjse8y/4BEzSJp6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185935; c=relaxed/simple;
	bh=v6GoWCPgEIo2r79FVu0WIOpnz/gyRBt0XKqA+rts9as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmzBEpSkrSf5ccIVxJ15EFOltK+C1vdi3gdLJhV49jme/x/qZR++fcvaBol+6aiLYJhgBt2YBjbwEAJjdsmmXJiNQKBfXZqsr7b68KBV5eUb9fgOly5ARMHS5Tf81BZbrd96e2aL6AzUBx5mWp/FD7qRKT74FX3s4CD/5DSiBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZwaoPmi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779185934; x=1810721934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6GoWCPgEIo2r79FVu0WIOpnz/gyRBt0XKqA+rts9as=;
  b=RZwaoPmiMo30mG2Zq998cOYr3a2JHaSZXXot+j4ttzU3Nq6Y4DpTBdnF
   QCXrcs8UrDtnf8Rxlw/kXjBu9C30gY/Zvs+MeFeW5DFqYXPXlhVqFPbNd
   6S1MJm90BNE84srsMTMffIXogxcfSXGeHoJinSKHOd1MZQUSwVmouu6UG
   nmkJi+7I6COxQLFWHz6Ma8r6N05zpk8D664pjztKqleuHA29bp5VE/1mo
   EKSp4o7W8EGayUmhv6ZeUSddGhDlnXv4yxTVU3+gWxj8+XcedZGApO65z
   r1Cj6X/X8iJJLRKRzVS00IM7zp3bafbZ0BqvrMBUuXOATdmJFs/OIk8eC
   Q==;
X-CSE-ConnectionGUID: Ul9AOMjqQTiW3H3AsPaBEQ==
X-CSE-MsgGUID: EukCnMiWT3W9DIlV0Z5NKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80231395"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80231395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:18:53 -0700
X-CSE-ConnectionGUID: q4MI/kTaT/Gm1PgfnFoRdA==
X-CSE-MsgGUID: 6h6w3+vLR/aVqdR8cs+79Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263238042"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2026 03:18:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D6D2395; Tue, 19 May 2026 12:18:50 +0200 (CEST)
Date: Tue, 19 May 2026 12:18:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v7.1-rc5
Message-ID: <20260519101850.GB8580@black.igk.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37678-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,black.igk.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 4F32C57C37F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.1-rc5

for you to fetch changes up to 928abe19fbf0127003abcb1ea69cabc1c897d0ab:

  thunderbolt: property: Cap recursion depth in __tb_property_parse_dir() (2026-05-11 11:32:03 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v7.1-rc5

This includes three patches that harden the XDomain property parser
against possible malicious hosts.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Michael Bommarito (3):
      thunderbolt: property: Reject u32 wrap in tb_property_entry_valid()
      thunderbolt: property: Reject dir_len < 4 to prevent size_t underflow
      thunderbolt: property: Cap recursion depth in __tb_property_parse_dir()

 drivers/thunderbolt/property.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

