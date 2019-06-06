Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF5B36F5F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 11:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfFFJDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 05:03:12 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:36798 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfFFJDM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 05:03:12 -0400
Received: by mail-wm1-f52.google.com with SMTP id u8so1560670wmm.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2019 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ikqhDzHJzrnnMA0hQ9bg9M7iUfopxG0xDwuMQvfnxZY=;
        b=uvfOHxuyq0ME+d5d6jcjTrr0vtWPeD01SCRLxU3nx8ZkNMmtvmZn5Lf81dOTWoiIKx
         /icpidp52Cw+RIL9Jz3k3Uikrk9dHFKpOpy03xdsbvzUKuJmfNAj9qczdUwhyLtColJD
         yNiYdnwEf/LUdsioBWd9+NRYa+V+lgb7+NQ4/d33rfj7KaM6Lcwh1fHjUgghT7FciZ7a
         bhjiRz1xShbCwzcpVETs7M4cdd5QgTV9UnGCIEVK5G+bAuhWPm7sGF/piwbsHa+qhhV8
         Y9qn13PFafACzppfYwyqTKfgDfPiLTBboLglvUQDGTkhG0/X7qXeISNbtsSKOP2biTSw
         Jy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ikqhDzHJzrnnMA0hQ9bg9M7iUfopxG0xDwuMQvfnxZY=;
        b=tcRpT+KCYU6yTLtBA0je5K8t5q2n3XNI4nOVK6cn+0SrRqCMmoevqS1CFS8B1YfAp0
         xtJWhkpriZE6o/HI8Dlp4N0PodJ5yVxcolYM1KQJIQPpP04afM9yYWqTq42voB6w+5Qv
         xpyJIjHtbM779NCddFTEa/n52odV7+l2QUkr+oUfCqQUvn3I5Ot8oJtDNwKtPKa+myrS
         0g+aYeKuBD43Zwv36ySl9IGuj2dyvuXD4whaGlg4Y04ua6OZhltUl6Tmweyrauoh56/1
         Q1ONPLWmiarVk/HVjSoyPnTsM9B3P6l5rr4JWjGjgMFNN0pUmlokD6SX/PsWKbG6djhj
         YjSA==
X-Gm-Message-State: APjAAAXvgGVZuLiwmXkJJ7m1wJNqj3HjmdnDytoNvC7ImWfiscSWdpH/
        bl48pt6aFQufXKFp2tLaDkHE3S2Ez8I=
X-Google-Smtp-Source: APXvYqy9zEAw53Ywk0LBeahOLAn91ajXZ7dhhekbjecnOQbRZLAe+U9gMxqM2hJ2bXsYlJd+Y+vaEQ==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr26059243wmg.48.1559811790186;
        Thu, 06 Jun 2019 02:03:10 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id d10sm1290013wrp.74.2019.06.06.02.03.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 02:03:09 -0700 (PDT)
Message-ID: <3fa782ff44f2518e2b7ef7f6f424ed9ecbeafe7f.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Date:   Thu, 06 Jun 2019 11:03:05 +0200
In-Reply-To: <20190605173902.GE27700@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
         <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
         <20190605145525.GA28819@kroah.com>
         <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
         <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
         <20190605173902.GE27700@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno mer, 05/06/2019 alle 19.39 +0200, Greg KH ha scritto:
> On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> > Hi,
> > Il giorno mer, 05/06/2019 alle 16.55 +0200, Greg KH ha scritto:
> > > On Wed, Jun 05, 2019 at 09:36:04AM +0200, Andrea Vai wrote:
> > > > Hi,
> > > > Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha
> scritto:
> > > > > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > > > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha
> > > scritto:
> > > > > > > [...]
> > > > > > Hi,
> > > > > > 
> > > > > > > Any chance you can use 'git bisect' to find the
> offending
> > > > > commit?
> > > > > > Yes, I am doing it as I managed to build the kernel from
> > > source
> > > > > 
> > > > > Great!  What did you find?
> > > > 
> > > > # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> > > > drm/atomic: Use explicit old crtc state in
> > > > drm_atomic_add_affected_planes()
> > > > 
> > > > By the way, as I am not expert, is there a way to double-check
> > > that I
> > > > bisected correctly? (such as, e.g., test with the version
> before
> > > this
> > > > one, and then with this commit applied?)
> > > 
> > > How exactly are you "testing" this?
> > > 
> > > I would recommend a script that does something like:
> > >       mount the disk somewhere
> > >       copy a big file to it
> > >       unmount the disk
> > > 
> > > testing how long the whole process takes, especially the
> 'unmount'
> > > is
> > > important.  Are you doing that?
> > 
> > Well, not exactly, and thank you for pointing me out. I am doing
> the
> > job in two ways, from the DE (when I am located at the PC), or in
> an
> > ssh session when I am away. In ssh I manually mount the media,
> then
> > run
> > 
> > touch begin
> > date
> > <cp command>
> > date
> > touch end
> 
> That tests nothing other than the size of the memory in your system
> :(
> 
> You have to flush the data out to the device fully in order to
> properly
> measure device throughput.  Calling 'touch' does not do that.
> 
> > If I use the DE (where the media is mounted automatically) I used
> to
> > "eject" the media after the copy finished, and took note of the
> time
> > used until the media was correctly "ejected" (and, so, unmounted).
> 
> eject/unmount is good.
> 
> > Anyway, I know that I can do all of this in a better way, and will
> let
> > you know.
> 
> Yes, please do so, your steps above do not show much.
> 
> 

excuse me, another question: since I get the good behavior with kernel
4.20.13 (installed from my distro packages), is it correct to run at
first

git bisect start
git bisect good v4.20.13

, then build the latest kernel, test it, set it as bad (as far as I
can expect) and go on with following tests?

Many thanks,
Andrea

