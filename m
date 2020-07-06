Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4C02158F0
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgGFN7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:59:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34178 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728940AbgGFN7K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:59:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id u25so22664784lfm.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FpUWI8jMr0yRvrwAKIbov0/IJ0CO9j0Rr3t2Dm64r0c=;
        b=jq324GP7xaAl9GUr9p2p3ZQrqjslC5cf+zNVHobzdM6B40dW39jtnzrjAmTZRgEtY6
         9uFZuC53kH9QW4ycNF7E2TExD1jlgobTgHCVYlH8bsceFbkDadoz7YEEtZ6xOMIqU1Kp
         Y1NTOjNI6AZpnR4g/OYN3fFJ6mQzb4+hpid2lDQb6Lma7fvMB13X+fdtocxtee7Jbeyb
         Dq5iIzyJgJ7eh2nSP4XRrW3Vgzcc6jrQEd9rrj568kdEj97ZxZWM93CC8uHbdyp23l2U
         TiNtNP/lS7RKIzPmAVGFHmytKuIKCMGObKgOfR3te2GI57suh5zQ87FIfzQ/lhyinXF/
         LQCg==
X-Gm-Message-State: AOAM532BpNjAsBHFnukundWVDhbYjaQMFCAcmy7dqHTuYUdzisQZ5sxp
        TFhvLYe7JfmHu1/lSQxFBQ8=
X-Google-Smtp-Source: ABdhPJwqt4sYfXKOl0Mmj2EFA8rgyMNUx0ghMyoU9VVN5/RZuml+LeU/6BY1XyL8P9Qmlp+FmmzFOQ==
X-Received: by 2002:a05:6512:3f1:: with SMTP id n17mr30432547lfq.125.1594043948199;
        Mon, 06 Jul 2020 06:59:08 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o1sm4961354ljj.82.2020.07.06.06.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:59:06 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jsReC-0007Am-0e; Mon, 06 Jul 2020 15:59:04 +0200
Date:   Mon, 6 Jul 2020 15:59:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200706135904.GJ3453@localhost>
References: <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost>
 <20200703150104.GE3453@localhost>
 <61febd93-400b-d1f9-6fd9-82de0e799f3e@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61febd93-400b-d1f9-6fd9-82de0e799f3e@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 01:47:50PM +0200, Jerry wrote:
> Johan Hovold wrote on 7/3/20 5:01 PM:
> > On Fri, Jul 03, 2020 at 09:45:39AM +0200, Johan Hovold wrote:
> > Would you mind giving the below a try and see how that works in your
> > setup?
> >
> > With this patch you'd be able to use PARMRK to be notified of any parity
> > errors, but I also wired up TIOCGICOUNT if you prefer to use that.
> >
> > Also, could try and see if your device detects breaks properly? Mine
> > just return a NUL char.

> I tried your patch. It detects the parity error correctly for my 
> application. Unfortunately I'm not able currently to verify a break 
> reception due to holiday, I'll probably try it next week when back at work 
> (I need to recompile the device firmware).

Cool, thanks.

I noticed that I can get comm-status to report a break condition when
event-insertion mode is disabled, but it just results in a NUL char in
event mode (the error flag isn't set then).

Perhaps buggy firmware, unless there's some other command for masking
events. Haven't quite understood how the EVENTMASK requests are supposed
to be used. Replacing the break char (SET_CHAR) didn't help at least.

> An interesting thing that your patch don't report any overrun. I'm not able 
> to create a real overrun (any idea?) but it doesn't report any fake overrun 
> compared to GET_COMM_STATUS.

Yeah, I noticed that too, although I had a feeling the fake overrun
didn't even always show up when sending while closed here either. 

Not sure how best to trigger an overrun since we rely on the read urb to
report it. Perhaps pausing the read urbs, filling up the device fifo and
then submitting the urbs again could work? Would need to patch the
driver quite a bit for that though.

> The question could be a value of CP210X_ESCCHAR. You selected 0xFF and this 
> value can be quite common in received data because an erased flash memory 
> is full of 0xFF. When I read an empty memory it means double USB bandwidth 
> so for example 0xFE seems be better... but I understand that it depend on 
> application and it is hard to globally select this value.

Good point! I think we should definitely avoid 0xff.

> I'll do some more tests but your solution seems be fully acceptable for my 
> needs. For me TIOCGICOUNT is enough (I just resend request when an error 
> detected) but for other situation it would be very nice to know exactly 
> which byte was malformed through PARMRK.

That's good to hear. I'll respin the generic (event-based) solution
then.

Thanks,
Johan
