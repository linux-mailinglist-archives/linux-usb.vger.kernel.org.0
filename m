Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4A3E18D0
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 13:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404815AbfJWLWD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 07:22:03 -0400
Received: from mga05.intel.com ([192.55.52.43]:63098 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404696AbfJWLWA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 07:22:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 04:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="210009575"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 23 Oct 2019 04:21:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1689823E; Wed, 23 Oct 2019 14:21:55 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        Oliver Neukum <oneukum@suse.com>,
        Christian Kellner <ckellner@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/25] thunderbolt: Log switch route string on config read/write timeout
Date:   Wed, 23 Oct 2019 14:21:31 +0300
Message-Id: <20191023112154.64235-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023112154.64235-1-mika.westerberg@linux.intel.com>
References: <20191023112154.64235-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This helps to point out which switch config read/write triggered the
timeout.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 2ec1af8f7968..d97813e80e5f 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -962,8 +962,8 @@ int tb_cfg_read(struct tb_ctl *ctl, void *buffer, u64 route, u32 port,
 		return tb_cfg_get_error(ctl, space, &res);
 
 	case -ETIMEDOUT:
-		tb_ctl_warn(ctl, "timeout reading config space %u from %#x\n",
-			    space, offset);
+		tb_ctl_warn(ctl, "%llx: timeout reading config space %u from %#x\n",
+			    route, space, offset);
 		break;
 
 	default:
@@ -988,8 +988,8 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 		return tb_cfg_get_error(ctl, space, &res);
 
 	case -ETIMEDOUT:
-		tb_ctl_warn(ctl, "timeout writing config space %u to %#x\n",
-			    space, offset);
+		tb_ctl_warn(ctl, "%llx: timeout writing config space %u to %#x\n",
+			    route, space, offset);
 		break;
 
 	default:
-- 
2.23.0

