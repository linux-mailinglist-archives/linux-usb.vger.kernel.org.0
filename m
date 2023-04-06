Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC646DA07D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 21:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240361AbjDFTBH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 15:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239868AbjDFTBE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 15:01:04 -0400
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DE59019
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 12:01:00 -0700 (PDT)
Received: by mail-io1-xd49.google.com with SMTP id b3-20020a056602274300b007603d89cdc9so2636971ioe.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680807659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=caRdwk2BRQJWlUMku9R1oT1hxRVhqY9kuoHjJ2qZO3g=;
        b=lfuUx+vimxI8w/cKWiB5+HTdLqsC/0cCYDiqUSTIeqzGMKR+TKHzvMizjJ7BBZhZW/
         RlHbjNQWDsD82aYLkG3tBnPoM2YnbzzGHVTeWDzYKzOUz6Gp4MAIpw30SmY7ci/GiQjg
         FnQkWFZp05JjNnSEUc0m7CUrF4XEblcCLQb6VXf1kI/MJ2RGfMVdkZbWgyfUe/Uzy0vZ
         TzlHMoGVm/UiwgZkl59Xjma1a7g5UolZu1xB4zkh8Y9WNDbbXYOuYkXU/UZBM2iGBKig
         VuX4OQ9m6Ud3XYU7CvzTvyVuvzsPIGY32a7R0F0CZZQwLW00QKLFtlweUo4TM8fl9CQa
         qLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caRdwk2BRQJWlUMku9R1oT1hxRVhqY9kuoHjJ2qZO3g=;
        b=jJzbn8zeufhzMmfPhbpcnuce7qSClVrZAwRO5yvYAEy9IW1RtP201DbtFIzE6N8Pdu
         UteOmHUNWrQwpe095mt4Z3vJBHEIH6/XZnj+3y02c7r8Iz9U/Nv/GbR8crW9F/r6S06p
         upJPiub1j/JrksjU75pB8NQc34xZO7mVE/XI3CZU0aMaZi/A0PmbeE+8KMQWlHVwtYo4
         yNJmWEYIkNfzlj7cqato3ETKBfqmx5//+U9UuLgii3HPqhZzIPx/PHa98hJINgaPlgnf
         O7rzwDotQR+6ubq1YUHOP+sYJk+I/G/WxyUqYq1j0jdlTJzBHZtPIfl/i95CuiIlhfEQ
         sI7w==
X-Gm-Message-State: AAQBX9cIY21pTI4xtyqDxRq5iRtYNWKXDhlUU600DMXWlOnUU7sMc6zv
        rsjZ+pBzI+UzlCDv0qXJ8coolHakELh4MuM=
X-Google-Smtp-Source: AKy350YZuifQDcAImF7FIJpdSl4uI0utqVn+lwF5XQxv4tsCuonBlHCBbuxU7Zq6L46KIXeGCiA3IUpgdFEzMO8=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a02:b181:0:b0:3c5:14ca:58c6 with SMTP id
 t1-20020a02b181000000b003c514ca58c6mr6033175jah.4.1680807659752; Thu, 06 Apr
 2023 12:00:59 -0700 (PDT)
Date:   Thu,  6 Apr 2023 14:00:21 -0500
In-Reply-To: <20230406190030.968972-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219204619.2205248-1-allenwebb@google.com> <20230406190030.968972-1-allenwebb@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230406190030.968972-3-allenwebb@google.com>
Subject: [PATCH v10 02/11] scsi/BusLogic: Always include device id table
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     gregkh@linuxfoundation.org, mcgrof@kernel.org,
        christophe.leroy@csgroup.eu, nick.alcock@oracle.com,
        Allen Webb <allenwebb@google.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A future patch makes use of the device table for built-in modules, so
do not ifdef out the match id table.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202212171257.0oLypyYS-lkp@intel.com/
Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/scsi/BusLogic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index f7b7ffda1161..79fc8a24e614 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3713,7 +3713,6 @@ static void __exit blogic_exit(void)
 
 __setup("BusLogic=", blogic_setup);
 
-#ifdef MODULE
 /*static struct pci_device_id blogic_pci_tbl[] = {
 	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -3729,7 +3728,6 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
 
 module_init(blogic_init);
-- 
2.39.2

