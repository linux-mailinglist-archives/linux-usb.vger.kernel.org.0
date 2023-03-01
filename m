Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0716A765A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 22:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCAVuK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 16:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjCAVuA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 16:50:00 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B26737541
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 13:49:59 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id d2-20020a254f02000000b00a316be8a939so1759674ybb.9
        for <linux-usb@vger.kernel.org>; Wed, 01 Mar 2023 13:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677707398;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpgIbXU90/hputcGUyYvUs2slzqLS52o251K2JuSVM8=;
        b=WaP00pOPIPdoTKkboEHT7Thc02cLx/1EyuvJqzfTtmWLWA1jQ7YPettxWnzX2TZ4nW
         3ZOPzjYi2AIW7hhE3FXtgR+HEl3l8QjhIDd1S0RqidjWKH3J8sP5oyIeYRCXUICPfwiv
         80TWtSEdZuCUaHNKXjmuE1Teqqmh4yRnBVe7Iz3tRKJ9qbqvIKvYBZg+wb9eLepwTDcg
         YUMb9SaMw1WyJWCu5TttIIzoEfBQRNMutAeaYMWK9fY6Xml97VcqZFGbfZdvXwPXlw5m
         dUGLd+VAEHnuULkYSsjmdc4zDZoHUfivc9i72rN6URuBLxXr5z1o/u/G6HTJngAmXsc3
         iJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707398;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpgIbXU90/hputcGUyYvUs2slzqLS52o251K2JuSVM8=;
        b=S7QfBy32nGJn+7CAVL/ltubQuaZ6joorikxMBLshNFx9vUsF18jkcWzZ7KAB2TT5DT
         X1+OCPWQkWd8UdZxC+11HEIa/jniJhx185/j9th7K9XNgt3It4j+2ZjAJ2HvdmUllZcu
         9cAv394BPQ+9bel0EcBumfayl7Kye+iCPLIbiTpL5alfeGA1ZiWwff5HizBO34uAg8ND
         Jd9uDNPU5El42ZgHMtW9NkRxYyzT1nk6tQVKl4cwseLhuNP22eBsb618omeDadkgBuMR
         m6h1JNgi+EzHjVX9ztkzguLULoLReApPDy5YftTMfoT1jChz9lkK0euJe0tfvPOsQ62n
         B8RA==
X-Gm-Message-State: AO0yUKWgXsCkpWk3+UfeNwJtpZ5SfECLgAVdOEpAkvg6WrrClstBBdT6
        hrFFh5zfXKiP7wF3T6MHhW6D4WIadIr7F20=
X-Google-Smtp-Source: AK7set82rOfXzXOZ9yj4WBRb6uaFtTB5S3WLT17i5Dm6MSyoMsbRAM5JC31qi17jLdC0x0otk/S0lMBW9GeEcZU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:debf:1aed:5c45:c92])
 (user=saravanak job=sendgmr) by 2002:a0d:fd41:0:b0:527:ad7e:8e1a with SMTP id
 n62-20020a0dfd41000000b00527ad7e8e1amr18ywf.216.1677707398396; Wed, 01 Mar
 2023 13:49:58 -0800 (PST)
Date:   Wed,  1 Mar 2023 13:49:48 -0800
In-Reply-To: <20230301214952.2190757-1-saravanak@google.com>
Message-Id: <20230301214952.2190757-2-saravanak@google.com>
Mime-Version: 1.0
References: <20230301214952.2190757-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Subject: [PATCH v1 1/4] usb: typec: stusb160x: Remove use of fw_devlink_purge_absent_suppliers()
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 6b63376722d9 (usb: typec: stusb160x: Don't block
probing of consumer of "connector" nodes, 2021-07-16).

After recent changes to fw_devlink that ended with commit 4a032827daa8
("of: property: Simplify of_link_to_phandle()"), fw_devlink no longer
cares about the "compatible" property and figures out the correct struct
device at runtime. So, we no longer need to call
fw_devlink_purge_absent_suppliers().

Signed-off-by: Saravana Kannan <saravanak@google.com>
Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/usb/typec/stusb160x.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 494b371151e0..482bffeb8a8f 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -685,15 +685,6 @@ static int stusb160x_probe(struct i2c_client *client)
 	if (!fwnode)
 		return -ENODEV;
 
-	/*
-	 * This fwnode has a "compatible" property, but is never populated as a
-	 * struct device. Instead we simply parse it to read the properties.
-	 * This it breaks fw_devlink=on. To maintain backward compatibility
-	 * with existing DT files, we work around this by deleting any
-	 * fwnode_links to/from this fwnode.
-	 */
-	fw_devlink_purge_absent_suppliers(fwnode);
-
 	/*
 	 * When both VDD and VSYS power supplies are present, the low power
 	 * supply VSYS is selected when VSYS voltage is above 3.1 V.
-- 
2.39.2.722.g9855ee24e9-goog

