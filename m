Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7100D15A739
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 12:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgBLK7z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 05:59:55 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33706 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbgBLK7v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Feb 2020 05:59:51 -0500
Received: by mail-wr1-f67.google.com with SMTP id u6so1710747wrt.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2020 02:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WADwYZAFozcjUcaNyh7Kf7qDOuVzzulZ+EPYmgS/ug=;
        b=fuh3dDrYkv830SEwfl+Gn/HIHAW0qEUw/EGHH1awGm4CJl9986LeURUBY95VKJJLkg
         40E0SVzv9Khu2zcvstRjkPG7B5O88LY8+oF1T9SxcoPPIspDntkT9/g5IF7ZqmozZBLf
         V7uPsvEfuJ3ytQwOHMJwH3uVcvpYwwuEto4UV0Y4AzZK9dTKNXrfWnmQWkuftxYd0vvk
         jFZ4ScRxOgXNIvbQzQr66Bhj3PFFBmJ83WgIIwuBNcWmybE5YoGWQSJXrhCGuitSNDQ7
         e4XM1FpP1u2FSNggqhi8EkF1U1bke7Mck+BRsCccEn/dQMghtZ/TDj1hzOuFmpM3n4qE
         YMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0WADwYZAFozcjUcaNyh7Kf7qDOuVzzulZ+EPYmgS/ug=;
        b=skFZPtWvr3Tk2wtTQVBtuKU3ZTT8nGUeU43UVlcDu/HxEPrjDQvFhWBH0xHHbuD67K
         v4XMS1ECO5hNTDrgyX9Rtn6z2TxYeohFCcj6H0wdHeAXxNPNdoYuxdc5pLITpGgJ3VYc
         jFt61XK/JkjqU3RnyokY+Y3qCjB+N8A33QVdPlzUdT041C0S4jLNhy8bPpAneArbtyhx
         zHbEQnfDDZxyMayF73Dbz7HzYd5+pFf7o83K+3XUfu6u24aAodw0pf/lp52sbNKzjmp1
         QCHCxShgtpJaakesTkGMkHuEE9HNJdvPJBoiauGYS7jMaBkI00GbKwzXkno2NFDnv5O2
         FTww==
X-Gm-Message-State: APjAAAV2wpa6Qes8BRZQMxOTSlvnBM7RcB4gis/vb27N0cE49iApCfEJ
        ChG0hF58gJk9tACE3gP4ZSp0iQ==
X-Google-Smtp-Source: APXvYqwbrMdOWkUnuIhJNtCf0g3LbuxklJ/KJtRqXXubgkOhbjraTmG58tAP8F49wXEmVf1wvP84Tg==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr14279292wrr.32.1581505189212;
        Wed, 12 Feb 2020 02:59:49 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id j5sm180760wrb.33.2020.02.12.02.59.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 02:59:48 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Felipe Balbi <balbi@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: udc-xilinx: Fix xudc_stop() kernel-doc format
Date:   Wed, 12 Feb 2020 11:59:47 +0100
Message-Id: <c753b529bdcdfdd40a3cf69121527ec8c63775cb.1581505183.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patch removes "driver" parameter which has been removed without
updating kernel-doc format.

Fixes: 22835b807e7c ("usb: gadget: remove unnecessary 'driver' argument")
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/usb/gadget/udc/udc-xilinx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 29d8e5f8bb58..b1cfc8279c3d 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1399,7 +1399,6 @@ static int xudc_start(struct usb_gadget *gadget,
 /**
  * xudc_stop - stops the device.
  * @gadget: pointer to the usb gadget structure
- * @driver: pointer to usb gadget driver structure
  *
  * Return: zero always
  */
-- 
2.25.0

