Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A3821589D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729569AbgGFNgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729284AbgGFNd6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:33:58 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328F5C061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:33:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f18so32880708wrs.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n7/LG8QKfAsUZ5xCCuI2vnf7Sj+c5EJvPq+Icl9Ejy0=;
        b=os0d0dx8lY4PrV0VCx4VZCbRVDM3s7vVVnY/vA+18e1qU3P3/R/bJTVXFEoxZBax3b
         H1evzJuHhO3Vf9lGtD/CevHBEjo0+SNdxVktW9IoKWmB/6rtywuxMeCHzwvvtwgP0gZv
         iDOnInpllmtroWuWZ0seJrk6D1D3YOVkjFObAGw+RXxVOq6bTk9TABngguksuBbbeMSb
         E+fx0zxFxP07AGEaRcKKn+ANTY3M6cY1izjCqRv23X6tLJUCdKZ3+bll9J/WTLpLQIvX
         SNlAaXxAnaPkVju6B1V7ZJ03U6SKfOX+L1LAEHgGxR58QOar2re6Pj23qdjIRBLb/rre
         aXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n7/LG8QKfAsUZ5xCCuI2vnf7Sj+c5EJvPq+Icl9Ejy0=;
        b=kGV7R9cOf1UlCpK3I3ld7jBGzcQdgEpO7vtDFOKgkuEGlRzWX4Fmb4W6rW2uJXF7ey
         drRtM/fTCx9lqins2BjSGA/fGF+R5gnrJ9hPeZd1JuqknDCKa737kfKncHnrJxsaMzaz
         2VY0m5mhpDbfi9YiAcfRKtww7/jD1bFumuRHUp54X7cqceK99VjIj0kSdsk394Yq9dAj
         0tL6BO9iKrlJX3UkzpMaozYBOjJPfHETPHYbb4HcT1o7ciudNokMvozc+IDMKH5MaEIG
         cM5+LWRSeOPE+TskaY65LFete2Jj94s5KDdqNbNBWKVYZs+MA6Fr+MZV2dsQPdv6DPrX
         ZPLQ==
X-Gm-Message-State: AOAM531/lOOZtL5p9ILeJJIPhYcUA7++qPkkdhMN2EGAYwvFI4XcGrkL
        lCQ3jCcbPY+4oH1KOb0smtv0+Q==
X-Google-Smtp-Source: ABdhPJxDvbV0BLobErzaVbEqiNwKzRAQTJlQ4Ma/Du+Zq1WMwRCa/vj3m927hR86GBAms5PrHXR14w==
X-Received: by 2002:a5d:4a42:: with SMTP id v2mr45407084wrs.33.1594042436907;
        Mon, 06 Jul 2020 06:33:56 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:33:56 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Al Borchers <alborchers@steinerpoint.com>
Subject: [PATCH 10/32] usb: gadget: legacy: nokia: Remove unused static variable 'product_nokia'
Date:   Mon,  6 Jul 2020 14:33:19 +0100
Message-Id: <20200706133341.476881-11-lee.jones@linaro.org>
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

Looks as though it's never been used.  Driver was introduced in 2010.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/legacy/nokia.c:65:19: warning: ‘product_nokia’ defined but not used [-Wunused-const-variable=]
 65 | static const char product_nokia[] = NOKIA_LONG_NAME;
 | ^~~~~~~~~~~~~

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Al Borchers <alborchers@steinerpoint.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/legacy/nokia.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/nokia.c b/drivers/usb/gadget/legacy/nokia.c
index 978c1a34a9320..2e15f9a32ce9f 100644
--- a/drivers/usb/gadget/legacy/nokia.c
+++ b/drivers/usb/gadget/legacy/nokia.c
@@ -62,7 +62,6 @@ FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
 #define STRING_DESCRIPTION_IDX		USB_GADGET_FIRST_AVAIL_IDX
 
 static char manufacturer_nokia[] = "Nokia";
-static const char product_nokia[] = NOKIA_LONG_NAME;
 static const char description_nokia[] = "PC-Suite Configuration";
 
 static struct usb_string strings_dev[] = {
-- 
2.25.1

