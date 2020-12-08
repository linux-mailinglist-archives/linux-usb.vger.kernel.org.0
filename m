Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168522D26CF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 10:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgLHJDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 04:03:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34668 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728591AbgLHJDF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 04:03:05 -0500
Received: by mail-lf1-f67.google.com with SMTP id m19so2166535lfb.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Dec 2020 01:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GF0c5m8yz6Uh68ztHaXzH+5XgWlZnz/2RQPftPgroNo=;
        b=l3OsOPTl2GJQmP5v8/I6njmfRjWaSIW5SZ3vbmsVfcFBqMFYattXUus+DA331Rj7Qt
         2zYU6CSAIyQOc5obr2x0sza1zqeZoqMPDsMVbHXHTsuTX6H/rcN3gwfajRaF4iewXv8v
         BsAhKH1YidoYCVmjcuIQFOFu9iPsmLNMg+vRGnx6Qt8tGaPJnENuI9U2vgwi8/lHA2vB
         yFCO4HSE8dV1z45e1b2yw3sA3x9H7KXyT/e6IoFMuuZ0IskmQ+qLW247hWkn1FRjgpHn
         ppRFqbBX5fQ9JDKM/5kqo6bgMrzR6UMmaI9Ts7aQ3uyOEw1mmaXj5WvfY/NmkVDs2T+G
         jeWQ==
X-Gm-Message-State: AOAM533mgk1J4BxLpBLszunxF860oBXXIvdUllAY/vBFTpwMu8pYM3N2
        zLst5XBw1zvtGgDL/BGmmfs=
X-Google-Smtp-Source: ABdhPJwptbpZ6wEgedeBfJzxR+2rO63DXEk2qHn/IO9nQiuOXEBwguJgcUUZnfwir4gsb+8GCQ5dYQ==
X-Received: by 2002:a19:48c3:: with SMTP id v186mr3298318lfa.3.1607418142578;
        Tue, 08 Dec 2020 01:02:22 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f132sm202589lfd.252.2020.12.08.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 01:02:21 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmYtf-0002NR-Kb; Tue, 08 Dec 2020 10:02:59 +0100
Date:   Tue, 8 Dec 2020 10:02:59 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: ftdi_sio: Helpful error on GPIO attempt
Message-ID: <X89BQ9l1ilubUNUd@localhost>
References: <20201201141048.1461042-1-linus.walleij@linaro.org>
 <43d788c69a0f4fe3caf578b98ae72395@kernel.org>
 <76a8c528f98df0797c79d870bb6587a4@kernel.org>
 <CACRpkdaNQ_JgHX=1aEDBR5dpF-1b2Zwx-z8qG5F6VhRW_Au_Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaNQ_JgHX=1aEDBR5dpF-1b2Zwx-z8qG5F6VhRW_Au_Qg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 09:39:25AM +0100, Linus Walleij wrote:
> On Wed, Dec 2, 2020 at 7:13 PM Marc Zyngier <maz@kernel.org> wrote:
> 
> > And to clarify what I mean, here's a patchlet that does the trick.
> >
> > maz@tiger-roach:~$ sudo gpioinfo gpiochip3
> > gpiochip3 - 4 lines:
> >         line   0:      unnamed       unused  output  active-high
> >         line   1:      "AltFunc"     kernel  input   active-high [used]
> >         line   2:      "AltFunc"     kernel  input   active-high [used]
> >         line   3:      "AltFunc"     kernel  input   active-high [used]
> >
> > It at least make clear that you can't grab the GPIO. Of course, you
> > don't get the message that you just added...
> 
> I think this looks good.
> 
> > +#include "../../gpio/gpiolib.h"
> 
> I suppose I can live with this because it's for a noble cause.

Not needed, Marc fixed that bit up in his series.

> > Thoughts?
> 
> Could you combine it with a patch similar to min giving some probe() time
> information that some GPIO lines are altfunc and where to get the tool
> and send a proper patch?

He already did that, but I'm sceptical to spamming the logs with this
(we don't explain how people should setup up pinmuxing in their device
trees in the logs either). Please take a look at the discussion
following Marc's series.

Johan
