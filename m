Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FBB30A76F
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhBAMS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:18:28 -0500
Received: from mga01.intel.com ([192.55.52.88]:22151 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhBAMSX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:18:23 -0500
IronPort-SDR: b9u9P96VFPuxveUqafsVVnHjS5+uB7NmczV3/z3e0F2Uzk1eFcEgGl0Jxjx8b6xvItehhNjcAA
 P/fyiIfql+cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="199568262"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="199568262"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:16:34 -0800
IronPort-SDR: u65Z9w7cbZRAUbug1tjfpksLgl02dbn+se7q9OGPiPlLb1U+lYm/bvFhxYaUSQysaX5dwoEj+B
 zF1Eq8Q8C0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="371527723"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2021 04:16:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9726F1A8; Mon,  1 Feb 2021 14:16:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/6] thunderbolt: path: Fix kernel-doc descriptions of non-static functions
Date:   Mon,  1 Feb 2021 15:16:26 +0300
Message-Id: <20210201121629.76969-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
References: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of the two non-static functions. This also
gets rid of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
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

