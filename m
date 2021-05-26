Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41552391852
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234930AbhEZNCf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbhEZNC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:26 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BACC06138C
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:53 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id b191so676572wmd.1
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nWQ+dGkib5DQMg+R+hA7frJhGrDbcK33rjn0/4gfMZI=;
        b=Zk3CukMJf/dJMXBbHW21xznSD8Wt3+CcmCDgEXWwSXPbziin9IQq1qnnJoJLF5445P
         42g5b78lDteSF+PWLHKzvgkedj6w5zW2U+GUSZvEOUh9U6Uaxj4DejZfD7YLaIxhbLzd
         F613wQnC3fEeoP5b4a1yWGWlRSP/Gw2YnLg5TjftNs6lSCRuu7OqnNpDIX8w4jleUA+e
         Ff3T6xiQX8gjdyEdBqq56XLGQR8yn+w0wu3qjj21oSRY2rEAkRNfcA6khy/G1SmRsbdy
         VRV9vbQ5v1LTK9gCjstDvsQuaXHlFyIC1W0YrmLsC9KEN5DdIFYbvQ40FZEyF8nLZhF/
         Gh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nWQ+dGkib5DQMg+R+hA7frJhGrDbcK33rjn0/4gfMZI=;
        b=uLKFIF8DbT6th2iyUgVVum6pF/mErL123Gy6yrsqEsThQAuKp5SchNml1eTR3cEiXs
         UxUsUr401HSpUnoAA55mnynO+qINHdFDLpn0xsQU+Zan3MRlsi9gb85aHkfBe0n2OFhw
         /p6ZFFJp9594p+F0cBHE+sul7pSRw4Tj2+rg7JEupGJj5yRsN8S2ArNY0wR+/u9yY/Fu
         qIE1BKfj2Fkm3+lgB2GOwykllv+1W538d1lLPqimlzFOklMs4fb5xkgbFSM8JbrBD0WB
         /WXdKT09o4a548S5e08NMvk4TotTUl/XUGUlRrwBJ2n5drqZ9iUlr+OPX61qi9wYhiKf
         u1lA==
X-Gm-Message-State: AOAM531xYpsVwQhcmtEGJaZuGspGDXfUoKWlMCiVURg9Mmez0lsMPzE0
        RfdN4IM+mO6wBOavZ8DQHYpWjiwo2ICSmw==
X-Google-Smtp-Source: ABdhPJwWmb/Kkxx3XwJGZhwQ5XxgRJr6DaOzbZh41z2m8M29MMCXDoZt4sxszuuSYpMZvBgCB9iCdA==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr28347837wmi.63.1622034052316;
        Wed, 26 May 2021 06:00:52 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:51 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 06/24] usb: isp1760: isp1760-udc: Provide missing description for 'udc' param
Date:   Wed, 26 May 2021 14:00:19 +0100
Message-Id: <20210526130037.856068-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/isp1760/isp1760-udc.c:150: warning: Function parameter or member 'udc' not described in 'isp1760_udc_select_ep'

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/isp1760/isp1760-udc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 3e05e36054357..a78da59d6417b 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -137,6 +137,7 @@ static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
 /**
  * isp1760_udc_select_ep - Select an endpoint for register access
  * @ep: The endpoint
+ * @udc: Reference to the device controller
  *
  * The ISP1761 endpoint registers are banked. This function selects the target
  * endpoint for banked register access. The selection remains valid until the
-- 
2.31.1

