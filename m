Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A3E50FBED
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349547AbiDZL3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349529AbiDZL2x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:28:53 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32936167DC
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650972346; x=1682508346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UFXkb/+beQV9rQ4YRuwLbvz1Rc4kmbFOfBT6bks0Xho=;
  b=aNHo29pxfZLqylYLoLVILLoIai5PDOWiDJVzR3V/l9G4RqDfwX3jpbyw
   xWuRIMlvlmIpbNN/V2V3XsbYrgvnQAlHE2uzg3SJuvNFRcvKeqRX7GLND
   W/7k/IPTd6GJmuQC5ToL8Qd7JNaTVOVXScyObb2fnapZUqHT7lO5oe79b
   mTeAyvIf0RGvewyYd74aX3TI/tjJb062WYc2us9jWibt5NVXWPckZDcMS
   G1YtcEAT5VVRALS/xKsfA+/pu2lWmyv7FRlOSyMiQpjcpeYyWJ/uphq+C
   uDp3LLs10ks125S7IkhS2GzPblNLNkerIQJVhPMUMlAMlui7MrdkQMZfF
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351988562"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="351988562"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 04:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="650158833"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 04:25:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6561B595; Tue, 26 Apr 2022 14:25:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: Move tb_port_state() prototype to correct place
Date:   Tue, 26 Apr 2022 14:25:37 +0300
Message-Id: <20220426112540.6053-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
References: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This should be before tb_wait_for_port() following how the functions in
switch.c are organized.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ad025ff142ba..8848e8de1fc3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -991,6 +991,7 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw);
 int tb_switch_xhci_connect(struct tb_switch *sw);
 void tb_switch_xhci_disconnect(struct tb_switch *sw);
 
+int tb_port_state(struct tb_port *port);
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_clear_counter(struct tb_port *port, int counter);
@@ -1023,7 +1024,6 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 
 int tb_port_get_link_speed(struct tb_port *port);
 int tb_port_get_link_width(struct tb_port *port);
-int tb_port_state(struct tb_port *port);
 int tb_port_lane_bonding_enable(struct tb_port *port);
 void tb_port_lane_bonding_disable(struct tb_port *port);
 int tb_port_wait_for_link_width(struct tb_port *port, int width,
-- 
2.35.1

