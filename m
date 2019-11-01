Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB9CEC487
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 15:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfKAOVB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 10:21:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37369 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKAOVB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 10:21:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id b20so7364878lfp.4
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 07:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ayfMHPGSvnX+Tl/pKeAX4lzYvvkqkGku+wqrn0xVBx4=;
        b=KJDyvI4mI37sVh1m5uAD8paw2xcoEe5e3b9R6HrWPFVTVxwuy9sANncI4EqLjJAYLh
         bHkelC/jUm0R54cs0L7eFilpKIDTfJryAivs39HAKa8lwgOz672PfHKtaJiVfLFNWspH
         iDL21cJkxyabWloLiLmgzaS0xZYu4jKfVUk8gzM+a4r7XS/tP8tBYLqOA8ZexR/b+dXs
         8WcPwQy1vyzxkG98Xu/zUThSenzixfijkDHZQ3Q/3D8GedIhhHLj4nJSMUkh9Z+/2+Rm
         C7M9043dWVIstoOsRoTdn8YD7UygskizvoJkaYyACXxgZtxnVwv/sa3StRwTa9ijmtbF
         JPTA==
X-Gm-Message-State: APjAAAUqADclMYSKsZnBnafcsM5eUyh7GS/gmQ17Ny9L+u0SLWk65pZZ
        bgpviyJNAVgEf1RlwmOv+Amn9Nko
X-Google-Smtp-Source: APXvYqw0pHenJeEv6wzSzbWDgIjxSmQMOjJzvt+q7bm6N6Pd74HIgMsjsRA8+Z6hK6G+tU4gtULSOQ==
X-Received: by 2002:a19:2356:: with SMTP id j83mr7434960lfj.103.1572618058070;
        Fri, 01 Nov 2019 07:20:58 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id s26sm585471ljj.12.2019.11.01.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 07:20:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iQXnN-0003Pe-5G; Fri, 01 Nov 2019 15:20:57 +0100
Date:   Fri, 1 Nov 2019 15:20:57 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Dreher <michael@5dot1.de>
Cc:     linux-usb@vger.kernel.org, Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
 calculation
Message-ID: <20191101142057.GD3657@localhost>
References: <BFA71FA8-3944-4203-B842-77C375BDC7A3@5dot1.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BFA71FA8-3944-4203-B842-77C375BDC7A3@5dot1.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Please keep everyone on CC, and wrap your messages at 78 columns or
  so; I've reflown the text below. ]

On Fri, Nov 01, 2019 at 10:25:53AM +0100, Michael Dreher wrote:
> Hi Johan
> 
> >> https://github.com/nospam2000/ch341-baudrate-calculation/blob/master/README.md
> >Interesting! From a very quick glance this looks very promising
> >(although he doesn't seem to handle rounding yet). I'll take a closer
> >look and compare with what I've done. 
> 
> That’s my code. I actually do rounding. It might not be obvious that
> the '(*2 + 1) / 2’ in  ((2UL * CH341_OSC_F) + / (prescaler *
> priv->baud_rate) + 1UL) / 2UL does a bankers rounding, that why I
> explained it in the README.MD:
> https://github.com/nospam2000/ch341-baudrate-calculation#rounding-issues

Yes, I noticed that today when taking closer look.

> > I also noticed that we should always pick the higher base clock if
> > the resulting divisor is odd (and within the valid range).
> 
> The general rule from the perspective of mathematics is to use the
> highest possible divider (and therefore the lowest possible prescaler)
> because that gives the lowest possible relative error in the division.
> As long as the result of divider*prescaler is the same it doesn’t
> matter which combination you choose. For example my algorithm prefers
> 1*208=208 over 2*104=208 of the other algorithms which doesn’t make a
> difference.

Indeed, I just mentioned this in reference to Jonathan's patch which
compared the two resulting rates with the third prescale register bit
set or cleared (effectively halving the rate). In this case, we can go
with either whenever the divisor is even. But generally, yes, a higher
divisor is better.

> At 110 baud there is the only difference between my algorithm and
> Jonathan’s code for the commonly used baud rates because I  pick
> 512*213 whereas he doesn’t use the 512 prescaler and therefore uses
> 1024*107 (both values are odd).

Yep, Jonathan only extended the current algorithm for the lowest
prescale value. I generalised it for all values, just like you did.

Note also that the third prescale bit affects divisor 2 through 8 for
all prescalers, not just when prescale bits 0 and 1 are zero
(prescaler=1 in your terminology) as your github doc claims.

It doesn't matter for your algorithm, just mentioning it for the sake
of completeness since I found this in my experiments.

Johan
