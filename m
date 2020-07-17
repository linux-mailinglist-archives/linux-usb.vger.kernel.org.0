Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C571A22435B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 20:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgGQSwy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 14:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbgGQSwy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 14:52:54 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF31C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 11:52:53 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a6so12186606wrm.4
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kryo-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xqe7Qw0WyiL+wuTbQ9VtGHN4HAGXDzdIwIBa2ghU0+w=;
        b=eSpAOLNjgPO+4ynK1QeAGem06+PQJ2ELwabhowXGkKNcNIOKlhjQXSyrMab6cu80wB
         h3KpRAKPqbORG88Byyr8kWY1AYBus+orCbkYF0+xNY1K0cR0HjDN6CMJHMVSHcqWVbQG
         GkOBz45cCyLeEomJlPA+2sLt+XcfAj84jkWQUFXkTGaUjDqkAXwJF+cFDVyfj14w8u8K
         ELQIAEq+cbPQD4ca5Bz3w4T2rZq1YYzg/8uGcockqM9PMVamgWLvacGIDXanT0mtlhoE
         ls7cveTn0aFTeL9YcYrDz7aoOEdRld+bpGDiy0NcOmAwzKC4+IntR3KdwwTVDXK45V72
         Igbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xqe7Qw0WyiL+wuTbQ9VtGHN4HAGXDzdIwIBa2ghU0+w=;
        b=eJPACxKKgS74NtepaCdrsR6gK9Yor05oNTxCvGwB0RR4mvrLjt9VpOLYFd15JEXFnl
         MVml5Ul9DhKqE+vPHmiGr1fCdxBxhPV1Y5Bx3U7o+nLjEJrxxhvR28SDJCBMCaNm7DWS
         kOe0XTdUNZolrFJxggmhVgUnXjannRCq36bdvldKGw9FBU/PvUhK9plDQO+T4Y23Fy7g
         U/+vAujK/P9GdHFnT9NhwlgWhDwAWvjTe6uekmygoJr/1sKiW1qENZ7eMjfV+CyrxZY8
         uRKqHFgUQaR8v2XaL3qhXFaygAEB0CWuxt4GwtxpmbxSWrV5UEaRzn5evx9K/Cw7NHSW
         fUww==
X-Gm-Message-State: AOAM532j5RrX41Wpk4ekiCSLKsbH5xS9XB59L98KhafhcHg9O/4WZ5+C
        /c4h17cyc4goChX77JAdzaY0eg==
X-Google-Smtp-Source: ABdhPJzE5d0dkM9a09oOZDz+u5hpxgBvisFeklfsljGHZjkDPndRCBU2CjXLXgTfp47+WNblU4jIbg==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr11165656wrs.320.1595011972128;
        Fri, 17 Jul 2020 11:52:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:168:9619:0:a7b:e9f6:ea26:8845])
        by smtp.gmail.com with ESMTPSA id a15sm18030455wrh.54.2020.07.17.11.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 11:52:51 -0700 (PDT)
From:   Erik Ekman <erik@kryo.se>
To:     Johan Hovold <johan@kernel.org>
Cc:     Erik Ekman <erik@kryo.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: qcserial: add EM7305 QDL product ID
Date:   Fri, 17 Jul 2020 20:51:18 +0200
Message-Id: <20200717185118.3640219-1-erik@kryo.se>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When running qmi-firmware-update on the Sierra Wireless EM7305 in a Toshiba
laptop, it changed product ID to 0x9062 when entering QDL mode:

usb 2-4: new high-speed USB device number 78 using xhci_hcd
usb 2-4: New USB device found, idVendor=1199, idProduct=9062, bcdDevice= 0.00
usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 2-4: Product: EM7305
usb 2-4: Manufacturer: Sierra Wireless, Incorporated

The upgrade could complete after running
 # echo 1199 9062 > /sys/bus/usb-serial/drivers/qcserial/new_id

qcserial 2-4:1.0: Qualcomm USB modem converter detected
usb 2-4: Qualcomm USB modem converter now attached to ttyUSB0

Signed-off-by: Erik Ekman <erik@kryo.se>
---
 drivers/usb/serial/qcserial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index d147feae83e6..0f60363c1bbc 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -155,6 +155,7 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x1199, 0x9056)},	/* Sierra Wireless Modem */
 	{DEVICE_SWI(0x1199, 0x9060)},	/* Sierra Wireless Modem */
 	{DEVICE_SWI(0x1199, 0x9061)},	/* Sierra Wireless Modem */
+	{DEVICE_SWI(0x1199, 0x9062)},	/* Sierra Wireless EM7305 QDL */
 	{DEVICE_SWI(0x1199, 0x9063)},	/* Sierra Wireless EM7305 */
 	{DEVICE_SWI(0x1199, 0x9070)},	/* Sierra Wireless MC74xx */
 	{DEVICE_SWI(0x1199, 0x9071)},	/* Sierra Wireless MC74xx */
-- 
2.26.2

