Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D7239D134
	for <lists+linux-usb@lfdr.de>; Sun,  6 Jun 2021 22:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhFFUNN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 16:13:13 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:28512 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230150AbhFFUNM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Jun 2021 16:13:12 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 53c9277b-c703-11eb-9eb8-005056bdd08f;
        Sun, 06 Jun 2021 23:11:07 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 2/3] usb: typec: intel_pmc_mux: Add missed error check for devm_ioremap_resource()
Date:   Sun,  6 Jun 2021 23:09:10 +0300
Message-Id: <20210606200911.32076-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210606200911.32076-1-andy.shevchenko@gmail.com>
References: <20210606200911.32076-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

devm_ioremap_resource() can return an error, add missed check for it.

Fixes: 43d596e32276 ("usb: typec: intel_pmc_mux: Check the port status before connect")
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 134325444e6a..de40276cc18b 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -586,6 +586,11 @@ static int pmc_usb_probe_iom(struct pmc_usb *pmc)
 		return -ENOMEM;
 	}
 
+	if (IS_ERR(pmc->iom_base)) {
+		put_device(&adev->dev);
+		return PTR_ERR(pmc->iom_base);
+	}
+
 	pmc->iom_adev = adev;
 
 	return 0;
-- 
2.31.1

