Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8001A255DE8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 17:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgH1Pbi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 11:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgH1Pbd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Aug 2020 11:31:33 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7ACC061264
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 08:31:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f26so1754442ljc.8
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FumSa2z8t6EvYT1e3m3L2wM+/ptAnWKmJwGurEQqWBU=;
        b=iDDdxzM2tMhCZgRsIJYs+QnHBXrI8IkcPcnfk0Y+lQl2XNTm2FqaWyUE4tW2k5SlLK
         7aDQ9sYCa7gKfZbKuxuoDEEmuGcNBkv9wzyNXBhqaixYiIyO1CEl8vpxzQYivQ5alJLg
         CsbSwMVwK8sgJbJ4Ov3OGkFYgwI19VY2MGy2D3rRVpaGtAXlcveMBW9H99CJPAcqTb+H
         yYzScRJRYkEh9IFsg5XtNIR6l+Z471QsS9S/n0sLv3LzQvEVD8mz2w0WFz2YkZA6EYEp
         tucxJZ60nrAu2GQCWJZ9h+7/omPJWu5p2hpIMmicXQaze+XtmAf/2arYA+Kh+SDTmle2
         cbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FumSa2z8t6EvYT1e3m3L2wM+/ptAnWKmJwGurEQqWBU=;
        b=kEmfTyyu1T1VHnpp3n/+QkuzMcrQav0LwcETOb5UZ2MapBZiHLQXFH+NMAFGzGouy8
         4fIoGJvgPMq+GgU13sE5ceFg+yuSg7HCKNICTykvbT0uuQjdQazyr4p9utV2F35CJRVU
         IKQy9F6kaGTDMcPZGGgz1OM3l9uvB8jQ0wg/OmHy3lbfnOM6fgjTkbXG5jenctHzYaCW
         FF9RKU0LjG76FP8L5DGgieNazkUHamewd8JJEk7Ue4E62AUATFcDO4KuEdIS0iB/OJWd
         Kh0BPtE5NkCIx+kA/lxrN+ycEpc23PoWfpdsefE/IELwsOCysDdBPvg/dQ9huu/2Btok
         1MGg==
X-Gm-Message-State: AOAM533UX88cn7s1dOJezoryopveESWBgUC+YofPGH3zq0fKEjxjmPe2
        Pu8H4W9wsNr87vaZ4Louh03RDw==
X-Google-Smtp-Source: ABdhPJzgEqCpnTGKY1dzuWVBbJ3aRyh6xyNvzRwq6Gi57FqnZL05ULsLANG6q/8DDBCVCMg+br7qpA==
X-Received: by 2002:a2e:7c05:: with SMTP id x5mr1050167ljc.451.1598628690871;
        Fri, 28 Aug 2020 08:31:30 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id z24sm216980lfe.54.2020.08.28.08.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:31:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] usb: gadget: udc: Drop surplus include
Date:   Fri, 28 Aug 2020 17:29:28 +0200
Message-Id: <20200828152928.83158-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UDC NET2272 driver includes <linux/gpio.h> but does not
use any symbols from this file, so drop the include.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.9-rc1
---
 drivers/usb/gadget/udc/net2272.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 44d1ea2307bb..440bcb3b6c23 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.26.2

