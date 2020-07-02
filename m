Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F812126A4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbgGBOq6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730034AbgGBOq5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB03AC08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o8so27099819wmh.4
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kZQeJUz+ErJ6yE5aR4TJ6dhksayixlSTB2k3nGSWLOM=;
        b=EmGnkDPALpzLOYQpEWxWIHKjJi1QPdROlga7PolW9eoc2fctcHjv9A3rBSoQzpnGVp
         8PfqKc2hmGPJ7C4BmFS0/+f1wti/7JErmkD2W8yyRMjypPlwK6A36wVpTDLwyDQg87sw
         c0uu9+dF+Ug0g9aw3Q4mYqsHAtgNH8/XLOM5hiwW0CRDrWgad5eFiCp87XpG+pFKWWqx
         LuX983vQCmCEepm8sMhjowkgnJS7kOwY1pekRce9IZQL8MQQ4dn+hkHQkftKnTTGaDR5
         900F+B1dg7IZ5BbGwkWizO0a35THYtH7qGGs4CJRdyIVW0UbbSb2o9jXD5Xq0qGGeOk+
         KnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZQeJUz+ErJ6yE5aR4TJ6dhksayixlSTB2k3nGSWLOM=;
        b=Y8NPUTtmsM0XWTLnjdxQO2B9u9p0GeCT++7X/mTUcInACR9ZBgmXg99+Sc5eHN0zbF
         A2NUUG+5AymoaiR2GQmVLSOCrJ4LTyKy/tyi2zgWpn+j4OuU5Wapqjd7QWZagJms/RjD
         LXbD8p+YAu6IFCV/+TK8Jl0Ez7bTpIir/TN0IyEQSwLwhAsVs/OQA+sXxCPKHppWLcyr
         94F/GFUvTEdX3m++yNf1b/5ZZwg3D8wMfd5acAiAMKQ0fS6V2JfEkr8yKvtD/yLOdO5S
         jVqX26ow9XtwL0R8Cg/97W6aXI+91EXXRfDLIdB/qMA2juttq4xo+IYisTGo+cYXP8tC
         VUng==
X-Gm-Message-State: AOAM530ktZ4pc9PHLoGTyVZ5cwV4P9hiwnO6CuvciumYolnM0n6o4Ujv
        Ujk6Tzt3hQwkIr+iQUILdI15Sw==
X-Google-Smtp-Source: ABdhPJyxMg7EbHaZ/31OlfupBkIBsGFOwrld5FUmxjo0/JeKjE8jPmiIcgJijoZ9w17/iOlzpi1ktw==
X-Received: by 2002:a1c:b4c2:: with SMTP id d185mr30552951wmf.57.1593701215544;
        Thu, 02 Jul 2020 07:46:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        "by L. Wassmann" <LW@KARO-electronics.de>
Subject: [PATCH 19/30] usb: host: isp1362: Mark the many unused ISP1362_REG entries as __maybe_unused
Date:   Thu,  2 Jul 2020 15:46:14 +0100
Message-Id: <20200702144625.2533530-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It would seem a shame to strip out all of the unused register entries,
since they can act as a fair source of documentation.  Instead, mark
them all as __maybe_unused to show the build system that this behaviour
is known and intentional.

Fixes the following kernel build warning(s):

 In file included from drivers/usb/host/isp1362-hcd.c:96:
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_OTGALTTMR’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:199:1: note: in expansion of macro ‘ISP1362_REG’
 199 | ISP1362_REG(OTGALTTMR, 0x6C, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_OTGTIMER’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:198:1: note: in expansion of macro ‘ISP1362_REG’
 198 | ISP1362_REG(OTGTIMER, 0x6A, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_OTGINTENB’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:197:1: note: in expansion of macro ‘ISP1362_REG’
 197 | ISP1362_REG(OTGINTENB, 0x69, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_OTGINT’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:196:1: note: in expansion of macro ‘ISP1362_REG’
 196 | ISP1362_REG(OTGINT, 0x68, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_OTGSTATUS’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:195:1: note: in expansion of macro ‘ISP1362_REG’
 195 | ISP1362_REG(OTGSTATUS, 0x67, REG_WIDTH_16, REG_ACCESS_R);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_OTGCONTROL’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:194:1: note: in expansion of macro ‘ISP1362_REG’
 194 | ISP1362_REG(OTGCONTROL, 0x62, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_HCATLPORT’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:183:1: note: in expansion of macro ‘ISP1362_REG’
 183 | ISP1362_REG(HCATLPORT, 0x44, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_HCINTLPORT’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:175:1: note: in expansion of macro ‘ISP1362_REG’
 175 | ISP1362_REG(HCINTLPORT, 0x43, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_HCISTL1PORT’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:171:1: note: in expansion of macro ‘ISP1362_REG’
 171 | ISP1362_REG(HCISTL1PORT, 0x42, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_HCISTL0PORT’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:170:1: note: in expansion of macro ‘ISP1362_REG’
 170 | ISP1362_REG(HCISTL0PORT, 0x40, REG_WIDTH_16, REG_ACCESS_RW);
 | ^~~~~~~~~~~
 drivers/usb/host/isp1362.h:59:22: warning: ‘ISP1362_REG_HCINTDIS’ defined but not used [-Wunused-const-variable=]
 59 | static isp1362_reg_t ISP1362_REG_##name = addr
 | ^~~~~~~~~~~~
 drivers/usb/host/isp1362.h:77:1: note: in expansion of macro ‘ISP1362_REG’
 77 | ISP1362_REG(HCINTDIS, 0x05, REG_WIDTH_32, REG_ACCESS_RW);
 | ^~~~~~~~~~~

Cc: "by L. Wassmann" <LW@KARO-electronics.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/isp1362.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/isp1362.h b/drivers/usb/host/isp1362.h
index 4c49688a069d1..9bbfcc3fdd3cc 100644
--- a/drivers/usb/host/isp1362.h
+++ b/drivers/usb/host/isp1362.h
@@ -56,7 +56,7 @@ typedef const unsigned char isp1362_reg_t;
 #define ISP1362_REG_NO(r)		(r)
 
 #define ISP1362_REG(name, addr, width, rw) \
-static isp1362_reg_t ISP1362_REG_##name = addr
+static isp1362_reg_t __maybe_unused ISP1362_REG_##name = addr
 
 #define REG_ACCESS_TEST(r)		do {} while (0)
 #define REG_WIDTH_TEST(r, w)		do {} while (0)
-- 
2.25.1

