Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A625B211F16
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 10:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgGBIo1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 04:44:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41755 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGBIo0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 04:44:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id z24so5888784ljn.8
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 01:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Fl70LEuKoaOpx116eWPnj1juwQ0cw6eLlAdtptRo4o=;
        b=AMp4kcc1RW3oxFQCzrtrZ2VWwxMdvpuYKBR0v4jJVkZjB33LG3kjmNQrvhtiSaXV4k
         z5/CWvRAN7xR7G6eeFW6+U9x6ap712U+s/fSRnjKashfYZdqnRU21Bi3a/W+v1aY4aQV
         Sw44gGJ4MvH2sM5FIuTiaQEQdQyt5urUVWhx8x0IIfgJTxPR3lSPyEgBM9j6kIlCzWDt
         IusvlTUCj2smBk3JrnE4mLJN4r2hK06Omj4taYsv1hFC+I2OViQv58q/AZ3WjS/HrlmM
         dzwfUhL0/BW8uVX7ct9ZK+p5zpcwsM8KD2Wr50Ccqv9BuDc0pnZsWiJHiBR5VVIP+TwW
         okBw==
X-Gm-Message-State: AOAM530ckVQqxriuJ/KBaYKj4HD008oLtWw4UrLu8khIAYhFzgT9MtSC
        gDcamqnaTEyWRPR/wPkw6sWv25cO/oA=
X-Google-Smtp-Source: ABdhPJxiG6z+CwdjEZYxk/Yz42aXnZe2Km3/D5sLpazRIAd99tRbC4MkUhZ33MVFLugKks4X/D7qzQ==
X-Received: by 2002:a2e:160f:: with SMTP id w15mr16393460ljd.28.1593679464534;
        Thu, 02 Jul 2020 01:44:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f9sm3027836ljf.27.2020.07.02.01.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 01:44:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jqupM-0003o2-GN; Thu, 02 Jul 2020 10:44:17 +0200
Date:   Thu, 2 Jul 2020 10:44:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: console: add support for enabling flow
 control
Message-ID: <20200702084416.GA3453@localhost>
References: <20200701173722.4536-1-johan@kernel.org>
 <20200702073828.GF1073011@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702073828.GF1073011@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 02, 2020 at 09:38:28AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 01, 2020 at 07:37:22PM +0200, Johan Hovold wrote:
> > Add support for enabling hardware flow control using the 'r' command
> > line option.
> > 
> > This also avoids a W=1 (-Wunused-but-set-variable) warning.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>

> >  drivers/usb/serial/console.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
> > index 7d289302ff6c..b97aa40ca4d1 100644
> > --- a/drivers/usb/serial/console.c
> > +++ b/drivers/usb/serial/console.c

> > @@ -102,6 +102,9 @@ static int usb_console_setup(struct console *co, char *options)
> >  		break;
> >  	}
> >  
> > +	if (doflow)
> > +		cflag |= CRTSCTS;
> > +
> >  	/*
> >  	 * no need to check the index here: if the index is wrong, console
> >  	 * code won't call us
> > -- 
> > 2.26.2
> > 
> 
> Nice fix!

Or is it a new feature? ;)

> And I think one of the first real "bugfixes" that have come out of the
> recent W=1 work...

Yeah, first one I've seen too.

> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing. All of these now applied.

Johan
