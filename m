Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A01C1F8660
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jun 2020 05:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgFND1K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Jun 2020 23:27:10 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:50988 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgFND1I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Jun 2020 23:27:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49l0JC46vKz9vCCt
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2020 03:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zVMhc-rSsXsT for <linux-usb@vger.kernel.org>;
        Sat, 13 Jun 2020 22:27:07 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49l0JC2C7Fz9vCCG
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2020 22:27:07 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49l0JC2C7Fz9vCCG
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49l0JC2C7Fz9vCCG
Received: by mail-io1-f70.google.com with SMTP id x2so3552610iof.0
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2020 20:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=trMCJ61FldcoujsZIY8Wf46yXCeSnen3DQpQ/YLOJjY=;
        b=PMV4p27qe+K63USGyKIQ9bcGu/GsoDsDqegA8UwSQZw0sv3KC59At/WZujXLw9ZsUb
         HcJryey5zYLoFYxvzv4U5dFXYsiMRj8Nc9C/6SQYiSSLClcKkFn1PKXhXGRYHnEIODSq
         mQ3OxdnirTx75iKHaZJVJ+YacjtCKIFqgzDeMNR6OKmKA/Y+Jw1RJ4ojB7w61h/4hY+y
         tePrA21qSLdtdIx48AicGEfPBBjCnN9KwLMgJ7xX+IoTH2Tt1Xc/CodBuA/aA4mFH4Mh
         JTAkSVUIsBNAw4wjUMhfSJjlaBNDJS5phngaN5khm8wawlumTEWTRUvwOv0yAoXWeQ62
         /smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=trMCJ61FldcoujsZIY8Wf46yXCeSnen3DQpQ/YLOJjY=;
        b=euYNmhCWygCWn288HQfjNRo48wfv/6q50CE/MCFVkCovEMgw2zzZwFy/YbBu1+paT3
         lgXaQzS1uymZoGNUxFrIS3mwvaEKG7aVbktq3g0ikgH7UjS6PXu9jMWEUijk+EiccHU1
         3UQ10ARCGE6lOi5so+1RLjtUyh5Oz7tmrYDREV/jSF+cGimvJfmNtabX8PoSUUPy3f8r
         3vpZumxe00hlLTd61VMIb4jFkdHoEfhWidMx/V2MxCTT2he+d+s1H+uDVkUy+I66PzyA
         QMo6jrLX+gsxpjj48GUubQSNXSoekjUQ+RuQ++FU6+ImOHuCfovCrr3Q5SFLOGfTl4kR
         Kmsw==
X-Gm-Message-State: AOAM533cO0yc74iWVC3/yVS/Bsng+Er3UowwGxvlEY1N72mcJr3G5Nsv
        Y584Hyp/UOAGm5XWBXpUCt1W3sdjQ5Nlrdr3sgcBkg1K/2zrl863Cxpy8OBTdOzix7O8aCe735J
        9gE1LsupEL6wAKT0XZ2GpYWsk
X-Received: by 2002:a92:aa85:: with SMTP id p5mr21225375ill.19.1592105226916;
        Sat, 13 Jun 2020 20:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/2Mlse3DqnWhjkkv7/1KCD9SfYfqSen/Um715vQpYWXomgiHxEjTQtmup3MrFv0QCPVeL7Q==
X-Received: by 2002:a92:aa85:: with SMTP id p5mr21225364ill.19.1592105226772;
        Sat, 13 Jun 2020 20:27:06 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
        by smtp.gmail.com with ESMTPSA id b13sm5654007ilq.20.2020.06.13.20.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:27:06 -0700 (PDT)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, wu000273@umn.edu, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: musb: fix reference count leak in musb_irq_work
Date:   Sat, 13 Jun 2020 22:27:04 -0500
Message-Id: <20200614032704.129010-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

musb_irq_work() calls pm_runtime_get_sync() that increments
the reference counter. In case of failure, decrement the reference
count and return the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/usb/musb/musb_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 384a8039a7fd..fd36a026bef0 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2070,6 +2070,7 @@ static void musb_irq_work(struct work_struct *data)
 	error = pm_runtime_get_sync(musb->controller);
 	if (error < 0) {
 		dev_err(musb->controller, "Could not enable: %i\n", error);
+		pm_runtime_put_autosuspend(musb->controller);
 
 		return;
 	}
-- 
2.25.1

