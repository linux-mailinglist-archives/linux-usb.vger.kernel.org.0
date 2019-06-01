Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E4631A6C
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2019 09:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfFAH7x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jun 2019 03:59:53 -0400
Received: from mx.zatta.me ([185.52.2.58]:60296 "EHLO mx.zatta.me"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbfFAH7x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 1 Jun 2019 03:59:53 -0400
X-Greylist: delayed 412 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Jun 2019 03:59:52 EDT
Date:   Sat, 1 Jun 2019 09:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zatta.me;
        s=myselector; t=1559375578;
        bh=GFATOyLII7Ejt47SkpZ0aXp5mCACrurs7PI8mYj2KQ4=;
        h=Date:From:To:Subject;
        b=XU+1M9+DHTqkIqz5JNVLnUms8uKH2LLAV2XwzOSdawrP6CDu7LrmDgctE0tq7RdoE
         7eUowgVjLF4hu+PBodBVZImuxD2WjAIxDu0fO1BotU0QZ2TM/vqQOOCFxKeYMy8zvs
         PYLdvV3vtOsmEPCWkAEZZtLsQq0dCy0grfktOExmWrQ2QkqLJdtjErIhx+m++BUR6y
         SM4SagGuCMXeWbZPtFA39zUe7dAaQdjqukcpGGiruhNkQYh/t3XSZDhZGEsFIVQzWe
         ccYxpUBQO62fnz42Y0r0W8mclcff1v/yE9D3Yn5QXIn0kHgFdHhCTLFSqZS6BuX9q1
         1RAid2txjutBw==
From:   Marco Zatta <marco@zatta.me>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
Message-ID: <20190601075257.GA24550@jimmy.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch fixes the chipmunk-like voice that manifets randomly when
using the integrated mic of the Logitech Webcam HD C270.

The issue was solved initially for this device by commit
2394d67e446bf616a0885167d5f0d397bdacfdfc but it was then reintroduced by
e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0. This patch is to have the fix
back.

Signed-off-by: Marco Zatta <marco@zatta.me>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 6082b008969b..6b6413073584 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -215,6 +215,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Cherry Stream G230 2.0 (G85-231) and 3.0 (G85-232) */
 	{ USB_DEVICE(0x046a, 0x0023), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* Logitech HD Webcam C270 */
+	{ USB_DEVICE(0x046d, 0x0825), .driver_info = USB_QUIRK_RESET_RESUME },
+
 	/* Logitech HD Pro Webcams C920, C920-C, C925e and C930e */
 	{ USB_DEVICE(0x046d, 0x082d), .driver_info = USB_QUIRK_DELAY_INIT },
 	{ USB_DEVICE(0x046d, 0x0841), .driver_info = USB_QUIRK_DELAY_INIT },
-- 
2.21.0

