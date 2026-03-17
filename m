Return-Path: <linux-usb+bounces-34920-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IixBcc5uWlYvwEAu9opvQ
	(envelope-from <linux-usb+bounces-34920-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:23:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC52A8AB0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 803FF3038F17
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 11:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176E1372EE2;
	Tue, 17 Mar 2026 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eO4+G/iA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF83AB267
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746626; cv=none; b=bXiBIwtYF4tbp0oGvICwGEaYokT0gVVOOGh0RlTplVM3pmoBK7MMno4gmYVUPqRN0ufcj5MhNe1LWEhJ+Uzp10Jf3s4kBZrqrGvjbedFdjSGv7bjY+2NF/boaL9drnc9tLzKeQfNx7jKIR6hApT5aaEBHP3NZiQlGKpn2aQ5COE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746626; c=relaxed/simple;
	bh=qowrY8Tl6gxhcLUOcG9rkM6Mwhth92uehjZ6WjlJOsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6nkSZ5ZWaJtVvoebyPvhH9PVmGTxoW1kbYvkdG3nWWWwSW9R0xaXprWU4hWwuVHqQ0TJNgtKhugsFHo2ZjLmDIM21KszNI3Qv7NoAPIVmMLMVSptw/s5JgJbvM4Xq/hUImk+faXZR+CyB7YEyAsubNVwfUz+M9RM9vxC/F6hHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eO4+G/iA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773746625; x=1805282625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qowrY8Tl6gxhcLUOcG9rkM6Mwhth92uehjZ6WjlJOsk=;
  b=eO4+G/iASk+UmAKvAIcZiF8O8U4pjGNk1cxsYwQolcLDyaKjjxiRJuzX
   +qMiYB6dSUEOI66LUk7zVjfxifbGU5Dgl2qIu3QutNf7dA33bdbLsyBoK
   9Y1muWkoVBPlStsMFhd2dr77jVgeuNKoE63Mj+2TXE6K7ymkwSDS2bX8Q
   KPxaV0kWBsQMpn94k8cLVJxiTp3SzYQ+i0co1gFcb9MAfdlsoe3Rlyk4g
   CTBN7i6BvIsgWb7bt6F+KZ6DdVhd867TGW/aR5sKWoJ6vtCsM1UCuC+GG
   Nkc8ldkIJsvSxfftEFpnR1i6FpkbA6XSwWRnxTCAblLoFFjxs1nPsBBJm
   Q==;
X-CSE-ConnectionGUID: pJ6HknnoRDu6RumbIs+DcQ==
X-CSE-MsgGUID: 6Tz0AFufS2G1ucXz0UegZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74662680"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74662680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:23:44 -0700
X-CSE-ConnectionGUID: WY+jB4xkRjiX/SJSViTEHw==
X-CSE-MsgGUID: HRGn5UCxQoaz0FyV/agW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218392094"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2026 04:23:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0E4A598; Tue, 17 Mar 2026 12:23:41 +0100 (CET)
Date: Tue, 17 Mar 2026 12:23:41 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fix for v7.0-rc5
Message-ID: <20260317112341.GF2275908@black.igk.intel.com>
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
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-34920-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 3FDC52A8AB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.0-rc5

for you to fetch changes up to 73a505dc48144ec72e25874e2b2a72487b02d3bc:

  thunderbolt: Fix property read in nhi_wake_supported() (2026-03-09 12:36:54 +0100)

----------------------------------------------------------------
thunderbolt: Fix for v7.0-rc5

This includes a single fix that reverses the check for return value of
device_property_read_u8() during the driver load.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Konrad Dybcio (1):
      thunderbolt: Fix property read in nhi_wake_supported()

 drivers/thunderbolt/nhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

