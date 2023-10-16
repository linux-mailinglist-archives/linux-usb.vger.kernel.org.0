Return-Path: <linux-usb+bounces-1668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CA7CA8E6
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 15:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 179971C20AD0
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 13:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F7B27ED8;
	Mon, 16 Oct 2023 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iti1+qk5"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBF27739
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 13:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF050E8;
	Mon, 16 Oct 2023 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697461790; x=1728997790;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FpyMkWTaSMiOJg/zrSh3Kkfek6DFC2dej1hPH9Rx2iI=;
  b=iti1+qk5lLoIzKFMKfK9pGJ5Yv8dq8063BbTdUPgcRor8F6cef0JEGqW
   xvgElhXeErzxXAaLXW0Yy4CMdzka19oO51AGa3DQOuWfqBKg0YRxDvkmD
   3gLwROnzSVvK3SRu2+lQvc1lvy74G401TvAJyuCY9L1rurOZ5/q1VXsTI
   zdclEqF4aXxXLMT1H+u1EdoMjb+6ekV5ovdTv5/XnDGVgCR1qGTDHdVSE
   ysJgkhoxKtEygCcfG36Hwo+vygqegbk1MxYcv9KjmOudcWeq+axuBQWB8
   3R6edTTdMnYmwKLgI3jxCJG0mZ3rLWm1JG9sgBmZsLBYWfMCQddplocPo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4133291"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4133291"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1087067135"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="1087067135"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 06:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EB53B385; Mon, 16 Oct 2023 16:09:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 00/10] xhci: dbc: Update driver to use modern APIs
Date: Mon, 16 Oct 2023 16:09:24 +0300
Message-Id: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Update driver to use some of modern APIs. It's not a full clean up
series, just a set of ad-hoc changes.

In v2:
- fixed mistakes pointed by Mathias and LKP
- sent with a cover letter

Andy Shevchenko (10):
  xhci: dbc: Drop duplicate checks for dma_free_coherent()
  xhci: dbc: Convert to use sysfs_streq()
  xhci: dbc: Use sysfs_emit() to instead of scnprintf()
  xhci: dbc: Use ATTRIBUTE_GROUPS()
  xhci: dbc: Check for errors first in xhci_dbc_stop()
  xhci: dbc: Don't shadow error codes in store() functions
  xhci: dbc: Replace custom return value with proper Linux error code
  xhci: dbc: Use sizeof_field() where it makes sense
  xhci: dbc: Use sizeof(*pointer) instead of sizeof(type)
  xhci: dbc: Add missing headers

 drivers/usb/host/xhci-dbgcap.c | 132 +++++++++++++++++----------------
 drivers/usb/host/xhci-dbgcap.h |   1 +
 2 files changed, 70 insertions(+), 63 deletions(-)

-- 
2.40.0.1.gaa8946217a0b


