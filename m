Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDED660196
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 14:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbjAFNxx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 08:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbjAFNxu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 08:53:50 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BAC77AC2
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 05:53:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id az7so1328872wrb.5
        for <linux-usb@vger.kernel.org>; Fri, 06 Jan 2023 05:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUbEDrNK64OKvEAVquj2zyofvZOboGLNVpKzKWCcis4=;
        b=DIa8lYnBwvMea6v9bpl6VuYNndqA0WtNVzwx9lmygPXVxljD52vlq4uPQH7eotrl5E
         wxZ1Q6n8956b76/N6IU5xgG14294M9zmKk/qmhFYTlrhacCCq2dKWvC6ofmRM2kEUhCf
         SEUcvqLccDvwVxsNDxIkD/uLzXFIfjwomyp8b+s6M0M9frC5/Vs14rxTtEftAh1uTtMN
         FARufTj0L2j1XZ3w5YUgY4pozphYWvV1FYLax4olB/HCwJLqoodRCsALfAzBF/NY4spf
         6HmXVO7HmL4t0B4UkwgbZqbdxXzuwhj85pQqY4UZfKydNzx0j5fKVuMxoRbIaVNt8XR7
         5VtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUbEDrNK64OKvEAVquj2zyofvZOboGLNVpKzKWCcis4=;
        b=kJu5TK9atVVdYJKPyTjA8/ndNqHx/oMiEnii4T5UxrEamz1SykHfdO46v+UxHDXgmc
         WM8imZ91ueTeEsO2OzCZZh55ZY95/+mWL8UkcHC6bxQ1HVD4lRlye3TyFCzpBtN03vr5
         aNOi14YFNJlR3W0AQUb5FegWQMdRncP9as8g3g9QXjclFOpGx1HYT1Mwp59MxipUHV/p
         kCQWQQjVBW5aMQo/UHkm8b4sm2BnawfaeZqYv/iVM+iHRH7pPysR1Lt2gsCON7vWRX0T
         4DtgWU/2dRz+TerGxWBeo8RygH3HkWFtkJt/6OFNpROH/a7/LSkkk4IKf8Ra6txE4UxA
         VRew==
X-Gm-Message-State: AFqh2kqNNyutSm3GSRjjVAvyfeEf+6HZTu86ojTFMp7/B0eRVIxn5+nY
        E5RhmVmEc7N1YqGrqZuPCBzkAQ==
X-Google-Smtp-Source: AMrXdXszH0PICfL53HjQFvJ+FqUzsZcK5hwHlqMjoLvvR05xn5pzVrr7gNFYcD5ShZ8fog7XTm2I5A==
X-Received: by 2002:adf:d4c7:0:b0:25d:6628:debc with SMTP id w7-20020adfd4c7000000b0025d6628debcmr36904111wrk.10.1673013228174;
        Fri, 06 Jan 2023 05:53:48 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id m7-20020adffe47000000b002b880b6ef19sm1191623wrs.66.2023.01.06.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 05:53:47 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v5 2/2] usb: serial: add myself as maintainer of CH348
Date:   Fri,  6 Jan 2023 13:53:38 +0000
Message-Id: <20230106135338.643951-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106135338.643951-1-clabbe@baylibre.com>
References: <20230106135338.643951-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
index 7729a30b9609..71b63b174703 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4915,6 +4915,11 @@ S:	Maintained
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
2.38.2

