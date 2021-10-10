Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EFF42837D
	for <lists+linux-usb@lfdr.de>; Sun, 10 Oct 2021 22:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhJJU1K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Oct 2021 16:27:10 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44476 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhJJU1J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Oct 2021 16:27:09 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 1A18421FE1;
        Sun, 10 Oct 2021 20:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633897510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GEQcDzhZ8Ka5CSVQvfxwlWYWOhU/3/GhrODN3V13RPI=;
        b=u/T4QtmO4zjpWP4G6PpsJYj8evddBVP5dABrjZMZ8CqJbfZUoqzHgHzZlDxk080ekTJTOR
        FnVqbL2/kEtp1nAvWgB3vmPw6WtaIe54m+Xj94yu8dxg9fQjsG1yUPxVx+R5+HaCXwLwz2
        YMIg25qOhHH+4FFj6i8tkiQ55eRU83k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633897510;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GEQcDzhZ8Ka5CSVQvfxwlWYWOhU/3/GhrODN3V13RPI=;
        b=eipG8Doua46nR7vEC1XNGKPBUEGveXX7uStsTSmBb2NhhNFJd9GuLwtCB/FluGSb1yeZgu
        XcZpQvh5ZrswNlAg==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id F3877A3B83;
        Sun, 10 Oct 2021 20:25:09 +0000 (UTC)
Date:   Sun, 10 Oct 2021 22:25:09 +0200
Message-ID: <s5hily46316.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: allow -EPIPE errors for some v2 messages
In-Reply-To: <YWLbEdHUE3k/i0fe@kroah.com>
References: <YWLbEdHUE3k/i0fe@kroah.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 10 Oct 2021 14:22:41 +0200,
Greg Kroah-Hartman wrote:
> 
> The Schiit Hel device does not like to respond to all get_ctl_value_v2()
> requests for some reason.  This used to work in older kernels, but now
> with more strict checking, this failure causes the device to fail to
> work.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> 
> This fixes the Shiit Hel device that I have.  It used to work on older
> kernels (a year ago?), but stopped working for some reason and I didn't
> take the time to track it down.  This change fixes the issue for me, but
> feels wrong for some reason.  At least now I can use the device as a
> headphone driver, much better than the built-in one for my current
> machine...
> 
> If needed, I can take the time to do bisection to track down the real
> issue here, it might be due to stricter endpoint checking in the USB
> core, but that feels wrong somehow.
> 
> Here's the debugfs USB output for this device, showing the endpoints:
> 
> T:  Bus=07 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  5 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=30be ProdID=0101 Rev=01.02
> S:  Manufacturer=Schiit Audio
> S:  Product=Schiit Hel
> C:  #Ifs= 4 Cfg#= 1 Atr=c0 MxPwr=0mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
> E:  Ad=8f(I) Atr=03(Int.) MxPS=   6 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> E:  Ad=05(O) Atr=05(Isoc) MxPS= 104 Ivl=125us
> E:  Ad=85(I) Atr=11(Isoc) MxPS=   4 Ivl=1ms
> I:  If#= 2 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> E:  Ad=88(I) Atr=05(Isoc) MxPS= 156 Ivl=125us
> I:  If#= 3 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
> E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
> 
> Any other suggestions to fix this are welcome.

Could you show the exact error messages and lsusb -v output?
We may paper over only the problematic node instead.


thanks,

Takashi
