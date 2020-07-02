Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFEC2126B8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbgGBOrL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730104AbgGBOrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:47:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0E8C08C5E1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:47:08 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o2so28288802wmh.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=juN4hSvL5XQNXRrfZcj7AlUDUYFoERtc/+nkEi7x4Ng=;
        b=DPNUrNZDKr8bIOqrg9aAd2AwHmX5d8s358yRYd2Z9zSwoUay0njHdD3Z9FyOJYfXnq
         yuXJR5zm+WMALudvtSdSf7QrU+aX32ihed4eNdWS3+J6iP4PSp0ApUSc13R6lbaytViu
         2nEXlLP1OTu1qHSAY5bLLe/AzWbxhs2PXgYldAEI3RW1XRKzFipV79YLuUQiSTLjSP8g
         /v0zUB/rvMW2lVRRVbnVMjr3LCCeiKd0qPq+6o6Y03pAOpmHuNjRYSmtp8eFBBlpTz6c
         NANPF2k9ZT//OiBoJTGMU6zxAubsmu61/54CaN7OGPIFUzM4MueSjt15ktnQ4bWU6wPP
         Nuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=juN4hSvL5XQNXRrfZcj7AlUDUYFoERtc/+nkEi7x4Ng=;
        b=Wlf+GNZEHtDW/+9AG32VtfbbkLie9VT+zyfoBZBQYXgV8txFnteEXgzZaGSW5By5SL
         FLaL6ZUvxgdUI+xsbPVsR2xe431ceeay4KhKkYjdEEfxKPgWIz6SbGHmraL5wRXiBBX9
         Li3d6YWq3Xudb6QXNbguJNUF7NsJKGscjYJGpxBeUjQDd9aL86aXyw6r1OMQq7RUrWbq
         6etoiWVHk+hQZzyeki0Yc/AH6L1nRr+dVy/riKZ1oHno8nrxbtsGGJ7va1cb1MMyBRKn
         PJM87tCa1EhLiZLl6LjhcJ5L75iDyeccepYJP2Uj7G97fckfUxwMd9z0lgQo00++ypw1
         2M7A==
X-Gm-Message-State: AOAM533ge9h4y6XWdiSU9zEATrB64xovy6cRtZgSSVu3QHGxbHqGFg1h
        8FT2F2QURDm0VJrLSfYYhKSPiA==
X-Google-Smtp-Source: ABdhPJwZjQU/P4mU/ND53GM/MjXCWI6l4mYnK8RuPiwY1UjcwaxyYVsB/ikr+y30GGMSdRhl2uBtAA==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr30736308wmc.145.1593701227467;
        Thu, 02 Jul 2020 07:47:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:47:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 29/30] usb: class: usbtmc: File headers are not good candidates for kerneldoc
Date:   Thu,  2 Jul 2020 15:46:24 +0100
Message-Id: <20200702144625.2533530-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Demote usbtmc's file header to a standard comment block.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/class/usbtmc.c:11: warning: Function parameter or member 'fmt' not described in 'pr_fmt'

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/class/usbtmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index ffc9c6fdd7e1d..4b52758d3a38f 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/**
+/*
  * drivers/usb/class/usbtmc.c - USB Test & Measurement class driver
  *
  * Copyright (C) 2007 Stefan Kopp, Gechingen, Germany
-- 
2.25.1

