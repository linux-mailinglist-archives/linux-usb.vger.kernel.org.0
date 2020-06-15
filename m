Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551A91F9A1A
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730545AbgFOO04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:1143 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730477AbgFOO0x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:53 -0400
IronPort-SDR: nH5YpFUcPMoAt5RJbEth/EtTNLnfhVHebCVBphczRNZqWgu8wnlj9S+N3s2PRQPPqo74nF9bkF
 liBnADIalENw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:52 -0700
IronPort-SDR: SyujC+jAHDPF9xWhUD+u6s2uOZ31TRN89FdDCvBKdfcxRSrgcsOnN9w0ZsAhnh8uBI8kR98cXg
 0h86fmNtJLdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="449412038"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2020 07:26:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E54E35FC; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 06/17] thunderbolt: Increase path length in discovery
Date:   Mon, 15 Jun 2020 17:26:34 +0300
Message-Id: <20200615142645.56209-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently we have only supported paths that follow daisy-chain topology
but USB4 also allows to build trees of devices. For this reason increase
maximum path length we use for discovery to be from the lowest level to
the host router and back to the same level.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6916168e2c76..b53ef5be7263 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -286,7 +286,11 @@ struct tb_path {
 
 /* HopIDs 0-7 are reserved by the Thunderbolt protocol */
 #define TB_PATH_MIN_HOPID	8
-#define TB_PATH_MAX_HOPS	7
+/*
+ * Support paths from the farthest (depth 6) router to the host and back
+ * to the same level (not necessarily to the same router).
+ */
+#define TB_PATH_MAX_HOPS	(7 * 2)
 
 /**
  * struct tb_cm_ops - Connection manager specific operations vector
-- 
2.27.0.rc2

