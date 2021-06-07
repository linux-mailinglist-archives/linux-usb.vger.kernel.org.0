Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308F239D78B
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 10:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFGIlW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 04:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhFGIlV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 04:41:21 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785BBC061766
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 01:39:30 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so1699098wms.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0Ls7RGiqur76yMNTl82bvhxlr41Kx4mSL6TwL2d7YQ=;
        b=nuQeZOQt0mBwgyL5sQq/SdJ+2WpcNY6PUrumTx19Zvl4jKyOXAHgpZoPnRSFbBQ4Dc
         7M5RPy6EVFNisdM0JL7JyjnmUM1kZSbC8IaXRafmZUz2BPM82wmR1VY3jaA0+AxySe5x
         EuQ783hRMyd54uViWEN8+S3yjkHUNJWMXXJ36KGg/849YmyNQZkk9nQC6+wO/JTu4vxy
         t/HPZq85FEB9aBWoHxbvFFiS7e3uxMrppHnJPK/JmTYoG5BBXPDf3vASLaLMZyjOdat1
         MyOYiyZPyQ623w18N/7EVESK0KZIv3064aXog/nwGS+S3wPKtvcGiFHgH+TQIlhZX/Kd
         BNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0Ls7RGiqur76yMNTl82bvhxlr41Kx4mSL6TwL2d7YQ=;
        b=tIjIRPZDbonfG6UhqFuoZHENyvNHTeJYNIzk6Pg6kzKZ0TPoPMoQSyiZNXjpWvrJEl
         VyhitWpPSnZML4IGZlHsiGhDeOFVjf3SMHtwtQVr2GfLvj6p+cRc67Ww3xqJ1S2jlrG+
         mGvgyS9qh2KYsEjc/q6M9DDJC1TatOJx1ZTt294qFw2zuKSIBKJwDSDtRdiReKlFxY6j
         kZ7tZpVGQjprWBJglFp3UHmC7k4vbgUZTiojLudsY5FltLn61CLWV5rlv4eWpwxbJdlx
         +91aZ6Box032VzrnsI/WanluQLpFzOQiQQv9R3rz7ncr0r9FvCpAHFE9CO5qTodjg6cx
         llrA==
X-Gm-Message-State: AOAM5305/CSaEzdr4zv4aKHFSqy3uyWL+txER+Hq3QGQvoqbMqZvJiJs
        cW9DDEHe7Nii4heV+rHx1qHzRA==
X-Google-Smtp-Source: ABdhPJwlLwMrdXBwnoq1pGpXAY0Q6voXa8uOVmFUnMF7Dge4IrYWuxpLUiA4wVrcLyGopUh8Zm+XZw==
X-Received: by 2002:a1c:43c3:: with SMTP id q186mr15709736wma.33.1623055169107;
        Mon, 07 Jun 2021 01:39:29 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id n9sm13908794wmc.20.2021.06.07.01.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 01:39:28 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] MAINTAINERS: usb: add entry for isp1760
Date:   Mon,  7 Jun 2021 09:39:21 +0100
Message-Id: <20210607083921.38441-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Giving support for isp1763 made a little revival to this driver, add
entry in the MAINTAINERS file with me and Laurent Pinchart as
maintainers.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 503fd21901f1..254803fe599a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18869,6 +18869,14 @@ S:	Maintained
 F:	drivers/usb/host/isp116x*
 F:	include/linux/usb/isp116x.h
 
+USB ISP1760 DRIVER
+M:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
+M:	Rui Miguel Silva <rui.silva@linaro.org>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/isp1760/*
+F:	Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
+
 USB LAN78XX ETHERNET DRIVER
 M:	Woojung Huh <woojung.huh@microchip.com>
 M:	UNGLinuxDriver@microchip.com
-- 
2.31.1

