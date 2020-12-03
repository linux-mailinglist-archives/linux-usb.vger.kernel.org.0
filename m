Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A582CCD33
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 04:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgLCDQ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 22:16:28 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:10391 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729724AbgLCDQX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Dec 2020 22:16:23 -0500
X-Greylist: delayed 482 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Dec 2020 22:16:22 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606965145;
        s=strato-dkim-0002; d=aiyionpri.me;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=xpm4kfSvb2+EMaMQUQN6rpKq8IYaRIgm9jSxMhIT5Bc=;
        b=puQlA3NeoF67g0M1HmGEHkJIUouwmUm1MG1pl/lLeEvmauJ5/xKc/7NKpEBpiouHqF
        cD2nrQJajc6C+ddOdG6mqENRFflMOZt/e4jlBUlH11eAbhsu04bfT9Hclb01VYUHFAHD
        C9R15ET/n2SBxa2hTK8ctq/PS3JuAfWFJ5C3XuXGkWkr2a8s+F47rmWMccUO4yHML12R
        isg3btCGvqcumtZN3UzWp9tTPa5dUoBiWXuK/mvVR+XS9/01O6M/89oWK97bHO/SYiyT
        hoxc/VonSn7CqcNlTUscctD4UxD5Otv3BEGw5B2xe+AjdSU8L5dW8WherjdNVAzMnSWY
        iEEg==
X-RZG-AUTH: ":IWkkdEmxcvCtRDtHUQOu48a0Nfy9hOkboq9r6d0vrgVDHZTjCI3RMwuZyUMg713B4qSDlwrG0lQguDZ8OYgibd2Y7MdGo21Hac8="
X-RZG-CLASS-ID: mo00
Received: from chromia.speedport.ip
        by smtp.strato.de (RZmta 47.3.4 AUTH)
        with ESMTPSA id k0aec2wB334N1Dz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 3 Dec 2020 04:04:23 +0100 (CET)
From:   Jan-Niklas Burfeind <kernel@aiyionpri.me>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>
Subject: [PATCH] USB: serial: ch341: add new Product ID for CH341A
Date:   Thu,  3 Dec 2020 04:03:59 +0100
Message-Id: <20201203030359.52583-1-kernel@aiyionpri.me>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add PID for CH340 that's found on a ch341 based Programmer made by keeyees.
The specific device that contains the serial converter is described
here: http://www.keeyees.com/a/Products/ej/36.html

The driver works flawlessly as soon as the new PID (0x5512) is added to
it.

Signed-off-by: Jan-Niklas Burfeind <kernel@aiyionpri.me>
---
 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index a2e2f56c88cd..b157a230178d 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -84,6 +84,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x4348, 0x5523) },
 	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
+	{ USB_DEVICE(0x1a86, 0x5512) },
 	{ USB_DEVICE(0x1a86, 0x5523) },
 	{ },
 };
-- 
2.29.2

