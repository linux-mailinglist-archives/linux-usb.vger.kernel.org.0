Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DF26FB9B8
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 23:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjEHVbN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 17:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232643AbjEHVbK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 17:31:10 -0400
X-Greylist: delayed 530 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 08 May 2023 14:31:07 PDT
Received: from out-3.mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A176CC
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 14:31:07 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=galenguyer.com;
        s=key1; t=1683580920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6NgXeQ+2yuj9B6ANPQaYqi7f1CbiuieB6vqqz2BhBk0=;
        b=cOKrntNlqypDVlGpOvY+IRE0zQefcNZ4ALPkz+wC7w+J0zHf9uIvkFjBAIa0Xs2qkDswYv
        F1kiPtAobOccNC8n6GxouLJ8xBfviNExL2WVRiUBEZni8iS9IXiHHWkQs9+fd844zZLXIL
        8gBB/WJiryWcx23TD3AhXqtQuu1/V2QCN1ttzSuiekxYmXp0zTIcW8Cf+nW91ACsNJDvxS
        PcO7BctOtntkVVqgFk5bzrW6ru+zbfdepijbfq5g3C8CS9WfPn9aRH80m9I77aaNef8AuV
        Xsbd+2P5e1z3XRKQ8hfAmpFG5LjxGVCYrPSi2QJwNVRzZWg9QLakxkOSO+yiTA==
From:   Galen Guyer <galen@galenguyer.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        linux-usb@vger.kernel.org
Cc:     Galen Guyer <galen@galenguyer.com>
Subject: [PATCH] usbip: give a more helpful error message if vhdi_hcd isn't loaded
Date:   Mon,  8 May 2023 17:21:20 -0400
Message-Id: <20230508212120.435329-1-galen@galenguyer.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Suggest loading vhdi_hcd if it's not loaded to make error message less opaque

Signed-off-by: Galen Guyer <galen@galenguyer.com>
---
 tools/usb/usbip/src/usbip_attach.c | 2 +-
 tools/usb/usbip/src/usbip_detach.c | 2 +-
 tools/usb/usbip/src/usbip_port.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
index b4aeb9f1f493..531a415538f9 100644
--- a/tools/usb/usbip/src/usbip_attach.c
+++ b/tools/usb/usbip/src/usbip_attach.c
@@ -86,7 +86,7 @@ static int import_device(int sockfd, struct usbip_usb_device *udev)
 
 	rc = usbip_vhci_driver_open();
 	if (rc < 0) {
-		err("open vhci_driver");
+		err("open vhci_driver (is vhci_hcd loaded?)");
 		goto err_out;
 	}
 
diff --git a/tools/usb/usbip/src/usbip_detach.c b/tools/usb/usbip/src/usbip_detach.c
index aec993159036..b29101986b5a 100644
--- a/tools/usb/usbip/src/usbip_detach.c
+++ b/tools/usb/usbip/src/usbip_detach.c
@@ -50,7 +50,7 @@ static int detach_port(char *port)
 
 	ret = usbip_vhci_driver_open();
 	if (ret < 0) {
-		err("open vhci_driver");
+		err("open vhci_driver (is vhci_hcd loaded?)");
 		return -1;
 	}
 
diff --git a/tools/usb/usbip/src/usbip_port.c b/tools/usb/usbip/src/usbip_port.c
index 4d14387df13d..21a20e378419 100644
--- a/tools/usb/usbip/src/usbip_port.c
+++ b/tools/usb/usbip/src/usbip_port.c
@@ -18,7 +18,7 @@ static int list_imported_devices(void)
 
 	ret = usbip_vhci_driver_open();
 	if (ret < 0) {
-		err("open vhci_driver");
+		err("open vhci_driver (is vhci_hcd loaded?)");
 		goto err_names_free;
 	}
 
-- 
2.40.1

