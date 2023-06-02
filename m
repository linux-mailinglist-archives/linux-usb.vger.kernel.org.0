Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24DA71FD45
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 11:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbjFBJMu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 05:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbjFBJMX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 05:12:23 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC21E40
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685697060; x=1717233060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Oc1Zb6KojX8fhfI7CsukUHq3VSTswZBs9dQ+qW3Zo4=;
  b=kzeS2Vz15s54b2NQaedV61Ke9RBcqXHlVYdJ9uvgVm3XgWrhZuJWuTbp
   mr6K194nU9Dzd7Fr5oa1FVI2bOJtHrfZh7RtR1yv4na1DbMNxprtj37kl
   2pI+CfOUZa3ojyh2LQoCLwx68hauZMJ8CXFCm0soO61Bc+y0pewEXMyN/
   1VWkgzMjYvsXtp2CBrbdap8eILT/JglEOicutbQk70gq2X4WEuZp0Ht0P
   FaVP5EtNge9XBD93FVPDq3teuMv/mgiqcCiS9n1L+4k4alYYjW71y21Rg
   LW+8dzebqV5wiQ/56s+VocGNFbKVVVtZoUotRAfyq6U7AQapqaft7ew00
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353317766"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="353317766"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 02:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="852083458"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="852083458"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2023 02:10:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3CB945E2; Fri,  2 Jun 2023 12:10:56 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Do not send UNSET_INBOUND_SBTX when retimer NVM authentication started
Date:   Fri,  2 Jun 2023 12:10:54 +0300
Message-Id: <20230602091055.65049-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Once retimer NVM authentication is started, sending UNSET_INBOUND_SBTX
will fail so avoid doing that. Only send it when we are writing an image
with not authentication or when the authentication failed early.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index fb8e113488db..a273fb02a02c 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -244,6 +244,13 @@ static ssize_t nvm_authenticate_store(struct device *dev,
 	rt->auth_status = 0;
 
 	if (val) {
+		/*
+		 * When NVM authentication starts the retimer is not
+		 * accessible so calling tb_retimer_unset_inbound_sbtx()
+		 * will fail and therefore we do not call it. Exception
+		 * is when the validation fails or we only write the new
+		 * NVM image without authentication.
+		 */
 		tb_retimer_set_inbound_sbtx(rt->port);
 		if (val == AUTHENTICATE_ONLY) {
 			ret = tb_retimer_nvm_authenticate(rt, true);
@@ -264,7 +271,8 @@ static ssize_t nvm_authenticate_store(struct device *dev,
 	}
 
 exit_unlock:
-	tb_retimer_unset_inbound_sbtx(rt->port);
+	if (ret || val == WRITE_ONLY)
+		tb_retimer_unset_inbound_sbtx(rt->port);
 	mutex_unlock(&rt->tb->lock);
 exit_rpm:
 	pm_runtime_mark_last_busy(&rt->dev);
-- 
2.39.2

