Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3258721587A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgGFNe7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729365AbgGFNeS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:18 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7ABC061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:18 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 17so42074750wmo.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nPVZRZLDqwpPhO4RC/GUsbLkf95aQVfMZw3d44goLsA=;
        b=e7KtGYdjynUM1W1lVC4D+RIRR4fBD8poghJ6q+calXuw04pQafBm+5FCXwnEGJDTjX
         BDzvFqtTHsd9hwMREut6OdZzkcQHEC0l2dZjb9VdPRyWH2aZ5LABMONQ2vCB9wK9tp1E
         zEM6m4tqjYBKq8REuplcACGfj3pwaKAES50KYRAyjwak7AC03Z7nKSoYgGR4tClPuoiM
         +CxlNKfmQVhp8aKa3Hs4YubZpnJHKn5GFtivVZFBW6CY5w0GlhBeXoh2rigyRtBmRuKn
         ZF7+SX/Ys14HAbuDA36aa4fev+VbZ5zLdYDDq0g5UecpKwPDPbJBaNBfdLa8wx3hwrnU
         bMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPVZRZLDqwpPhO4RC/GUsbLkf95aQVfMZw3d44goLsA=;
        b=pG4m/jxmCdGY4tHk6qZQ5qN1/kH5/4RmItWikNyPHHXL85KsCm4yUXa1SZQCR0ZJNp
         Qvr7FkJ6++zqrPFb6N9eYiNizOjuDRVfMlfxftdoxjPvVKlu15wcVg0do276/T0FuHbm
         ePwuiPXxNOAu7pdiV1YkNnQFBc4tp8oHl7HVAwfyxXKwduGpyZXb23O2Vr3/QLWQx9UN
         S70zVW6fIyLiy22uvlp5eUy53DDM8063wDZxNPbexPCU3yOunsrztd6WAJvLqdrBlzl8
         BwrRg7EpFf6HM56P57c74ckhRc3p1DpYYsafTEzr/ZQkI5LWnxLUMRWOWiGViLQKNsoy
         585g==
X-Gm-Message-State: AOAM533vUVEMTYOXiyPINlrHgh0X+/dNJJDZwPKLQfSmVdYzp7wEYz7a
        p0CWr+xqkdLYFhqyM0rtr0wpLQ==
X-Google-Smtp-Source: ABdhPJyAcv25bdv6OoMfwgsx5XUgRwu6m6klXGx12+TUQBLMsDvexy8Kv11aX3pyM5ps2Xh49QyLrw==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr48983261wmb.158.1594042456784;
        Mon, 06 Jul 2020 06:34:16 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 27/32] usb: early: xhci-dbc: File headers are not good candidates for kerneldoc
Date:   Mon,  6 Jul 2020 14:33:36 +0100
Message-Id: <20200706133341.476881-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Demote xhci-dbc's file header to a standard comment block.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/early/xhci-dbc.c:10: warning: Function parameter or member 'fmt' not described in 'pr_fmt'

Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/early/xhci-dbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index a9932c1ff20f7..c0507767a8e34 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * xhci-dbc.c - xHCI debug capability early driver
  *
  * Copyright (C) 2016 Intel Corporation
-- 
2.25.1

