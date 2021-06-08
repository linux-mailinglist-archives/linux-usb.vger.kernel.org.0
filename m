Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F07A39EDC8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 06:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhFHEoT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 00:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhFHEoT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 00:44:19 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233BDC061787
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 21:42:12 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id k7so11146903pjf.5
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 21:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMsvU3fKoubbU8qmsenuy5RIoCMUqHrHUOqVh+OSU5g=;
        b=TGpYDNqx55JjPj6skb4523PrVZHBn3UJiYn7m1gWU/bSHyKJU17mkXd/eEhT1YXjfP
         xs0eM4vIvP5pqW72lnUgnVH13WD0NWROd5HmYe1OmdNjXBzerGj2Xs01uJX60dwYComf
         xnW6O3GswMptfdnjVs4olAHrH2oEUooUPUZ599mNy9fkBIDG5LEY+Svc3lxS9x39D3nA
         0qxdi+jDV87yrRmxZNUv23njeqxVHaP6Is9CUJ0Cs7C7vhu49snHA63jbgj3EVhdoSEi
         5RrC1IgIcXojsbEh28PujUNKE7nMPg8EvPZe9o8lArE2Mv8hfaPBlsl2dtJQN9hLGd/n
         nvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMsvU3fKoubbU8qmsenuy5RIoCMUqHrHUOqVh+OSU5g=;
        b=GNoG/+0p56SVJ3bF1cZE6RAIL6AmiIA0X7HeqajBFBEXtKWJQA/Kt8VK90HlHUa9vE
         Nlk172Ts6FEeuSjifiozcsSKqkyjwbPPDNLq9IznOVUM2Nvb0kQl7F6FmsfGBmoJPTO3
         bDWoBBal/KJKK55+lu5LAS+VDo24WExs6xjXjB1HNaNwLOcJAJrEz4c5E6ax1h2/HQT8
         haKZ571zxZ90zN5QYYrbNIPKqP/qKILy534/EODVtPqUesgYrTbf6fcG5U/bndtFuEyl
         L4hRlgtM4MquRKAHeygrvB46Z7vzspPZtJWjTVFGAuPOl/hWgk1PIAUdJ+IPfhA1XmDE
         9qVg==
X-Gm-Message-State: AOAM531qnXWwb39qg1OrixBB0BDlrHk5L5E2hOnyzlKy8mrGyOgclUmO
        xOO2S4/hu+NqL8OFYve4H0Y=
X-Google-Smtp-Source: ABdhPJytryDhq+qUx2Fg/Wm2Ffm/mJIzHC/vUyRTkwgNb/66an9LNPvh2F28BX6osnL9vRZFyD+Ilw==
X-Received: by 2002:a17:902:e849:b029:114:1fab:b9e1 with SMTP id t9-20020a170902e849b02901141fabb9e1mr2329194plg.76.1623127326061;
        Mon, 07 Jun 2021 21:42:06 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:0:34c3:22d8:b92a:ddfa])
        by smtp.gmail.com with ESMTPSA id 30sm9923521pgo.7.2021.06.07.21.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 21:42:05 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: fix various gadget panics on 10gbps cabling
Date:   Mon,  7 Jun 2021 21:42:01 -0700
Message-Id: <20210608044201.3898589-1-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
index 8bb25773b61e..d624f9f57f34 100644
--- a/drivers/usb/gadget/config.c
+++ b/drivers/usb/gadget/config.c
@@ -164,6 +164,10 @@ int usb_assign_descriptors(struct usb_function *f,
 {
 	struct usb_gadget *g = f->config->cdev->gadget;
 
+	/* In most cases this is good enough as a default */
+	if (!ssp)
+		ssp = ss;
+
 	if (fs) {
 		f->fs_descriptors = usb_copy_descriptors(fs);
 		if (!f->fs_descriptors)
-- 
2.32.0.rc1.229.g3e70b5a671-goog

