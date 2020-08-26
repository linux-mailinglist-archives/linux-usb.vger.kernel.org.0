Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE175252C2D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgHZLHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:18806 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728732AbgHZLHo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:44 -0400
IronPort-SDR: 5Q9GLpDQKJCORyLH0p0RAcLNjwMenxBQdRGSVYEBf8+dEZwJfUfRLjYplmWQ7fW/V0G7/g54l8
 72nlXh0eyEaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136333407"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="136333407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:42 -0700
IronPort-SDR: KEJx+dnI9S0/meu3t8AtAFh9xrp+LF41jI93Fq3ZtDgoNTNGgFxUgejjs/pzXiCfE9nptecJBX
 CZ+OwaV0oUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="500208475"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2020 04:07:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1285B51B; Wed, 26 Aug 2020 14:07:37 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 8/9] thunderbolt: No need to warn in TB_CFG_ERROR_INVALID_CONFIG_SPACE
Date:   Wed, 26 Aug 2020 14:07:35 +0300
Message-Id: <20200826110736.55186-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This may be returned for example when accessing some of the vendor
specific capabilities. It is not fatal by any means so instead of WARN()
just log it as debug level. The caller gets error back anyway and is
expected to handle it accordingly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index f77ceae5c7d7..38e5e296fe3f 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -266,9 +266,8 @@ static void tb_cfg_print_error(struct tb_ctl *ctl,
 		 * Invalid cfg_space/offset/length combination in
 		 * cfg_read/cfg_write.
 		 */
-		tb_ctl_WARN(ctl,
-			"CFG_ERROR(%llx:%x): Invalid config space or offset\n",
-			res->response_route, res->response_port);
+		tb_ctl_dbg(ctl, "%llx:%x: invalid config space or offset\n",
+			   res->response_route, res->response_port);
 		return;
 	case TB_CFG_ERROR_NO_SUCH_PORT:
 		/*
-- 
2.28.0

