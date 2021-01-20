Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2156F2FDDE0
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 01:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391323AbhAUA22 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 19:28:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390944AbhATXQ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 18:16:56 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4410CC06138C
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 14:52:51 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m22so42925lfg.5
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 14:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TsZwAdXxcN07oPYjKF0R9ErxYO2ZYi4WWvX+FRR8Zs0=;
        b=glBWAs4NA+NmOHjgxMBCRKPyd0QfmgwfVzIe9rfYcHAQURhCH+iQ0faC1sjpVvg4hb
         XEgPzuHibkoS0EH/4dQCJPFU9pQPxYfPT5GHbGBjfb4JMN5+YycDzCo+ar1rtb5hshxZ
         E9i6E8CLicEJRO/raihnp5TDRHynuJtLqDQhzVhJ0c3ZIaAHZFG5/c6VF1CzS7Hb85ej
         U80vkV0rWsy038WOSa/97MaTXYbL3ckIviKLUfRf/6xdRsbmwZ2tKxSRvI7X/BAM/Xea
         Lw4aAMwFJAJgg/bKgVHZs41PmMDRc9pMPd4RwBkoIDNaC2S3KzYxM3slFN8Czj/S/B5D
         4CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TsZwAdXxcN07oPYjKF0R9ErxYO2ZYi4WWvX+FRR8Zs0=;
        b=PdbCh4tgZmdMPi7JnMjyc/yLPmmKHeARKN0Yb+ZFqJoXTo6qIO+H71GqF3FkhUOiBf
         pPwYuNxa1OTVI8ognAO7mh0pshmqJJKSr0I6Yc0+qtVJ3cqfTqga74CfLyPa1fHBOVzF
         Fm4oiJKFiM0Jy4uL5KIHp5qEODOBRvk4zH4NvdVrtDvYJU9Zgfmi1n1dKi6Wwbc/LnNW
         CDV9afoL06FPjIxkvLCmPteaxaM6/kuTzvTs6J/iUCj2KuOCLwQQUnCJsPmFRjCksSbc
         6GQfzQApc+C+ZvTP0nYFybOTO95qVJNOSOPLHbXXyXfqLYjVM6D9aQ7jw4mJlqnXcii4
         nIhw==
X-Gm-Message-State: AOAM533zSZPrW7X6BUb8tq4rZutTdwhcy8F4M7qn63tZERgWhnd3+rgZ
        yL+zaHmjJWn0kdqiEe5xtV4FCg==
X-Google-Smtp-Source: ABdhPJz3og/FBhS0y5fALcmMCjRkG60zO6031OtVwxMQnYU9v+uOQtNCDHClTvRCXfpfKMIdRKsHsQ==
X-Received: by 2002:ac2:43c1:: with SMTP id u1mr5329955lfl.38.1611183169576;
        Wed, 20 Jan 2021 14:52:49 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id k10sm357969ljg.13.2021.01.20.14.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:52:48 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: tcpci_maxim: Drop GPIO includes
Date:   Wed, 20 Jan 2021 23:50:45 +0100
Message-Id: <20210120225045.173556-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This driver includes the legacy GPIO header <linux/gpio.h>,
the new GPIO header <linux/gpio/consumer.h> and
the deprecated OF GPIO header <linux/of_gpio.h> yet
fail to use symbols from any of them, so drop these
includes.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 319266329b42..0e2bb1235ab5 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -5,13 +5,10 @@
  * MAXIM TCPCI based TCPC driver
  */
 
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/tcpm.h>
-- 
2.29.2

