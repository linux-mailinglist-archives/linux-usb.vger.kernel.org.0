Return-Path: <linux-usb+bounces-24110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2BABD454
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 12:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27893B7852
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 10:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A9121B9E7;
	Tue, 20 May 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYHmNPpD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB6620C473
	for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736211; cv=none; b=WQPQzAPUM7SJOKfAj4GfRMkqqdkYeyOmaBrS1qaj2MJMXv1qCF0GDLTMqYapbfRyaMqxHCiYAkxTbkXyV3ehmnULNC+f4UgLGpdef/bhkjcMxdWXaCQe+6dCOrk+60GiZ2HeTNecYeC4zQuh5I+OIatOHH1+MJGWAcWXRC6PrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736211; c=relaxed/simple;
	bh=8oJf+Shlj5VDqKV1ksOhEqq1FedXCZzbPOtsVhiu7co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hictPwx99O26NpXkmqEFnN6UN/50jtA33MmcGFnK5S+6GmQChhOQSWOquDzvme0h+dVG7Qk9FidF0fWuHKQDx3JqY9VFipwOM6lhwLlWJSKWcMWULqVpGbcW2Fh2ZJBw5Tmv74SHwdyVVXUT8il4RhwFPp0pr97YJYVUajkYIaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYHmNPpD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747736210; x=1779272210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oJf+Shlj5VDqKV1ksOhEqq1FedXCZzbPOtsVhiu7co=;
  b=dYHmNPpD7Y0avcfbFuxIUCCIk/bTRzoBfL/urVUcPtzZ28MCodR1tcUO
   Fla7GinJvZetkkUai8NNi9fhXzTJwXTmToSsQjM3jF10fgsDkrOit9CgE
   1SRrK++Z+eOC36YwxbcoM6PNT1+DNyL7hZQuGD5MB3t12nt3xWuLSKzbc
   ugSGl0gTuXGO1sNaLtmQBPHY1LfpoYSxray3/k7hHbLqflbSPVSraRnge
   m6wu63P4wNWyK/CAz3YBmTIwPo2jENPEXmnafWj3Kneo9xc/6j2QnV5ix
   Q5rdb66ExALE+qP/oolZNVliBUPjSWA8JcmV2mMKmqg7/tFMfURhUyyjJ
   Q==;
X-CSE-ConnectionGUID: NUcJXKU+TyyKYKkyKozDmA==
X-CSE-MsgGUID: CMZP4Tl8Qs+1gJ/HpKUMIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49360497"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49360497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:16:49 -0700
X-CSE-ConnectionGUID: GOUJvmUvQqSZUf2YJm17sg==
X-CSE-MsgGUID: BP2E2FLyRFmPT1HfxO4COA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143645621"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 03:16:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EDB66368; Tue, 20 May 2025 13:16:45 +0300 (EEST)
Date: Tue, 20 May 2025 13:16:45 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.16 merge window
Message-ID: <20250520101645.GH88033@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.16-rc1

for you to fetch changes up to 36f6f7e2d4d094c828977938eaa4949ec5439380:

  Documentation/admin-guide: Document Thunderbolt/USB4 tunneling events (2025-04-24 08:24:39 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.16 merge window

This includes following USB4/Thunderbolt changes for the v6.16 merge
window:

  - Enable wake on connect and disconnect over system suspend.
  - Add mapping between Type-C ports and USB4 ports on non-Chrome systems.
  - Expose tunneling related events to userspace.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Alan Borzeszkowski (7):
      thunderbolt: Expose usb4_port_index() to other modules
      thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
      usb: typec: Connect Type-C port with associated USB4 port
      thunderbolt: Introduce domain event message handler
      thunderbolt: Notify userspace about software CM tunneling events
      thunderbolt: Notify userspace about firmware CM tunneling events
      Documentation/admin-guide: Document Thunderbolt/USB4 tunneling events

Mario Limonciello (2):
      thunderbolt: Use wake on connect and disconnect over suspend
      thunderbolt: Fix a logic error in wake on connect

 Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++
 drivers/thunderbolt/domain.c              |  2 +-
 drivers/thunderbolt/icm.c                 | 36 +++++++++++-
 drivers/thunderbolt/switch.c              |  1 +
 drivers/thunderbolt/tb.c                  | 22 +++++++-
 drivers/thunderbolt/tb.h                  | 14 +++++
 drivers/thunderbolt/tb_msgs.h             |  1 +
 drivers/thunderbolt/tunnel.c              | 92 +++++++++++++++++++++++++++++--
 drivers/thunderbolt/tunnel.h              | 23 ++++++++
 drivers/thunderbolt/usb4.c                | 18 ++++--
 drivers/thunderbolt/usb4_port.c           | 56 ++++++++++++++++---
 drivers/usb/typec/port-mapper.c           | 23 +++++++-
 include/linux/thunderbolt.h               | 18 ++++++
 13 files changed, 314 insertions(+), 25 deletions(-)

