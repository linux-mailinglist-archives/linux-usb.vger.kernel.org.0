Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00A4391870
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbhEZNDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbhEZNCw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:52 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ADAC061574
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:12 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m18so1071703wrv.2
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BV2wtRRLMxAa81oGx1tmOdPw4Mr1oYrs9/D1IvLhHvs=;
        b=gwcQu0HYZp6Q9nuqOI1PH7zqKZF34NqRTAlK8sF1ZlUediO7Mz58Pykew+9wi7LVIM
         2miaYwPZHVK/1WT+2w0M1KBIm3vtZ8/movIRvoWST+Uexoyo7sb422yijgENtbMthPQB
         LuEkxcmrZI4o+fxvRRFTrOP9lG62QdTuMPw6UwlZZ8Tn8M4Qsyuov0Qo87YGcFCvJEgG
         Safp42bDmyqFPuhSpJPPTAsD8NGc2AuId+CPGXKx5YCRr1gj3V53xD+yY3cappc0oAne
         fhKpCTuJ00DkVf/ilt/FHdPCcP79jP+cYX6MdtTdU9weUIIuEargeyDLL+Lwj3ZvbyXo
         bGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BV2wtRRLMxAa81oGx1tmOdPw4Mr1oYrs9/D1IvLhHvs=;
        b=kjcXUl2U63F4xQYTeFvslkFKpBOM4Drpzlvez5fpgqZgT/J+dHP1sZW+vCJZ+JRUHF
         GlUGThhltH2upoxBTrTFzxSPQTabGguteWCTjA7iwJGgoAGFV86Gyd8BuTk/N1XkNC3S
         CpQLnGw/F/iOXjSiOypOCSryWghKBHQdXRIBEf8a3pFNQOpI7LpwaGrLn+SEPaEZsHjj
         q4Dy9ksVc/+kwIxrLZSDGF5fdWS/EPhcf8i0XmsRXqGce55TYdh4YVul8r8yMPXUSwUd
         dz58lpNkdZonKaRLS/+NMiLLX6kyuMnBrC9xcJI6KPeiqFUHRz30n87xeMYCM26v/bEx
         PcfQ==
X-Gm-Message-State: AOAM531xn5GO1eRHPAyoQ21HLqRYgLrOjGqvBk32+PGoyUbmkuiejP9v
        +FMBOMI8PHGnYs5TlF9dZ0kNsyw9rrXAjQ==
X-Google-Smtp-Source: ABdhPJxx/vUhheBv/u6xxxC3v9iEWvA4sorhAjtlhx6wBjJ+Mu2Z7lnv46siDZ4/6vug2f8RhOIAPA==
X-Received: by 2002:a05:6000:184a:: with SMTP id c10mr34616274wri.244.1622034071313;
        Wed, 26 May 2021 06:01:11 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:10 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 24/24] usb: typec: ucsi: Fix copy/paste issue for 'ucsi_set_drvdata()'
Date:   Wed, 26 May 2021 14:00:37 +0100
Message-Id: <20210526130037.856068-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/typec/ucsi/ucsi.c:1287: warning: expecting prototype for ucsi_get_drvdata(). Prototype was for ucsi_set_drvdata() instead

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b433169ef6fa4..4e1973fbdf0dc 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1279,7 +1279,7 @@ void *ucsi_get_drvdata(struct ucsi *ucsi)
 EXPORT_SYMBOL_GPL(ucsi_get_drvdata);
 
 /**
- * ucsi_get_drvdata - Assign private driver data pointer
+ * ucsi_set_drvdata - Assign private driver data pointer
  * @ucsi: UCSI interface
  * @data: Private data pointer
  */
-- 
2.31.1

