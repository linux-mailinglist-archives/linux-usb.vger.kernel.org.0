Return-Path: <linux-usb+bounces-1895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F037CF529
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E54C1C20F3C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B539518C1A;
	Thu, 19 Oct 2023 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq6M+t1W"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E718B07
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B6C121
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711281; x=1729247281;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=164W09k++CIt0/Apfg7vJKLoAlaJfkI6n+VWjXsprFw=;
  b=dq6M+t1WHNva/n2IBkliSxxsxXuW5SWyfyCfK9l0Z9TZVRWxcdZeJfh3
   5hhUFqYxIWwztCpyMThkaUsUctxSGIajsIYC3q4LRBEguPFWTHcwtDetv
   qO7IzaR5JiSS2It226Pcukwh5xhNzL9aV7Gu+4PxJe4k+Hgy68Xs5PlJ2
   Za54nR8VR1S8MRbk6iakgXohY+wXSbNu+9dLTYYTR2vpj/80l9ksMpAyn
   0bzGe7BWrtildOYC322P9EqmKwBZtsdwFY/7X72WSVxj7s3htN/dmyWJ0
   Rr3maKGiM99BcYko9Vkw1wKIkp1v2Ys2i8hgrUC4v02F1/yonWjHEwDI8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075764"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075764"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557441"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557441"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:27:59 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/19] xhci features for usb-next
Date: Thu, 19 Oct 2023 13:29:05 +0300
Message-Id: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

Some xhci features for usb-next.

Among other small changes this series doubles the event ring size,
turning it from a one segment ring into a two segment ring.

Thanks
Mathias

Basavaraj Natikar (2):
  xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
  xhci: Enable RPM on controllers that support low-power states

Jonathan Bell (1):
  xhci: Use more than one Event Ring segment

Lukas Wunner (7):
  xhci: Set DESI bits in ERDP register correctly
  xhci: Adjust segment numbers after ring expansion
  xhci: Update last segment pointer after Event Ring expansion
  xhci: Expose segment numbers in debugfs
  xhci: Clean up ERST_PTR_MASK inversion
  xhci: Clean up stale comment on ERST_SIZE macro
  xhci: Clean up xhci_{alloc,free}_erst() declarations

Mathias Nyman (6):
  xhci: pass port structure to tracing instead of port number
  xhci: Add busnumber to port tracing
  xhci: expand next_trb() helper to support more ring types
  xhci: simplify event ring dequeue tracking for transfer events
  xhci: Simplify event ring dequeue pointer update for port change
    events
  xhci: split free interrupter into separate remove and free parts

Sergey Shtylyov (1):
  usb: host: xhci-plat: fix possible kernel oops while resuming

Udipto Goswami (1):
  usb: xhci: Implement xhci_handshake_check_state() helper

Wesley Cheng (1):
  usb: host: xhci: Avoid XHCI resume delay if SSUSB device is not
    present

 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-hub.c     |  4 +-
 drivers/usb/host/xhci-mem.c     | 96 +++++++++++++++++++--------------
 drivers/usb/host/xhci-pci.c     |  6 ++-
 drivers/usb/host/xhci-plat.c    | 23 ++++++--
 drivers/usb/host/xhci-ring.c    | 38 ++++---------
 drivers/usb/host/xhci-trace.h   | 23 ++++----
 drivers/usb/host/xhci.c         | 40 ++++++++++++--
 drivers/usb/host/xhci.h         | 18 +++----
 9 files changed, 149 insertions(+), 101 deletions(-)

-- 
2.25.1


