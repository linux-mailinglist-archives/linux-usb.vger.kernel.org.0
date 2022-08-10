Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98FA58EC1B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Aug 2022 14:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbiHJMhF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Aug 2022 08:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiHJMhE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Aug 2022 08:37:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12117756F
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 05:37:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6DD8A61347
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 12:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563FCC433C1;
        Wed, 10 Aug 2022 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660135022;
        bh=52k7omSbM/GfKfWbTu80+Qj+Cf0A16QJHfyKHY+cA6g=;
        h=From:To:Cc:Subject:Date:From;
        b=w5pe8waRvVvcDi0E3ZBFNBsGqtKK80QKdp7bTZASf7wo7b7ItnNeKqWrnt4G052gj
         LCLaQWNPxgE9vIm9pQnQmZIHVD6oy3HsvLFDso6A7nBQUv4UpSHFumfdA/jEL3a8v/
         diDYr5jxXsN9RBGGzOmOKD0DM/ppV5ElOXXbWG/E=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Maxim Devaev <mdevaev@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Roger Quadros <roger.quadros@nokia.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Cai Huoqing <cai.huoqing@linux.dev>
Subject: [PATCH] USB: gadget: f_mass_storage: get rid of DEVICE_ATTR() usage
Date:   Wed, 10 Aug 2022 14:36:56 +0200
Message-Id: <20220810123656.3637104-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=gregkh@linuxfoundation.org; h=from:subject; bh=52k7omSbM/GfKfWbTu80+Qj+Cf0A16QJHfyKHY+cA6g=; b=owGbwMvMwCRo6H6F97bub03G02pJDEmflyU7mxzZKrFLYjvnp+3XJpYqTrY5p/bIbd6DX+3r1p8L uHSquCOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmMuMew4JZQZw362bsWsFVxzP10P Gi+RPn/NRkWLDpd2tXQGTdPxVtLx7HjKkab49+FQMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The last holdout in the drivers/usb/* tree using DEVICE_ATTR() is the
f_mass_storage driver, so move it to use DEVICE_ATTR_RW() instead.  The
mode is overridden in the is_visible callback to set it properly
depending on if this is a cdrom or removable device.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Maxim Devaev <mdevaev@gmail.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>
Cc: Roger Quadros <roger.quadros@nokia.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_mass_storage.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 925e99f9775c..3abf7f586e2a 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2662,11 +2662,16 @@ static ssize_t forced_eject_store(struct device *dev,
 }
 
 static DEVICE_ATTR_RW(nofua);
-/* mode wil be set in fsg_lun_attr_is_visible() */
-static DEVICE_ATTR(ro, 0, ro_show, ro_store);
-static DEVICE_ATTR(file, 0, file_show, file_store);
 static DEVICE_ATTR_WO(forced_eject);
 
+/*
+ * Mode of the ro and file attribute files will be overridden in
+ * fsg_lun_dev_is_visible() depending on if this is a cdrom, or if it is a
+ * removable device.
+ */
+static DEVICE_ATTR_RW(ro);
+static DEVICE_ATTR_RW(file);
+
 /****************************** FSG COMMON ******************************/
 
 static void fsg_lun_release(struct device *dev)
-- 
2.37.1

