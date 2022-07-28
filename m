Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1601583FC0
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 15:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbiG1NQX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 09:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235859AbiG1NQS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 09:16:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEAF286C0
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 06:16:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m12so2808225lfj.4
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OunJSJMMCgqgaXatw8v1iFuM0DUaN06c11p0+7A2avI=;
        b=Hb3kelol87N7fuYXMGICB/bpxMRGJFVBDu9rrQ6sqfKQPB19P5zHRvmaLEVh9VO4bC
         K/qSL+tDfdyM/pPRFjAEwcObFtiSaXqt2Mlnd5nxOkPXAQMsrn7hh+2w9HB9W3GsCdEH
         f1EvLTZxcCG7Kvja6BPuOYVswHe3uCZv9nB/G+N7ba963lP8POgCsMZh/LSrKTFJJFgu
         KUKjyN1JLnLpL0n+ahGUvhv/l/bpVbDipNnjP4/MiD9jqFINJeZn7EGEM3lqUNcM4ltC
         ooxrRqhNV+LB9LfUuL9qvW/AtfzLdZNu44s6w1uvpdXVURwLW1+f8FFhxwi2epyFd7nT
         E4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OunJSJMMCgqgaXatw8v1iFuM0DUaN06c11p0+7A2avI=;
        b=u+jp5ZaX5eHYZwIahkEKTvnmesrwIdYUekgg6j6YrFD2hgth15UopIsB7kzMBalgc1
         T2uysz85i4AuB03TW7Knw7txg5USEKQlWGTX9QnQgDAg/pj55ucduK3y/1x9Per/VUff
         4qNi/u6XqQ8rRPJyfCWgx8htUKJBtisS/MnbJYxWv1FGLpCqAV6bkIUaVrvNUxHBHy0k
         OMRkJfqPnBvyGRXUSWiRLVDF6XrIKO4n51YWX4qOxBcOymCFLHX3khVGQmhsRYcoF9Wa
         kStbSlRgOIDFr3b1C8jaWT4USa4wmwpJPisDZIoJm+5yor216Iym7ohWJIM9fFtg3AAR
         WBiw==
X-Gm-Message-State: AJIora/L5/k8c98jzYAxnlcSiDq2gNUkiudJ7aRPX1LKk9oISuTPOud0
        BX8+pWzBj6oFj63Q92Hn0hBw
X-Google-Smtp-Source: AGRyM1th5Nx/RaEs0JkWOsDyCtomtCSRxWxg5lNBt03DiQnH4dtPNVikl2jJN/S50fdZokjJe57AQQ==
X-Received: by 2002:a05:6512:5d7:b0:48a:83e0:a507 with SMTP id o23-20020a05651205d700b0048a83e0a507mr8899800lfo.452.1659014174912;
        Thu, 28 Jul 2022 06:16:14 -0700 (PDT)
Received: from localhost.localdomain (public-gprs369165.centertel.pl. [37.47.73.78])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512344a00b0048a8c745be2sm200940lfr.38.2022.07.28.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 06:16:14 -0700 (PDT)
From:   Lukasz Bartosik <lb@semihalf.com>
X-Google-Original-From: Lukasz Bartosik <lukasz.bartosik@semihalf.com>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:     linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v1] thunderbolt: fix PCI device class after powering up
Date:   Thu, 28 Jul 2022 15:16:08 +0200
Message-Id: <20220728131608.31901-1-lukasz.bartosik@semihalf.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Łukasz Bartosik <lb@semihalf.com>

A thunderbolt
lspci -d 8086:9a1b -vmmknn
Slot:	00:0d.2
Class:	System peripheral [0880]
Vendor:	Intel Corporation [8086]
Device:	Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]

presents itself with PCI class 0x088000 after Chromebook boots.
lspci -s 00:0d.2 -xxx
00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
NHI #0 (rev 01)
00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
...

However after thunderbolt is powered up in nhi_probe()
its class changes to 0x0c0340
lspci -s 00:0d.2 -xxx
00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
NHI #0 (rev 01)
00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
...

which leaves pci_dev structure with old class value
cat /sys/bus/pci/devices/0000:00:0d.2/class
0x088000

This fix updates PCI device class in pci_dev structure after
thunderbolt is powered up.

Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
Signed-off-by: Łukasz Bartosik <lb@semihalf.com>
---
 drivers/thunderbolt/nhi_ops.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
index 96da07e88c52..6a343d7e3f90 100644
--- a/drivers/thunderbolt/nhi_ops.c
+++ b/drivers/thunderbolt/nhi_ops.c
@@ -160,12 +160,17 @@ static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
 
 static int icl_nhi_resume(struct tb_nhi *nhi)
 {
+	u32 class;
 	int ret;
 
 	ret = icl_nhi_force_power(nhi, true);
 	if (ret)
 		return ret;
 
+	/* Set device class code as it might have changed after powering up */
+	pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
+	nhi->pdev->class = class >> 8;
+
 	icl_nhi_set_ltr(nhi);
 	return 0;
 }
-- 
2.37.1.359.gd136c6c3e2-goog

