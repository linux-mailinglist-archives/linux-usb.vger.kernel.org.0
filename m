Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEF35AE29C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 10:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238801AbiIFIal (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 04:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbiIFIaS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 04:30:18 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879961F2D7
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 01:29:46 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so9095791wme.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Sep 2022 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4Rut9/WgB5Z4NKZgybzJxTOr7Gu6E5F7bb+M3Y+u6dY=;
        b=AbGpfXHe4fNRqbSsnp5kSX4dvwaKSG7IOxuSafPGwn4V3i3z9/g1hVnlrP51WpjGm5
         TLtTyaJfCV7Hv6AyzPVDedZOzwWKVc6Thj+YgI/vd2AmaKaVo3RuvI1GZ8u80lVErNt9
         5Uk85RkyiTEKaw5i3eS4d4DsM9MtqWmQI98thUv537IKMwduIhxPueyekIYrukNOge7U
         17mlpUfp/oJZuefek5vJVWW5GQpcEm3rYtUhieKHaGSElF/H++hipDfKNkHxj4/TGoW3
         0gREYoplQ63nE/bLw+Q1cCfQO7id+ooaM6AgfyBsHQBm/RfGE1JwQedksErlBgG4qZ5E
         7tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4Rut9/WgB5Z4NKZgybzJxTOr7Gu6E5F7bb+M3Y+u6dY=;
        b=5IzaapzS+X4Nz7VaP2l73OF6hRzYCsXpfv5u1A+OnB9b1wOKVSMTZvLDeMPamtfLxB
         Oe3SJvaFhRkapJ5zxS0hTwDUZZWSUk6YtOarYsrGu2Kut9Eipnp1fs+g1kp3UfPnESOb
         sKfzWSwmIH0Zu6v9BE5NuPga7Sbmmro6xMQUFUOgIDzbkt4XAkHXCBV3506y8+z3LcCS
         eiZ9PMoj+/slmV5ZitLBhEwaI3AQK1DcOzhv+zDQr95cRTNKgPiMeANcNBZ2NC4EsxJu
         1ldPREuf5zemKbpoXzuruBjhQh6vxq2Dyfu3w2LXfjg1C6DdJNnBogZLz3DQCLR0ux1A
         fYGA==
X-Gm-Message-State: ACgBeo141mKlLtNflwrZo9jqVHrjJX2x1Va7ivABw8GMchoKf358v0Bv
        7Cu1SYLgWeU25vfw0n+xXrenAQ==
X-Google-Smtp-Source: AA6agR5HzfEJw03q1lKJc/U0wKdhXtdahXU2N7brX5xD3yDapMAK/VwSR5OUhvxr/p7zAWx6JBAFug==
X-Received: by 2002:a05:600c:3b8c:b0:3a6:71a:f286 with SMTP id n12-20020a05600c3b8c00b003a6071af286mr12741602wms.120.1662452984866;
        Tue, 06 Sep 2022 01:29:44 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id q10-20020adff78a000000b0021e6277bc50sm13752248wrp.36.2022.09.06.01.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:29:44 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        neil.armstrong@linaro.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/2] usb: serial: add myself as maintainer of ch348
Date:   Tue,  6 Sep 2022 08:29:34 +0000
Message-Id: <20220906082934.2046584-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906082934.2046584-1-clabbe@baylibre.com>
References: <20220906082934.2046584-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since I did the driver and have hardware to test, set myself as
maintainer of it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 399d2bb08a4a..56900292e40d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4821,6 +4821,11 @@ S:	Maintained
 F:	drivers/auxdisplay/cfag12864bfb.c
 F:	include/linux/cfag12864b.h
 
+CH348 USB SERIAL ADAPTER
+M:	Corentin Labbe <clabbe@baylibre.com>
+S:	Maintained
+F:	drivers/usb/serial/ch348.c
+
 CHAR and MISC DRIVERS
 M:	Arnd Bergmann <arnd@arndb.de>
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-- 
2.35.1

