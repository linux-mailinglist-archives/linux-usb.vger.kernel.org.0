Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198033A2A72
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFJLk4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:40:56 -0400
Received: from mail-pg1-f179.google.com ([209.85.215.179]:42956 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFJLkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 07:40:55 -0400
Received: by mail-pg1-f179.google.com with SMTP id i34so15906978pgl.9
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 04:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ITmfIylMdEonVEb3hqxSnl0bjFhvyGWbatUNvPqka6c=;
        b=GOeahdO0SoSCwCv3bhYp1aKNgNobgdl0qaPUkFnLK1gZrDDAKm3lM/w4FPiL0GQgJE
         hzYPwLHlKAPQAw+EOYFy2BRX8dKjsPsWwLNZIJ5LqRJUTbCzINW6XTmo2NgLi6m3MQup
         p3HNYMdAVMROuqTPyMhreGQWqMEsWZNu5uq43IkuSfxtN0zN9vFbAwuUGdxe+NfQ3Lb7
         2ZlmbXO2vKTttlv+B3leFsVv3PvbbEyvQO+na1Nlt20sNjyIkHNqjjFJ2y6NQYTn0f6V
         DrwaP+Z/S/EUlZA35b69UM5OTC28r7Bk/vBR50TqrrrltMP26ud9ClA0aW1NaKMZVfjg
         HKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ITmfIylMdEonVEb3hqxSnl0bjFhvyGWbatUNvPqka6c=;
        b=n19uGBHNzyJJUR1i7QEhXwMswSpllvV6p1nGRUoo0SkAwh8mFi3iCpba9vrVoi8BP6
         PPQptoWky+fKNEhztaIH/KXR+k3WmZqMxEmafiHcjzxkCFJzN4O/rO8NcI7TTWwZcgxV
         9WDCO6c3pueVxz/Lr7yNWggafThuay6ZugC1CH3gL4PHMlgrbfbO3VBZ4stMVi6BmYlM
         Pnw2+jpvOAR1w5GQq+4iQU1E6nP2Vj+0KITnxQvefSlXbj5P7w4Rxs0f7M9oqAbQx/HO
         L7wcYtE8baFSKMKPWyNmweTIn5Nre2LOSqX9xbij7KsGCTy5tqkpX8uzO3YcoKeknetu
         CWkA==
X-Gm-Message-State: AOAM532ttJnQOl8u8gF+ocHXJjRZYnOBl57VIzdz7BIMFUP5Whh3qg5A
        J6mPTdSApUBcDQ6DYPIFDx8YK6ZKR/rPtg==
X-Google-Smtp-Source: ABdhPJwLpF19NVq97heA7Ohb8Tqbdm+v3tMdoRThzHoJNi/jJ+0eUVcbAl4BaLiNmvXZYgRiHCePQg==
X-Received: by 2002:a63:ba5e:: with SMTP id l30mr4567612pgu.43.1623325079332;
        Thu, 10 Jun 2021 04:37:59 -0700 (PDT)
Received: from coding1257.verisilicon.com ([116.227.119.103])
        by smtp.googlemail.com with ESMTPSA id x2sm2245284pfp.155.2021.06.10.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 04:37:59 -0700 (PDT)
From:   Yuan Fang <fangyuanseu@gmail.com>
X-Google-Original-From: Yuan Fang <yuan.fang@verisilicon.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Yuan Fang <yuan.fang@verisilicon.com>
Subject: [PATCH] driver/usb/dwc3: Add error handle for dwc3 get usb phy
Date:   Thu, 10 Jun 2021 19:37:45 +0800
Message-Id: <20210610113745.7710-1-yuan.fang@verisilicon.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add error handle for dwc3 core get usb phy, because
without error handle will lead to bug.

consider case like this, when both dwc->usb2_phy/usb3_phy
and dwc->usb2_generic_phy/usb3_generic_phy do not exist
current driver code set them all to NULL and return 0
to caller which means usb phy is ready.

Signed-off-by: Yuan Fang <yuan.fang@verisilicon.com>
---
Hi maintainer,

   I find this issue when i try to add a new usb phy driver for
   dwc3 usb core, this issue looks like a bug, please kindly have
   a review, many thanks.

Best regards,
Yuan Fang

 drivers/usb/dwc3/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b6e53d8212cd..4d527d313a4c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1184,6 +1184,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		ret = PTR_ERR(dwc->usb3_generic_phy);
 		if (ret == -ENOSYS || ret == -ENODEV) {
 			dwc->usb3_generic_phy = NULL;
+			return dev_err_probe(dev, ret, "no usb phy device\n");
 		} else {
 			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
 		}
-- 
2.17.1

