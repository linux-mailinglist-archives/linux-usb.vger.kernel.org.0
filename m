Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8346B387AB3
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349804AbhEROLE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:62760 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhEROLC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:02 -0400
IronPort-SDR: qVC0NmVGf8kUiGTk/d4hhmiAUcX5XabTK1jjAzDFHHvTDo+NdLLaM1PQSLkQSw0QTNZhgTSNVK
 8+D2yHM5qS5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="261948705"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="261948705"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:43 -0700
IronPort-SDR: fwd329/JDVd818EU6yYP31PjidEPG9rtJX2MTt/g1lUt+5GJlj4wKvH44ECFl7tfLH26MiFY1l
 ReWQ/6SEEknA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="411288251"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 18 May 2021 07:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 753FF12F; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/8] thunderbolt: Make tb_port_type() take const parameter
Date:   Tue, 18 May 2021 17:09:55 +0300
Message-Id: <20210518141002.63616-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function does not modify the object in any way so make the parameter
const to reflect this.

No functional changes intended.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 4d4bc50a3c44..0edc452c2ac9 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -459,7 +459,7 @@ static void tb_switch_nvm_remove(struct tb_switch *sw)
 
 /* port utility functions */
 
-static const char *tb_port_type(struct tb_regs_port_header *port)
+static const char *tb_port_type(const struct tb_regs_port_header *port)
 {
 	switch (port->type >> 16) {
 	case 0:
-- 
2.30.2

