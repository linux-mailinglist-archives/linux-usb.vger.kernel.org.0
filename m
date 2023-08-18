Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85573780BF6
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 14:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376881AbjHRMks (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 08:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376916AbjHRMkf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 08:40:35 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355783A8D
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 05:40:33 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RS1dl5DVcz1GFGT;
        Fri, 18 Aug 2023 20:39:07 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 20:40:30 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <gregkh@linuxfoundation.org>, <laurent.pinchart@ideasonboard.com>,
        <dan.scally@ideasonboard.com>, <yuehaibing@huawei.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: function: Remove unused declarations
Date:   Fri, 18 Aug 2023 20:40:25 +0800
Message-ID: <20230818124025.51576-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These declarations are not implemented anymore, remove them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/usb/gadget/function/u_phonet.h | 1 -
 drivers/usb/gadget/function/u_serial.h | 4 ----
 drivers/usb/gadget/function/uvc.h      | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/usb/gadget/function/u_phonet.h b/drivers/usb/gadget/function/u_phonet.h
index c53233b37192..ff62ca22c40d 100644
--- a/drivers/usb/gadget/function/u_phonet.h
+++ b/drivers/usb/gadget/function/u_phonet.h
@@ -20,7 +20,6 @@ struct f_phonet_opts {
 struct net_device *gphonet_setup_default(void);
 void gphonet_set_gadget(struct net_device *net, struct usb_gadget *g);
 int gphonet_register_netdev(struct net_device *net);
-int phonet_bind_config(struct usb_configuration *c, struct net_device *dev);
 void gphonet_cleanup(struct net_device *dev);
 
 #endif /* __U_PHONET_H */
diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
index 102a7323a1fd..901d99310bc4 100644
--- a/drivers/usb/gadget/function/u_serial.h
+++ b/drivers/usb/gadget/function/u_serial.h
@@ -71,8 +71,4 @@ void gserial_disconnect(struct gserial *);
 void gserial_suspend(struct gserial *p);
 void gserial_resume(struct gserial *p);
 
-/* functions are bound to configurations by a config or gadget driver */
-int gser_bind_config(struct usb_configuration *c, u8 port_num);
-int obex_bind_config(struct usb_configuration *c, u8 port_num);
-
 #endif /* __U_SERIAL_H */
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 100475b1363e..6751de8b63ad 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -178,8 +178,6 @@ struct uvc_file_handle {
  */
 
 extern void uvc_function_setup_continue(struct uvc_device *uvc);
-extern void uvc_endpoint_stream(struct uvc_device *dev);
-
 extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);
 
-- 
2.34.1

