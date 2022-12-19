Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8990065143F
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbiLSUqa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbiLSUqZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:46:25 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BDF120A5
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:24 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3dfb9d11141so120269517b3.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6S5anngOGqBeJ8dWJgoyIXF8JBImIfN2OM+kqAQMiJE=;
        b=gnQMVJ3xF+K9w4Ke8/SF9LQfX63JngjuAaaKEfwICm0afC0ubsmlLvX2d+aJYYPPut
         xwDVxhQ+UVNR6WozYsWHk2OzoMgMuRCsS7/M2n8kC3agf1OnnvKkjN3Vajtk5OGqxQFA
         7xXkYzcDyqKcOR4oR0UgA1nDOo/Cmx29kWXiVsRI8HQqaTtfntgrPzQGh9MJJepxkBbX
         bU/wUvhMA1u9zzQq9V+8A6YAURGA388ei9l+gpGY8fr57zm3z7k2LLw5klooWKkMe/iT
         G7qCAr3jLShHNmsds2xY+/62uvMpDO/xyAprxT1lJZ4oAusILamm3Cvn4cN/R3SAIwlB
         PvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S5anngOGqBeJ8dWJgoyIXF8JBImIfN2OM+kqAQMiJE=;
        b=8LUUieKpI2QmcMArmbii87hMD7Ax5LTK1JQuo9PDOSVvCTGaQYBofjXp3Qp7K/ahA8
         atYgQfA4oPSBaDreR7NBbdLh017Uont8jSAB+CgW68D8Ad2gFS/tMAeNsTYyDaYv5Eru
         N/wmj0LJRXAlwmrAUsiyjNhrML+251VpdCvdxml/qIVePCPvW5n1/ON/A7HQe3fIi9Ri
         0btEs5Wkk6yvH0TUCIiJ28OuNRG6UHlhW3WpawpnfM6CDT8izx7w2yXaCdmjiwQ4Onf5
         QchDSHkwJ8PBIb9Fiu5Jw9b50CSgzN4hX8WxRcjhX6daNPcztArR5GGSw4D+heHmf4rx
         /+OQ==
X-Gm-Message-State: ANoB5pleTxkKB1fDi0eibH1mU9nPAfGs+LCCa1EcIJxJlWEV1FFQfWyh
        uwDsS0quMP1EmQK9hukLsiG3XwSB8heizdY=
X-Google-Smtp-Source: AA0mqf7kZBjoNWYV8TibcRALWUvI1Rfi91G32OQZdtuSY8fGUv9/eoVoqpXctVBvfvV0GPpqkHk4vvZGgsZlRtU=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a25:e807:0:b0:6f8:a76c:7a23 with SMTP id
 k7-20020a25e807000000b006f8a76c7a23mr45891538ybd.513.1671482783822; Mon, 19
 Dec 2022 12:46:23 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:46:10 -0600
In-Reply-To: <20221219204619.2205248-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com> <20221219204619.2205248-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219204619.2205248-3-allenwebb@google.com>
Subject: [PATCH v9 02/10] rockchip-mailbox: Fix typo
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A one character difference in the name supplied to MODULE_DEVICE_TABLE
breaks a future patch set, so fix the typo.

Cc: stable@vger.kernel.org
Fixes: f70ed3b5dc8b ("mailbox: rockchip: Add Rockchip mailbox driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/mailbox/rockchip-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index 979acc810f30..ca50f7f176f6 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -159,7 +159,7 @@ static const struct of_device_id rockchip_mbox_of_match[] = {
 	{ .compatible = "rockchip,rk3368-mailbox", .data = &rk3368_drv_data},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, rockchp_mbox_of_match);
+MODULE_DEVICE_TABLE(of, rockchip_mbox_of_match);
 
 static int rockchip_mbox_probe(struct platform_device *pdev)
 {
-- 
2.37.3

