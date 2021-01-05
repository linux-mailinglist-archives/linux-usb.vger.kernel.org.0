Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B01C2EAC4D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 14:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730355AbhAENrm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 08:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbhAENrl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 08:47:41 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DB7C06179F
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 05:46:59 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 30so16607407pgr.6
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 05:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BboSdl56X5tZCa1JC8GMF3OJjVd8bFB4tSitY3B1i3g=;
        b=I4SYlf3ZoglmtWzpWKqzObH2UCZ74zqUB+IYUD2YR6C+CU+GbM0Lxrq4O2dbetV2eR
         hC6Ye9eHbzfS/a2v1Gj++CegqMWIU5jLEPCKIc1HMzVuOUk2+KqhIXny9f+J5eGfGYM6
         ARXzatciOSRZzOhVzyVoHbwyal9SpE5EWm/VuK4s4Px0oH5EP+uic8ZJI7ftxanziWCH
         TpF5orSjhRtfboOJZ4Et5Ghjqgt2J+Fbpm7+jtcinX32U3qrJjHAUwZ0tgqhMUyyiL4h
         iCwz7bP5zWlD9A3KcQQL5PLXe3y53vGbuv2oHW7JPy/jEw+w9gkYzMboiXbPSURn5+IQ
         qZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BboSdl56X5tZCa1JC8GMF3OJjVd8bFB4tSitY3B1i3g=;
        b=RNvYNHfsdWAcHjFwLAJxkB1/Rz8DiP0IeMvuf1F3ETpwYbFptnEYDuLiPNvzLPQmJu
         IHP3LpAopQqfz97e2qyo/Y0Q4Ug9yiS8iQDeDIw5poXmFw0fSD9ZPrE4Jk+AMhLCQs9T
         5iCmYIc4Ln4iAtU/z900XumPxesNGAcjJLY41I7EvEGtnI52ti9lM9pab28vDTo8SoI4
         mCdG23i1TXK/duGxaE4Itg9ZtrBImq/n2BB/+VKTQtlCxCggHb50wlXVWm/ESYOpYJxO
         qk/H6QPNh+85SIKgDITMQFksbRDGHydJ5q7enhwuN9lG8ngAPrj5nEXYgXXaeqFPWYWA
         oUBQ==
X-Gm-Message-State: AOAM530BwtJwxf2psEJjjHfo8zVnqTLZ5xGKY5OEtEpv22XyultxtoWV
        Kltt4I5+5mwDugxelg4uPcU=
X-Google-Smtp-Source: ABdhPJyZPtbwhHTwQkBgffoyLpLNzDH7wqmb40ao0E5uzkhOhZTmTVyFs0jP377/ILBU3PZspjP2Sw==
X-Received: by 2002:a62:78ca:0:b029:19d:ce86:fc22 with SMTP id t193-20020a6278ca0000b029019dce86fc22mr69656843pfc.39.1609854419154;
        Tue, 05 Jan 2021 05:46:59 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
        by smtp.gmail.com with ESMTPSA id s7sm2564508pju.37.2021.01.05.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:46:58 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id 1C7CF900901;
        Tue,  5 Jan 2021 13:46:54 +0000 (GMT)
Date:   Tue, 5 Jan 2021 13:46:53 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: dwc2 gadget rejecting new AIO transfer when bus is suspended
Message-ID: <20210105134653.621bed8a@gmail.com>
In-Reply-To: <a87cca5e-786c-ca45-a98c-1429680621a6@synopsys.com>
References: <20201224125012.4df1d26c@gmail.com>
        <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
        <20201226004627.657ba339@gmail.com>
        <20201226165230.GB606763@rowland.harvard.edu>
        <20201227014900.2ff91bab@gmail.com>
        <a87cca5e-786c-ca45-a98c-1429680621a6@synopsys.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Artur,

On Tue, 29 Dec 2020 07:29:27 +0000, Artur Petrosyan <Arthur.Petrosyan@synopsys.com> wrote:
> Refactoring the driver to always accept any EP request independent of 
> the state (suspend), requires lot of investigation. We will decide and 
> implement later.
> 
> For your case we suggest the following workaround in 
> "dwc2_hsotg_ep_queue()" function to additionally check "hsotg->power_down":

I did test your change (with a trivial adaptation, see below) on
5.11.0-rc1 and I can confirm the AIO submission is accepted in my
use-case, despite a 4-seconds sleep between UDC being bound and AIO
submission to try to trigger the issue (which it does on an unpatched
5.10).

The gadget goes on to correctly respond to the host, so this looks good
to me.

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 0a0d11151cfb8..dc676f3b1d799 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1387,7 +1387,7 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 		req->zero, req->short_not_ok);
 
 	/* Prevent new request submission when controller is suspended */
-	if (hs->lx_state != DWC2_L0) {
+	if (hs->lx_state != DWC2_L0 && hs->params.power_down) {
 		dev_dbg(hs->dev, "%s: submit request only in active state\n",
 			__func__);
 		return -EAGAIN;

Regards,
-- 
Vincent Pelletier
