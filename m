Return-Path: <linux-usb+bounces-21646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B8A5C8A2
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 16:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D856D166912
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 15:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E70625E821;
	Tue, 11 Mar 2025 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GylNZycx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB0F255E37
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707892; cv=none; b=TZoBMIXWACAQrofoafjIOUKBs+v3sHhao2sYmCsszAOZXfGtMksO23m5VFqXE3GO2jUULqVnvebHzbYuXxab5HToaohto1N7geVkhU3YxqGphM6j8RVeGVMS/EUdPBD1sRbWJnVqSkuPbNawngIhdFQddyhO0pSA4xP8MO/JvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707892; c=relaxed/simple;
	bh=Ol8kNrsdmmlf8cTjPIPWFl6CLuFSFnhAFspRn974LoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjU6HK9kmBebfOSaWnYmvaLaIo8TNdMkbAcY4PCx7JmFm8lk1unA5nhe9GeiSpnKDjaYamFM+901nrPLFrYUH1GyuKTxR6QwRuKGB5OK2E2AHPiIa4GZdKhwTZYrr9+YeCLMUt5l98a8w8Z0WvkH5FkWmRJKbz2LLJRBLa4L/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GylNZycx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741707890; x=1773243890;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ol8kNrsdmmlf8cTjPIPWFl6CLuFSFnhAFspRn974LoQ=;
  b=GylNZycxazOblB5WqtwxzLUyDuNg+4sQFYZQlQ5bztmK16vMCkJ3NYSZ
   YUBmxtLgW+7pTA6uLau4L6s+9XPbEtzSBtUFXrEpDS/+UizAJ6qdGDKFT
   bhYBeKS2j8dvB3WJ7AzcuuC7hKp0kWcwmq0O7wbsj0GQUSK5ah6neR98e
   K5aoiFIi5fe4RNnGepiuyOeKgkObVwqqkd+bGy/J72N+I9fU2XApik7WD
   ySTgwxyrIUQ90UrM+r0kDKiU2bJhn730B3efsHtHyyqW4go+hWpyu3b+S
   9ow2L+376A4KdQTzOYft8oMp55kt/AxE00f1+T6vaQwEX9Idoadf4DRLK
   g==;
X-CSE-ConnectionGUID: ZlK4lpAWSTOBuvu3CJt7ww==
X-CSE-MsgGUID: hV7QbtmQQkehK4E71jcx6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30327893"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="30327893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 08:44:50 -0700
X-CSE-ConnectionGUID: oewu5XNKQjCpMPvSLn+trw==
X-CSE-MsgGUID: FPLzXmJ/R8O9AVPW6hWUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125396686"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2025 08:44:49 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci features for usb-next
Date: Tue, 11 Mar 2025 17:45:48 +0200
Message-ID: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A small fixup series on top of previous series for usb-next.

Improves URB cancel during endpoint stall code in previous series
PATCH 12/15 "xhci: Prevent early endpoint restart when handling STALL errors."

Also has a couple more patches just submitted by Michal that touches code
relatad to URB cancel and endpoint stop.

Thanks
Mathias

Mathias Nyman (1):
  xhci: Avoid queuing redundant Stop Endpoint command for stalled
    endpoint

Michal Pecio (2):
  usb: xhci: Don't change the status of stalled TDs on failed Stop EP
  usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems
    Running

 drivers/usb/host/xhci-ring.c | 23 ++++++++++++++++++-----
 drivers/usb/host/xhci.c      |  8 +++++---
 2 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0


