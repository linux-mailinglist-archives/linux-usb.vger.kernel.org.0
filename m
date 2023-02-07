Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55A3268D513
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 12:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjBGLFt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 06:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjBGLFr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 06:05:47 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1C9DBDC;
        Tue,  7 Feb 2023 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767946; x=1707303946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xF4jDpA9qmX+Mr6H3ol1SyoP+RukmcdTgfZeN+x6MrE=;
  b=F1tsRY8x3EI3mP+aJLHj5Pvf1uhRrDNXwX217SRNzmBwns4h2Wxq94TU
   yl0EISBmbBtMSmaRmb03MFusbkl+hWN+f85wOnR0DHUDshx4/OxTGeO2u
   gfbhrAGwOlAaOTAvd/Q+0kyxXKDWUuftSHKCcdLkWwahX/ojzagS4hGy7
   hOV0ARGDEmdirZqWaMJt4fKNkBEca85IkR8Tm+Qy7HV7KtU+ln61j8oV8
   E5geszLcb2McNVfGWYTu4qfz2x4o6rOEYcK006CkRgWOa1vtwkVGOQj7M
   y9YS2jtBIEQcW1kdRgNW/URlWviRJYTjOkaDuBj64T4JJERjRSyixZ1SS
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917152"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 07 Feb 2023 12:05:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 07 Feb 2023 12:05:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 07 Feb 2023 12:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767941; x=1707303941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xF4jDpA9qmX+Mr6H3ol1SyoP+RukmcdTgfZeN+x6MrE=;
  b=bbQFVAauNtA8AcSz8nEsemS4XavL3lLNVVjyaOTy/kFvwRPlwU+NhL2/
   k3jLhYq+9XbnbHqlZLpaIIBttvm7l1Kb3Heqi7/bKreB/hTw6YcVGmZAX
   1rWuDRaZJVyNRak+5Mc+f1xjAGWQLTa1ZMY+BS4emO2Kj1IrlXDCHKwXT
   DONSdq56DkthPRZtQb2VB60aXjbq83Bwgb2di/9BamukXoDZVVPDY3xaV
   zR5yIHWuoQn+Wqi8Tnil70SAYZU8qpERMhetuzJePRfpI2PDngESWJF5d
   55shciw0K12jk53nrkATRRCXxk5KGJ6ek2XKNz7KpMbC9bZMf5TBkgAUk
   A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917151"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2023 12:05:41 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ADC30280073;
        Tue,  7 Feb 2023 12:05:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Darren Stevens <darren@stevens-zone.net>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/3] of: device: Do not ignore error code in of_device_uevent_modalias
Date:   Tue,  7 Feb 2023 12:05:30 +0100
Message-Id: <20230207110531.1060252-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
References: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

of_device_get_modalias might return an error code, propagate that one.
Otherwise the negative, signed integer is propagated to unsigned integer
for the comparison resulting in a huge 'sl' size.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
There is no problem if of_device_uevent_modalias uses the same checks as
of_device_get_modalias, but this is error prone and cumbersome.

 drivers/of/device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 5b929351b65bf..955bfb3d1a834 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -385,6 +385,8 @@ int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *
 
 	sl = of_device_get_modalias(dev, &env->buf[env->buflen-1],
 				    sizeof(env->buf) - env->buflen);
+	if (sl < 0)
+		return sl;
 	if (sl >= (sizeof(env->buf) - env->buflen))
 		return -ENOMEM;
 	env->buflen += sl;
-- 
2.34.1

