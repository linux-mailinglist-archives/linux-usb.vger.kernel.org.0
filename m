Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD1B6DA07B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 21:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240354AbjDFTBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 15:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240337AbjDFTBC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 15:01:02 -0400
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F4359F2
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 12:00:59 -0700 (PDT)
Received: by mail-io1-xd49.google.com with SMTP id l7-20020a0566022dc700b0074cc9aba965so24575551iow.11
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 12:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680807659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGQLnr57manA7/d3sSj7CWvU90h1ejgPAAwZbA4W80Y=;
        b=E1XOP1CaY8koFy3ME6her9rJ9Nke8XHAoAVsqLpY3lPsNoEYGcrpUF5PF5gHdN47bK
         NGSiShp2xcYg0DXa0KIabY1O37FSpfutYwWTjtRVrU9oHpeB9FGTYAd99a4F1/6Y8FZn
         AbnD5SAV+TZ0GjZP3RdKVI6rqFp6OB//JibKTs1ZBw4TBgjK4lD7u+6bQxjHMtj/gsBd
         BKNR9Uz/lHv1iRy4b6qhPk1HwfMVdk/ucdXhOaul/MyfX6WSdjJGRwtYds3NlIxOeBAy
         hYI94iBkFDpAsYZMS2B43djCX50lmE22kkHDNV9FYiOmAE1uw+MDpJDDPPsBmoU8NICk
         6/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGQLnr57manA7/d3sSj7CWvU90h1ejgPAAwZbA4W80Y=;
        b=tB9/KGeA+z9eF9wHvdDOvDRA4oBjPNXiiYItyo6kfVwOl306z//e3CfyWpoCMMA0Ai
         ioHdnT8Qn8uhj8n8Qe6BiuSYv6a7lRM49pRsa7NFrxlTPwGMDUYaU50NKDvKPX0w6Ax1
         9w3PDLVIKH5jYK4qxWwUmnISpYhTEm8qxA7D14IXuL8Gb2QCs1D+OMPEWSn/ZtuBDBaP
         qZTpKJoMuHNTPOmT/uuipzj2Um8yO/1OTjapTgsy21QgBMJ1OjX3/7a7lqz27KkTRmuW
         CRuT4R3NnwKTu3Huv5BgqBy9vtdzqq1y3wNw1iuA/pcneFvnd7inQhaK9UWd2gsy19NG
         XyAQ==
X-Gm-Message-State: AAQBX9cZ8dqZ1gowMSfRItfIfZzFBosGSs7UasFkQ9ETfeORWhovlWs4
        cQACVmjXlcpRv0qh0q7eR2FeSwpv+o320lQ=
X-Google-Smtp-Source: AKy350bXUyOdQnwpKnTh5pwn2Z58BJIiX3qb6NKTnyLlDlV/PWR/2NVrpWvh92/1KkRXzxoRshzXEZc+XwdEVcY=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a92:1a49:0:b0:315:8f6c:50a6 with SMTP id
 z9-20020a921a49000000b003158f6c50a6mr6481064ill.1.1680807658940; Thu, 06 Apr
 2023 12:00:58 -0700 (PDT)
Date:   Thu,  6 Apr 2023 14:00:20 -0500
In-Reply-To: <20230406190030.968972-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219204619.2205248-1-allenwebb@google.com> <20230406190030.968972-1-allenwebb@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230406190030.968972-2-allenwebb@google.com>
Subject: [PATCH v10 01/11] rockchip-mailbox: Remove unneeded MODULE_DEVICE_TABLE
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     gregkh@linuxfoundation.org, mcgrof@kernel.org,
        christophe.leroy@csgroup.eu, nick.alcock@oracle.com,
        Allen Webb <allenwebb@google.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A one character difference in the name supplied to MODULE_DEVICE_TABLE
breaks compilation for ROCKCHIP_MBOX after built-in modules can
generate match-id based module aliases. Since this wasn't being used
before and builtin aliases aren't needed in this case, remove it.

This was not caught earlier because ROCKCHIP_MBOX can not be built as a
module and MODULE_DEVICE_TABLE is a no-op for built-in modules.

Fixes: f70ed3b5dc8b ("mailbox: rockchip: Add Rockchip mailbox driver")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202212171140.NB93eVvI-lkp@intel.com/
Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/mailbox/rockchip-mailbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index e02d3c9e3693..1f0adc283d1b 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -159,7 +159,6 @@ static const struct of_device_id rockchip_mbox_of_match[] = {
 	{ .compatible = "rockchip,rk3368-mailbox", .data = &rk3368_drv_data},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, rockchp_mbox_of_match);
 
 static int rockchip_mbox_probe(struct platform_device *pdev)
 {
-- 
2.39.2

