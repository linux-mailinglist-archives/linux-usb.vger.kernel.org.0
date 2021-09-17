Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250FF40F4B0
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245747AbhIQJXl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:23:41 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53406
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245625AbhIQJVH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 05:21:07 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 47D5540267
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631870374;
        bh=p6HUPon1kszCQMILCC0vROc00hQT65Msl8k6wuLckrA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lFy0pT74E0l2JGYrZIDY2QmiYQWcu1Hx7F8X1Yr2n5w/80gzniJU5pCsEHss57AH0
         ojOH1x+f9aFN0gejfhGOZVY/spvTnL+4+y9Z4KwG9JBSWGLnGSiHDYhh3rUs5KFjf/
         I92kgNjs/aXn0dz4CQUmF09YejGIhQ3xjUSLdBV24C6NPF8ErWcKW8MN7A2Rv0KUVm
         ASQD9nT7SH6k2iyGNs0+0FGYv8xVN88gRdQVGhLd4yBhkpKFWboTKGQxn0qb7MVHsX
         hc7jprp1hNCosdGrmNTqezBhG5Y9CIbGh5wbGs7BxPgjECem5OX9i3j+9pGIV1lEx3
         sLOViSCrVYpUQ==
Received: by mail-wm1-f70.google.com with SMTP id 201-20020a1c04d2000000b0030b3e4fdcfbso1587415wme.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 02:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6HUPon1kszCQMILCC0vROc00hQT65Msl8k6wuLckrA=;
        b=MdXDdrQQKo76WRi4olpI+rx6437v0SpYZU8z1g8EkrA9DjJJ/bk7NejbsM5IOsRF7g
         QrAiglubJSKCDnAi4afIJVsHfh3p3eL+0T0J0w1/qlhUQCDzekzMJIeNiN/6cRWgMrCg
         OLWfU5rJt0PrAHFtelq9FGng4yqreprK6FEeX7+4SjiPfB4XDlbrC4e7AuH1a4QTgpgl
         ZjVUL5uJ2c8fuvIl3ZRFVzyXkWUlMdHr+ZdI4rhDrEIo2N9enb0P2JV9SLz2wKxI6wzq
         0M5KQ1ZVp3rMdkExpdy3wwPwwVtPKcekqyE18vBxEYQA4wm9mH2Fe1CJr7Xya+B9EWmD
         ISyQ==
X-Gm-Message-State: AOAM53333A7VPmCwZkGdKG3+buqOqP8WJyCDDUj5rvIq3EElgzx7XvP/
        RutkpmHhiCAbAr2KzbxSAKyJiv84pUYCG/KcaBvzajh7aP6tSpc+4673M4mDQ8/BqnJvMW5mUiV
        oW6JUOhEJ9MNgMdeaW4Q5ZEN2a2ukUi55UjP9aw==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr10954251wrs.304.1631870373494;
        Fri, 17 Sep 2021 02:19:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqXxbeZD6oTBDvipoUVLNYKgzKbf56C8E7jiR0bRAuCgNvovbTiVkTx/4l+xFvSd/2Nf6HLg==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr10954236wrs.304.1631870373381;
        Fri, 17 Sep 2021 02:19:33 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p1sm5678354wmi.30.2021.09.17.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:19:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/3] USB: cdc-acm: remove duplicate USB device ID
Date:   Fri, 17 Sep 2021 11:18:49 +0200
Message-Id: <20210917091849.18692-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917091849.18692-1-krzysztof.kozlowski@canonical.com>
References: <20210917091849.18692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device 0x00e9 (Nokia 5320 XpressMusic) is already on the list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/usb/class/cdc-acm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 8bbd8e29e60d..d77e30625f4d 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1848,7 +1848,6 @@ static const struct usb_device_id acm_ids[] = {
 	{ NOKIA_PCSUITE_ACM_INFO(0x0071), }, /* Nokia N82 */
 	{ NOKIA_PCSUITE_ACM_INFO(0x04F0), }, /* Nokia N95 & N95-3 NAM */
 	{ NOKIA_PCSUITE_ACM_INFO(0x0070), }, /* Nokia N95 8GB  */
-	{ NOKIA_PCSUITE_ACM_INFO(0x00e9), }, /* Nokia 5320 XpressMusic */
 	{ NOKIA_PCSUITE_ACM_INFO(0x0099), }, /* Nokia 6210 Navigator, RM-367 */
 	{ NOKIA_PCSUITE_ACM_INFO(0x0128), }, /* Nokia 6210 Navigator, RM-419 */
 	{ NOKIA_PCSUITE_ACM_INFO(0x008f), }, /* Nokia 6220 Classic */
-- 
2.30.2

