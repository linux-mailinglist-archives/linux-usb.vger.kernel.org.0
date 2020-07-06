Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE55B215382
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 09:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgGFHvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 03:51:46 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40750 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbgGFHvq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 03:51:46 -0400
Received: by mail-lj1-f195.google.com with SMTP id n23so44191687ljh.7
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 00:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dsthmx27R2OGSz/ZCIxnf54wrdLmAGZqDalvjLH8gkc=;
        b=Iqtgtkjzvr8x1Aapnp3/8XQ4b3AL4lxzDSNzKjj3uxxFshf+jLvqx0UP8pPFxWoRkV
         DJg+XASt3M4RtE/wl8ORNBBN6BcG35SWv+z1h9yMgWUBkdtAdfT+P45RLv0zuihhRIgj
         mC9LsTVKNQFov4arXwct6JAhSfuUvxzg5bnp4OuRUuiMuxnwYTQGI44ARxoiwX7SZMUb
         lVG+q5sDQtPU4YsEv5EYHoMlf9PKLrlFijM8hmD/lDRGSt3JFyJbY4nWK8+Eglz5ky2x
         hHphZ91UlIlLwg1PjQPOm/6ZNDJfl0UPiU6Fmj0eTDR6pEZRomAgVgUdxtlkKRYp6jXq
         3Dow==
X-Gm-Message-State: AOAM5307dkIhELNif9ZanKtJYunBfb0cf4srttqMSH5CKZjlyH/8nifP
        tOGncf3IkFjMC9eszFSBZL4=
X-Google-Smtp-Source: ABdhPJw6GpqqTMyEO4NCdZ7qdRbMRU07LhNERV10hFlIvQlbSAbprWxCSdQncyrWUqDBSIeMMRBBuA==
X-Received: by 2002:a05:651c:2043:: with SMTP id t3mr27045670ljo.0.1594021903795;
        Mon, 06 Jul 2020 00:51:43 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a16sm9681018ljj.108.2020.07.06.00.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 00:51:43 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jsLud-0004YG-FM; Mon, 06 Jul 2020 09:51:40 +0200
Date:   Mon, 6 Jul 2020 09:51:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200706075139.GG3453@localhost>
References: <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost>
 <8a501a7f-68fa-c6a3-30aa-c941f5c2a66f@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a501a7f-68fa-c6a3-30aa-c941f5c2a66f@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:45PM +0200, Jerry wrote:
> Johan Hovold wrote on 7/3/20 9:45 AM:

> > The problem here is that we're sort of violating the API and turning
> > TIOCGICOUNT into a polling interface instead of just returning our error
> > and interrupt counters. This means will always undercount any errors for
> > a start.
> >
> > The chip appears to have a mechanism for reporting errors in-band, but
> > that would amount to processing every character received to look for the
> > escape char, which adds overhead. I'm guessing that interface would also
> > insert an overrun error when returning the first character.

> Yes, it is posible to use EMBED_EVENTS and chip will insert event codes 
> into stream of data bytes. But it will cost some processing power and if 
> transmitted data contains ESC char it will be escaped so it will cost some 
> additional bandwidth. In the worst case (all received data = ESC) it means 
> double bandwidth.

Yeah, but sending a stream of ESC chars isn't a particularly interesting
application anyway. ;)

> I have found such solution here:
> https://github.com/fortian/cp210x/blob/master/cp210x.c
> but it is quite complex and I expected argument that it costs too much 
> (especially when using maximum baudrate) so I suggested simple way which 
> doesn't have an impact until ioctl is called.

It will definitely have some overhead, but since it allows for proper
posix behaviour and things like break detection I think it's warranted
(but only when those features are requested of course).

It may be possible to get the best of both worlds here if we poll for
changes only if input parity checking is disabled. You get the
statistics and could still use the Linux-specific TIOCGICOUNT ioctl to
check for errors indirectly.

> > But perhaps that it was we should be using as it allows parity the
> > errors to be reported using the normal in-band methods. If we only
> > enable it when parity checking is enabled then the overhead seems
> > justified.
> >
> > I did a quick test here and the event insertion appears to work well for
> > parity errors. Didn't manage to get it to report break events yet, and
> > modem-status changes are being buffered and not reported until the next
> > character. But in theory we could expand the implementation to provide
> > more features later.
> >
> > I'll see if I can cook something up quickly.
> 
> >> I suppose that GET_COMM_STATUS reads and CLEAR pending error flags (not
> >> explained in datasheet but behaves that way). So if some errors are
> >> reported during cp210x_tx_empty() it can be either counted immediately or
> >> lost. I'm not sure if cp210x_tx_empty() is called ONLY during close but
> >> seems be more consistent to count every detected error regardless who calls
> >> GET_COMM_STATUS.

> > tx_empty() is called when waiting for data to be drained for example
> > during close but also on when changing terminal settings with TCSADRAIN
> > or on tcdrain().

> But losing an error during tcdrain() is definitely wrong. It is common to 
> send (write) some request, then call tcdrain to be sure that whole request 
> was transmitted and then receive response. Calling tcdrain is necessary in 
> combination with GPIO manipulation but it can also be useful to measure 
> correct timeout because I need to know that data was already transmitted to 
> target (it can take long time for slow baudrate). There is no reason to 
> discard error flags during such waiting.

Yes, you're right of course. Since comm-status request clears the flags
they need to be accounted for whenever it's used.

Johan
