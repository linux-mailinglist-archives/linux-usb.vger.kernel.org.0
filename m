Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47C112D09C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfL3O03 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:29 -0500
Received: from mga06.intel.com ([134.134.136.31]:56447 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727543AbfL3O03 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233475"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:27 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 10/15] usb: typec: Add the Product Type VDOs to struct usb_pd_identity
Date:   Mon, 30 Dec 2019 17:26:06 +0300
Message-Id: <20191230142611.24921-11-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Discover Identity command response has also 3 product type
specific VDOs on top of ID Header VDO, Cert Stat VDO and
Product VDO.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index a6615d488c95..269a76a4f9b6 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -74,6 +74,7 @@ enum typec_orientation {
  * @id_header: ID Header VDO
  * @cert_stat: Cert Stat VDO
  * @product: Product VDO
+ * @vdo: Product Type Specific VDOs
  *
  * USB power delivery Discover Identity command response data.
  *
@@ -84,6 +85,7 @@ struct usb_pd_identity {
 	u32			id_header;
 	u32			cert_stat;
 	u32			product;
+	u32			vdo[3];
 };
 
 int typec_partner_set_identity(struct typec_partner *partner);
-- 
2.24.1

