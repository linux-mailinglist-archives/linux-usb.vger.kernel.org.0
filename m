Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A43040DD5E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 16:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238919AbhIPO5p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 10:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbhIPO5p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Sep 2021 10:57:45 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CD8C061574
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 07:56:25 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id r2so6378830pgl.10
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=EcNUVDQUowrW/nhMYpMEil5d+gqVP024lSQTdRxS5I0=;
        b=fkYwmYqW1lCvyF6nSqs6tsh7g8swRZLxml46pj+5UzAknzLs0jbSaVnXTMjl08nHlT
         lzcsfORCtACcrkKfJ3u3Bfc0R64QEDNRRDy8r4MiQiExr7Bms+6wyeDcvrM70lMvXhjR
         F8QSM/kBk1b4plzYXdBmxxYhStupIppGlpT2uw7p9XywPBKnPzIDR/UClnNDYCNNqJqX
         VAhxq8c2ZwCWzejgoE38ccsu2tv2SI1ygefWnkOjKsaHsh1mohPnoilacJB6Jgt4GGS8
         kJ+/gv27X4MDaCeAgOKcDPZSN5gkgcOkq20xM6qeXaRN3Rz6vg/yd9jpzL2eStBN9HZd
         iCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=EcNUVDQUowrW/nhMYpMEil5d+gqVP024lSQTdRxS5I0=;
        b=MJPfS8LHYROc7O8jajhMCVgqhFX9+D1fS6wVAS9D/MwErLN0s8IVYvUG3ok68uZEer
         e0eI/lz01nN0/1tmA9oVJczEx3Js5kPnDQqk86V5ihcWI7K+MuOeve40luTKJKMNaPYs
         SsHiu2fsyj0gCafgpobK5c/gR45W2cWrz250VgLP/s7ku74vu95YHeJjeltJxfhlxvGM
         QhJ/Zd2TG16QDEavHjZdS6GLdUf81Z9i9/zuiwRsLhE14OLu+7h7JbuoaAMMApNR/Jvd
         zqBLY9t0UXkFX/CnsZbfsBCHuFaHAfnbDqDI0Tvj9zyIDN0vJS9qsU8wKOUpA35tGcZG
         MXKg==
X-Gm-Message-State: AOAM53055tG+vN/beAPl2UukwpEftDm5R70WeL27KVCxaUugAG0Kupg7
        jLyAm2fyxFokgeJBGGxyt+hGE6gzjjDp4jXUYDlOxA==
X-Google-Smtp-Source: ABdhPJwGfgsO1BeG6DpI8GDGuVIQ9bdaZxPpQQ6T1NgyxePCwBpdwokBOnK8VtP73BKnREToTc02xA==
X-Received: by 2002:a63:7a5a:: with SMTP id j26mr5455505pgn.80.1631804184496;
        Thu, 16 Sep 2021 07:56:24 -0700 (PDT)
Received: from ws2 ([185.65.135.245])
        by smtp.gmail.com with ESMTPSA id d63sm8294915pjk.17.2021.09.16.07.56.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 07:56:24 -0700 (PDT)
From:   Andreas Bauer <andreas.bauer.nexus@gmail.com>
X-Google-Original-From: Andreas Bauer <Andreas.Bauer.Nexus@gmail.com>
Date:   Thu, 16 Sep 2021 21:56:15 +0700
To:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget/legacy/ether: assume saner default power mode
Message-ID: <YUNbDyoTPa+5J9Od@ws2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


I propose the included patch to the OTG USB ethernet gadget code:

  Report default of bus powered and 500mA bMaxPower consumption.

Reason:

  The USB spec requires all devices consuming more than 100mA from
  the bus to report in this manner. Devices such as Rpi Zero can operate
  in this mode and will then falsly report being self-powered when they
  are not.

  The more sane default is to report being 500mA bus-powered than being
  self-powered

This patch was born from an issue within the Raspberry Pi Zero ecosystem,
therefore I would invite comment regarding other usage of this OTG code.

Best regards,

Andreas

$ diff -u linux-5.14.2/drivers/usb/gadget/legacy/ether.c.orig linux-5.14.2/drivers/usb/gadget/legacy/ether.c
--- linux-5.14.2/drivers/usb/gadget/legacy/ether.c.orig	2021-09-08 13:52:41.000000000 +0700
+++ linux-5.14.2/drivers/usb/gadget/legacy/ether.c	2021-09-16 21:25:06.782958554 +0700
@@ -296,7 +296,8 @@
 	/* .label = f(hardware) */
 	.bConfigurationValue	= 1,
 	/* .iConfiguration = DYNAMIC */
-	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
+	.bmAttributes		= 0,   /* bus powered implied */
+	.bMaxPower		= 250, /* 500mA in 2mA units */
 };
 
 /*-------------------------------------------------------------------------*/
