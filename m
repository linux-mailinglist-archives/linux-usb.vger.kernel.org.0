Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BE521A4E1
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 18:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgGIQdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 12:33:31 -0400
Received: from v6.sk ([167.172.42.174]:36588 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgGIQdb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 12:33:31 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id C349E60D19;
        Thu,  9 Jul 2020 16:32:59 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, balbi@kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
Date:   Thu,  9 Jul 2020 18:32:35 +0200
Message-Id: <20200709163235.360054-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529175643.46094-1-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 29 May 2020 Noralf Trønnes wrote:
...
> This series adds a USB host driver and a device/gadget driver to achieve
> that.
> 
> The reason for calling it 'Generic' is so anyone can make a USB
> display/adapter against this driver, all that's needed is to add a USB
> vid:pid. I have done a microcontroller implementation hack just to see
> how that would work out[1] (which unconvered a couple of bugs in the
> host driver).
...

This is actually very cool; finally a good way to drive the cheapo
SPI/I2C displays from computers whose only means of expansion is USB
with a little help from a microcontroller. I've actually had some
success doing just that [1].

[1] https://assets.octodon.social/media_attachments/files/009/983/960/original/64ad8ea46c1b06c5.jpg

I suppose you can add:

Tested-by: Lubomir Rintel <lkundrak@v3.sk>

I've had to jump through some hoops though.

My OLED display is a 128x64 SSD1306 [1] driven from the SPI bus. The frame
buffer SRAM is normally scanned out in stripes of 8 vertical pixels called
"pages". When the display is turned on its side, with "vertical
addressing mode" and "segment remapping" enabled and bytes being sent LSB
first, it appears linear -- it's easy to repaint the whole display from
what is now the top left corner to the bottom right. This is very
convenient for painting pixels as they come, without bufferring them or
doing any conversions (assuming that memory and cpu cycles are at
premium on MCUs).

[1] https://cdn-shop.adafruit.com/datasheets/SSD1306.pdf

There doesn't seem a comfortable way to do partial redraws though. Would
you find it objectionable if the device could indicate that needs full
frames instead of just the damaged areas? Perhaps then the driver
wouldn't even need to bother issuing GUD_DRM_USB_REQ_SET_BUFFER to
displays dumb enough to be incapable of partial redraws and decompression.

My work-in-progress code that works on STM32F103 (e.g. "Blue Pill"
boards), or GD32VF103 (RISC-V "Polos Alef") is at [2]. The partial redraws
that don't start from column zero or are not "page aligned" don't work
correctly for the time being; X11 doesn't seem to care.

[2] https://github.com/hackerspace/libopencm3-gf32v-examples/tree/lr/gd32v/examples/gd32v/f103/polos-alef/usb-display

Thank you!
Lubo
