Return-Path: <linux-usb+bounces-1017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1737D7B65AB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id BAB99281952
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38A6208D3;
	Tue,  3 Oct 2023 09:40:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FC1A722
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5229DC4
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326014; x=1727862014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=292LgU0F36gL+RqMUfFNij3Yes4E0TB5Svokzu42/Jw=;
  b=fOzZDfBvrBcDjvNA7uAxoiPx9CZpYgycdxss/DqssKv7BKYdf9i8xXOn
   oDSDB8rgbHz9xU/Jo5O1UlexmmojoWnEX+FVV41dAz5HX+SSyg76LpOrr
   v9uQIL3cWEN1+EvU9mT/OJvjzUIL/AmQQUUsRt6pBfn2U+4FjRTfblpFP
   89XRFA9NvOGSL2m2qnxldLNGTQYWTwEyMNuFvGj2Z+2LWPmjwqXbD/xm5
   jzBwsYUqD9PjlCKHVDoD6fGcoPc4Ul3mIrn4neflpWAvssAa3lGLqFLPB
   Xm5cyvZ7kHd7p0aloEpz8bJMHCjXaSDEVoM73b8N2IL5alkgONwnJQpD2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424904"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945486"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945486"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D04EA2012; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 11/13] thunderbolt: Log NVM version of routers and retimers
Date: Tue,  3 Oct 2023 12:40:03 +0300
Message-Id: <20231003094005.2676823-12-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

This is useful when debugging possible issues.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 1 +
 drivers/thunderbolt/switch.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 47becb363ada..d49d6628dbf2 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -94,6 +94,7 @@ static int tb_retimer_nvm_add(struct tb_retimer *rt)
 		goto err_nvm;
 
 	rt->nvm = nvm;
+	dev_dbg(&rt->dev, "NVM version %x.%x\n", nvm->major, nvm->minor);
 	return 0;
 
 err_nvm:
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7d3c7e73a020..c80421eff558 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -372,6 +372,7 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 		ret = tb_nvm_add_active(nvm, nvm_read);
 		if (ret)
 			goto err_nvm;
+		tb_sw_dbg(sw, "NVM version %x.%x\n", nvm->major, nvm->minor);
 	}
 
 	if (!sw->no_nvm_upgrade) {
-- 
2.40.1


