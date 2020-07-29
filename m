Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038362323B6
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 19:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgG2RtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 13:49:22 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43993 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RtV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 13:49:21 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id ECA161BF203;
        Wed, 29 Jul 2020 17:49:19 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Trevor Woerner <twoerner@gmail.com>
Cc:     jamesg@zaltys.org, linux-usb@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] usb: ohci-nxp: add support for stotg04 phy
Date:   Wed, 29 Jul 2020 19:49:18 +0200
Message-Id: <20200729174918.321615-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729172829.GA3679@piout.net>
References: <20200729172829.GA3679@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The STOTG04 phy is used as a drop-in replacement of the ISP1301 but some
bits doesn't have exactly the same meaning and this can lead to issues.
Detect the phy dynamically and avoid writing to reserved bits.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Hi Trevor, this is totally untested but at least it builds ;)

 drivers/usb/host/ohci-nxp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 85878e8ad331..36ab1501c28f 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -55,6 +55,15 @@ static struct clk *usb_host_clk;
 
 static void isp1301_configure_lpc32xx(void)
 {
+	u8 value, atx_is_stotg = 0;
+	s32 vendor, product;
+
+	vendor = i2c_smbus_read_word_data(isp1301_i2c_client, 0x00);
+	product = i2c_smbus_read_word_data(isp1301_i2c_client, 0x02);
+
+	if (vendor == 0x0483 && product == 0xa0c4)
+		atx_is_stotg = 1;
+
 	/* LPC32XX only supports DAT_SE0 USB mode */
 	/* This sequence is important */
 
@@ -70,9 +79,11 @@ static void isp1301_configure_lpc32xx(void)
 	i2c_smbus_write_byte_data(isp1301_i2c_client,
 		  (ISP1301_I2C_MODE_CONTROL_2 | ISP1301_I2C_REG_CLEAR_ADDR),
 		  ~0);
+	value = MC2_BI_DI | MC2_PSW_EN;
+	if (!atx_is_stotg)
+		value |= MC2_SPD_SUSP_CTRL;
 	i2c_smbus_write_byte_data(isp1301_i2c_client,
-		ISP1301_I2C_MODE_CONTROL_2,
-		(MC2_BI_DI | MC2_PSW_EN | MC2_SPD_SUSP_CTRL));
+		ISP1301_I2C_MODE_CONTROL_2, value);
 	i2c_smbus_write_byte_data(isp1301_i2c_client,
 		(ISP1301_I2C_OTG_CONTROL_1 | ISP1301_I2C_REG_CLEAR_ADDR), ~0);
 	i2c_smbus_write_byte_data(isp1301_i2c_client,
@@ -91,10 +102,8 @@ static void isp1301_configure_lpc32xx(void)
 	i2c_smbus_write_byte_data(isp1301_i2c_client,
 		ISP1301_I2C_INTERRUPT_RISING | ISP1301_I2C_REG_CLEAR_ADDR, ~0);
 
-	printk(KERN_INFO "ISP1301 Vendor ID  : 0x%04x\n",
-	      i2c_smbus_read_word_data(isp1301_i2c_client, 0x00));
-	printk(KERN_INFO "ISP1301 Product ID : 0x%04x\n",
-	      i2c_smbus_read_word_data(isp1301_i2c_client, 0x02));
+	printk(KERN_INFO "ISP1301 Vendor ID  : 0x%04x\n", vendor);
+	printk(KERN_INFO "ISP1301 Product ID : 0x%04x\n", product);
 	printk(KERN_INFO "ISP1301 Version ID : 0x%04x\n",
 	      i2c_smbus_read_word_data(isp1301_i2c_client, 0x14));
 }
-- 
2.26.2

