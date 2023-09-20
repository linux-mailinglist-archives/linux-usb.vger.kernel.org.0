Return-Path: <linux-usb+bounces-402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A41157A7099
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 04:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0911C20F16
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 02:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675E3C17;
	Wed, 20 Sep 2023 02:33:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3411FB4
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 02:33:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B02AC;
	Tue, 19 Sep 2023 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695177197; x=1726713197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9oH2vhb+i0DF046ABw0g6rni0Rw6+7eJnY/NOkScvqA=;
  b=g3sGF92lCkjQcDuei2AGryk8cge9hvpm6E1ZbK16WxCvxugvgtzmPkd4
   nLC8Q6Kmx46aRl8MDVyOgA0COPa+EjwcgIvLxTEckS4tNqQzSzbYC06QN
   frZ9XEjR9Wi9REt73MpMyRIm481Dh8NViVY5kys9vh+xfuWWyQ01FI8k9
   Aq2Ym9YQZMQuEy0qsGvscvvhDF03+Yei7PXH0/qp299EedZ0MLD9DCpdA
   n7d+kMUVx/5l/6YRlw7kPPZLCQCHdBDqs7c0f7LmBst7pB/h/A/B84n90
   VNQZF/9nOSMn73f+6cLGPxhtosdcVGSCd+/LfunoW+zWeQy0GKXy/L14V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466422451"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="466422451"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 19:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816690726"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816690726"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.215])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 19:33:13 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	pmalani@chromium.org,
	chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v4 3/5] usb: pd: Add helper macro to get Type C cable speed
Date: Tue, 19 Sep 2023 19:32:41 -0700
Message-Id: <20230920023243.2494410-4-utkarsh.h.patel@intel.com>
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

Added a helper macro to get the Type C cable speed when provided the
cable VDO.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v4:
- Added this patch back in this series with Reviewed-by tag from Heikki.

Changes in v2:
- This change is being added as new patch in this series.

 include/linux/usb/pd_vdo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index b057250704e8..3a747938cdab 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -376,6 +376,7 @@
 	 | ((vbm) & 0x3) << 9 | (sbu) << 8 | (sbut) << 7 | ((cur) & 0x3) << 5	\
 	 | (vbt) << 4 | (sopp) << 3 | ((spd) & 0x7))
 
+#define VDO_TYPEC_CABLE_SPEED(vdo)	((vdo) & 0x7)
 #define VDO_TYPEC_CABLE_TYPE(vdo)	(((vdo) >> 18) & 0x3)
 
 /*
-- 
2.25.1


