Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E967869CA8F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Feb 2023 13:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjBTMOV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Feb 2023 07:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbjBTMOT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Feb 2023 07:14:19 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5FF1ABE8
        for <linux-usb@vger.kernel.org>; Mon, 20 Feb 2023 04:14:17 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id ck15so5082677edb.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Feb 2023 04:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/lQTSLXrwgzelSDnMy7lmlYyvCXnK+UarZpoGpHksw=;
        b=eshFNKA6+fVRbXLaccaskQT4mt2M0JIRfUMuUllNiSRwSK2UO/7BIHuQ4vHBtzuSpH
         KoZWX7KvjQMPxFNtxKXnEmhrxPOn0WNmoMQeLeY0YqHgxpKwd8q/UcxPR40oEaK7UrTI
         bb65ZSeNOEvOrH8nbE1K4PYiBF+6AkUzmr/N/EIk4rR4Ub1h8MMzeXUE+n0QpU2sqlwM
         4e/Ylitfi/1CTXEIldB6CqUnx2mSjklvTxdZ1BS7JDEKUvCLUUayjkpJFwNSNCDWaQyF
         Zzw7QyJ/yb/29KimGoiZxGjtJ3/2Haf41m0MMG7ei0UgD2rFKUMm/9OeQwDAAI63FkkG
         C3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/lQTSLXrwgzelSDnMy7lmlYyvCXnK+UarZpoGpHksw=;
        b=4LzZ0uy9aVg49ykXVeSfHEIpqos6f3O8OVi4gIgLXo1/O3zt6tjak67iLKZjFXGGHJ
         IwGhlBBsa4yiJFywKoFrk0Ri33Ch8WFHD2E++6WPTpgGnC1F+iSX5Cc0SoUupigLVPFx
         PLmGEOAiz2hOfk2iY95yxFLaRlHx6/i6flerQSAbudYs9CNic0683WfkQruIjTf8u0Xl
         qwUinAg93xfY6H3etpZO8qf144vAxxxWTx5/DJM9S7bJj5AdeQNZe3U51ge64GW+KrMG
         PNYGQ08Ba7V03TUgubqqZH2tVJS/W/fC+uNGGVkCKw4CJdkqLaWuLmScWAQqaC6vl5Pj
         lN+g==
X-Gm-Message-State: AO0yUKV8o6zCSjtktBSKvnT54HFLSai+JApWAchkEZ7VN3nX+b2as+zi
        sGgIgjLSi47OX//uGj6g6i+U/LS/T9cxNg==
X-Google-Smtp-Source: AK7set/yla+SjH6mKUIvWR9xz2ajXT+tPzti3TfvCfbcIzcLyojPorLDTsANUua3thXy6qtyckywrw==
X-Received: by 2002:a05:6402:4d8:b0:4ac:c12b:8ef8 with SMTP id n24-20020a05640204d800b004acc12b8ef8mr48726edw.26.1676895255378;
        Mon, 20 Feb 2023 04:14:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id n7-20020a5099c7000000b004aee5f08364sm1027439edb.64.2023.02.20.04.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 04:14:14 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH] docs: fixing typo in the dwc3 struct
Date:   Mon, 20 Feb 2023 13:14:08 +0100
Message-Id: <20230220121408.111541-1-vincenzopalazzodev@gmail.com>
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

This commit is fixing a typo inside the dwc3
struct that I found while I was understand how
the docs generation works.

Hope this will help.

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

