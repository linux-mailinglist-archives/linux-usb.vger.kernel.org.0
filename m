Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072321C7A2C
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 21:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgEFTYH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 15:24:07 -0400
Received: from node.akkea.ca ([192.155.83.177]:50632 "EHLO node.akkea.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728770AbgEFTYG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 15:24:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by node.akkea.ca (Postfix) with ESMTP id DA09F4E204E;
        Wed,  6 May 2020 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1588792705; bh=hgjDEbhHP+Rph+2Z4aYps749rxVfZblv9VmXbTlQqC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OjZ76XOO5EZxild9iF5h+jy2KH3fPzl7hRzKIi9guV9GTHz2C8woj1xFXcez36Zsm
         VkqPlVah9hQB44vMZfd+drgjfx5PliK4ZVvtOSRABq2HQHfopHuWggrX5Z3u/Lgmbq
         z4NSRUbeFx1dfhQ0FYDigyFOZ906O6Et8sHb1sKw=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
        by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cLgU-atzt1fn; Wed,  6 May 2020 19:18:25 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net [70.66.86.75])
        by node.akkea.ca (Postfix) with ESMTPSA id 5B66F4E2006;
        Wed,  6 May 2020 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1588792705; bh=hgjDEbhHP+Rph+2Z4aYps749rxVfZblv9VmXbTlQqC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OjZ76XOO5EZxild9iF5h+jy2KH3fPzl7hRzKIi9guV9GTHz2C8woj1xFXcez36Zsm
         VkqPlVah9hQB44vMZfd+drgjfx5PliK4ZVvtOSRABq2HQHfopHuWggrX5Z3u/Lgmbq
         z4NSRUbeFx1dfhQ0FYDigyFOZ906O6Et8sHb1sKw=
From:   Angus Ainslie <angus@akkea.ca>
To:     angus@akkea.ca
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usb: typec: tps6598x: add device tree hooks
Date:   Wed,  6 May 2020 12:17:17 -0700
Message-Id: <20200506191718.2144752-2-angus@akkea.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200506191718.2144752-1-angus@akkea.ca>
References: <20200506191718.2144752-1-angus@akkea.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a compatible string for the devicetree.

Signed-off-by: Angus Ainslie <angus@akkea.ca>
---
 drivers/usb/typec/tps6598x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index f661d8722ee0..2e71a35cc9d8 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -981,9 +981,16 @@ static const struct i2c_device_id tps6598x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tps6598x_id);
 
+static const struct of_device_id tps6598x_of_match[] = {
+	{ .compatible = "ti,tps6598x", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tps6598x_of_match);
+
 static struct i2c_driver tps6598x_i2c_driver = {
 	.driver = {
 		.name = "tps6598x",
+		.of_match_table = of_match_ptr(tps6598x_of_match),
 	},
 	.probe_new = tps6598x_probe,
 	.remove = tps6598x_remove,
-- 
2.25.1

