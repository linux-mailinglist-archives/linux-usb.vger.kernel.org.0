Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97086215886
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgGFNfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729358AbgGFNeR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C649CC061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:16 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so29659570wrl.8
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hOxuOAzmvEV55alflVuCU5810VX9tcA35muYC7R0MbA=;
        b=w5P2aU6Doeac9XeMuviG7stwJdgM6WsIR+NBZVf+lZt+//ND6hJ0DXWizpA/m6bvwD
         B2u0ApOKmiuQOBKM1YTtRRJXFMhrqsqF5Ykg3yCIhM78pF2i9vIJFL96Ve0I6gQrZww+
         hipLqHTD9shzTQ0ixY1kUN5YsF9v2aMQynbFnVU+Qu+aWu0Ikiy2sbwjO0WWC78XIlyu
         Jukm9EtNycZtWgB8LT/DwQWNu306tPsdPdKJ6yBLniVQ1uduG5/SYh+Cis1o7XDA4U9y
         bpXkmFKaaIGenZXim6OybyyfkysmnYGI7GTOso3LNOgCj400PgZI42jXMSjLkXY+Bfio
         7O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hOxuOAzmvEV55alflVuCU5810VX9tcA35muYC7R0MbA=;
        b=ECbqtyOw05Q0FM87VwP6x71SG7B7mQPaL7Njjknm3nydP8GZu9cWfGb5a/my5omfqM
         +PkRaZLxim4CcUIy6BhGkaCnNKJMoMWREkoapc1NFEQvVZra5nROr29P5fyPI/IUCyNl
         X8/VBsGHrzpjgL2b8jKnzRK0e/9biZdWIgCUzb0GuPKtJ9OxE+e86u/2Ns9KWw1O8558
         D/P/gJ2pvohKea8ydEHvWVK3cBr73xAIqU47SYV9Oocu0kYe1iDuA8A3s2qKDfQabR3S
         NzniR0zWYFr3OsHiKRVeencxEowSJTmCJfgttHcIronr+QI2HIT6w4+2J/ExGZr0+xv/
         ou1g==
X-Gm-Message-State: AOAM5300Tgk37QMHDlPfy9Ssn8MimDp0DVNjwMGy3q2Lwv2EgIt+zReQ
        R8tB//kKMYCUqNIQrxeSYkmTKg==
X-Google-Smtp-Source: ABdhPJwQLKXTvfX4Y1+2PDutR0rJsq3ap9TgpalSECU387DommfB6/zibSUcLtGWIgZ9/g+LfFUx5A==
X-Received: by 2002:adf:8024:: with SMTP id 33mr52421656wrk.117.1594042455545;
        Mon, 06 Jul 2020 06:34:15 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Jann Horn <jannh@google.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 26/32] usb: early: xhci-dbc: Supply missing 'xhci-dbgp.h' headerfile
Date:   Mon,  6 Jul 2020 14:33:35 +0100
Message-Id: <20200706133341.476881-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the header file containing a function's prototype isn't included by
the sourcefile containing the associated function, the build system
complains of missing prototypes.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/early/ehci-dbgp.c: In function ‘early_dbgp_write’:
 drivers/usb/early/ehci-dbgp.c:915:13: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 915 | int chunk, ret;
 | ^~~
 drivers/usb/early/xhci-dbc.c:600:12: warning: no previous prototype for ‘early_xdbc_parse_parameter’ [-Wmissing-prototypes]
 600 | int __init early_xdbc_parse_parameter(char *s)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~~
 drivers/usb/early/xhci-dbc.c:653:12: warning: no previous prototype for ‘early_xdbc_setup_hardware’ [-Wmissing-prototypes]
 653 | int __init early_xdbc_setup_hardware(void)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~
 drivers/usb/early/xhci-dbc.c:910:13: warning: no previous prototype for ‘early_xdbc_register_console’ [-Wmissing-prototypes]
 910 | void __init early_xdbc_register_console(void)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Cc: Jann Horn <jannh@google.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/early/xhci-dbc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 04ba11fff0edc..a9932c1ff20f7 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
+#include <linux/usb/xhci-dbgp.h>
 
 #include "../host/xhci.h"
 #include "xhci-dbc.h"
-- 
2.25.1

