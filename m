Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0230305A1B
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237078AbhA0Lme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236795AbhA0L3V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:29:21 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F28FC061351
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id 7so1538873wrz.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=svVOUGKG5Fv6t7oAvNImQmC5zwwJ4U0ey/3mhzQtIP4=;
        b=RQw8287NITYeNqTInH8hwgY4UTwjmsUno9caSnmGOl1zLHuayiE5rJ2fiiEuXSbeP6
         H5HESNZOpwqyEvLrXVHbZR5HX1tOFS7EsZPHpDvyfzWy8N5wiauKQiVXQmEtu48AvsjU
         CgyJPy9FrN7NV6nm+d/grtY8TW5/MB4qpL9oid2Y6X9dLinRP43m5MaSOeUJHQMghP65
         nXOSL1+0338DF+3oxLldc7jf2R3Kv7Sxcsk166jHtfs2e4zBiDuUMhlDIqgzIonbzg8h
         +qw6+ULYXP6ZLS3liXBN1aJkbO6cM8q4OYjMd8C3sjsfEg/36EHfxpHqG+7YBpZYtJPP
         CnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=svVOUGKG5Fv6t7oAvNImQmC5zwwJ4U0ey/3mhzQtIP4=;
        b=OfsaAgVK0yms4fUlDPgnQn5SwV2i9Ktx0Ez9dKSGzDLH32WHWP/jK5tD4rGMhfXeD7
         DpjyhxJZzIRXmB8PFUodI7ftxyrm5UmUGWBuXFqfWwRaryBV4xW6RCKaVq5Ajvjx2LeY
         ewaej5GyfSAYBvpRQnximWVhdmtjvtJZHds/iZbxmtjDEljupN2i060AScMkxnNcUGfx
         KPFJoVg3/Dm2bs7vgLE/ufaRzEhdSuEsUTdRSVnC9r147T6boPeb7X2PTc08Lpf22QZX
         VS4yPJZLnRoDL+FvfDOo7sNEBA0T0vHuB4tuCLT3ULqs5+n7JG+b6RMNfkvU329dyinU
         npqA==
X-Gm-Message-State: AOAM530pj7pVBZ1KsqQLP+uP+n93Smp54fqi8EKSnu7AMykCmDn8gAmr
        zumXcfLXvDevmVXBsSXeZKXIKw==
X-Google-Smtp-Source: ABdhPJwHTzrcFOoZyi1HeP3EtLePMxJE62a7mjl8dfor15nZfkZLeVwADi013e38+v4lDmcaCLfdxw==
X-Received: by 2002:a5d:4292:: with SMTP id k18mr10798614wrq.218.1611746766164;
        Wed, 27 Jan 2021 03:26:06 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m2sm2040065wml.34.2021.01.27.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:26:05 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: [PATCH 06/12] thunderbolt: xdomain: Fix 'tb_unregister_service_driver()'s 'drv' param
Date:   Wed, 27 Jan 2021 11:25:48 +0000
Message-Id: <20210127112554.3770172-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127112554.3770172-1-lee.jones@linaro.org>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/thunderbolt/xdomain.c:678: warning: Function parameter or member 'drv' not described in 'tb_unregister_service_driver'
 drivers/thunderbolt/xdomain.c:678: warning: Excess function parameter 'xdrv' description in 'tb_unregister_service_driver'

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: linux-usb@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/thunderbolt/xdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index f2d4db1cd84d0..6e8bea6a7d392 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -670,7 +670,7 @@ EXPORT_SYMBOL_GPL(tb_register_service_driver);
 
 /**
  * tb_unregister_service_driver() - Unregister XDomain service driver
- * @xdrv: Driver to unregister
+ * @drv: Driver to unregister
  *
  * Unregisters XDomain service driver from the bus.
  */
-- 
2.25.1

