Return-Path: <linux-usb+bounces-1584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A427C8554
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86146B20C34
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C5B14F7E;
	Fri, 13 Oct 2023 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3jqF4Aq"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4D14281
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 12:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5234D9
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697198807; x=1728734807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ybxOwvsXDTDSEkpkSKGU1Ujru0iOFnktjSDoVuX5rk=;
  b=N3jqF4AqgWt41OKQLhzXEmyF64MpBkpEXu3DtQNuwbfRbIYS3l/4DA0o
   UC6gsJBU3Z5hUzrT/DsVRsO38211Ly8aTpSGT98aFiOyfzW6RtNE0hsCZ
   xyqTeYWEfYfGsRNwVbM0YHYvr1lVgg+8i8NQZalyIyyy/K3w1j2xzIxcn
   MsLnnf2dYlm6K9Tbs22BMhMzTNOmBk6+ryfW+61acHrvl11seKac/TFWq
   jEFFhlswCX4wWWzp/jmlhC+0OKseYR19k3ogPM3xwN3yeCc1fTckk7SbR
   /90n+wmues1KXIUFqhKqboz4fEIU5K4fLzJ0gX97KSEC4xoCL6eP6yIqd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="389033481"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="389033481"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820602091"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="820602091"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 05:06:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1D9D1766; Fri, 13 Oct 2023 15:06:41 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 07/10] thunderbolt: Introduce tb_for_each_upstream_port_on_path()
Date: Fri, 13 Oct 2023 15:06:37 +0300
Message-Id: <20231013120640.709255-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
References: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
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

This is useful when walking over upstream lane adapters over given path.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6d49510eea09..869ac360e1b5 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1073,6 +1073,21 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 	for ((p) = tb_next_port_on_path((src), (dst), NULL); (p);	\
 	     (p) = tb_next_port_on_path((src), (dst), (p)))
 
+/**
+ * tb_for_each_upstream_port_on_path() - Iterate over each upstreamm port on path
+ * @src: Source port
+ * @dst: Destination port
+ * @p: Port used as iterator
+ *
+ * Walks over each upstream lane adapter on path from @src to @dst.
+ */
+#define tb_for_each_upstream_port_on_path(src, dst, p)			\
+	for ((p) = tb_next_port_on_path((src), (dst), NULL); (p);	\
+	     (p) = tb_next_port_on_path((src), (dst), (p)))		\
+		if (!tb_port_is_null((p)) || !tb_is_upstream_port((p))) {\
+			continue;					\
+		} else
+
 int tb_port_get_link_speed(struct tb_port *port);
 int tb_port_get_link_generation(struct tb_port *port);
 int tb_port_get_link_width(struct tb_port *port);
-- 
2.40.1


