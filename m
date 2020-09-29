Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A120B27C222
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgI2KNk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 06:13:40 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33146 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2KNk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:13:40 -0400
Received: by mail-lj1-f194.google.com with SMTP id k25so3543711ljk.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 03:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DI5yGCUAy8wake3DUYKxsHpYcEqsTGU21W+Nt9M8WXo=;
        b=oRPIdGRFWZJwi/Y66tG7O/VcjqdP/TK6sLeNoVcXWNtX2u848jpUbRAM52yNLZQRJG
         OgKnK5DD5o9yurZCx5RUcs40ruP5mcH1AIbgt1+893DEcCEwvqNyuV/ducOkY2+zJow6
         ta+P13MBiuAfMlYrIS7EBKDtvt8fFOts62N7gHil3fhUxrvabD8zHVThmBcU+V7+VUsl
         swUEHwMvoymH8YVGAHqBunMIA+PL8yq8YGpfpi+6h5UacwSo5WvjcN3Vu8m+cDUAE3iS
         gSQQpQsBFKsLPerEYVGEwWG0JYSIpj0+ZUHpd2kBj9gnZIv/qTwxxmK0oY8Sq8YE2yvH
         ZdOA==
X-Gm-Message-State: AOAM531dKv0peDINYQX5xM1pcQdxDJU75WZbEF0SQxvQRnawwrS1AwfV
        JLd4urS2MGRa85/IbScd+gkRqj1FPCY=
X-Google-Smtp-Source: ABdhPJwshhhfZo4kF25M6wYVRtRV/oxkQCwSyFd3QU1/lZK7JtEFbgQieKCZXt7ymyykrDw8I4WEvw==
X-Received: by 2002:a2e:8046:: with SMTP id p6mr859152ljg.372.1601374417424;
        Tue, 29 Sep 2020 03:13:37 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f144sm3164582lfd.165.2020.09.29.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:13:36 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kNCdX-0001U0-0J; Tue, 29 Sep 2020 12:13:31 +0200
Date:   Tue, 29 Sep 2020 12:13:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Mychaela N. Falconia" <falcon@freecalypso.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        mychaela.falconia@gmail.com
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio
 quirks
Message-ID: <20200929101330.GQ24441@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916015621.EFCDA374023F@freecalypso.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 01:56:21AM +0000, Mychaela N. Falconia wrote:
> Hello Johan,
> 
> This patch series adds support for a family of FTDI-based devices that
> need special quirks in the ftdi_sio driver.  The devices in question
> are produced by my hobby company Falconia Partners LLC, and I got a
> block of PIDs from FTDI (from their VID), so I assign custom USB IDs
> when I program FT2232 EEPROMs on my boards.  These custom USD IDs are
> intended to facilitate conditionalized quirks in the ftdi_sio driver,
> as implemented in this patch series.
> 
> The 3 devices (3 USB IDs) for which this patch series adds support
> consist of two JTAG+UART adapters and one dual UART adapter.  Support
> for the two JTAG+UART adapters consists of nothing more than adding
> them to the USB ID table with the already existing ftdi_jtag_quirk
> applied, but the dual UART adapter (DUART28C) is more involved.
> 
> The special quirk with DUART28C is that FT2232D BDBUS2 and BDBUS4
> outputs (which would normally be Channel B RTS and DTR, respectively)
> have been repurposed to drive power and reset controls to Calypso
> targets, and these power and reset controls must not be triggered
> on their own - instead their control needs to be left to special
> userspace applications.  The problem is that the standard behaviour
> of all tty devices under Linux (not just ftdi_sio and not just USB
> serial, but apparently all ttys) is that DTR and RTS are always
> unconditionally asserted as soon as the tty device (ttyUSB in the
> present case) is opened, and userspace does not get a chance to
> intervene.  It is not my place to debate whether this behaviour is
> good or not for true serial ports where DTR/RTS really are DTR/RTS,
> but it is a total killer for non-standard hardware where the USB to
> serial chip's DTR & RTS outputs have been repurposed to do something
> disruptive like power and reset control.
> 
> The solution that works beautifully in my own hardware lab is contained
> in the present patch series: the new DUART28C-specific quirk simply
> suppresses automatic assertion of DTR&RTS for Channel B on this device.
> Userspace can then trigger PWON and RESET actions as needed with
> TIOCMBIS ioctls (followed by a delay and TIOCMBIC to make a pulse),
> and everything works beautifully.  If I could get this DUART28C quirk
> (conditionalized on the USB ID which FTDI officially allocated to me)
> mainlined, it would spare my users the pain of having to apply this
> patch themselves locally.

Thanks for the well-argued series. I've applied the first one now after
dropping the PID for the dual-port device, which isn't used until the
last patch.

As you probably expected, I'm a bit reluctant to adding quirks like this
(e.g. as it makes the code harder to read and maintain):

Did you try inverting the signals so that they can be used on any serial
port to power on and release reset on open, and then just clear HUPCL if
you want the connected device to remain powered after the port is closed?

> Mychaela N. Falconia (3):
>   USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
>   USB: serial: ftdi_sio: pass port to quirk port_probe functions
>   USB: serial: ftdi_sio: add support for FreeCalypso DUART28C adapter
> 
>  drivers/usb/serial/ftdi_sio.c     | 72 +++++++++++++++++++++++++++++++++------
>  drivers/usb/serial/ftdi_sio_ids.h |  8 +++++
>  2 files changed, 70 insertions(+), 10 deletions(-)

Johan
