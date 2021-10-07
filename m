Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06304252F1
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 14:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241315AbhJGM1M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 08:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241310AbhJGM1H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Oct 2021 08:27:07 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0804C061746
        for <linux-usb@vger.kernel.org>; Thu,  7 Oct 2021 05:25:13 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t8so18653639wri.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Oct 2021 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hjek12AjZEr+Hd7KslG84+7uqBt591HUyaUi8tQnZ+g=;
        b=ixf10l39YJd9cAo21PWDq+V5gbJoGHGA3WGQI2rbQWS9DyUNwq5m4fbJJI+/MR3VVE
         gQ53Is9a9EC3v1RK6WFc74QUSYU9YklHG7NiKsyYKEZGYjmxmNwCQsVgzhj41iBmqcS9
         X7LuB0vaPcUIxFYE+LG0+K0Fo/Yxr8SxBQDmMsutCkPFOrKJhT0olik60uonJzLfYTKC
         Vty5FfwhR1MpUbucb76TKm5OE3gcRYVg32qjXoiET8KlOwtcn/zUNgT2nUzKAY79Yib2
         btcDwQj1YsMr8397aJQQexWn94Yk4iORmDo5DXW2PsPpmb2rnzXt+XSwXc1JqtOJH6o/
         dcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hjek12AjZEr+Hd7KslG84+7uqBt591HUyaUi8tQnZ+g=;
        b=zwoMo+AztGQC7JjgKt56YxpwuY33edOSZXqp2KLUKIZR6CRr6yLhu9aXmexAvgO0S9
         Q7+HX6igchbWOPDjueV88JOoyWVEA6AnNkEX5QRSTfqjVBsT4uEnXpmzPAy62SptQxIu
         g7fWi8AjbEGabG/TigXb3wKyEtoJnQ3ChbaVDN3yMAdy/IDTxzaiegckbq5jkXfZ1KBs
         fWMSJsrOy+OkNh2vGJM3cjlEMYGizY5Hfk674EYphWMlHvkkp5swviTmHcWV7mkZFGFG
         Yc/JKM2znHwgao7wkD4iVKNf06P6zi4Dvrirk5EmQ2RDrkOiiIrjbiBvnmCmndNGl6C7
         vLWw==
X-Gm-Message-State: AOAM532rCGpTxjppKHIi1GrbYGLyiiYG09FzhvHeCY7SF00ahz4+BYvx
        A2pPOJR85CHtzc8LuJDnt6vn2g==
X-Google-Smtp-Source: ABdhPJypex+YO3cToo2FEr66ejQWoRkzJhnvNLQxi7A92fIgDW/QbRSrdWUGF5bzq1xMbYze4Q3xBw==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr4279067wmm.61.1633609512360;
        Thu, 07 Oct 2021 05:25:12 -0700 (PDT)
Received: from ares.lan (156.red-79-144-201.dynamicip.rima-tde.net. [79.144.201.156])
        by smtp.gmail.com with ESMTPSA id y4sm3184368wry.95.2021.10.07.05.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 05:25:11 -0700 (PDT)
From:   Aleksander Morgado <aleksander@aleksander.es>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        Aleksander Morgado <aleksander@aleksander.es>
Subject: [PATCH] USB: serial: qcserial: add EM9191 QDL support
Date:   Thu,  7 Oct 2021 14:25:01 +0200
Message-Id: <20211007122501.11306-1-aleksander@aleksander.es>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the module boots into QDL download mode it exposes the 1199:90d2
ids, which can be mapped to the qcserial driver, and used to run
firmware upgrades (e.g. with the qmi-firmware-update program).

  T:  Bus=01 Lev=03 Prnt=08 Port=03 Cnt=01 Dev#= 10 Spd=480 MxCh= 0
  D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
  P:  Vendor=1199 ProdID=90d2 Rev=00.00
  S:  Manufacturer=Sierra Wireless, Incorporated
  S:  Product=Sierra Wireless EM9191
  S:  SerialNumber=8W0382004102A109
  C:  #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=2mA
  I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=qcserial

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 drivers/usb/serial/qcserial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 83da8236e3c8..c18bf8164bc2 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -165,6 +165,7 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x1199, 0x907b)},	/* Sierra Wireless EM74xx */
 	{DEVICE_SWI(0x1199, 0x9090)},	/* Sierra Wireless EM7565 QDL */
 	{DEVICE_SWI(0x1199, 0x9091)},	/* Sierra Wireless EM7565 */
+	{DEVICE_SWI(0x1199, 0x90d2)},	/* Sierra Wireless EM9191 QDL */
 	{DEVICE_SWI(0x413c, 0x81a2)},	/* Dell Wireless 5806 Gobi(TM) 4G LTE Mobile Broadband Card */
 	{DEVICE_SWI(0x413c, 0x81a3)},	/* Dell Wireless 5570 HSPA+ (42Mbps) Mobile Broadband Card */
 	{DEVICE_SWI(0x413c, 0x81a4)},	/* Dell Wireless 5570e HSPA+ (42Mbps) Mobile Broadband Card */
-- 
2.32.0

