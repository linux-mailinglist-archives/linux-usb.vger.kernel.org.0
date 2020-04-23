Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E4C1B5C69
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgDWNVK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgDWNVJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:09 -0400
IronPort-SDR: kiUl0ClO+binPNAg2Tyyd6tr6G24RgiBS4sQRQaXV4I0jwF2TrL08MzuZ2XCi4u5hH22D44f3Q
 mxCuGyORb7sg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:09 -0700
IronPort-SDR: A4NQImD/Go5aqOj9Ea5nSJd+dcRJucX6NhF3eKssQmP9byFj8xObRDxONIsJi3b1jQptX2ZLNE
 6ojZDNYgN5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001027"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:21:07 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "K V, Abhilash" <abhilash.k.v@intel.com>
Subject: [PATCH 4/6] usb: typec: ucsi: Correct bit-mask for CCI
Date:   Thu, 23 Apr 2020 16:20:56 +0300
Message-Id: <20200423132058.6972-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
References: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "K V, Abhilash" <abhilash.k.v@intel.com>

Bit 0 is reserved in CCI (Command Status & Connector Change Indicator)
register. So, change bit-mask for connector number field to 7..1
instead of 7..0.
There would be no functional change since we were anyways right-shifing
by 1 bit.

Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 8e831108f481..f068356cc325 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -21,7 +21,7 @@ struct ucsi_altmode;
 #define UCSI_MESSAGE_OUT		32
 
 /* Command Status and Connector Change Indication (CCI) bits */
-#define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 0)) >> 1)
+#define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
 #define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
 #define UCSI_CCI_NOT_SUPPORTED		BIT(25)
 #define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
-- 
2.26.1

