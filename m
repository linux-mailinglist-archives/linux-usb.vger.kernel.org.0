Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8EA9584E50
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jul 2022 11:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbiG2Jlo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 05:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235959AbiG2JlQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 05:41:16 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53DED43
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 02:40:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p10so6498677lfd.9
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlB1PLMmBO5wAZp/rJ+t55Wo1Wb7Hb1/K7W0E1/Rthw=;
        b=owaroN/fkxCxX0BPlaLmjO/TuS96J559mTUOcbtnZXvyf9FJZo3jWXpHutOKSdO33K
         Eko/qJKAlPVvUUPXbiOyApkXBkaSqqsexwjgV62hdHi9N7zEYCM6XaGpa1OCzXQFZSBg
         wXLQfxjtnmVt8tbEwWyEvb40HiOEzswljdkfZgU0CwwAbEXoP4qdUT6ZgKXWPk6pAmG7
         w4ErymoUT0BBUW7MMVFIEZ0z9bPbkjETIcKjOguqu3z9NOo2hYiHOiY7R8z/M7op+5q5
         Ms9n+P2e2vapAU9CmCkSf2hzwa+WeP5iwjprm9z9wfbziEx5OTL65JSjddpqKZTKZGBH
         4jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlB1PLMmBO5wAZp/rJ+t55Wo1Wb7Hb1/K7W0E1/Rthw=;
        b=t8Uaa+cFMQa7o27SynJalgMYsKNofZD6sB6VxAGT4uocMMh9gH1K7BXos3kX1hqPqF
         zTLc7wdxl/CcLNpaR7ZOHIEgZT3+ClaVjInF0MlFnsPFndJjwtHmfhSKQge2nGiTiqVs
         wulkS+Lmgvib/BaqFLzQgnoTOAZ0Pgek2DSvZZQMNwVeJoN3q3c1nBh/XP6O0BzmhfnE
         2vAbYjOqaQhT1H227l04sN9nsuNQ3mpA6hXBC8KYzyVshs9tFUVieR/1xo17GwaLAP8T
         fG2JZrjOEYPML1avMF3exlOu/6B+frzbP0VWB7HhVI2luB1LOgN/SKuix3N3DEehUxX8
         dkYg==
X-Gm-Message-State: AJIora/mz469dODFWjorytIh3Sjg0YVSX8S1hbnbddgKrssim3GlS1MG
        FyRFbvjZ96g8trj4zLsnc8fp
X-Google-Smtp-Source: AGRyM1vSJjiuAn45yth8P4zLPuiAPreiQ7XzNaJmg+F+OejWHoSxhKrHjd+rRwvFJlpSSvqQxzDP2g==
X-Received: by 2002:a05:6512:2025:b0:48a:a653:fe31 with SMTP id s5-20020a056512202500b0048aa653fe31mr1013843lfs.166.1659087637291;
        Fri, 29 Jul 2022 02:40:37 -0700 (PDT)
Received: from ukaszb-l.wifi.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id f22-20020a2e6a16000000b0025e343c4929sm218503ljc.92.2022.07.29.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 02:40:36 -0700 (PDT)
From:   =?UTF-8?q?=C5=81ukasz=20Bartosik?= <lb@semihalf.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:     linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v2] thunderbolt: fix PCI device class after powering up
Date:   Fri, 29 Jul 2022 11:40:22 +0200
Message-Id: <20220729094022.186496-1-lb@semihalf.com>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
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
Changelog v1->v2
* Add restoration of PCI revision id
---
 drivers/thunderbolt/nhi_ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
index 96da07e88c52..7aba47e5b3bd 100644
--- a/drivers/thunderbolt/nhi_ops.c
+++ b/drivers/thunderbolt/nhi_ops.c
@@ -160,12 +160,18 @@ static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
 
 static int icl_nhi_resume(struct tb_nhi *nhi)
 {
+	u32 class;
 	int ret;
 
 	ret = icl_nhi_force_power(nhi, true);
 	if (ret)
 		return ret;
 
+	/* Set device class & rev as it might have changed after powering up */
+	pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
+	nhi->pdev->class = class >> 8;
+	nhi->pdev->revision = class & 0xff;
+
 	icl_nhi_set_ltr(nhi);
 	return 0;
 }
-- 
2.37.1.455.g008518b4e5-goog

