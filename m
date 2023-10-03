Return-Path: <linux-usb+bounces-1012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34D7B65A7
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 894E728206A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334431CA99;
	Tue,  3 Oct 2023 09:40:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADCC101D2
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677929B
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326013; x=1727862013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBQiy5fkklqzWqxXTctXVxX8iGb679blwO2b7fH5EJ0=;
  b=C8a7388HhcZB5bQdPXhstqEM3OjJAkNB4/NurDmWqoml1tPkU6j63rwF
   wOPsIC5umeyffcPHMG8FaFXTxXWVa+pmYDChoUrvlHxyYhiAg212x4KN1
   E2LSb3wb8+EFCI4mVxIFwmosERqB6sHzD1DkKjamfSFYQ6FlHBPRzTw8y
   3FgMFSRk+E6OpWhYq2aETy17Umb8VHptRIzKK9RaddeCtvh2Kp8yC6RTS
   F6S2XyShONEHWNh13MivGmjZ8JP/uzGLcWtBhmDcrIHfUt/udCT5RL7IC
   7BllCBUnIjmwDJWwJF5rlO6nF8Df+qjrkJAS1zG253muUiAlZTpCQk+hS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424889"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945474"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945474"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A88B119DD; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/13] thunderbolt: Fix typo in enum tb_link_width kernel-doc
Date: Tue,  3 Oct 2023 12:39:58 +0300
Message-Id: <20231003094005.2676823-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Typo trasmitters -> transmitters.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 include/linux/thunderbolt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 02333f47c994..6151c210d987 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -175,7 +175,7 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
  * enum tb_link_width - Thunderbolt/USB4 link width
  * @TB_LINK_WIDTH_SINGLE: Single lane link
  * @TB_LINK_WIDTH_DUAL: Dual lane symmetric link
- * @TB_LINK_WIDTH_ASYM_TX: Dual lane asymmetric Gen 4 link with 3 trasmitters
+ * @TB_LINK_WIDTH_ASYM_TX: Dual lane asymmetric Gen 4 link with 3 transmitters
  * @TB_LINK_WIDTH_ASYM_RX: Dual lane asymmetric Gen 4 link with 3 receivers
  */
 enum tb_link_width {
-- 
2.40.1


