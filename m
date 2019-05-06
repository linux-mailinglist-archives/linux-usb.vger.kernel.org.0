Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB6314A63
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 14:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfEFM5O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 08:57:14 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:34985 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfEFM5N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 08:57:13 -0400
Received: by mail-oi1-f182.google.com with SMTP id w197so9468963oia.2
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZwDr9F1GyVYnDUev2ADHdr1+dJLHGyMU3IyJaRX2Wps=;
        b=EQVrtoKY90SnYXJeKKpR2NiulBmi+M8WX7u2C5IvBab7+4tDTIHdBauHn+a5d5QC9q
         en+zIfQjNekTSy8A6jygV/qZUAawk7sk0D0rHFKNhQuJVYng84+Ghj4DItQfazvcLpZY
         7MP/Cnocjl2+NyMkCJNATL1A0YfFpWR6LoWMSHHR48MUTNGFkuGVE9yYG6ZCxXys90uM
         lDU8hgEKUBb9VKJ+i4BMbbNKxYZ0hFx4tJnHjBWYI6AivMqQFoLr3oe+kcYgprOiGf/0
         9VzudB/Wr8haImxGQ0Hp87EyjdbIr/hg6F8x5MeR22YsShdmyOctlBWFUcRhkjmquSSC
         k2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZwDr9F1GyVYnDUev2ADHdr1+dJLHGyMU3IyJaRX2Wps=;
        b=U66z+sHu0avfBs1/DpWOFgKgbqmMAxVUiXGMTcs5GaJj7Q1V0xtrdux4asmRW+vbE8
         VQqfdZcONbUvdKjurgmeRA3w932LHdD6676/z/sQ4RrDpReUMMPexlQiGkxKV5qvSYqz
         tn1jA5tWZOWmdMguHpyTAWRc7uWJEMnvsbnWv0QMGyzd+VzDwZneMqwdJ0C4MRRc+Ha/
         8iF8hqq1zj+w3+uEGG0udDs6oe+pbdP5/BrDaWD101g0P2tOoVLdQpNkBJjkUx5yyphM
         kUUpVBaNiwNGXc68m2RcQwGAiS8zBF64CkplzqSvbh62sx75YRi03BPbGSQEak2D3jHM
         rxZQ==
X-Gm-Message-State: APjAAAUqjWJF8kDiBbo95MLGVjyDWNIHYGuZXoRxmVvuCmrThwmyh1zR
        vE8Z05BcB0NtCzm25i6l3YWcup0Dj7ZJ9f2JIZXrLjr7
X-Google-Smtp-Source: APXvYqwV6ukBoGI5TOAZY8vJ7e6gxScsCw3ccNY+gDbMe48Yr5Ho9jTLR+qXZdhctgA9Gl0y6LTM6YdnhB3i5zywP/U=
X-Received: by 2002:aca:1a16:: with SMTP id a22mr452563oia.174.1557147432976;
 Mon, 06 May 2019 05:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190506090241.169665-1-grawity@gmail.com> <20190506123221.GA25920@kroah.com>
In-Reply-To: <20190506123221.GA25920@kroah.com>
From:   =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date:   Mon, 6 May 2019 15:57:01 +0300
Message-ID: <CAPWNY8VMZQRysyUj77Tjqu3fmr_0Xsg3fnBvhAyfwXu-X9V2fA@mail.gmail.com>
Subject: Re: usbutils - various patches to the lsusb.py script
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 6, 2019 at 3:32 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 06, 2019 at 12:02:07PM +0300, Mantas Mikul=C4=97nas wrote:
> > Hi,
> >
> > I accidentally ended up hacking on the lsusb.py script and now have an
> > assorted collection of patches:
> >
> > - Output (controllers, hubs, etc.) sorted numerically.
> > - Color enabled by default when on a tty.
> > - Added --long-options.
> > - Replaced hand-rolled binary search with ordinary dict lookups;
> >   lost the -w (--warn-if-unsorted) option in the process.
> > - Cosmetic changes to make it look more like Python and less like C.
> > - Some changes to the output formatting that I liked to have in my own
> >   local version.
> >
> >
>
> I've applied all of these patches now, except for the usb.ids error
> message that I responded to.  Note, I do not know python well, if at
> all, so I just had to take your word for most of these :)
>
> I don't like the usb.ids error message that happens here, it's not
> essential that that file be found, especially given that most distros do
> not ship it anymore as they have switched over to the hw database
> format.  So maybe we can just drop the "error" as the tool does work
> without it, or look for the hwids data instead?

Yeah, it's probably fine to drop it (especially because the v010
parser bugs that prompted the change had already received fixes in
master).

I do want to make the tool use hwdb (I suppose the dependency is fine
given that lsusb.c already uses it), but as the only existing parser
for hwdb.bin is the C library with cpp macros sprinkled on top, I
suspect doing it from python will hurt a bit.

--=20
Mantas Mikul=C4=97nas
