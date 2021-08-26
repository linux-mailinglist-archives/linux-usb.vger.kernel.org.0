Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFDE3F8602
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 13:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241855AbhHZLDj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 07:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241849AbhHZLDe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Aug 2021 07:03:34 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4211C0613C1
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 04:02:45 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id i21so5393830ejd.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sxJJcu/TfCUqsX/b1XreoR65hy3NGzjv/vIjvntQEyE=;
        b=DYf33382M57vegZqvx0fJNrIxj6j4Q5Xold3ASMLndLsZDDnl870VM0F5TX6sal0s/
         0VfjNRKoD4LDv1c8K0SR3DWdL1CXlYuObxBp+UrRCRceEzZqNyKNjEXP64E8nyU92dYv
         Ehs/qCxyk+CXf5+/ObRhLrOyNiSYLw/toqUU+xgumIz3KUvSzS940yl57AlVBhseT9j4
         b/7KoIoKBP1VYz9YukG/F2tgiPL6LS+olgxE8lZrbfx/mDD9adnaSyc7ZUMsiT35yNxl
         m1ojhDs0uBmb8B6TSVoKzNMGC58xxw7k27ldTy9gZr3cDN65+hTNGXm960QgnDoFjnl6
         gAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sxJJcu/TfCUqsX/b1XreoR65hy3NGzjv/vIjvntQEyE=;
        b=ocQQS2iV0ZVQFAQMEpYsNVpWrAgQ3kSeWLi+iV6XvDJswcpoYUpo+/At1KXT/W2Vff
         i7dFHM2WX54fk3FjHqGIAZv73QHH6SGUtF3pUZzsPA1MTdtJqiPgvhg10BRZHga4vUjT
         X5vXs+SkShMdxCHYqEbFsiVFt9qrkKW9xcJLik4CQUUoc6I2Lj/deL8ZZ1copJJ4BfYf
         DqYA2c0As22oBXew8fCKwZ8iScvq2WbM1UORz+H+bB+aSNGXs2tgXBU6YyqefHSiHSVF
         ri8uUCaPuNJ/6aq1dzXpAyGRZDjGll+W+BjMMUN0sLTz3AYv9qduqkxglgUvZzkw/NGx
         5RfQ==
X-Gm-Message-State: AOAM531kaipaM0ER1zelOcyOUXVxzZNHI55w5QK8ZGVbyRScQAZLOHXg
        VMNLR93vksLRSF55BQ3AVaW99A==
X-Google-Smtp-Source: ABdhPJyNYr4tr91nWVSyfwfrRRLQYEqu7F3LC/OzBCJuksItbLeuNXWlAsVBT2cr6Orr14HdvIv8Ow==
X-Received: by 2002:a17:906:7154:: with SMTP id z20mr3618448ejj.547.1629975764506;
        Thu, 26 Aug 2021 04:02:44 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-67.xnet.hr. [88.207.98.67])
        by smtp.googlemail.com with ESMTPSA id t24sm1198130ejf.48.2021.08.26.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 04:02:44 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] USB: serial: pl2303: fix GL type detection
Date:   Thu, 26 Aug 2021 13:02:39 +0200
Message-Id: <20210826110239.5269-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At least some PL2303GL have a bcdDevice of 0x405 instead of 0x100 as the
datasheet claims. Add it to the list of known release numbers for the
HXN (G) type.

Fixes: 894758d0571d ("USB: serial: pl2303: tighten type HXN (G) detection")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/usb/serial/pl2303.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 2ce9cbf49e97..3b579966fe73 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -433,6 +433,7 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		switch (bcdDevice) {
 		case 0x100:
 		case 0x305:
+		case 0x405:
 			/*
 			 * Assume it's an HXN-type if the device doesn't
 			 * support the old read request value.
-- 
2.31.1

