Return-Path: <linux-usb+bounces-2392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747EC7DCC94
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF765B20FE8
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9891DA30;
	Tue, 31 Oct 2023 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgLOwJvK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799D1DA20
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:07:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4511BF5
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754073; x=1730290073;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gBCQCmb/1jw6JvSI+yx6WZxCtADTPud8IVszj8b/KMA=;
  b=RgLOwJvKfgua4tr35KnqD4CtPg0FBWNwU7owI69b8VQLsN8h7SV4Dz68
   fYMoRoQ60d9jLZQXn2UbY/wGDo+V/tqZE8tlXmAWeQ/mqbrqW9bKgcByU
   Wq7QgSkfJeVvsyKIB47wiPpkWa6aIiszMaTbAjZujr6qRMK1xGlTgtaX8
   n2zo0Yy+OcBdByCBOFvQcxrh8NXgyLPn6vRC2Fj8cSc6p646Y9ltRSaDt
   ZskHA3PWUXstayFMaLo6bZ+m0dJb0MA3ezVI4eL5q65Uw0dWB5Ng2QL3F
   GAE2a4PRNY9DGIejOGxr2dqnJ0ivBU05ArKPJfEew4c4p+pX7R9agGl0u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9804878"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="9804878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="884190161"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="884190161"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 31 Oct 2023 05:07:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 541384A0; Tue, 31 Oct 2023 13:59:47 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 0/7] xhci rework interrupt enabling
Date: Tue, 31 Oct 2023 13:58:36 +0200
Message-ID: <20231031115843.39272-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks interrupt enabling in 'xhci-pci.c'.
Instead of MSI-X, MSI and legacy IRQ enabling being split
over three functions, rework them into one simple function.

Niklas Neronin (7):
  xhci: check if legacy irq is available before using it as fallback
  xhci: add handler for only one interrupt line
  xhci: refactor static MSI-X function
  xhci: refactor static MSI function
  xhci: change 'msix_count' to encompass MSI or MSI-X vectors
  xhci: rework 'xhci_try_enable_msi()' MSI and MSI-X setup code
  xhci: minor coding style cleanup in 'xhci_try_enable_msi()'

 drivers/usb/host/xhci-pci.c | 140 ++++++++++--------------------------
 drivers/usb/host/xhci.h     |   4 +-
 2 files changed, 41 insertions(+), 103 deletions(-)

-- 
2.40.1


