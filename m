Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480CA5F2CF8
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 11:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbiJCJNH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 05:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiJCJMo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 05:12:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6F84E627
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664788224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KF3qLfmhvJkX4+p8FKgifh9dumEDGRy0/hFFDmVdfwA=;
        b=J2xIq4MgbZx0NwEv23xLNvBAbZKcFnXqJmFaW60vWQAQq97a4qKHoDsBf4ftd6TUcNVYkc
        7xeBW92qC/Iu+ZSL7eB0+3dufZfBfhqPGf1Cjb+0bbbFVz85aoL+hLnWjMF+tgwTYY3Xt0
        r49OwQ8iPNXfCGSvDvfUat2AmMDEGzE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-TrRkpYGBPmWLNhjyBl2ejg-1; Mon, 03 Oct 2022 05:10:21 -0400
X-MC-Unique: TrRkpYGBPmWLNhjyBl2ejg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 437808027ED;
        Mon,  3 Oct 2022 09:10:21 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 692032166B29;
        Mon,  3 Oct 2022 09:10:19 +0000 (UTC)
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        skhan@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] USB: usbip: missing lock in stub down
Date:   Mon,  3 Oct 2022 11:10:16 +0200
Message-Id: <20221003091016.641900-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Missing lock in sysfs operation when we want to close the connection in order
to check the status and send the down event in a safe way.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/usb/usbip/stub_dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 3c6d452e3bf4..b4b452ce7120 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -118,6 +118,8 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 	} else {
 		dev_info(dev, "stub down\n");
 
+		mutex_lock(&sdev->ud.sysfs_lock);
+
 		spin_lock_irq(&sdev->ud.lock);
 		if (sdev->ud.status != SDEV_ST_USED)
 			goto err;
-- 
2.37.3

