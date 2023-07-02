Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1C5745033
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jul 2023 21:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjGBTHA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Jul 2023 15:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjGBTG7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Jul 2023 15:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5FDC7
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688324773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=xsRDdmtq5Our5WATjThYRnHQTqs5zu3TQW1oubRlwjw=;
        b=BFgOTOlRPdo89VfpxsGKUlPrnc/IbgRhDU08abK+OVzcjidM27mBMVOXANEOotZoY1Xqow
        vVsXe7Cwc9LDJrC8wJKtWBE0rP1vFTQh7RtMe29K7rS6kK36FbMwP4jx/XUGWA422BzasG
        tVpSH8FHy3H3NIuKlQSL/OjFMwN+DfQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-YSPWCZjqNi-Sr5yzg7cNiw-1; Sun, 02 Jul 2023 15:06:12 -0400
X-MC-Unique: YSPWCZjqNi-Sr5yzg7cNiw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635ddb30491so41352296d6.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Jul 2023 12:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688324771; x=1690916771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsRDdmtq5Our5WATjThYRnHQTqs5zu3TQW1oubRlwjw=;
        b=S/CT4FxYOD1JSQoZxiZez0QkARUjNOHUen2s+THr9PE+FlefpAYyawTNHKIh3Xm2sC
         PTSL6U8+N9Kry16SOrjEUsyTmk3aCzMNvCBV2qCMo0xM7j/ln2aPl6K3RYZC7CWV1nCg
         qX2ER/nFUnD/mwmAq9OMwsX0CdgK+AR92pOyp3J0aw5+yHD7knQCkjb3MwXRA8xnzotx
         oVjvAD2/O4U6NzYwQoMGr/sspOxwASYlJM5Y5aAk+ti9Qd9PdGU/nnZ9PbEITWF2dyvu
         mU30jmfUkmQ0SdwHPB0cxqS4rErApWskfIAKJwNsLsUNjbay7KD2RTaF7EqZ3+xTFKMm
         Sfbw==
X-Gm-Message-State: ABy/qLZvxxOO+rdm/JhUfu+gGzco8hJAy5j5u8vOfGU5gvA4Ogcvagbn
        n4zyMs9EIhwg/W1MaBo4T897XNiJhs1Vh0lgVRaQeJfr41ojHOV8o1YnifWCMxCsmaXdF9bfvUP
        7EJ116n3syD9m52rSN0yL
X-Received: by 2002:ad4:5fcd:0:b0:636:39ed:4dce with SMTP id jq13-20020ad45fcd000000b0063639ed4dcemr12491743qvb.20.1688324771652;
        Sun, 02 Jul 2023 12:06:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHHwkDf+q0k6HfatFZaR5G1pfLmXHURWAiK2OHvHS8ulozJIkbfjTuy/u9kGBcgR9l7lGiJBg==
X-Received: by 2002:ad4:5fcd:0:b0:636:39ed:4dce with SMTP id jq13-20020ad45fcd000000b0063639ed4dcemr12491729qvb.20.1688324771450;
        Sun, 02 Jul 2023 12:06:11 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c5-20020a05620a11a500b00765aa9e3499sm7592804qkk.135.2023.07.02.12.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 12:06:11 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] thunderbolt: set variable tmu_params storage class specifier to static
Date:   Sun,  2 Jul 2023 15:06:08 -0400
Message-Id: <20230702190608.3441704-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

smatch reports
drivers/thunderbolt/tmu.c:30:3: warning: symbol
  'tmu_params' was not declared. Should it be static?

This variable is only used in its defining file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/thunderbolt/tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 1269f417515b..c789024d7ffe 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -19,7 +19,7 @@ static const unsigned int tmu_rates[] = {
 	[TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI] = 16,
 };
 
-const struct {
+static const struct {
 	unsigned int freq_meas_window;
 	unsigned int avg_const;
 	unsigned int delta_avg_const;
-- 
2.27.0

