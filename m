Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76212924B2
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 11:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgJSJgN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 05:36:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46787 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgJSJgN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 05:36:13 -0400
Received: by mail-io1-f68.google.com with SMTP id b15so8294433iod.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 02:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2Yd7eFQcw2IeP63aaEeGBJJs+lBbxgTU3WPKYR+LUg=;
        b=CkE8ahzTqo0BwxGzEx2qqshJLItolYGj1HRufo67GT9VSca8Luou/2n4H+gv76NigI
         Vto0IDrHvi4weEL0N+3ZjcdFK9eOviaakbLQw3GyAPFqmVSVvEazeLIXPIgKo1qPUG4V
         hO9vwo8VayOUjlpmrHQfJCGaYM2+e7EmKPXIpqgpNqr7U024JxyeB45Qmnu/tKVwMfut
         bGVlD6I6TIOp29IYykHEWMKTxHgisF/0BKuaZi51/yAJ28aQx/wn/qc+566oTZvUcnS+
         tJNodyICHtRJnjE+NZDeW+ZKZRRXVk0Q1DVmyVlXJ59YlHO6Rvvcav7OB0dGo3KNmhJY
         1reA==
X-Gm-Message-State: AOAM533ftT5GYwidAig7UoI8yEGIZTPiMjmIb6PCBEgQkFFGWjr9fnjc
        1DEyO+0ooircd4gAuk55UCbp33uEz/2xNA==
X-Google-Smtp-Source: ABdhPJxu3aaMsF7IPD/7qtAPCuh/5Y51c2p9rBKS80jItZl3cNIOu656paEJy9P3XWeyV4gJikmsFw==
X-Received: by 2002:a05:6638:92a:: with SMTP id 10mr10820219jak.125.1603100172346;
        Mon, 19 Oct 2020 02:36:12 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id s14sm997833iln.32.2020.10.19.02.36.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 02:36:12 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id g7so819071ilr.12
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 02:36:12 -0700 (PDT)
X-Received: by 2002:a92:3007:: with SMTP id x7mr10700188ile.141.1603100172052;
 Mon, 19 Oct 2020 02:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
In-Reply-To: <20201017200200.GB842001@rowland.harvard.edu>
From:   Pany <pany@fedoraproject.org>
Date:   Mon, 19 Oct 2020 09:36:00 +0000
X-Gmail-Original-Message-ID: <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
Message-ID: <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 17, 2020 at 8:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, Oct 17, 2020 at 04:07:11PM +0000, Pany wrote:
> > Hi,
> >
> > I installed fedora 32 into an SD card, with which I booted my Macbook.
> > It had worked well before, until I upgraded the kernel from 5.8.5 to
> > 5.8.6 [1].
> >
> > With kernel-5.8.6-200.fc32.x86_64.rpm [2] installed, the boot process
> > would be stuck at "A start job is running for
> > /dev/mapper/fedora_localhost_--live-home (<time> / no limit)" (See the
> > photo of screen [3]).
> >
> > By appending "systemd.debug-shell=1" to the kernel cmdline, I saved
> > the journal [4].
> >
> > This issue has been bisected to commit
> > 53965c79c2dbdc898ffc7fdbab37e920594f5e14 ("USB: Fix device driver
> > race")
> >
> > If I revert this commit, the kernel 5.8.6 would boot successfully.
>
> This should have been fixed in 5.8.14 or 5.8.15 (5.8.14 was released on
> the same day that the fix was installed; I'm not sure which came first).
> At any rate it certainly should work with the most recent 5.8.y kernel.
>
> Alan Stern

I tried, but neither 5.8.14 nor 5.8.15 worked for me.

-- 
Regards,
Pany
pany@fedoraproject.org
