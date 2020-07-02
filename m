Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8DF2126F6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730029AbgGBOtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729948AbgGBOqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:40 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBCCC08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z2so6524774wrp.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tRsQR13PSt+71+KJ9+2KUCB1us21DRhNxaWRJTFi8XY=;
        b=afE8GxK7+FqqdTQOg0Q4RfL/jq4qaEfxl3bVjnUTU58Byyndjn0zvnx4zWGWaxbd1G
         8HcC2pPTZrDJOXvWZJw2Srm1mc4TKdMYEgzz5rQHZ/vchbzx961n0WWfiYAMcz4bWORc
         6yqMFh1JFW3V7a0Jrpihl/434CUzB0yF5qUebR3lgQteVSq+x/MocXFzl8BNYpBbOrNt
         z7TPIjgB6jtFDr7zIqNK/P9sVMBQ7yuvqAwb7P/Yk2s9AkcxcSmVL5tCjAYNdZyliqQD
         mvnCt9FkG+r2v32fVSVVcIyAYl4V0Xl60xjM97Dr1WtJxD+AwmzeW240Cm1xUIS5uefk
         XVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tRsQR13PSt+71+KJ9+2KUCB1us21DRhNxaWRJTFi8XY=;
        b=ETaTqzLzDj7AFCHV532AlU444XxE6dWVBN+iqP+mtbF1S1LIYBM6H/m//5I4jvmae6
         IlSVC17pxEreq5LMwyTnrmLhCPeU4Ope4T0FpYEUe6hPiTwXzjGjkjhrNDkFYogw85KD
         ERDxaf9gaAn2DqDRVDpIHGkQLDrgFh1QfpibHLV+dkHTv+vo/3pQgyuN+C1KoYwgf2hG
         Sp/9LlzKzl4OQNZA9W2XzwQhChiBOI5669lFVYfOpN8xh1pIIRiiRNDUfA+hRMykduTa
         8/6ZkTnJ2Hv+1R8jEzIq2RiwPaVKI+rXB/iTNYwdXe/5LTe6qEDTxeqts8qEdTdkha6B
         USZg==
X-Gm-Message-State: AOAM530ZFsqvGG3jB1bS7O5fJU1CYuHkRj8y5sQENagt8z4CX+Xgig+j
        qKGh2rVjiB9mJaR6T//OS1gunw==
X-Google-Smtp-Source: ABdhPJyqONzkjZI9qaxDAqErGMqBbVCt3H11ePJ7rYrmZUiaxTZ0JWbKWEk8+2bN0aTs5d9nufxEOg==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr31334712wrt.209.1593701198911;
        Thu, 02 Jul 2020 07:46:38 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:38 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 05/30] usb: dwc3: drd: File headers are not doc headers
Date:   Thu,  2 Jul 2020 15:46:00 +0100
Message-Id: <20200702144625.2533530-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Demote drd.c's file header to a standard comment block.

Fixes the following W=1 build warnings:

 drivers/usb/dwc3/drd.c:20: warning: Function parameter or member 'dwc' not described in 'dwc3_otg_disable_events'
 drivers/usb/dwc3/drd.c:20: warning: Function parameter or member 'disable_mask' not described in 'dwc3_otg_disable_events'

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/drd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 2e483448d6959..fd7f9a9f67dc7 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * drd.c - DesignWare USB3 DRD Controller Dual-role support
  *
  * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com
-- 
2.25.1

