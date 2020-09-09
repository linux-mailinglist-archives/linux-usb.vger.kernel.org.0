Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42230262D97
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgIILDF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:03:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:31701 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729621AbgIILAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:00:23 -0400
IronPort-SDR: VEiu1jjYsnUga9op4zpSneuPL2ITzvFybA4d1f6AwOvWX7Hn9XOyc8sz7pRoGbRHRlI9VEt/d8
 4z7KYusHmUdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="146026492"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="146026492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:08 -0700
IronPort-SDR: 7cbPN908jWJi1V5kxu+yRUhB9AOz3wWwArvv5NI6PdbfqhDvYGpv8ncd5hI7U4Zq4Q2GKCXhki
 fS0oEwVd/IYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="304461116"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2020 04:00:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 32A1F3D3; Wed,  9 Sep 2020 14:00:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/7] thunderbolt: Correct tb_check_quirks() kernel-doc
Date:   Wed,  9 Sep 2020 14:00:00 +0300
Message-Id: <20200909110001.71603-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove extra white space and make the sentence end with a period.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 7eac3e0f90a2..57e2978a3c21 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -27,7 +27,7 @@ static const struct tb_quirk tb_quirks[] = {
  * tb_check_quirks() - Check for quirks to apply
  * @sw: Thunderbolt switch
  *
- *  Apply any quirks for the Thunderbolt controller
+ * Apply any quirks for the Thunderbolt controller.
  */
 void tb_check_quirks(struct tb_switch *sw)
 {
-- 
2.28.0

