Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358344FE64D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 18:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357855AbiDLQxZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 12:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357854AbiDLQxX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 12:53:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A759C574A0
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 09:51:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z99so14486556ede.5
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVbqjA7ErtCWshTPBZJd5FGzyo/s6SwwCQGBMNVlD5s=;
        b=JOF/v8Rp/oA3NQPEGqGx/QIl1q3IhHN+4Z2WsvfgotRyytqVe8QlYNF7b6oj9Sms7H
         aAmAtKAWU9mUxbMPg1wzVJ7ATQUZRbFSoCuk1lENwRhy14Z9oPY/hgRCxJG9yLJLNk2u
         xSCPng06lL6MPqQF2o1UDBa/IfzvbbjzbOQzWXOJ/V35aJlPbOvysAkPA6Xkzz3VabjI
         QBw41u/GZRDcq+jGqmgAmTdRSJ4kYSsGrmVViCz8IvrGpoID7WJYPmUA7JaAEnP7Y7qz
         jzXpYEeM99i4TT7Heh9HKfgAiOvrVAv7b4Qne58+qXGaGDVILXhN2bLbi9A86Z6CXnO7
         qspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVbqjA7ErtCWshTPBZJd5FGzyo/s6SwwCQGBMNVlD5s=;
        b=xpkF0Ei08z1rPRbLX0I2eq+Aa57OBLgWyarmJeMFgtBYLlMUqP1drAzy5bWZdKmpkz
         /FcSsojup2Tcz9ZC+1/3IaHrFvCDY+YDvARhNECv5ZfQrIehbLIQjHgTarT3Tg8CuNFr
         i5dcRihzqZz4bm7TdPQh8gzS4U4GsklzXvuJHFglXoNdFoOr2pzDdWptAMjudXBssMTr
         R4/9uheVCSy8dNfTDtM+pWhh9aTKSXttlyRD180Z2LkHgEqje4wu0C88z9kFP7Cf/SbI
         r0ZHpQDUfv8dSJjshbtnfj34LwBEY9Tv5cR9jibtbTd8sc8Hkc11KuhzHZnIRPDp1PGC
         n5Gw==
X-Gm-Message-State: AOAM530H2v/OO/CKfEn3B49fB/e0Ih38rqCbGp2yRpFdS3bqqRzIX/Xh
        ZqoqjZhNoG7MKHUAHAAOAmb3G26ntGj4Kqjaz8k=
X-Google-Smtp-Source: ABdhPJx4HkuCZSyCn+igVr3Q8ARPWF5BtXctg1uPtxanRWFvB5AdXJBR1ihXTA7vm89gSnB8ZJgMxw==
X-Received: by 2002:a05:6402:22c4:b0:41d:78b1:349 with SMTP id dm4-20020a05640222c400b0041d78b10349mr13602150edb.365.1649782260157;
        Tue, 12 Apr 2022 09:51:00 -0700 (PDT)
Received: from localhost.localdomain (ptr-dvafnx6088d6pfrb8pc.18120a2.ip6.access.telenet.be. [2a02:1811:ce3a:3400:364:f5e0:d796:a7d0])
        by smtp.gmail.com with ESMTPSA id o15-20020a50d80f000000b0041cc1f4f5e0sm6173edj.62.2022.04.12.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 09:50:59 -0700 (PDT)
From:   Niels Dossche <dossche.niels@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Niels Dossche <dossche.niels@gmail.com>
Subject: [PATCH] usb: usbip: add missing device lock on tweak configuration cmd
Date:   Tue, 12 Apr 2022 18:50:55 +0200
Message-Id: <20220412165055.257113-1-dossche.niels@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function documentation of usb_set_configuration says that its
callers should hold the device lock. This lock is held for all
callsites except tweak_set_configuration_cmd. The code path can be
executed for example when attaching a remote USB device.
The solution is to surround the call by the device lock.

This bug was found using my experimental own-developed static analysis
tool, which reported the missing lock on v5.17.2. I manually verified
this bug report by doing code review as well. I runtime checked that
the required lock is not held. I compiled and runtime tested this on
x86_64 with a USB mouse. After applying this patch, my analyser no
longer reports this potential bug.

Fixes: 2c8c98158946 ("staging: usbip: let client choose device configuration")
Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---

I'm developing this tool as part of my master's dissertation in order to
obtain my master's degree. If you'd like more information about the
details of the tool, please let me know.

 drivers/usb/usbip/stub_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 325c22008e53..5dd41e8215e0 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -138,7 +138,9 @@ static int tweak_set_configuration_cmd(struct urb *urb)
 	req = (struct usb_ctrlrequest *) urb->setup_packet;
 	config = le16_to_cpu(req->wValue);
 
+	usb_lock_device(sdev->udev);
 	err = usb_set_configuration(sdev->udev, config);
+	usb_unlock_device(sdev->udev);
 	if (err && err != -ENODEV)
 		dev_err(&sdev->udev->dev, "can't set config #%d, error %d\n",
 			config, err);
-- 
2.35.1

