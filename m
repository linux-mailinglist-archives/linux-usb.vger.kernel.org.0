Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676716A1BA0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Feb 2023 12:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjBXLwx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Feb 2023 06:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjBXLww (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Feb 2023 06:52:52 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECBB18E
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 03:52:51 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id ee7so38688522edb.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 03:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiBi2rmIB0gCq2dC/b8J6pP3oVXImSm/q3/mbvP8YQo=;
        b=aY5m2HqbtQ0FZou4E2oFSDM+AltE3Kd1ENtPzJ2fffxPQjbfiaatodBoa8hCwPDcAs
         6cs7pXzT/EzYPxE06X+H4c2GT+S0wfieulKP1J1fBiEC2pModjgbbbYr3ttyD4oL0zCF
         fkjLfH76UP/8SpQX+/5yZlAVAcKqKkEYASJJD8+3fJHTcWAoX2qPz6gImIb5tAb9BTtp
         bhwdjO5KMuHUXGJSQLspfad4PNKRVuDY2b7c7QEZN0jbhvkgxRQVDUEL1zUxmk/WPwcc
         JK7zVzrv/t4cXXn8gJPGnjIT/bp0HKZIyNQwb4Ia4pO5WWsr4kVCYbuJ44vLl6ihcvoi
         nLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiBi2rmIB0gCq2dC/b8J6pP3oVXImSm/q3/mbvP8YQo=;
        b=0r79FApgZBcohYdn1pgaW5PXiqLO1GLgaXJFkCtUhAW+6uYE1sMAMz0XlW43436/hd
         OUzX9E/OA/zq0/4tUZj73euSc9+P/qauyLDjzNZDsM1HmNH0IZYEsk/klp8+NEW/Y+ii
         Tt8Ky9dZdWpxpEuO9c+otCcHPZDU00fekpaBgJrLD7iSSx55h674OqsKA+G9I/RDZoaN
         Y/wr7YlpdFXhnVtQ5DpTPucqoq1guhLwNLxSmks4rSu3W74HWGs7qpsNSEZX1lf0ii8N
         c5bJS1wyqWfvv+2YNLCj4ChhuH/oBAxJ/ks2kgZHaRbO6bzapoYQLgo/F7KFCz/wyJRx
         JFZA==
X-Gm-Message-State: AO0yUKUzHOLyYid8zhPZ7HI4UTZwD13XJJNSUbe8aRFJFRag3gRF4C3X
        OoFDNoRQbW3J60cvsZs3jfhJUlQWE68/f5iK5QI=
X-Google-Smtp-Source: AK7set8cWqSbJqcEv+Xxn2GHUfrojUniGKfl5UC9XDrZrsId+LVGAuqP9sV9zKc3KKt+AGYC4ns3ow==
X-Received: by 2002:a17:907:3f2a:b0:8e1:1f8c:5670 with SMTP id hq42-20020a1709073f2a00b008e11f8c5670mr14386529ejc.5.1677239568940;
        Fri, 24 Feb 2023 03:52:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b008cd1f773754sm6823613ejc.5.2023.02.24.03.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 03:52:48 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH 1/1] usb: dwc3: fixes a typo in field name
Date:   Fri, 24 Feb 2023 12:52:24 +0100
Message-Id: <20230224115224.2838636-1-vincenzopalazzodev@gmail.com>
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

fixes a typo inside the dwc3 struct docs.

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

