Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7E96A84ED
	for <lists+linux-usb@lfdr.de>; Thu,  2 Mar 2023 16:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjCBPHj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Mar 2023 10:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCBPHi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Mar 2023 10:07:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE6A4743A
        for <linux-usb@vger.kernel.org>; Thu,  2 Mar 2023 07:07:15 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h11so5101701wrm.5
        for <linux-usb@vger.kernel.org>; Thu, 02 Mar 2023 07:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677769634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmEzz/8Cso4kqBqjQ7ZPbGNyv6e4icKwYHc2gW/v4ho=;
        b=LpQZ0bQ7ofPEraroRXQUYOpDFJ52ykM7aHokiT79iMi0qDdM2iinNls8D9eyOC0vA2
         jxE+z/2822AcS8oB1us11S6ZO3TkV7yDHH3mHA164UjncKKjZwa68nW5sHm48MrAtLb/
         VZpUiXxCJkxx+wF7HAxJpJ2clEUSNTGTO2odET1ATh814w+fenYMOwra4xiNPe3Mpdm5
         rzJ7yXlPEo9a8mU+tedIjmWj4eWk6pJZTqFUviogPqJoSipaOulqF1V2pkl6hwbxgnL4
         TcjsJH0VC68nqfEKm1c0r6rnsoNHQ5rG/adzQeCGfp4FlWnbfSuG1TRVhLKiRhVStJsb
         dWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677769634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmEzz/8Cso4kqBqjQ7ZPbGNyv6e4icKwYHc2gW/v4ho=;
        b=rHFiixy0hv47rZvAhGVvvwNaoZ+8OAxx1gMjNdGHo/jWnqqakFPXQbv6yy8LntMHWN
         dWTIh1F5jkv+LmBCuzJUrgQB6TciP3hyHPhomOp6YUUHjigXkWtvOowYc4EjoKwXcjjw
         HaYX2bED7vGr8Z6VT57uwRzIt3KYjg293FxQZeMKPttZ9XGb4TMrEg9zyPVbU8hZpIjY
         DFFPR1jxmvt04YRmZFIiSoF0zNRqXLH7DzNNnU7nUjPLrn2ube9sObPfYoeFEC4xB1eB
         J6/6rMu3tcYI+wY8C21OboZmbsFB9E86sOTuze61RTgpBLCN0qBYQ1dg+ogn+fz1x5ns
         RBhQ==
X-Gm-Message-State: AO0yUKX1R1l8KGiGscjnQkzrmCVPHzNB3xpurviTn1pzHtwJ5P+Uw2Vz
        rjiuqTvDIpp9VpOf5CaPgzevqk5HXh0JSixl0cs=
X-Google-Smtp-Source: AK7set9q7yfUYWZq52CBmfUxK0dkI3SSFQJZRdh7YVarcfCm0z1YCuuZdzncBYTFusr1OlrumvxmbQ==
X-Received: by 2002:a5d:42d2:0:b0:2cd:bc79:5432 with SMTP id t18-20020a5d42d2000000b002cdbc795432mr4378744wrr.25.1677769633771;
        Thu, 02 Mar 2023 07:07:13 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b002c7163660a9sm16032433wrs.105.2023.03.02.07.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 07:07:13 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH v2] usb: dwc3: Fix a typo in field name
Date:   Thu,  2 Mar 2023 16:07:06 +0100
Message-Id: <20230302150706.229008-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix a typo inside the dwc3 struct docs.

Fixes: 63d7f9810a38 ("usb: dwc3: core: Enable GUCTL1 bit 10 for fixing termination error after resume bug")

Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 drivers/usb/dwc3/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 8f9959ba9fd4..ac81d523710d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1098,7 +1098,7 @@ struct dwc3_scratchpad_array {
  *			change quirk.
  * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
  *			check during HS transmit.
- * @resume-hs-terminations: Set if we enable quirk for fixing improper crc
+ * @resume_hs_terminations: Set if we enable quirk for fixing improper crc
  *			generation after resume from suspend.
  * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  *			instances in park mode.
-- 
2.39.2

