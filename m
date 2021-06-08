Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC92B39FC87
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 18:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhFHQ3Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 12:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhFHQ3Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 12:29:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20306C061574
        for <linux-usb@vger.kernel.org>; Tue,  8 Jun 2021 09:27:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a1so23294696lfr.12
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4LD6OwX1PtA/DnhD9mCwB75VDvoCXN1qyZuB5xx/nA=;
        b=ptzNXiFTdEZFcbFOg/B2sLUYA7IGQgTnnp8zvXyWN4XWaLdEmvurn4cFMxlFqx4Brv
         jX1MHW7AcK6OvZCorD3om/uQz0/73m5HwUPpZqLh8lPTPfTkIap+S3fNpM9FAwRiMC/r
         9lavApv5oUYSRWl+OkdZYYRXXsahefuReAaMQluyEd5vfu8YyJ14ibrrzbMtgk7pafAU
         OEexWrWv0Go+o7/TNswxyAbhpmeok2LyFvrUKvpQiVcTaOlBhNVeT5N5uHdx/J0yHLj2
         feX2wMTYWph7yoPrbrzwINsLnbTcc4nbsortGqXYDxDOiaIOPwi2NGJaKYB8YxfLmKYi
         cpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4LD6OwX1PtA/DnhD9mCwB75VDvoCXN1qyZuB5xx/nA=;
        b=N0hn5LMHkMs2G6NpjHy575o27Ip0yyNJZj4hGvmq50mrqTuttN78sU0YFPkG5GJ1lq
         qQURodeMtYU+T3Zw+JLeHvdzeH1wY31hYopxpIscY5pLOdovm9ukDOuUOTkR3xrSbqwZ
         lGkPLH7nd0m+60XKkL5u/gV9r3kkTcn7bxTEiMrPHVP2D+/UCMG+30NxlnPmirKVKnXH
         vcRqz2Km4xc2UOSO1LHdKa/7vf24aDwSAPM+jgW/myuT94DRoy4JODNzl6A/DduXXzg9
         KEVnj2YbGt5YFlYwifhyR9HTHRGT+WdYMkkSyQtyoPok/o4H52IOcJ6EucA9u+EARzyC
         OJXQ==
X-Gm-Message-State: AOAM531KmL+jiEC2htFRgELTljSZUlau0T1UtuvPtoCmNecr+Trte+z4
        Tv5Pt+AkuLAJ67p4hxHaftrovgaINEJRf0xDGDQ=
X-Google-Smtp-Source: ABdhPJwySCNZETg8al10N0VH7Op6IFrWfD5hY5ZfI0ag/UNKoSuVo4ssDONnkN22egYjsMcWE6kHkg==
X-Received: by 2002:a19:6515:: with SMTP id z21mr15897160lfb.641.1623169624392;
        Tue, 08 Jun 2021 09:27:04 -0700 (PDT)
Received: from ubuntu.gopro.lcl (213-155-158-249.teliacarrier-cust.com. [213.155.158.249])
        by smtp.gmail.com with ESMTPSA id n21sm18330lfq.12.2021.06.08.09.27.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 09:27:03 -0700 (PDT)
From:   Marian-Cristian Rotariu <marian.c.rotariu@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     mircescu@gmail.com, marian.c.rotariu@gmail.com
Subject: [PATCH] usb: dwc3: ep0: fix NULL pointer exception
Date:   Tue,  8 Jun 2021 19:26:50 +0300
Message-Id: <20210608162650.58426-1-marian.c.rotariu@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no validation of the index from dwc3_wIndex_to_dep() and we might
be referring a non-existing ep and trigger a NULL pointer exception. In
certain configurations we might use fewer eps and the index might wrongly
indicate a larger ep index than existing.

By adding this validation from the patch we can actually report a wrong
index back to the caller.

In our usecase we are using a composite device on an older kernel, but
upstream might use this fix also. Unfortunately, I cannot describe the
hardware for others to reproduce the issue as it is a proprietary
implementation.

[   82.958261] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a4
[   82.966891] Mem abort info:
[   82.969663]   ESR = 0x96000006
[   82.972703]   Exception class = DABT (current EL), IL = 32 bits
[   82.978603]   SET = 0, FnV = 0
[   82.981642]   EA = 0, S1PTW = 0
[   82.984765] Data abort info:
[   82.987631]   ISV = 0, ISS = 0x00000006
[   82.991449]   CM = 0, WnR = 0
[   82.994409] user pgtable: 4k pages, 39-bit VAs, pgdp = 00000000c6210ccc
[   83.000999] [00000000000000a4] pgd=0000000053aa5003, pud=0000000053aa5003, pmd=0000000000000000
[   83.009685] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   83.026433] Process irq/62-dwc3 (pid: 303, stack limit = 0x000000003985154c)
[   83.033470] CPU: 0 PID: 303 Comm: irq/62-dwc3 Not tainted 4.19.124 #1
[   83.044836] pstate: 60000085 (nZCv daIf -PAN -UAO)
[   83.049628] pc : dwc3_ep0_handle_feature+0x414/0x43c
[   83.054558] lr : dwc3_ep0_interrupt+0x3b4/0xc94

...

[   83.141788] Call trace:
[   83.144227]  dwc3_ep0_handle_feature+0x414/0x43c
[   83.148823]  dwc3_ep0_interrupt+0x3b4/0xc94
[   83.181546] ---[ end trace aac6b5267d84c32f ]---

Signed-off-by: Marian-Cristian Rotariu <marian.c.rotariu@gmail.com>
---
 linux-4.19.124/drivers/usb/dwc3/ep0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-4.19.124/drivers/usb/dwc3/ep0.c b/linux-4.19.124/drivers/usb/dwc3/ep0.c
index 662a1298b..3a55bbdde 100644
--- a/linux-4.19.124/drivers/usb/dwc3/ep0.c
+++ b/linux-4.19.124/drivers/usb/dwc3/ep0.c
@@ -292,6 +292,9 @@ static struct dwc3_ep *dwc3_wIndex_to_dep(struct dwc3 *dwc, __le16 wIndex_le)
 		epnum |= 1;
 
 	dep = dwc->eps[epnum];
+	if (dep == NULL)
+		return NULL;
+
 	if (dep->flags & DWC3_EP_ENABLED)
 		return dep;
 
-- 
2.29.0

