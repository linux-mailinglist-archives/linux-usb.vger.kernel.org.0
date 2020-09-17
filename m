Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074FE26D866
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIQKGt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:06:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:37704 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgIQKGe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=8d1aXqgHDJwOdjA+ia7wq/6Fdl+kzdMh7SX4pt8jxVs=;
        b=QZwx9DTbcTD3soVk1bAslHuJ05NdTbBVEOeFQ6vXWL0tk4a3V+yle7ZEj5+DAidj0b5XnT
        i1cRUVH17fnedXTFV7SC4LkekCODlakLPCF0NYFRzdwehlLhGTMClwS5OteIFZgvdA4fE6
        HiLfVA5VhrBT2vvWdPWoj80TqzWnQN0h5qgW2lAn0puNo8k+UCDui0Vh1Uc4UpqZZuJr3C
        vlVYFrKVm0Ft9CbFVMxuVvoMSsAVWpp7e8w//LfOp/0ouauoFlcwAYMqDqPdXdwSmRBvFA
        sFvELfsujG1C/AG0WyWePZl3MvVoyv8LFFtgMyrTDL1gRdwWKpDFyKmaQHANVQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 15CF3ADC2;
        Thu, 17 Sep 2020 10:07:04 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 6/7] CDC-WDM: correct error reporting in write()
Date:   Thu, 17 Sep 2020 12:06:13 +0200
Message-Id: <20200917100614.1010-7-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200917100614.1010-1-oneukum@suse.com>
References: <20200917100614.1010-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case our wait was interrupted by a disconnect, we should report
that.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 89929f6438e3..f952eec87b0f 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -396,6 +396,9 @@ static ssize_t wdm_write
 	if (test_bit(WDM_RESETTING, &desc->flags))
 		r = -EIO;
 
+	if (test_bit(WDM_DISCONNECTING, &desc->flags))
+		r = -ENODEV;
+
 	if (r < 0) {
 		rv = r;
 		goto out_free_mem_pm;
-- 
2.16.4

