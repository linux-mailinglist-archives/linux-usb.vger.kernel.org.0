Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A8E651441
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiLSUqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbiLSUq1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:46:27 -0500
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E881275B
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:26 -0800 (PST)
Received: by mail-io1-xd4a.google.com with SMTP id o15-20020a6bf80f000000b006de313e5cfeso4568401ioh.6
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7UrSOUGP+a8SdpdysICkGiHV2UeH0pTpanyW1FANts=;
        b=awanE9lkV2lS1NwSLmOwByOYf9g/kmku46qRrN0Qko+KTOC8NCLFn939E5b1YSq9iE
         e8I9HjrFjaRH0YufjNA1YtUq9cELaJ/9oNQKRTURdsAHf0fZon3vCt85dCE7CkNfgrjC
         GXtBmi0BQRPJPJkYcQi54sqSOrS4J5dF1RyBWcpQyas9hZUtYOs4UVkV/JtfbIWA2egd
         cvWbTIKloG9IS/l1R1KDWneqFiiJf4OOK/QnHPK1LYTUrkxwjGNgcqRHPCMesXO+htkB
         kQtPISQPX62cnn3pPqXepP2ZWMru0HvYxM01YPdFLwKrtpmjVBJsOC3Ox96baIQSNggn
         BdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7UrSOUGP+a8SdpdysICkGiHV2UeH0pTpanyW1FANts=;
        b=e227/hgn+gIx8THAM3xiL9qU73Uzs0kN1WCq2xKVAmDbcTtME4q3VJu1syIrv6PpNQ
         i3vxbtLqGBaTHDJjeYrDbndgua2VpWIOshJ9mzP0umNEY2SawKVzd6mIEm6MY9nDqZje
         wd8HAzdXQ+aXPgySPB4kIfTYUB9dyUIZ8jd9pmjYdwW4nygvf+NuMo7p22jbdSbmtals
         7pvg2W5JJUoDCzTzo3S+2oeKl3XkvlP082vxR25r8QwIRBu79ZKwA4wuCzUqvORGK8hr
         Ir7hEqCGWNCgB4exnnnpFC+wyCFqewvVaxUNkk5wRj6e6Cs5JIRL66vpx3b1Xf6kGyu8
         5ZSQ==
X-Gm-Message-State: AFqh2kpNlIYaYQKrgHCjEIPuGlzLRGutRe4sRwjPVqDREsuVOYTcITzy
        jg/ebsMmwN4d4i1MmnNX+RRojlOEdJqw72s=
X-Google-Smtp-Source: AMrXdXvASLX+bEGK9PqHTbJ1D5tdl6EsQ+ZoWrZiL0X8c3M6xdBh7C7vDHsT1vuh3MKDIJ0/3XEWDcW2a90QzlA=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a05:6e02:ec7:b0:30b:b665:fdc4 with SMTP
 id i7-20020a056e020ec700b0030bb665fdc4mr529287ilk.27.1671482786264; Mon, 19
 Dec 2022 12:46:26 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:46:12 -0600
In-Reply-To: <20221219204619.2205248-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com> <20221219204619.2205248-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219204619.2205248-5-allenwebb@google.com>
Subject: [PATCH v9 04/10] stmpe-spi: Fix typo
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A small difference in the name supplied to MODULE_DEVICE_TABLE
breaks a future patch set, so fix the typo.

Cc: stable@vger.kernel.org
Fixes: e789995d5c61 ("mfd: Add support for STMPE SPI interface")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/mfd/stmpe-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index ad8055a0e286..6791a5368977 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -129,7 +129,7 @@ static const struct spi_device_id stmpe_spi_id[] = {
 	{ "stmpe2403", STMPE2403 },
 	{ }
 };
-MODULE_DEVICE_TABLE(spi, stmpe_id);
+MODULE_DEVICE_TABLE(spi, stmpe_spi_id);
 
 static struct spi_driver stmpe_spi_driver = {
 	.driver = {
-- 
2.37.3

