Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE71C5A2350
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 10:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbiHZIl3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 04:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343713AbiHZIkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 04:40:39 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875473ECDC
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 01:40:13 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33dd097f993so15676477b3.10
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=1BCRKzVhOtBrKG/VR6oCKwA2rCN8yts14gxEEpWzTCs=;
        b=LpDUdywQAhULaMYLRcfvjEFdyqICCSbvUhMa1DwrNNBTXZ98htp1qCZwkXePp0+qCP
         fjWkp3GQpIlRivOEyhsVHLsN6eU/KWRz9XFPvbwOinyj0d3mfcx9j2h9IvBFz3Cax1dx
         D+6trm1GmP3wzvlvqtVNSb/Zh1UtxY9xcfwoJ5/Z5nUEZNPNZHtV2V/7VzGIvP8BVwSv
         wLi74SKWq17U0iEorxRpjRSmMMIAGSy47nHgvX2KCsjCfjZjhu9pFdF1ancQdj4wBoLR
         vKVy7pYQN320eHO3HAsMf1AEOpRSt++WrxHCnZDOsPV1hBoLjM5R1WBoNIHhyi+ndYRj
         nn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=1BCRKzVhOtBrKG/VR6oCKwA2rCN8yts14gxEEpWzTCs=;
        b=aOnZtO+q3qqhu5XGiCuXopwFcK+vIo5OCKVwRgq/k4jjYFOs3MWPh7AgidYda2/AIa
         Y/b7dlrUMscvlgdofd3lmefRXwTrVZpHLSZzX7qK22PzLO/qVUG0lkO+PizoMo6QgzI5
         gWyTkGgU+2g5nEjTVOK3Nt0IZK4xNZvNutxJZKhAX6JyF6vcZAkgxgr84ecK1jMz4EON
         IAMTfzZtlkKIB10xjjsHpa3KDfSSD8ki3AXQvnhXb8ofHAGHT8iUhXfp5P8LZ3N3DhDi
         pcVTAeRdk4xItXjt1iTD6QV+4XjLGDAd1Ej0CKaVwtNI08psOsC7mmnc7SN2rEg6CUSh
         RNdQ==
X-Gm-Message-State: ACgBeo3ENeA1dm/ocT5PSTDLmrjCyzWOsBa+AngQm4f1aByZsy+MXlzA
        poI/9NDJB0uHeeDflPArs3UyoplUlLU=
X-Google-Smtp-Source: AA6agR6wjESRw5TzQK2Y6xr9dLNT27OzE76bMAt4poVX5d//5QWPL/VdEtum0Cvn2yNc0Zzee+GEEfFEqGs=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:9c82:622c:af33:39f2])
 (user=badhri job=sendgmr) by 2002:a0d:da83:0:b0:329:9c04:fe6d with SMTP id
 c125-20020a0dda83000000b003299c04fe6dmr7700379ywe.196.1661503212667; Fri, 26
 Aug 2022 01:40:12 -0700 (PDT)
Date:   Fri, 26 Aug 2022 01:40:00 -0700
In-Reply-To: <20220826084001.3341215-1-badhri@google.com>
Mime-Version: 1.0
References: <20220826084001.3341215-1-badhri@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826084001.3341215-3-badhri@google.com>
Subject: [PATCH v1 3/4] usb: typec: tcpci_maxim: Export helper function for
 register reads
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 4b6705f3d7b7..af3a7ecab23b 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -68,25 +68,29 @@ static struct max_tcpci_chip *tdata_to_max_tcpci(struct tcpci_data *tdata)
 	return container_of(tdata, struct max_tcpci_chip, data);
 }
 
-static int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
+inline int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
 {
 	return regmap_raw_read(chip->data.regmap, reg, val, sizeof(u16));
 }
+EXPORT_SYMBOL_GPL(max_tcpci_read16);
 
-static int max_tcpci_write16(struct max_tcpci_chip *chip, unsigned int reg, u16 val)
+inline int max_tcpci_write16(struct max_tcpci_chip *chip, unsigned int reg, u16 val)
 {
 	return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u16));
 }
+EXPORT_SYMBOL_GPL(max_tcpci_write16);
 
-static int max_tcpci_read8(struct max_tcpci_chip *chip, unsigned int reg, u8 *val)
+inline int max_tcpci_read8(struct max_tcpci_chip *chip, unsigned int reg, u8 *val)
 {
 	return regmap_raw_read(chip->data.regmap, reg, val, sizeof(u8));
 }
+EXPORT_SYMBOL_GPL(max_tcpci_read8);
 
-static int max_tcpci_write8(struct max_tcpci_chip *chip, unsigned int reg, u8 val)
+inline int max_tcpci_write8(struct max_tcpci_chip *chip, unsigned int reg, u8 val)
 {
 	return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u8));
 }
+EXPORT_SYMBOL_GPL(max_tcpci_write8);
 
 static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 {
-- 
2.37.2.672.g94769d06f0-goog

