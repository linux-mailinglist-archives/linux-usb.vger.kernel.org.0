Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDD72126A3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730022AbgGBOqz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730013AbgGBOqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:53 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E45AC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:53 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so28805488wrv.9
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQs4Q7oGTt/0sNcw0ENBRB2w5tCtiZwCiQW85p5XR3U=;
        b=Dq/N0zwqmdZ1Pky1vybgdJTfU1rvLmD2pQ9c00vr1KrgVzDXKqSrslDmwfYFr/6KCK
         ehJ/rv2Lr/z18jHuh8s+yqWsmnxzC6ux4zNbBCd6V9T0xBnvLugJ8tNemxxFlkFG/ZDt
         gwns4rWqq4K2acfTHJlEXcXKdnnasOk6YrTxhliNI+Zmss3EBmCsTymInZ8JBEy99dy3
         OUeLJUBDz6Ah0vntaRPup5QDqARM7ZgsXL3KoVIqbpYMZtOdoURkAyVlIP2tS7Grl7Lx
         YSp64q8Cy5E+a/vdeUBjmCiAy25XXDU+QUVIPcSdPgfjqjBdqE4tTxX3nybtVufRKnsb
         eBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQs4Q7oGTt/0sNcw0ENBRB2w5tCtiZwCiQW85p5XR3U=;
        b=oh1pub/E66mnlLVMur62e3d9MMzBCsOHPggyXNz+PP47ttZgxMiiA+q81+xxEhdGfn
         BM6lo0QKcfEgS5F+FtQpfBEuChW3gi+IdRgJ2c3UTlYgISuTCNFeYqtOP88tWO8zop/N
         6UnVG8VvB4jxLBEnIOFqxUBbk2vMxnoY3nbvTPbfl8YCAZhb1P1pu8JuONLlykHp5Wyp
         iMpz+RzOCWNsr0HernJ/Ob6gixWRXvJIQWMwHEQlJ2wvtotuUVgHfCRS1TwjeOqvtION
         hDG9zWdSs7nssDlaSkrJOdbmrNhk9No9PjPNkEFQxpdlMG3cSxdzCf0+n+Qxkcalznf+
         bWvw==
X-Gm-Message-State: AOAM530Bvn8t+EgfToD+j4SldM9S6Q14WGOM4wA0yQtgImew31qATT2/
        MBMzs9u8mO7PkxNdAkwreinKt2fUMfg=
X-Google-Smtp-Source: ABdhPJyvjgDLGI4NJ9Sbqgluo1gBEWKCmbDfXNg8SW/WfotLzOFpxXr/k7akiCP8oG+foxClcw6o+Q==
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr30432630wrr.23.1593701211993;
        Thu, 02 Jul 2020 07:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:51 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 16/30] usb: mtu3: mtu3_trace: Function headers are not suitable for kerneldoc
Date:   Thu,  2 Jul 2020 15:46:11 +0100
Message-Id: <20200702144625.2533530-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warnings:

 drivers/usb/mtu3/mtu3_trace.c:13:6: warning: no previous prototype for ‘mtu3_dbg_trace’ [-Wmissing-prototypes]
 13 | void mtu3_dbg_trace(struct device *dev, const char *fmt, ...)
 | ^~~~~~~~~~~~~~

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/mtu3/mtu3_trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.c b/drivers/usb/mtu3/mtu3_trace.c
index 4f5e7857ec312..155eae126e5e2 100644
--- a/drivers/usb/mtu3/mtu3_trace.c
+++ b/drivers/usb/mtu3/mtu3_trace.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * mtu3_trace.c - trace support
  *
  * Copyright (C) 2019 MediaTek Inc.
-- 
2.25.1

