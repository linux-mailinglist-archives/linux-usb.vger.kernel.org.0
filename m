Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F068747A5C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jul 2023 01:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjGDX1J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 19:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjGDX1I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 19:27:08 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Jul 2023 16:27:07 PDT
Received: from mx5.ucr.edu (unknown [138.23.62.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFE210E2
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1688513228; x=1720049228;
  h=mime-version:from:date:message-id:subject:to;
  bh=IIcGzf0mh9g73nBCtmMFvgNM+Eq+aaBo6WfZ0QBu17E=;
  b=QZmX4BbAQriyqrkSsRWkaLguRFwt0IZy+za5vtn6P5aCCEBvnyHuFTfo
   bWNFT/18GKKM6eDo3oNbm4qx886f3R2Nt4EhR/qoI5fTlg4N40bf0wcZm
   aAfBor/CbtbHamA9yDYY447JoDTrz5qZiS1MagPdEfbJRgySVfeZhh0gH
   T2RXPfaU8Js8GMLaB7IdCF80QdA6FuP2QnW6wLjUoJYcm/Y+OfmKf4HXr
   v0x1PfRGc35hi4AElALwD1n6sd+OpgbYkW0p7R30vf/SSGEFPJ6fYqUV/
   /4eD01MeENurHGMmf77WVdN7kuUVvgjnHRLBzxNmo27lVY772Hh/xroYI
   g==;
Received: from mail-wr1-f69.google.com ([209.85.221.69])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jul 2023 16:26:05 -0700
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-314134f403fso3212176f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Jul 2023 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1688513163; x=1691105163;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kX4KQkS9n4VAC2qSIaAGCx3GNGd1xoIMp65oHXNSsCU=;
        b=Wna9BBKFzEMaCEtvGZB+yT8Jt70cwhNa/5N4yycxRMDqD2SVM3Ig7/UpjLd/B6MuMK
         4tT2DCl14duFCEFfZTC5jKSccqa+xR/c+J1TVxRp5jUH5pPz/01KynduoYnUeD//LQNt
         iyiwyAXPs8bgYMETS85D9W6KeU3LoonWikSlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688513163; x=1691105163;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX4KQkS9n4VAC2qSIaAGCx3GNGd1xoIMp65oHXNSsCU=;
        b=chjj3cFj6ZN6vJj90YwrpjQ8zNSsNg3IbsTfGmuUWamETKL0hmZm7100Uc7ht2PzfK
         vKnS+hvrDFk04hXzoXyGndaXYnsOWEiHCT5/2dozoP5yK8vyeSq0ZLhEBShWiguvNXWC
         zrGtV8mnDCpiXhxx2t/U8o7HXK9Ti5yJ85DhjXwhsfII6QXOc9cVOTtiRTFAvQiDZ/JR
         TRSbLPRzRosZTncXo3VT9ArHLRssJeRHrmumsUU4XGmLCbStZF/Zmc75JAnlFQaXmQNv
         nYnQiOtr2hU9M5rtKc1jGlGV1HC+66IIFsyiTN+1EEF05ZSEOJZ64yMGuS1bawsfOudv
         ndwQ==
X-Gm-Message-State: ABy/qLbXL4fqtaOgLENkpSaBeMC2V3FfckRf1xxKiRteAGGqqnGNVPI7
        T+Qfpn96ovMLGFLzTLmTvzRIisPttQkpgsEZfXUTzHNjHuT7rMqORkLG4qSMSPaigrivceBYGCv
        B4W51QPSRBHLKUr2VOc4pP9ATMQNSdfe6g9lZ3u8idVDLGvgf
X-Received: by 2002:adf:f6d1:0:b0:313:f7a1:3d92 with SMTP id y17-20020adff6d1000000b00313f7a13d92mr11357204wrp.66.1688513163267;
        Tue, 04 Jul 2023 16:26:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGPHNfkxxQrUTgpCNAWDSLPEBOshdPoSSdm8s4Xq/52TYuqpLWxYADoNTOT/rraoqVUff/OQdjCnMkVyzUAnlI=
X-Received: by 2002:adf:f6d1:0:b0:313:f7a1:3d92 with SMTP id
 y17-20020adff6d1000000b00313f7a13d92mr11357195wrp.66.1688513162932; Tue, 04
 Jul 2023 16:26:02 -0700 (PDT)
MIME-Version: 1.0
From:   Yu Hao <yhao016@ucr.edu>
Date:   Tue, 4 Jul 2023 16:25:50 -0700
Message-ID: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
Subject: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
To:     chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The struct usb_ctrlrequest setup should be initialized in the function
ep0_read_setup(mtu, &setup). However, inside that function,
the variable count could be 0 and the struct usb_ctrlrequest setup
is not initialized. But there is a read for setup.bRequestType.

Signed-off-by: Yu Hao <yhao016@ucr.edu>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..67034fa515d0 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -638,7 +638,7 @@ static int ep0_handle_setup(struct mtu3 *mtu)
 __releases(mtu->lock)
 __acquires(mtu->lock)
 {
-   struct usb_ctrlrequest setup;
+   struct usb_ctrlrequest setup = {};
    struct mtu3_request *mreq;
    int handled = 0;

-- 
2.34.1
