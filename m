Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E4B158D86
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 12:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgBKLZi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 06:25:38 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbgBKLZi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261834"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:37 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 4/6] usb: typec: Fix the description of struct typec_capability
Date:   Tue, 11 Feb 2020 14:25:29 +0300
Message-Id: <20200211112531.86510-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Removing descriptions of the mux and sw members. They are no
longer part of the structure.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index c358b3fd05c9..44d28387ced4 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -198,8 +198,6 @@ struct typec_operations {
  * @pd_revision: USB Power Delivery Specification revision if supported
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
- * @sw: Cable plug orientation switch
- * @mux: Multiplexer switch for Alternate/Accessory Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @ops: Port operations vector
-- 
2.25.0

