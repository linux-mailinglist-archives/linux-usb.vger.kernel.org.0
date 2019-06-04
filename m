Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6CF13400F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 09:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfFDH00 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 03:26:26 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42622 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfFDH0Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 03:26:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id o12so7498295wrj.9
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QbZvrjLfIFVqFbZjsWNghzLo74BB0FgDBdA6SVfVZHY=;
        b=j6l6U0hBlOSFNA69xTaVSJGX+ZllwaJZJmGZ5ygX+ROvaHUZByrpIp0qKdxmyYGLHY
         uwhg+HvM0ojo0S7N6zU5k/yuTRASgBp0SE2hHIjgAtTwWJ2SPcbQYxuT86ufeKXtVrNf
         qyxQXMeL7hjIL9pxyuyP7rfF3k/ZrQiEFmFUt4ARGkSrG1/965HG0i6nsHm8T9qU+Ppg
         A04c2QYpSjtYhss5vUhEJUDan4XCTYJgsJD6+UVT+JUnqD5vrKWW7AOlNKYsdkO+TBFd
         +mrVEsjcy6fA8w5UjJ0UqxJAvP3hLVCgoIWWJ0hk7x34RiymKkmgRNB7ufSce4p4xDj/
         6ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QbZvrjLfIFVqFbZjsWNghzLo74BB0FgDBdA6SVfVZHY=;
        b=ZIavKQyuTozi72c5Ip/X80tzYZoe36pa+ofpEhKacDLTudjA01cjlkz3iYhLfi3ZNR
         wfKiko9UBVgWC6CLnX/r+YGPZLGmC2qWqaNHN/ro0WvWbcdpsnYZWxYf9n0Fr0lPaGv7
         A1Xlih3wmS1UtJJIbHW8PiGRWDxgjC2qAmgExjecUP7zY4vAByM7HNcPHj1aXUEw5FLx
         2Ef6v7s78ehykVjFwhaRADWN5i45eBZ/VGU8SzsSK1O6YQMepNAni99vv3DMuoa7xLwQ
         2l6HdyLvWxxmxtII15M5ghZW2F2YIP4iZ9V5K/adGr4tJinysHERCe0L8vBSD54If30q
         lfzg==
X-Gm-Message-State: APjAAAXT7TlVXu9fHw3oNPQ76jYLHhASnln23fD+DvVcbxDbfQuLvihF
        3RAEpf5hwHD8iJUb46aJjaAJXHoT0Sk=
X-Google-Smtp-Source: APXvYqzBmOMQldN1x1xxbZKKR99CP+q3ys6G4K6AMABOdTPx2pdjiVk4Uqv08Y4f1DrUOrRs+94h4g==
X-Received: by 2002:adf:fc85:: with SMTP id g5mr19243277wrr.324.1559633183482;
        Tue, 04 Jun 2019 00:26:23 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id o3sm16976980wmo.6.2019.06.04.00.26.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 00:26:22 -0700 (PDT)
Message-ID: <9b04d6c3a322ffe25e0c57e055885eb22e7cdaea.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 04 Jun 2019 09:26:17 +0200
In-Reply-To: <20190604054300.GE1588@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha scritto:
> > > [...]
> > Hi,
> > 
> > > Any chance you can use 'git bisect' to find the offending
> commit?
> > Yes, I am doing it as I managed to build the kernel from source
> 
> Great!  What did you find?

so far, something in between 
2ac5e38ea4203852d6e99edd3cf11f044b0a409f (good) and
b3cc2bfe7244e848f5e8caa77bbdc72c04abd17c (bad)... (about 8 steps left)

> 
> > > And did you accidentally turn on "sync" for the filesystem? 
> > Sorry, I don't think so but actually I don't know exactly what it
> is
> > nor how to check it...
> > 
> > >  How do you
> > > know the old kernel really flushed the buffers out in 1 minute? 
> > 
> > I used to try to unmount the usb media (e.g. "eject" using
> Nautilus
> > file manager), and got a message stating the filesystem was in use
> and
> > could not be mounted, so always answered to not eject it until it
> was
> > unmounted without any warning... does it make sense?
> 
> That does not mean that the data is not flushed to the device yet,
> that
> just means that some userspace program is still accessing the
> device.
> You need to run some other type of test to validate how long it taks
> for
> the data to get to the device.

I understand, I actually omitted here what I found out by using "top",
"ps" and "iotop" to catch the moment when the data write finish. I
found a process named "kworker/u8:0+flush-8:16", or similar, which is
alive while the cp process is in D state (and as long as I can't
"eject" the device), and disappears when the media can be ejected, so
I assumed it to be a good indicator for the data write. But I admit I
am really poorly skilled on this matter, so thanks for pointing it
out, and for any other explanation (or links to deepen it
furthermore).

> 
> > >  But 12
> > > minutes is really long, did anything else change in your
> userspace
> > > between the kernel changes as well?
> > I am not sure if I understand correctly the "userspace" you
> mention:
> > if you mean my home directory and contents, settings etc, then
> yes,
> > maybe... but while I am doing the tests I am quite sure I didn't
> > change anything, and double-checked many times that the 4.20
> kernel is
> > always working (I usually boot up with it when I need to do the
> usual
> > day work).
> 
> I mean, did any other programs on your machine change between the
> upgrade of your kernel?  Maybe some gnome-tracker is going off and
> indexing all of the data on that device after you mount it, and it
> wasn't previously doing that before.  As it is still busy, something
> has
> some open files on that device.

Thank you, now I understand what you mean. Yes, this is definitively
possible (may a "lsof | grep mount_point_of_the_device" or similar
could give some clue?)

Thanks, and bye,
Andrea


