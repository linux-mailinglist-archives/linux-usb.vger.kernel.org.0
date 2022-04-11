Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4DB4FBCB3
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 15:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346320AbiDKNDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 09:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346313AbiDKNDF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 09:03:05 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEC21C93F
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649682051; x=1681218051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1WXNmwvWB7vKcXKCA0XNPVWy2V14lesQSx9PcD01+4A=;
  b=XY1s4Q56CMpg9tMyDbqFtGwV+tk8/ddmMSkDK2s73wWuSYNPhBhFldNN
   HvYxolkJsx6yvpAbiioS16ZlZjMdDOsLnB0HhAoyuDOR/rC03jYz1ih6H
   pCvsrxAAKSh128SiMkzCKyHYRXH5m0nwdOnuk0+5eNmk+F4pLGdDDAFrc
   yZjVr++KKLl2hNNFxvuzdLmyQO9gll3kWkuRISnr9mZsY6NWcb32XMJHe
   nx8v0lGRGVJqBIQ+5fRswcOBbjHawxZiMCY6DvVqkVKTJwr4y5uc+0IqA
   qccUvO39Udqen8nTj3szkqfwOIy5EHzY3oGGyeO3qxD4U4aWlkwV/uynr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="249390168"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="249390168"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 06:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="589869129"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 11 Apr 2022 06:00:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5C347144; Mon, 11 Apr 2022 16:00:49 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Brad Campbell <lists2009@fnarfbargle.com>
Subject: [PATCH 2/4] thunderbolt: Use decimal number with port numbers
Date:   Mon, 11 Apr 2022 16:00:47 +0300
Message-Id: <20220411130049.53656-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
References: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it consistent with the other logging functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b6fcd8d45324..ad025ff142ba 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -674,7 +674,7 @@ static inline int tb_port_write(struct tb_port *port, const void *buffer,
 #define __TB_PORT_PRINT(level, _port, fmt, arg...)                      \
 	do {                                                            \
 		const struct tb_port *__port = (_port);                 \
-		level(__port->sw->tb, "%llx:%x: " fmt,                  \
+		level(__port->sw->tb, "%llx:%u: " fmt,                  \
 		      tb_route(__port->sw), __port->port, ## arg);      \
 	} while (0)
 #define tb_port_WARN(port, fmt, arg...) \
-- 
2.35.1

