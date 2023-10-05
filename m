Return-Path: <linux-usb+bounces-1132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEB7B9D9E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 42B69282956
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D13D266D0;
	Thu,  5 Oct 2023 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SafQk0VP"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E42629F
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EC9270F
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513851; x=1728049851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ybxOwvsXDTDSEkpkSKGU1Ujru0iOFnktjSDoVuX5rk=;
  b=SafQk0VPUuO34SofSbqgi4IyCDjT+thw+4sM5K3SnqH9ht1T2+1YerZs
   gFceeFaWZcfCplZRa5BA4y0Met7IYkfdE0VfJ4H9tMo+gsepnPKDGac3J
   M2km1tY9hOpBsQYNrRDaos5kxC+QspYwgd3C9hi4sN12Oug5mZWbPmS1I
   ti99TvRPboMzq2s5IKQWROJvgOUr/twSC58zkxVvnAwGOxzPPSRs6vXG5
   3cRLR4fd+Zx0ZPF8vP0Kwro/ZhO8Y/3UPd6fmR7GdYOUhOvxHKj8GaEoa
   EdXdo49k+Tg8u8Nh/tVWN19OjdYnTw3r8UBEZQ25jSdDZMohm7m4svTWy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368524190"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="368524190"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="822054747"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="822054747"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2023 02:27:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 286EC574; Thu,  5 Oct 2023 12:27:30 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/10] thunderbolt: Introduce tb_for_each_upstream_port_on_path()
Date: Thu,  5 Oct 2023 12:27:26 +0300
Message-Id: <20231005092729.3595447-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
References: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
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


