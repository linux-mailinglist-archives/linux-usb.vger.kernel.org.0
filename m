Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD88536127
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 18:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfFEQYD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 12:24:03 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:55446 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728630AbfFEQYD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 12:24:03 -0400
Received: by mail-wm1-f51.google.com with SMTP id 16so2872699wmg.5
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZaMs/snBbpvg7XRuQ2l4FQcAh7uurMNccxIYMJb1RYw=;
        b=G3WS3CLdMtdpEgRt8LdT9g9aXIW4znuxHldNimOYGQoMs0zCQebFvUJm1FdhI0N3Om
         AoNd4eZwtcpS2XCqnEQknbE4rkxfDdI4MuVaUMNPlQ8kzNbUdi/+Rt7czHGrR4dHZL5C
         V9hTlt1ctb4fuJ/kESxXv9tuLJ5b7lk3q56x+5tRxGdnZXx0JBODVYbJPsXOMXDDq/Kh
         +Y9kiDBjJ7Wm+9uKshgRKWb4S7NRWQbYymMBqhiwYZl3aGgaEOaYTL92q+fBqe6HdXhY
         PRtdDrFKICiec99v4mYvHGwuk0uT0erPGJ1wlGu/OWD0Xw1KTCcXSQW73wS2+UVB2Ckx
         Jodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZaMs/snBbpvg7XRuQ2l4FQcAh7uurMNccxIYMJb1RYw=;
        b=K/lI88/1TXtaODodYvNA3B/bpTfPrrge6MQqj2Bl/wtIIxO1phYRYgOYJ83DhdBSv9
         9bvnooaQUVHTCFIxd8t4ff8wiscW9djMk0OtHGNv3NVSOOyxHV9H/76N8LV9WQgk7/Ol
         02ofXynqAgOtEv4v0Cpoj6ANboaYn8jpl7mfJWpm33gL8sE71beDCskgtU+UKmjEEaxL
         w68LYNYllqhG/TvNoaQU/nwH4ZIXrZXk/duZHOKjFeWffZ8jZpVDzlWQqQNbOzRLmwFx
         PGDRUybnjCXoM/Q3oXMrhq2h23wO/hZvLL7gGVDdV643ZLwqLcNpyb9jhJeJDXX+MQxM
         tylA==
X-Gm-Message-State: APjAAAUXIK1Y+JfwZJXusokv6/pzeDxpysF1LEoSOkLgAzrw1WzWXKLM
        kC3g4h57FNPNKVXJFp/QYm2xkw==
X-Google-Smtp-Source: APXvYqw5PN+qikdN+XUYdofCIGNq2CptGAZIRMMEQoiGQINzKauE6sGieVdnVdoWSZc/9hYrlc7BaQ==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr11203656wmc.47.1559751840910;
        Wed, 05 Jun 2019 09:24:00 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id f8sm13656078wrx.11.2019.06.05.09.23.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 09:23:58 -0700 (PDT)
Message-ID: <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Date:   Wed, 05 Jun 2019 18:23:58 +0200
In-Reply-To: <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
         <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
         <20190605145525.GA28819@kroah.com>
         <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
Il giorno mer, 05/06/2019 alle 16.55 +0200, Greg KH ha scritto:
> On Wed, Jun 05, 2019 at 09:36:04AM +0200, Andrea Vai wrote:
> > Hi,
> > Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> > > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha
> scritto:
> > > > > [...]
> > > > Hi,
> > > > 
> > > > > Any chance you can use 'git bisect' to find the offending
> > > commit?
> > > > Yes, I am doing it as I managed to build the kernel from
> source
> > > 
> > > Great!  What did you find?
> > 
> > # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> > drm/atomic: Use explicit old crtc state in
> > drm_atomic_add_affected_planes()
> > 
> > By the way, as I am not expert, is there a way to double-check
> that I
> > bisected correctly? (such as, e.g., test with the version before
> this
> > one, and then with this commit applied?)
> 
> How exactly are you "testing" this?
> 
> I would recommend a script that does something like:
>       mount the disk somewhere
>       copy a big file to it
>       unmount the disk
> 
> testing how long the whole process takes, especially the 'unmount'
> is
> important.  Are you doing that?

Well, not exactly, and thank you for pointing me out. I am doing the
job in two ways, from the DE (when I am located at the PC), or in an
ssh session when I am away. In ssh I manually mount the media, then
run

touch begin
date
<cp command>
date
touch end

so I get the time kept looking at the output of "date", or at the date
of the begin/end files. I understand that if I don't unmount the media
I cannot be sure all data has been written, but if the cp command is
still not finished after 20, 30 minutes then I can tag the commit as
"bad". Since I obtained one "good" behavior only (1-2 minutes) among
10+ tests, I took for sure it was a"good" commit, and I may have made
a mistake there (because I am not sure I actually unmounted the
media).

If I use the DE (where the media is mounted automatically) I used to
"eject" the media after the copy finished, and took note of the time
used until the media was correctly "ejected" (and, so, unmounted).

Anyway, I know that I can do all of this in a better way, and will let
you know.

> 
> Also, you should probably just boot into text mode for this, most
> graphical DEs like to auto-mount disks these days.

Thank you for clarifying. As said above, actually I think I have took
care of it, but I can do another bisect by turning off the automount
feature of USB media in my DE, and mount/unmount only by command line.

First of all, I will try to revert the commit, and see what happens.
If the test fails, I will run another bisect.

Thank you for your patience,
Best regards
Andrea

