Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756A749CC14
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235558AbiAZOQm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:16:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:39082 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235491AbiAZOQm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643206602; x=1674742602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4BN6xQ+3xVnsiWcfq4MqqngDGMog2DrMg4CU1FpwaGI=;
  b=EPgvcTvgs7SoCItShnsmUF5y1IJCJmSq6x1A/GbEJw9Na0bCcyBF2q4z
   jY4mvpGek9RDI2NShKcOPLkyD5RAUhb4aSk0Vd73IahGGQbipchxexX1v
   v+XcD8+gEY5q/Ll4ecm62kIka0uoQnpVNjEJTN9mCbu4ROporXSyACh73
   NSoxYhMgtjlV4cG7M8L99Q752V+cjuVh3vLLMjnyfQFY+kNGIIJo8+xCs
   SJZDH7u5/d5nzl9jxuWABniMFwYG54qyFSEhs0hoDMhns9RuspVMR0oUN
   I+r8rpnWACEXjTiLUORpsMhB7ymOk4WkvulrzwqwnUoGB3b8ltm/mtgsV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="271008864"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="271008864"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="597473899"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2022 06:16:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 24FA715C; Wed, 26 Jan 2022 16:16:53 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Add missing device ID to tb_switch_is_alpine_ridge()
Date:   Wed, 26 Jan 2022 17:16:51 +0300
Message-Id: <20220126141653.28092-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
References: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tb_switch_is_alpine_ridge() is missing device ID for Intel Alpine Ridge
dual port version so add this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 74d3b14f004e..44e36498b261 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -855,6 +855,7 @@ static inline bool tb_switch_is_alpine_ridge(const struct tb_switch *sw)
 	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
 		switch (sw->config.device_id) {
 		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE:
 		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_BRIDGE:
 		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_BRIDGE:
 		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_BRIDGE:
-- 
2.34.1

