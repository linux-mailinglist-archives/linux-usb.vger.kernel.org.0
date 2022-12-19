Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128E06512B6
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 20:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbiLSTTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 14:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbiLSTTD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 14:19:03 -0500
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E80512D04
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 11:19:02 -0800 (PST)
Received: by mail-il1-x149.google.com with SMTP id h9-20020a92c269000000b00303494c4f3eso7077620ild.15
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 11:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OWNuZYCaMdD0VqCL395Kor3n/H1hGaRkxYaUC/R9e30=;
        b=RevcIhrqWVnTCyAyG1KYmPiklVQWXA6oi8x63005w1ZE4ju2L/vacA4mHJ3tzsUG9w
         tm5E52DZ1yKiQv8pr++SD+Rs/mldhfd1d6nlHjOudWQnSdRCzhgib95wcTln9tJ3kCOV
         nGeUsUR+5Jpjs+vcGTPCLqGeHyTnuYy6ssOnebtfbiqypMz1LCoi/zuDJNTwvpDetH7v
         hiZapLh9uGgpwQz708WoD8g3H+Bd3jbX2yfQIs2qyjU2B9q8K63mGE5vwX/1b1TWKFAD
         ggRTtY0Rvl9k6GEbhiURa3jZBTCeNq4aOO+ob4U7EhG7P4rK1sOpl9qhG2jmBzOoGN0R
         /ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWNuZYCaMdD0VqCL395Kor3n/H1hGaRkxYaUC/R9e30=;
        b=mQPK/ZEN1Z+4S/emc6FCO+SwTFr+saMB06aIHy1ZNjlVFD57xCjo6mx1FSuEdMfMWV
         0sprNYzcbePfnrd9c5zno76/ETYcbsEjoOF69JHlN0GPoqw5uwdP1P/6p+xqPXqSnLYh
         GPaEx2BbP5ebrXFpqXW1oKZ8A1jmoUz7YCEf5C+LUWHNsCJM4iaMh+ABiw8snWn1mDVI
         mS/PoG9ENxZaQ/DtoEj8PEwfTr45L9pnW1vW9P2cHdq6jUvU9VPbwgdsX4Y8iHIb81q6
         YA+8u1ytmgQT3x+xxnup3b60m1FFTiam1TeinmHTV7QZqhwJLPDS+d9BRyNG5BsR0b3Z
         k0oQ==
X-Gm-Message-State: ANoB5pnHlxZg8aonoj5AYkh14kLhWP5tqm08gg+/ux11eeyUg/g+LhaU
        B6B21PDx8ETREWS6RV+hooxesjdrHpeUfns=
X-Google-Smtp-Source: AA0mqf6anYld01mlT0bgsEUW2E614uK1xY0nfYX11Z7gH5gt8Lz/huRlMVEEPaCK3ttoKX4XoKeMyd/3padWXCE=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a5d:9158:0:b0:6df:b406:273c with SMTP id
 y24-20020a5d9158000000b006dfb406273cmr21977487ioq.110.1671477542105; Mon, 19
 Dec 2022 11:19:02 -0800 (PST)
Date:   Mon, 19 Dec 2022 13:18:49 -0600
In-Reply-To: <20221219191855.2010466-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221216221703.294683-1-allenwebb@google.com> <20221219191855.2010466-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219191855.2010466-4-allenwebb@google.com>
Subject: [PATCH v8 3/9] scsi/BusLogic: Always include device id table
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>,
        kernel test robot <lkp@intel.com>
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

A future patch makes use of the device table for built-in modules, so
do not ifdef out the match id table.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/scsi/BusLogic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index f2abffce26599..0c60867c9e7c0 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3715,7 +3715,6 @@ static void __exit blogic_exit(void)
 
 __setup("BusLogic=", blogic_setup);
 
-#ifdef MODULE
 /*static struct pci_device_id blogic_pci_tbl[] = {
 	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -3731,7 +3730,6 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
 
 module_init(blogic_init);
-- 
2.37.3

