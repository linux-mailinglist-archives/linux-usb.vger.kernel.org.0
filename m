Return-Path: <linux-usb+bounces-29873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2679C1E925
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 07:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C3004E77B6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 06:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B4232A3C2;
	Thu, 30 Oct 2025 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNjC1TFY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BEC2F99B0
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 06:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761806050; cv=none; b=Q+wlmOGqsLU78RNR87V2YReRyT4+iOzAylDywuStfTYfsbeFrVpA2ImK82pDmLEAbfYK+CidiHpE6170ML8JdmUqfBldlYDIaonwjYK0KelO+Nc3c6aqFGRhR++3hNnD/EtLg/CQpa27E3lgA4xJa6Uz4CM/moTHAk8A3YEqLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761806050; c=relaxed/simple;
	bh=/PawtP3U2DDVyMUAtfxrbkJky98pg9K9mLedbS7wjxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iN6AdX346XprCea4+eSa0IrsQeMYd+AC2Cgd8Ia70JIXGXc15A15pZHzkKfYszB8Z1BzQxTg8KVkkCB4T7+FbqDkh9pT0dzhXIZGgnqieS9wUB8+KFoe4YZ7u1akSYZ63yjZmuRc1G18k3dWCzkuEJKjPosnLvwBXgWEGBdYens=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNjC1TFY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761806048; x=1793342048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PawtP3U2DDVyMUAtfxrbkJky98pg9K9mLedbS7wjxA=;
  b=mNjC1TFYe+wIyQzJ9fdBtALDCTC0c2cC+wNB8uTUMB2Wrqyaz70JGosb
   lLIWLT+6qpZ+M2ezF7plGir6Aw7+yFtdWCA5Iv4hHrEXzlIZA4IgM4Dxf
   x5LZ+wYNoOQ0Ns+O90USWeJ3R5w4kbG23oWxdVMAWo7r4Tj7ojo3PP2pr
   QQjruqW74a6bWUfk2X/ViNe7UVtFMnO5vidnU6Vt77bzzBXpf3CdlDobW
   A8zmaKbMVa67ZwNqPQ/BqfzB/cRnopfd6MD5eyXsXpojOSBx7GiWLaJFR
   IMj5eupXhpUEZNPKPO1zMn2xzbQLgRIVww4FMJpw6h0JblFqWZz7C2ATs
   Q==;
X-CSE-ConnectionGUID: kalWVjwMSxmuIpdSsjEk/Q==
X-CSE-MsgGUID: UmJ1ZvVaQBqTWR8sO8elGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74230199"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="74230199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:34:07 -0700
X-CSE-ConnectionGUID: pgYAmtldQIOnJc8fLjse0Q==
X-CSE-MsgGUID: TAWYyn2+Ts2dv2+Su07cKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="186614233"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 23:34:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5C7E795; Thu, 30 Oct 2025 07:34:05 +0100 (CET)
Date: Thu, 30 Oct 2025 07:34:05 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.18-rc4
Message-ID: <20251030063405.GX2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.18-rc4

for you to fetch changes up to 3575254546a27210a4b661ea37fbbfb836c0815d:

  thunderbolt: Add support for Intel Wildcat Lake (2025-10-20 08:20:34 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.18-rc4

This adds PCI ID for Intel Wildcat Lake Thunderbolt/USB4 host
controller.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Alan Borzeszkowski (1):
      thunderbolt: Add support for Intel Wildcat Lake

 drivers/thunderbolt/nhi.c | 2 ++
 drivers/thunderbolt/nhi.h | 1 +
 2 files changed, 3 insertions(+)

