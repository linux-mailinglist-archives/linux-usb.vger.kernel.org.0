Return-Path: <linux-usb+bounces-23180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB0AA9173C
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA29C19E1A6A
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3233122836C;
	Thu, 17 Apr 2025 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfiTT+gt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D58227BA2
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880672; cv=none; b=TeAlc4Zr0TLQ/TRUat4Aix4EPrwvPS5URaujfBunMxypGSoqY6yl0vzqumGNWYX0kW44jWoaBExfjfpg9Wx3ioKj/XKEsXu8ASMWzhz/CtKAHvY9ItIevFGIiI9LTx/EtsDOxWAsCa+a8+Sj4KLZp3g7iDgtRNcVOOxxoYGv7tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880672; c=relaxed/simple;
	bh=zzOU5yq/qAIkgA8xp7rU+Go6c7q9jYeDKFzF+NypqA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o/irgo3xTSrPXRLofdyJheJjAwRmtu0jj/n/0pBz+3jb0qPd+3fwu1V1/8TJ9TN6EjwxTqIFoQEtg7afbDO7RWiaHHDHRc8LYBVdxKZJr4J6KRSFPMsLGY+6Yn/ihnq5B6uvabNEI6dW+rVoZF1VznhtqR9L6qp3iOuoQP6zjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfiTT+gt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744880671; x=1776416671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zzOU5yq/qAIkgA8xp7rU+Go6c7q9jYeDKFzF+NypqA0=;
  b=DfiTT+gtAmUfs2kh+nXMqT68bXhDhYDp+pdk2wknghSK0Y+XHDolc/xt
   GPAfNQbe7cF5BlO1QGBqzV28uh46g6ANRCiVlDnr0iYzhiDt/3APfk+qH
   3xN954fSHkGC2GJdpPYTXJ7j7lW7ldg3UPV+0OKEqwLRWJ99+R+5YvWal
   rrJ2/YwnpacD+dTc/yyOUTifD+L5es4NPSXcPgbcLeS/yI9xxXMIr74/L
   jRiTUL5I5lH0Dht4iqLSre2w+cftPErGo8+yJBpHsdcFN86OIlktquJcv
   ez7yWFWy25YbmbocwPSvJoas1DMIOnJXEnxUhnUBxi0L2RP5iHZhkkHiq
   A==;
X-CSE-ConnectionGUID: 4UNIlQZxQL6PjbJKx3OS9g==
X-CSE-MsgGUID: ezeSm7YlTvif97XqKtA9Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50281220"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="50281220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:04:30 -0700
X-CSE-ConnectionGUID: JFQkZE/RSEiZCsb+En/Sqw==
X-CSE-MsgGUID: ISHQryJeRy+ueuIk61ueWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131066814"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 02:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D984971B; Thu, 17 Apr 2025 12:04:26 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/4] thunderbolt: Notify userspace about tunneling events in the domain
Date: Thu, 17 Apr 2025 12:04:22 +0300
Message-ID: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This series adds support to sending uevents to userspace about changes in
tunneling such as creation, removal and bandwidth related.  One intented
use-case for this is an upcoming USB-C daemon developed by Saranya that
then notifies user for example if there is not enough bandwidth for
DisplayPort requirements. We also added debug tools [1] support for these
(currently it just updates various screens on event but we are working on
add event log there too).

The Firmware Connection manager side is kind of limited though since there
are not that many notifications we get.

[1] https://github.com/intel/tbtools

Previous version can be found:

  https://lore.kernel.org/linux-usb/20250410125600.3074417-1-mika.westerberg@linux.intel.com/

Changes from the previous version:

  * Add missing SoB.
  * Add documentation to admin-guide/thunderbolt.rst.

Alan Borzeszkowski (4):
  thunderbolt: Introduce domain event message handler
  thunderbolt: Notify userspace about software CM tunneling events
  thunderbolt: Notify userspace about firmware CM tunneling events
  Documentation/admin-guide: Document Thunderbolt/USB4 tunneling events

 Documentation/admin-guide/thunderbolt.rst | 33 ++++++++
 drivers/thunderbolt/domain.c              |  2 +-
 drivers/thunderbolt/icm.c                 | 36 ++++++++-
 drivers/thunderbolt/tb.c                  | 22 +++++-
 drivers/thunderbolt/tb.h                  | 13 ++++
 drivers/thunderbolt/tb_msgs.h             |  1 +
 drivers/thunderbolt/tunnel.c              | 92 +++++++++++++++++++++--
 drivers/thunderbolt/tunnel.h              | 23 ++++++
 8 files changed, 212 insertions(+), 10 deletions(-)

-- 
2.47.2


