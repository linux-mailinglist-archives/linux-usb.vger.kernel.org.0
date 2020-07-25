Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D7422D6C5
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 12:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgGYKbQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 06:31:16 -0400
Received: from cable.insite.cz ([84.242.75.189]:46784 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgGYKbQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Jul 2020 06:31:16 -0400
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Jul 2020 06:31:15 EDT
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C2AB7A1F63ADA;
        Sat, 25 Jul 2020 12:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1595672669; bh=KpNElD35u4gogcs318CtHxk1cpVZry944ittHMNUGT0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EZynsY+aJ8SPhK8RXorj0o8KUIS7zucyW1LegaisTCEOTOM/B7FaMhratCZVPe+5n
         w4uvDySO07ODH7Dax6/cVLcjJ0ZLoD9Dc1H/51mmd0pS1M9VBLRrLfUHUV6Ffg6Jrf
         Wbl06ON9grFunJehyYRqpquI6jle/9FFa+y0+GRc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OwBmMuxEQ6Nk; Sat, 25 Jul 2020 12:24:24 +0200 (CEST)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id D3F33A19A790B;
        Sat, 25 Jul 2020 12:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1595672663; bh=KpNElD35u4gogcs318CtHxk1cpVZry944ittHMNUGT0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JevrRx7etwEPYqvgdKJGUMCs8HLlLOIsYcwBUWmLwQh8+UlG4v1C7Z6fjWNVA7I3E
         vbGgalI9tYDWe9UteJyUUUcpFWY3yJ1MiH9xY+gfI3Dc0W/6MARFng9m6xnve8SEGt
         uBuPyjOipIc6HznQ5sPXdHash7cvVD0YhuA7Naow=
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     harrison conroy <harrisonconroy@me.com>, ruslan.bilovol@gmail.com
Cc:     linux-usb@vger.kernel.org
References: <79D67DF9-2A12-40DE-AFF7-4FF68193AD1C@me.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <6194f859-aa61-90fa-043e-1df02b01bacb@ivitera.com>
Date:   Sat, 25 Jul 2020 12:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <79D67DF9-2A12-40DE-AFF7-4FF68193AD1C@me.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 22. 07. 20 v 17:25 harrison conroy napsal(a):
> Hi Ruslan, 
> 
> I am working on a project that involves using an RPi 4 as a USB Gadget
> and we have run into the feedback endpoint issue causing Windows 10 to
> not recognize it as a USB audio device. Do you have any updates on this
> patch for the community? Any help would be greatly appreciated.

As a temporary workaround you can change the EP OUT type from
USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE.

Or you can add implicit feedback flag to the EP IN. Win10 should handle
implicit feedback OK, unlike Win7. Unfortunately linux still requires an
explicit quirk for the implicit feedback
https://www.spinics.net/lists/alsa-devel/msg111824.html . Yet it is
still a workaround because IMO the existing EP IN is in fact not async
but adaptive, clocked by the USB frames.

Pavel.
