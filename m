Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331B7301E30
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 19:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbhAXSjZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 24 Jan 2021 13:39:25 -0500
Received: from mail.v3.sk ([167.172.186.51]:49978 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726007AbhAXSjY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 Jan 2021 13:39:24 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id CB01BDF61F;
        Sun, 24 Jan 2021 18:34:41 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Ux9EEQKzQmVj; Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 53DF7E0AC6;
        Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id joA8Xy5qonPc; Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 169D2DF61F;
        Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
Date:   Sun, 24 Jan 2021 19:38:38 +0100
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        sam@ravnborg.org, peter@stuge.se, markus@raatikainen.cc,
        pontus.fuchs@gmail.com, hudson@trmm.net, th020394@gmail.com
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
Message-ID: <20210124183838.GA1873250@demiurge.local>
References: <20210120170033.38468-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 20, 2021 at 06:00:30PM +0100, Noralf Trønnes wrote:
> Hi,
> 
> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
> 
> The reason for calling it 'Generic' is so anyone can make a USB
> display/adapter against this driver, all that's needed is to add a USB
> vid:pid.
> 
> Unfortunately I've had some compounding health problems that have
> severally limited the time I can spend in front of a computer. For this
> reason I've decided to keep the gadget driver out-of-tree and focus on
> getting the host driver merged first.
> 
> See the wiki[1] for more information and images for the Raspberry Pi
> Zero/4.
> 
> One big change this time is that I've followed Peter Stuge's advice to
> not let DRM stuff leak into the USB protocol. This has made the protocol
> easier to understand just from reading the header file.
> 
> Noralf.
> 
> [1] https://github.com/notro/gud/wiki

The patch set:

Tested-by: Lubomir Rintel <lkundrak@v3.sk>

Works like a charm with this board [1], though it didn't impress the girls
as much as I hoped. Code here [2], picture here [3].

[1] https://www.banggood.com/LILYGO-TTGO-T-Display-GD32-RISC-V-32-bit-Core-Minimal-Development-Board-1_14-IPS-p-1652870.html?rmmds=search&cur_warehouse=CN
[2] https://github.com/hackerspace/libopencm3-gf32v-examples/commit/7ef51b31b9
[3] https://people.freedesktop.org/~lkundrak/lilygo.jpeg

Had to apply a fix for the drm_connector_enum_list[] ommission I mentioned
elsewhere, and that I've now noticed you've noted previously.

Take care
Lubo

> 
> 
> Noralf Trønnes (3):
>   drm/uapi: Add USB connector type
>   drm/probe-helper: Check epoch counter in output_poll_execute()
>   drm: Add Generic USB Display driver
> 
>  MAINTAINERS                         |   8 +
>  drivers/gpu/drm/Kconfig             |   2 +
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/drm_probe_helper.c  |   7 +-
>  drivers/gpu/drm/gud/Kconfig         |  14 +
>  drivers/gpu/drm/gud/Makefile        |   4 +
>  drivers/gpu/drm/gud/gud_connector.c | 722 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_drv.c       | 620 ++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_internal.h  | 148 ++++++
>  drivers/gpu/drm/gud/gud_pipe.c      | 472 ++++++++++++++++++
>  include/drm/gud.h                   | 356 ++++++++++++++
>  include/uapi/drm/drm_mode.h         |   1 +
>  12 files changed, 2354 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/gud/Kconfig
>  create mode 100644 drivers/gpu/drm/gud/Makefile
>  create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>  create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>  create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>  create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>  create mode 100644 include/drm/gud.h
> 
> -- 
> 2.23.0
> 
