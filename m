Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C64C6775A5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 08:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbjAWHf0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 02:35:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjAWHfY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 02:35:24 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80B8166DC
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:23 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id kt14so28133164ejc.3
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTTaF5DXTYx8lSJcnr7SChzDK+nG29bhSj5Md7rU3Jc=;
        b=bpPugIjoJB7+wPrko9UFj/PRsBIeBrF0SNWFyx8/ag3PHTAGAI+S/RtnFbcwYh3Mnr
         VxAnX/pSpaBz7UnEC+7DUiRg9Ldr+IpyCiQD9Rcylpu4EP8kMWU08/vDkrgKSgoZ/9Ab
         AdM4hr/CZAOwKteF+wfmhRcFpCJgPccmHA2nyWwEKRSqBi38RelLtdY6paQpli0n47/x
         dD0qgbpkm2aWwQHO1R6r4iJbU8BDCq2qFK0FHkqAPuM9eS4JPcCnrPhXZeMyqOGMbTed
         aTZQ0b9pDCadIxDPnfzDguW8Z0Lai/PSvP6UWPtZq9lf0fq2i3XrmFXwT5TwdCpTUf4O
         xjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTTaF5DXTYx8lSJcnr7SChzDK+nG29bhSj5Md7rU3Jc=;
        b=eP70rXIMJXbZGBFf9FW4LOdH0Qp68yy9H3BIlMHX0uEMfbNL3EvaCLQ1TnfQpY/Y2Z
         EMIA9BqvIKVHg6Va7zi5BFLfdvXRPUWh0np4Jb5Z2qVbkANDNahjeaGtXccyDQvAY5Ps
         XkcU7rWZbt7r1n+TbJwn8OZo6VhMfKuzUO318ERWwXAM+8ZHRYEHx3F9ZZk/woFu/MR8
         si012xCqoTogG55nxAKwT2eL13QiiNDA8BBDTPsJvciuwXJXmlHnJ0OejQaqCKHCRbjd
         1hUB9Krok31oXu7i0z0UQAdWZDoSNvkMhnJJPw8BF/UnZAjDfdowA8fFHsWdYamA24q+
         I6zg==
X-Gm-Message-State: AFqh2kpCi1boggcOyu0vxTWtvWsnU7dr2CfeiUEb4ERmqsotBVijOb4d
        hgrz1ui+jnoyhKT4GpYPdVWrDhs/ZBdl+eEV
X-Google-Smtp-Source: AMrXdXsH/QJL7+Rd/0HHzh68oW0EetxKqBPVgqln3y6AKRUWd5MfNHYj72hyECu20OeYippJtbhOQQ==
X-Received: by 2002:a17:906:f6ce:b0:877:9b5a:bd51 with SMTP id jo14-20020a170906f6ce00b008779b5abd51mr14165888ejb.72.1674459322163;
        Sun, 22 Jan 2023 23:35:22 -0800 (PST)
Received: from localhost.localdomain (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906155700b0084c7f96d023sm22104821ejd.147.2023.01.22.23.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:35:21 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] usb: fotg210: Improvments
Date:   Mon, 23 Jan 2023 08:35:05 +0100
Message-Id: <20230123073508.2350402-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These are some FOTG210 improvements from Fabian Vogts tree where
he's working on using the driver on the TI NSpire.

They can go for -next, these fixes are not really urgent since
the patch with a Fixes: tag is needed for an out-of-tree system.

Fabian Vogt (3):
  fotg210-udc: Add missing completion handler
  fotg210-udc: Introduce and use a fotg210_ack_int function
  fotg210-udc: Improve device initialization

 drivers/usb/fotg210/fotg210-udc.c | 85 ++++++++++++++++++-------------
 drivers/usb/fotg210/fotg210-udc.h |  2 +
 2 files changed, 51 insertions(+), 36 deletions(-)

-- 
2.39.0

