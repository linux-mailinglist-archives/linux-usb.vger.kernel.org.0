Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F69F45DE79
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 17:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356333AbhKYQSf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 11:18:35 -0500
Received: from fieber.vanmierlo.com ([84.243.197.177]:57106 "EHLO
        kerio9.vanmierlo.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233555AbhKYQQe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Nov 2021 11:16:34 -0500
X-Greylist: delayed 1819 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Nov 2021 11:16:31 EST
X-Footer: dmFubWllcmxvLmNvbQ==
Received: from roundcube.vanmierlo.com ([192.168.37.37])
        (authenticated user m.brock@vanmierlo.com)
        by kerio9.vanmierlo.com (Kerio Connect 9.3.1 patch 1) with ESMTPA;
        Thu, 25 Nov 2021 16:42:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Nov 2021 16:42:27 +0100
From:   Maarten Brock <m.brock@vanmierlo.com>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: CP2105 gives kernel error -22 when in modem mode
Message-ID: <5eb560c81d2ea1a2b4602a92d9f48a89@vanmierlo.com>
X-Sender: m.brock@vanmierlo.com
User-Agent: Roundcube Webmail/1.3.3
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

When a uart of the CP2105 USB-serial chip is programmed to be in modem 
mode, all its gpio pins are in alternate use and none are available for 
gpio. Still the cp210x driver tries to add a gpiochip unconditionally, 
which results in an error.

> cp210x 1-1.4.4:1.0: cp210x converter detected
> usb 1-1.4.4: cp210x converter now attached to ttyUSB0
> cp210x 1-1.4.4:1.1: cp210x converter detected
> gpio gpiochip2: (cp210x): tried to insert a GPIO chip with zero lines
> gpiochip_add_data_with_key: GPIOs 0..-1 (cp210x) failed to register, 
> -22
> cp210x 1-1.4.4:1.1: GPIO initialisation failed: -22
> usb 1-1.4.4: cp210x converter now attached to ttyUSB1

I propose to add something like the following to cp210x_gpio_init

+	unsigned long valid_mask, altfunc_mask;
...
+	altfunc_mask = priv->gpio_altfunc;
+	bitmap_complement(&valid_mask, &altfunc_mask, priv->gc.ngpio);
+	if (bitmap_empty(&valid_mask, priv->gc.ngpio))
+		return 0;
+
  	priv->gc.label = "cp210x";
  	priv->gc.request = cp210x_gpio_request;
  	priv->gc.get_direction = cp210x_gpio_direction_get;

I can write a proper patch, but am unsure if and what the Fixes tag 
should be.

Maarten

