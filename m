Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59AD2F9DE3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390108AbhARLSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:57298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390061AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60CF322B40;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=Jrf86bTZuvWL7qBEsZp5Tt7u1ih/Pww254arLofaApY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nXmqaJLNpOzmuYj0+XlqRg3Sx/kVpfjnQrLfekP1F6jEVxyfuSIwPZ8wO1Ra6RNVs
         txgiJOjlFhWef4C8ec9qTO5iCHAIgoTKu0FTedS4zSrQw3qCnytDzkr+/39N+73gj4
         NwTCrYDl+Z4jKaOva3S05NiiwXWenkU835qX/0CYUnz5AR2Ivr2QENLActHCkdUKqd
         HvYWp2WiGPRdqSFeV7XbLg0QlmyF8Eii5rj8Er97ZxRnjcU3NOiSMCFgxxcP7EBte4
         Xfp+iA8xNAqCCGhbqCeRdxb4Nwip5zXO0F/Q3B0Lh6ItE1/wGZiwUdh5TWV8SJU83p
         XtAOfI4ciu9YA==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUc-0001M3-3y; Mon, 18 Jan 2021 12:14:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/6] USB: serial: io_ti: fix a debug-message copy-paste error
Date:   Mon, 18 Jan 2021 12:14:24 +0100
Message-Id: <20210118111426.5147-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix a copy-paste error in the ti_vread_sync() debug message.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_ti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 0c4062698603..0bbfa47e04b7 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -266,7 +266,7 @@ static int ti_vread_sync(struct usb_device *dev, __u8 request,
 	if (status < 0)
 		return status;
 	if (status != size) {
-		dev_dbg(&dev->dev, "%s - wanted to write %d, but only wrote %d\n",
+		dev_dbg(&dev->dev, "%s - wanted to read %d, but only read %d\n",
 			__func__, size, status);
 		return -ECOMM;
 	}
-- 
2.26.2

