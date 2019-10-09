Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9A1D0A4E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 10:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfJIIxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 04:53:17 -0400
Received: from canardo.mork.no ([148.122.252.1]:55789 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfJIIxR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 04:53:17 -0400
Received: from miraculix.mork.no ([IPv6:2a02:2121:2c8:bfe9:9043:eeff:fe9f:3336])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id x998rAv4011160
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 9 Oct 2019 10:53:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1570611191; bh=apcxaAqSeVr6+0ViCt7eeL9D7EbWWEBAuYHhQh/J0W4=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=W1UDe5LRu1CH+HfTj9XvAGs4S15VBOnkfbjTVWYKaJ9aV1xvIxd8/3WGrVrC2WowX
         dOlHn4xGzoDQUp2bYEcjcRL1wQFwQ8OAwFnUEoV1Ltazbp0PcG+KmUwm/Af9EjQ5ZO
         zQfx9khDOigUHJ3Sa8bPU1hF1qg/IyGgZudm0BrM=
Received: from bjorn by miraculix.mork.no with local (Exim 4.92)
        (envelope-from <bjorn@mork.no>)
        id 1iI7iT-0003OW-GF; Wed, 09 Oct 2019 10:53:05 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Adam Bennett <abennett72@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: Possible bug with cdc_ether, triggers NETDEV WATCHDOG
Organization: m
References: <3913c851-93f8-3d26-a578-f5a2c8b69aaa@gmail.com>
Date:   Wed, 09 Oct 2019 10:53:05 +0200
In-Reply-To: <3913c851-93f8-3d26-a578-f5a2c8b69aaa@gmail.com> (Adam Bennett's
        message of "Mon, 7 Oct 2019 17:15:59 -0400")
Message-ID: <878spuxpu6.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.101.4 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adam Bennett <abennett72@gmail.com> writes:

> I've been messing around with a Raspberry Pi Zero, in its ethernet
> gadget mode.=C2=A0 This possible bug report is not against the Pi Zero
> linux kernel, but rather the host computer's linux kernel.=C2=A0 I've been
> able to reproduce the same host computer issue with my normal laptop,
> and an embedded board (buildroot-based). Both run a newish version of
> 4.19.

The issue is reported on the host, but it's really a problem with the
gadget.  You'll probably have the same issues with any host, including
hosts running something other than Linux.  They just won't be as verbose
about it.


> The bug report is that most of the time I cannot ping through the
> local link, and I get a kernel debug message:=C2=A0 sometimes I can ping
> the Pi Zero with no kernel message, most of the time I can't ping and
> the message comes up, and occasionally I get the message right when I
> plug in the Pi Zero, before I issue the ping command.
>
> Here is the dmesg on my normal laptop (I've included the plug-in
> sequence also):
>
> [11728.029900] usb 1-1: new high-speed USB device number 10 using xhci_hcd
> [11728.434200] usb 1-1: device descriptor read/64, error -71

First symptom of something wrong with the gadget...

> [11728.669543] usb 1-1: New USB device found, idVendor=3D0525,
> idProduct=3Da4a2, bcdDevice=3D 4.19
> [11728.669548] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> [11728.669551] usb 1-1: Product: RNDIS/Ethernet Gadget
> [11728.669554] usb 1-1: Manufacturer: Linux 4.19.75+ with 20980000.usb
> [11728.674528] cdc_ether 1-1:1.0 usb0: register 'cdc_ether' at
> usb-0000:00:14.0-1, CDC Ethernet Device, 22:93:3a:1e:ac:5c
> [11730.725278] cdc_ether 1-1:1.0 enp0s20f0u1: renamed from usb0
> [11768.174915] ------------[ cut here ]------------
> [11768.174921] NETDEV WATCHDOG: enp0s20f0u1 (cdc_ether): transmit
> queue 0 timed out


This warning means that the gadget doesn't accept the packets we send
it.  There isn't much the host can do about that, except dropping
packets on the floor.  Which is why the warning is this loud.



Bj=C3=B8rn
