Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09975FE468
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 23:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiJMVtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 17:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiJMVs7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 17:48:59 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7155B16F42D
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 14:48:58 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 70so3171566pjo.4
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=dKlD2Mcc6dt1mqt7ZvNDmGn19DoM+ztOLAKStgJjo3o=;
        b=GCCXHvCPbnzd/uh8c41H76YI1Hbdg9mDhLyz3H5wJf7sx4FYDx2h+0UmRlXplcJeeH
         uU66ytFmEFLWqFJViQoHw4CdjjlZ5tBqEvxAtkUQJbgcuCb2n4wa82j12e+4U16FeBhT
         ZIXpIy/cn3aPKf8ZDJBW85Cjl89rkIE5XOu4CvK1geobv3QjQfqfwxFsqZlawJgBlNYR
         AMtBMUThNBeGV1sMt041vBZ4P6ypCOhxCwSOZuc/hvstg+vIfJySXMy/QekzfwNch+TP
         c9PZfJOojyKtYOIJSk5phAr42A8uPD5yV2R6tBSjCDiWMk5JyrYaywgccKsvTEEwk9ID
         uYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKlD2Mcc6dt1mqt7ZvNDmGn19DoM+ztOLAKStgJjo3o=;
        b=QFd8bzeIJxIQAJ1ZTEUyQ/igBa9qhn1IuB4ltu1B2BrnICd8BZnMqCo4bgMPGFvthN
         NzTOL2t6tNY3MXUlXkj1GdnZkvaYfr/9KhCBmBluDQkOZEA5hRIyQF8zdcGMALIHU2Ng
         1EWx5fQWtQEr04HDeI9hqTofyGWUu64DgRlLSYvGj0GkrbG8xLI7U5weVBh+NOtvWgWx
         j3Zh3T5otQJ3D9l3apBiVnIGkkiNwWilk9TPVK8wGoIfwaKtERakpaIc8wPwKLsVpQhm
         piT9XlFUF52CRaSryphLQxgmz6CbAre+uVRqTEcm6GLxmqMU8H43l9K6r1pa+Df9xzrZ
         y1dw==
X-Gm-Message-State: ACrzQf27AjL0x4KAqFa9Fdtxx8tt+nJMLCKtoCWTzodA2YKB0I/vkogI
        +4sIaXuX9lSzpkO4uymZZ8LOcw==
X-Google-Smtp-Source: AMsMyM4fPFc/1FWGHD0Yj6s/PltanesGHTpHAg8a3f8v/HyLccdRGcJ3YIncH2LaSwsgJTci5h0muA==
X-Received: by 2002:a17:90a:a088:b0:20d:67b7:546d with SMTP id r8-20020a17090aa08800b0020d67b7546dmr2137835pjp.6.1665697737917;
        Thu, 13 Oct 2022 14:48:57 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 8-20020a630308000000b0043c80e53c74sm179817pgd.28.2022.10.13.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:48:57 -0700 (PDT)
Subject: [PATCH] MAINTAINERS: git://github -> https://github.com for petkan
Date:   Thu, 13 Oct 2022 14:46:36 -0700
Message-Id: <20221013214636.30741-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:        linux-kernel@vger.kernel.org,
           Palmer Dabbelt <palmer@rivosinc.com>,
           Conor Dooley <conor.dooley@microchip.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     petkan@nucleusys.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Github deprecated the git:// links about a year ago, so let's move to
the https:// URLs instead.

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I've split these up by github username so folks can take them
independently, as some of these repos have been renamed at github and
thus need more than just a sed to fix them.
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f5e5c152d3c..3705c487450b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21047,7 +21047,7 @@ L:	linux-usb@vger.kernel.org
 L:	netdev@vger.kernel.org
 S:	Maintained
 W:	https://github.com/petkan/pegasus
-T:	git git://github.com/petkan/pegasus.git
+T:	git https://github.com/petkan/pegasus.git
 F:	drivers/net/usb/pegasus.*
 
 USB PHY LAYER
@@ -21084,7 +21084,7 @@ L:	linux-usb@vger.kernel.org
 L:	netdev@vger.kernel.org
 S:	Maintained
 W:	https://github.com/petkan/rtl8150
-T:	git git://github.com/petkan/rtl8150.git
+T:	git https://github.com/petkan/rtl8150.git
 F:	drivers/net/usb/rtl8150.c
 
 USB SERIAL SUBSYSTEM
-- 
2.38.0

