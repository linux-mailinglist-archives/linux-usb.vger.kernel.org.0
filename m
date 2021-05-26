Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB9A39184F
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbhEZNCb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234760AbhEZNCY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3291C061761
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:51 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h3so665115wmq.3
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UlJ4EWtdgAdd3He0OtdTyScO+jD11FSW8rVw74hIROo=;
        b=VRdZpkKv7nuWGAn1gX3EztMikybapEaiUmDgC/dfWr29q2vmUEJrxZ8loteIy97czM
         ga21Wa7uAxJlsBsAj1cLE5STt4H70IpZNRr1lg2bTg8mw5C+1qOzxPt1WH6pjYsEbKvu
         zw5zzqJD1Ec3bEPr0aGvp8JbmkwLldLxCowHoGFCQyYA040WKCtVcfsPLmiHtIvwKng+
         DiYO5tKPacpYSB/wVU40Uo3s1iqN34XOMSjawMjA3XfYmxJGzaSFuHtyZobrGoAxHb6g
         rccAGBfsLWqVHViiB+nu1AesxqiQ6sLqbtltRtdjyus7qf6ZkfNcjG0UNuTn7lpOspDI
         kvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UlJ4EWtdgAdd3He0OtdTyScO+jD11FSW8rVw74hIROo=;
        b=b3VDLMQFuDGQgZtuJl+g6V8/V3WmJ0ugCQOw4Ip7jX9wl1MVzjJB+Jy8LHVzffFayc
         659aD/aX+Q4CUQdq36xYP3OA81+wKH30FeKE2boADexgtQhWHGdYkXgI+pdIDHx6LrPF
         l3khHdKSOMLZeCo6Xnp+vWsDIZ37WMJEAM1u6nzMICqukmAFn1yGEpRbciovj8PRwLG/
         ZzcN5gJw8+q59wgaNi49yGtyiQpCTuva7X8P4Ulw8ngrH1Sa2Wp/lam7vDMdfE9Xjdsd
         KCa5hpAOnwYtu2Ikif9SKJlXS3ZaCtYSnT9P2gTuXLm84p7Y56EG1hyUheNxyXJRs3DK
         E8rQ==
X-Gm-Message-State: AOAM5322QyZ/MmxNmzRjoaY7s2f4z0TxLoV3YJ5dhsgcoZi4Q++hX9ER
        mtzfrLLDNYuxbEDr0PPu3vzeBWL5k7OJFw==
X-Google-Smtp-Source: ABdhPJyZAmZS13GvVI3oXls44k0noSs5Dx+Au8qYpHtppOYSMkaZc/Jz/jr4F0hrDFfNrxOmmLFT0A==
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr1108257wma.77.1622034050301;
        Wed, 26 May 2021 06:00:50 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 04/24] usb: cdns3: cdns3-plat: Fix incorrect naming of function 'cdns3_plat_remove()'
Date:   Wed, 26 May 2021 14:00:17 +0100
Message-Id: <20210526130037.856068-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/cdns3/cdns3-plat.c:179: warning: expecting prototype for cdns3_remove(). Prototype was for cdns3_plat_remove() instead

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/cdns3-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index e1deeada425cd..4d0f027e5bd3a 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -170,7 +170,7 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 }
 
 /**
- * cdns3_remove - unbind drd driver and clean up
+ * cdns3_plat_remove() - unbind drd driver and clean up
  * @pdev: Pointer to Linux platform device
  *
  * Returns 0 on success otherwise negative errno
-- 
2.31.1

