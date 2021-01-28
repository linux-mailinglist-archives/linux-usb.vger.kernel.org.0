Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97595307636
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 13:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhA1Mcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 07:32:54 -0500
Received: from mga01.intel.com ([192.55.52.88]:54368 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhA1Mcw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 07:32:52 -0500
IronPort-SDR: 27yjiIXMg9Q3dQ9DDSPWmxz1aC3IFisLvpGlhV4OSG+MDqVvGcYjFYrRpjz7uZoeKLvINk3Vl/
 W0rWaVKeDM7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="199057043"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="199057043"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 04:29:37 -0800
IronPort-SDR: 7cgQwmWUwu55mJJZGI4+ch2zM8s2I21ie37Jh243uoE1VzQ5CQ+El+n6PKCwtyKJL4QW+1Q5sW
 zGNQH0D2Ad3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="369832555"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 04:29:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E260A214; Thu, 28 Jan 2021 14:29:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: path: Fix kernel-doc descriptions of non-static functions
Date:   Thu, 28 Jan 2021 15:29:32 +0300
Message-Id: <20210128122934.36897-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of the two non-static functions. This also
gets rid of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index ca7d738d66de..f63e205a35d9 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -466,6 +466,7 @@ void tb_path_deactivate(struct tb_path *path)
 
 /**
  * tb_path_activate() - activate a path
+ * @path: Path to activate
  *
  * Activate a path starting with the last hop and iterating backwards. The
  * caller must fill path->hops before calling tb_path_activate().
@@ -561,6 +562,7 @@ int tb_path_activate(struct tb_path *path)
 
 /**
  * tb_path_is_invalid() - check whether any ports on the path are invalid
+ * @path: Path to check
  *
  * Return: Returns true if the path is invalid, false otherwise.
  */
-- 
2.29.2

