Return-Path: <linux-usb+bounces-399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308147A7094
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 04:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6F91C20C3B
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 02:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E59A185E;
	Wed, 20 Sep 2023 02:33:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4D17F9
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 02:33:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EBAC6;
	Tue, 19 Sep 2023 19:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695177196; x=1726713196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MEaeKnyuEaXLPLqy8/HwrSfH0McwsNF5euRm+5aXbcc=;
  b=Oz1521c6d4NlZOcNI7Dg6mIEqxFQvAQaqlvZr6R/FDfiNtR8Dr/Q2VCs
   jwrwEUX56jQ/dn2Ta5nmZITyhIxQEeVqHXRRgiplBwANjSSZfLbgJ4cDr
   7FQyIM+p4+PQAqJOI7hIvnR5tb2jkRHIdoRppnjnv3MPY38ZcA3M/UxHa
   8Xogqm2O9jIXlieyANWvPIkcvseirPLlNz+rHJTLeh9C2DinY/Zf5PEeb
   Widiza9WaFYvz+agHZYSwtTIivrCbrjpFHYNqK4OWKxRpnCK1FCqpnGmL
   UAPvWsCxlsYSB9cNIHo0XHh3Iw/LhZjEjelWiwOdQqMhg3e0QZO7brlkB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466422437"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="466422437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 19:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816690724"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816690724"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.215])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 19:33:12 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	pmalani@chromium.org,
	chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v4 2/5] usb: typec: Add Active or Passive cable defination to cable discover mode VDO
Date: Tue, 19 Sep 2023 19:32:40 -0700
Message-Id: <20230920023243.2494410-3-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

As per USB Type-C Connector specification v2.2 section F.2.6, BIT25
represents Active or Passive cable. Added BIT25 defination to the
Thunderbolt 3 cable discover mode VDO.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v4:
- No change.

Changes in v3:
- Reviewed-by tag from Heikki is added.

Changes in v2:
- This change is being added as new patch in this series.

 include/linux/usb/typec_tbt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 63dd44b72e0c..c7a2153bd6f5 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -46,6 +46,7 @@ struct typec_thunderbolt_data {
 #define TBT_CABLE_OPTICAL		BIT(21)
 #define TBT_CABLE_RETIMER		BIT(22)
 #define TBT_CABLE_LINK_TRAINING		BIT(23)
+#define TBT_CABLE_ACTIVE_PASSIVE	BIT(25)
 
 #define TBT_SET_CABLE_SPEED(_s_)	(((_s_) & GENMASK(2, 0)) << 16)
 #define TBT_SET_CABLE_ROUNDED(_g_)	(((_g_) & GENMASK(1, 0)) << 19)
-- 
2.25.1


