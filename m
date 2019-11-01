Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D83EC0EA
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 10:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfKAJ53 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 05:57:29 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39295 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfKAJ53 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 05:57:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id 195so6812610lfj.6
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 02:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RkpXPjjCri4/FhTm1fCyT8tcIdRD8c+cJhEwoTMJdNI=;
        b=l2h/1mZ0galaYI11c3e1eESiThIWJ5BOis0I3K3DFxGyM9+VPQXIx7squnPhhKBfeY
         9g1tVAO23XKZFsS2BpfftkLSGEIfyDkeuoNBW+V373leIogC6CzeuwC+l2l4scqUzaTV
         kAonLrwh4HrAW+4WiO48jXZFmlQjfwMDcxGpoYcZFErhnZUMgzj/QVq8gJvgB3m2KImS
         Ic52hdy3QMuwfpm2nP4PSk8uL4oVGnc2CVnbK81AUGee1YSEC14xR4IyLG3I+uy4B87E
         EkDwJEUjYv2mIIyn0gETkMQBFElWCl0juZlPlRrB+g5dBE9sY+zS7SIDWf3afs+2etFk
         siDA==
X-Gm-Message-State: APjAAAWkXC4EUAFLDP9u5aC7QlMpDPxkaOSuF/sS+0Nj1BGROvSqRbY/
        d2ctdWAA22EA9qpDn6wYKQw=
X-Google-Smtp-Source: APXvYqylvFS5hLdyzUAqgtWsGaez/HnkjeeRSnsyCwfjCfvEdAuxpDWsRuqnB41Fap0/9Zlddwyaeg==
X-Received: by 2002:ac2:569c:: with SMTP id 28mr6157744lfr.139.1572602246836;
        Fri, 01 Nov 2019 02:57:26 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id x187sm2872654lfa.64.2019.11.01.02.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 02:57:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iQTgL-0002bI-3m; Fri, 01 Nov 2019 10:57:25 +0100
Date:   Fri, 1 Nov 2019 10:57:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Jonathan Olds <jontio@i4free.co.nz>
Cc:     'Johan Hovold' <johan@kernel.org>, linux-usb@vger.kernel.org,
        frank@kingswood-consulting.co.uk, werner@cornelius-consult.de,
        boris@hajduk.org
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
 calculation
Message-ID: <20191101095725.GA3657@localhost>
References: <jontio@i4free.co.nz>
 <20190608051309.4689-1-jontio@i4free.co.nz>
 <20190620134318.GL6241@localhost>
 <000001d52e0e$5303de80$f90b9b80$@co.nz>
 <000501d58e8d$b360b4d0$1a221e70$@co.nz>
 <20191030094709.GB4691@localhost>
 <000901d59049$c59eaae0$50dc00a0$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000901d59049$c59eaae0$50dc00a0$@co.nz>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 01, 2019 at 01:17:35PM +1300, Jonathan Olds wrote:
> Hi Johan,
> 
> Thanks for that.
> 
> I tested you patch out with the ch340g chip and it works fine for all
> rates I tried. I used a logic analyzer and made the following
> measurements...  
> 
> - wanted	measured error
> - 110		0.02%
> * 256000	0.26%
> - 576000	0.79%
> * 921600	0.16%
> * 1333333	0%
> - 2000000	0%
> - 3000000	0%
> 
> The asterisk are the ones that are really bad with the current Linux
> driver. Of the ones you that you mention my measurements match yours.
> So that looks really good.

Thanks for testing. Do you mind if I add a tested-by tag for you to the
patch?

> Yes the current Linux driver is a bit opaque.
> 
> BTW I had trouble patching the ch341.c file using your patch. Using...
> 
> ```
> wget
> https://raw.githubusercontent.com/torvalds/linux/master/drivers/usb/serial/c
> h341.c
> patch ch341.c patch.diff
> ```
> 
> where `patch.diff` was your patch I kept getting either
> "patch: **** unexpected end of file in patch" or
> "patch: **** malformed patch at line" depending what lines I changed.

Not sure why that doesn't work, perhaps you just need to provide an
appropriate "-p" option to strip the directory prefix?

I suggest you use git directly instead. Clone Linus's repo at
kernel.org, or use mine

	git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git

to get the latest USB serial changes.

Then you can apply patches directly from a mailbox using git-am (or from
a patch using git-apply).

> However it was easy enough to manually apply your patch by hand and
> that is what I did.

Ok, good. Thanks again for testing.

By the way, when communicating through the Linux mailing lists, try to
respond inline as I've done here instead of top-posting.

I'll try to look at the github repo you referred to and respin my patch
today.

Cheers,
Johan
