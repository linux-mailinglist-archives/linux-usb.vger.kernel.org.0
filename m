Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251773A3CDB
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhFKHUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhFKHUO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Jun 2021 03:20:14 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6395DC061574
        for <linux-usb@vger.kernel.org>; Fri, 11 Jun 2021 00:18:17 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id s17-20020a17090a8811b029016e89654f93so156795pjn.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Jun 2021 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=h1n/zuYlwqp+rHpksQ0F0YWXfiHRXbQ+IawrWkwik+U=;
        b=T0kxJqFHf70lY+njXDWqYAN6vBaTKGc99PhXMEg6pSXfRI32J0p7uzXFul+MzUolIP
         04QCrPJXKMir5BGYPmFJlHFGCnqyHtrg8y6Q/fwGJygsQq86dTqMj+3U+kRmkBZmXULz
         qNCigbqjP1zvuJ0Tw3onxW1+gfWr/TQals09Lxn+xn5/JsmC/9SN8IKY6j43KbR25e8u
         vQD+p1TySlbAnwkKny4tfqxJvhPOJ3PJu2r+JrbrfhKweyrFN0g2m4tpjz0LKe847WGp
         FZqn7+IRpkvpoyEPKpBYaWmf/c7CxQ1+CnzNZt30HjZqxNs5Q9WueOVPxqHVHIzW1SKV
         RlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=h1n/zuYlwqp+rHpksQ0F0YWXfiHRXbQ+IawrWkwik+U=;
        b=Oi3OqFLeoQTEYVc5QRyVR1hSSeOdyu9abZcUXFr0Xvo7p/c0ogsCnYpfS0hh5CMtMR
         qMng7xYhWACWgOSkk255UriFAubRqxknhdxhjX4//2ROhGtcYFv+yO3poG6Cz8TF86eb
         iNx1N9SW0/RUPkyoGUeiyxNGW1c4Ob4af84pFIpdGmwwK6ma81jL9TJW7+PS6ruEklLn
         /ZjX1REjakMRGZAZBwi4SFZ/Pa96ZGRBm0WHk3eTuBZtjb1AKfDFYxFdKQEwI7dPHsQT
         z4vPSN8XhCuUvRKZuv27xQWzU6uyNJheVKNzral69kelQ0MF6whhMP7vBXgpmHqZyTs2
         E7XQ==
X-Gm-Message-State: AOAM530ivW9PBBLu1tLHwqXdi0msy6Im2mvx6OC4B7nV8f9oxx+hySiP
        dim+l9ve8xRXw7wPqA/xXkwLHiGZgS2RvsjCq2o=
X-Google-Smtp-Source: ABdhPJzlMwMMR1TulJ0QfJsKDdrDNmI5BKy90mUsVAz80HraIJY/XUiwzC71u7xD64AyJ5Z3o+9y0Q==
X-Received: by 2002:a17:90a:cd03:: with SMTP id d3mr1402488pju.31.1623395896874;
        Fri, 11 Jun 2021 00:18:16 -0700 (PDT)
Received: from coding1257.verisilicon.com ([116.227.119.103])
        by smtp.googlemail.com with ESMTPSA id w59sm4286174pjj.13.2021.06.11.00.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 00:18:16 -0700 (PDT)
From:   Yuan Fang <fangyuanseu@gmail.com>
X-Google-Original-From: Yuan Fang <yuan.fang@verisilicon.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Yuan Fang <yuan.fang@verisilicon.com>
Subject: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
Date:   Fri, 11 Jun 2021 15:18:05 +0800
Message-Id: <20210611071805.9169-1-yuan.fang@verisilicon.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's more safe to set PHY ready after soft reset done

Let's consider a test case like this:
I have a usb PHY which don't need SW initial before access
it, But i have a wrong PHY clock default setting in PHY
register which means PHY is not ready in fact.
in dwc3_core_init, dwc3_core_get_phy will return 0 despite
usb get PHYs with return -ENODEV, and set phys_ready=true
but at this point, we can not say phys is ready or at least
it not safe to do that.
then, go on with dwc3_core_soft_reset,dwc3 reset core and
PHY, as phy->init is NULL in this case, so, usb_phy_init
do nothing and go on with a while loop which cost 1000*
20 ms, and return with -ETIMEDOUT
check phys_ready is set to TRUE but actually not.
Move phys_ready after soft reset done is more reasonable
and don't see side-effect yet.

Signed-off-by: Yuan Fang <yuan.fang@verisilicon.com>
---

Hi,
	please take a look at issue description above and kindly
	review this CL if any side-effect, many thanks.

B.R
Yuan Fang

 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b6e53d8212cd..04b1bbaf694a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -324,6 +324,7 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC31, ANY, 180A))
 		msleep(50);
 
+	dwc->phys_ready = true;
 	return 0;
 }
 
@@ -979,7 +980,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		ret = dwc3_core_get_phy(dwc);
 		if (ret)
 			goto err0a;
-		dwc->phys_ready = true;
 	}
 
 	ret = dwc3_core_soft_reset(dwc);
-- 
2.17.1

