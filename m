Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F444FBCB2
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 15:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346316AbiDKNDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 09:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346329AbiDKNDM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 09:03:12 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F062C112
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649682057; x=1681218057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ioZBE8hHg87s6nHLr10yJiq5tbQQUlK0KDyDtiLfQM8=;
  b=Oez3v0KcyQneVKsU6wHz3bd9r0v3KrPCT0hc9jhUJ+8JfryCfNKZ+VQ8
   Ny0u66+mNnkxYro02okJH8kfjQ+oqj7oy5rLpKYDkhOsDTiaWnHw4xIuE
   nAZvaPpJW72LmxCi6FGhLhQy5KHRI0n2xGEh3MpBH/08XmCfHFMgQ+Nq1
   hKjmnvMtxmrCE6kXcptdMZultWw/sAvrh7h3mhXl3nrDNo2X0nhZ5cRvj
   LKFRKEwoWd6PgfFffk0m6udE3IXK3crj5tGCKp9WGL69wEAnq7dX/j5ow
   TpwRaHuM8osKpUKkIhQ2XQHZxG98pS34ttTYR0vEceKpVnEMSykmHiIyx
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242044374"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="242044374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 06:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="654611224"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2022 06:00:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6496A3D5; Mon, 11 Apr 2022 16:00:49 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Brad Campbell <lists2009@fnarfbargle.com>
Subject: [PATCH 3/4] thunderbolt: Dump path config space entries during discovery
Date:   Mon, 11 Apr 2022 16:00:48 +0300
Message-Id: <20220411130049.53656-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
References: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is useful when debugging possible issues during tunnel discovery.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 299712accfe9..ee03fd75a472 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -166,6 +166,9 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 		return NULL;
 	}
 
+	tb_dbg(path->tb, "discovering %s path starting from %llx:%u\n",
+	       path->name, tb_route(src->sw), src->port);
+
 	p = src;
 	h = src_hopid;
 
@@ -198,10 +201,13 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 		path->hops[i].out_port = out_port;
 		path->hops[i].next_hop_index = next_hop;
 
+		tb_dump_hop(&path->hops[i], &hop);
+
 		h = next_hop;
 		p = out_port->remote;
 	}
 
+	tb_dbg(path->tb, "path discovery complete\n");
 	return path;
 
 err:
-- 
2.35.1

