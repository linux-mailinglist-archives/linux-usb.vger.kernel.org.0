Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E1839E4AA
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 19:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFGRDv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 13:03:51 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:54843 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhFGRDv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 13:03:51 -0400
Received: by mail-wm1-f54.google.com with SMTP id o127so94038wmo.4
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 10:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SXhKjHlDafHvLa6+mmKehuSjImxnB705A4SYez/TQRI=;
        b=tUv4sxinXmsyyN/eKnI4+Uc0Up8QGwcoOmqshLXxvHWNwHZjmHnDIyYMKwB3KsES7S
         Fk2HnixEfduMxZgEtLLAoiBucDBjrl0UhDUhmsjAuGcXTkq7dJ0fdshNPrthYo4ZWwq+
         lOQZUoCYzfPmbLbMdmeua65w8M8nRuQyeDqymuMb89jfmiJlcIdeFPCfIOPQ06Hv3RQe
         4TddyQBP8BfuV2Lx01gPBtFw9NjE6i3ZExMpAYNB1fQ+NEHwOwk+HR7BsD1JmoU/uIvO
         XTf2TfSdTPR8YaX0B1ZYnuofQZnp9Jx1Al9IEuULIvLiobw4Sr3yUeHsxucaiooIg59g
         5Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SXhKjHlDafHvLa6+mmKehuSjImxnB705A4SYez/TQRI=;
        b=apgcvFMI9ezEREKM0I5rAHmLOll4Iz/K2gLD0OoUjBfzIx6L1f4Zf1bUlRTNaaeCdW
         j+ta6Y+mRxhMoBVUuP4m/k+DQzG/TPGbtXaT9nU7g/8IgqRc7rhGhiyNuqAk6vQ/tLj7
         ORCVAeNWcNGYGVI8XAOzjybyrLU8CKjoVzFO6mn1RXgwUVA1DAIalreLmvJwCLMqbZui
         ky4HZEiOBAxQ4NdQU2CQ6tZKcZIJ1NQc5iaXyUILyUxQPvv/fK5tGKAL1bjlqUJQLFyE
         xkaBtGIu2uIEZ0146XfQh2uBeGQg4ZOMffDzyDWzT5X5bdCu+ttywv0dm/YbxfJNjHNt
         a/Rg==
X-Gm-Message-State: AOAM531Xo5SzWu0fosIH4e8nYeUJHZyk07eYQAWEDA1gL17/33tb/AnZ
        5QyU2JhGanfQs5LyB0Sfa6fwZw==
X-Google-Smtp-Source: ABdhPJzo0VMIuYu2D3oy69TyKcHdG8ChbGvIASR6XBQF9PDPfIxT5y1gTIm/pYn+CDpwvH0545tRQA==
X-Received: by 2002:a05:600c:255:: with SMTP id 21mr105644wmj.46.1623085259131;
        Mon, 07 Jun 2021 10:00:59 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o6sm18649122wre.73.2021.06.07.10.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 10:00:58 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3] MAINTAINERS: usb: add entry for isp1760
Date:   Mon,  7 Jun 2021 18:00:54 +0100
Message-Id: <20210607170054.220975-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Giving support for isp1763 made a little revival to this driver, add
entry in the MAINTAINERS file with me as maintainer.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---

v2[1] -> v3:                                                                                                                                                                  
     - remove Laurent completely

v1[0] -> v2:                                                                                                                                                                  
     - move Laurent to reviewer instead of maintainer by his request                                                                                                           
       because of lack of bandwidth

[0]: https://lore.kernel.org/linux-usb/20210607083921.38441-1-rui.silva@linaro.org/T/#u
[1]: https://lore.kernel.org/linux-usb/20210607101538.74836-1-rui.silva@linaro.org/

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 503fd21901f1..28ebc6423cf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18869,6 +18869,13 @@ S:	Maintained
 F:	drivers/usb/host/isp116x*
 F:	include/linux/usb/isp116x.h
 
+USB ISP1760 DRIVER
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

