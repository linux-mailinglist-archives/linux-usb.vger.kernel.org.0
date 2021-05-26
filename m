Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0696E39184E
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbhEZNCa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234539AbhEZNCX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:23 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA722C061756
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:50 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v12so1049773wrq.6
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wClzZvICbZY1gDqbs5K+gmqfI5n/KTxqQt4Q33U0XvY=;
        b=VpxrOtJd113lP+VjeEIN7iNWNT3vxTAUF/jCgeAQmbLtvfWY4e+ytfafM1dhU/m4DT
         UUSP1iUSbi3bMSzTAoliO7w/28GG32EaQ1/GzU8XPedUzVFsLnO2c8n2WKb8L64VIEA7
         uT2zbHKlwICxHjmng6VP3DR2bD1esx2/dTBOuZTZuR0dKbrXspv8IO/7hDq7FDieTRrs
         hJqhs7qXUDi0ZTeQOkJqEje+VxTUNisS4FOilETg5sVs3QJBPOG2MCzhgXQzhHcw2kUt
         AazbdNLuCeDfe2UhzBs+pn4z51NFipJnhA9p3WP4UMy+pXKS2vJ7hKeVtQvoyt7LWkKD
         ibRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wClzZvICbZY1gDqbs5K+gmqfI5n/KTxqQt4Q33U0XvY=;
        b=ZsY1EsvMVlPT9jkLS1/uucF/FIh8KX4r/snX7R8bnZUL4WYg02Y8NP3sBcy0NaZUYo
         FLpsvjJArFE+RzPthNylKSMFIqMdXvo6v1sJqcpCPNSIU1jvwm0gKHHI3Q6gwB6/7ph0
         c01ao14GGPmxLRZTWhSHMXlUrzvSQ+iYdtcP0Ylo759d6tFIwQuM9jBZpYPWtbp/UDdX
         UyvNu5hY09L1tVgJdt+d02WQLx0xyzrSdStS5VuH8VxOn/1X7W43+RCrNI1oOot2ujyG
         MHRz17hIbtL1P5Al7sOuNZZlM2iNhWy3jI+E9EVvbvcB99KV/0HE1gZdjpyGxY7evl86
         3Skw==
X-Gm-Message-State: AOAM530l4OAFVTz7fohpHEfKhAIYt+vLegwkmB5GGrKvupYjNjn0F/w7
        P0+DQNg+Mb202tBUdG4swPIJoxSQb8YLTw==
X-Google-Smtp-Source: ABdhPJzyC5CuTPA/mddKYnxBk2ZuzkwnF05QXDPiw/dHSZafcLnBzSwjlhOjPo4pUYzR2+8v9voY3A==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr32509687wrk.35.1622034049311;
        Wed, 26 May 2021 06:00:49 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:48 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 03/24] usb: common: ulpi: Add leading underscores for function name '__ulpi_register_driver()'
Date:   Wed, 26 May 2021 14:00:16 +0100
Message-Id: <20210526130037.856068-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/common/ulpi.c:151: warning: expecting prototype for ulpi_register_driver(). Prototype was for __ulpi_register_driver() instead

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/common/ulpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index ce5e6f6711f79..7e13b74e60e5a 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -141,7 +141,7 @@ static const struct device_type ulpi_dev_type = {
 /* -------------------------------------------------------------------------- */
 
 /**
- * ulpi_register_driver - register a driver with the ULPI bus
+ * __ulpi_register_driver - register a driver with the ULPI bus
  * @drv: driver being registered
  * @module: ends up being THIS_MODULE
  *
-- 
2.31.1

