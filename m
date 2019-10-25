Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEA2E460E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 10:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408439AbfJYIpN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 04:45:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40122 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407543AbfJYIpN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Oct 2019 04:45:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id o28so1318638wro.7
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2019 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QljUEfnAFjPhi1Cpeu2+3TNeN7NOO8V2PLCDzIO4TxA=;
        b=h8tCSMCbn6S2V/9/0tqMW7XfM6Lx7Aid2dbQnkDVZH/aWFVCEjpr8pmJ6KvRNpOC4g
         G9R7x19+rarr9DFL0s3xGhjaw9AhZdwwXH63/jAa7hKTTLBfN+JQOZmXfxwyySQSwv2r
         3dvjuRNxJPPdPvhdm6YpjwX04K59tzPPbBuN80icjqEon59gV1W/iX3ORCRYfCL0S+p4
         X+oRe7GGdGm2b6q9oeNl8qA2+wtREPQKqMmErg0rbEbE4C8ys2lnnD/PerDP7AvWAvmV
         XnyCwECQm8H+Iau4iJR/3LfLpigaMgucxAS5OniDB2SPrLCS0pTMiDN1cIrjnwP7XdYD
         1OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QljUEfnAFjPhi1Cpeu2+3TNeN7NOO8V2PLCDzIO4TxA=;
        b=jyEUARHpsLb0Lb/5BSeNBYG5Ek8GzHt5wG3KA9kZuXG7JDFTC9zm+ErG4eREKJzuxV
         W0nz0MYDwRDqpq5YonrZaFEx1JYIWxUR9QKdjyJZW/Xs3PSY0k/L6x4H0gUHXEO/X/+L
         wpwDD6uvii16SqxA7bB5ifM4m7AOexX1QMrKjvkb3jFb5OQmEMqd1NDPSMQuKwweqHJD
         luWJOlFMlSbLLUGbO+UfwFuVsH0QkXvsYIzNEUajXOlZqsn7GtPluJcce4GYjIvXG99D
         C6c/GyWEoMNsXEvU5E4B3CyROvJMMW6JjoXVlFCRvlBh9XlONc+UtWMdWlbv9TyFJqTQ
         uDEw==
X-Gm-Message-State: APjAAAWMOlwaqlk7lIitwDohJZLXse/fIU4uzOjjP+io95hEjwGL4Wlp
        n41WFWiqCO40w/0QuGiwcxYP+7UrbICEvNFP2rQ=
X-Google-Smtp-Source: APXvYqxEK/mImiGcPOoAPdtj1UU9haau8tNDoYwiz5GRhJi5nFO8EU55ZnjEuoJpBgIHQ86d3nkxEHbk+UFS4AvYlXU=
X-Received: by 2002:adf:d1aa:: with SMTP id w10mr1748787wrc.127.1571993111044;
 Fri, 25 Oct 2019 01:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com> <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
 <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com> <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
 <87d0fny5in.fsf@gmail.com> <52a7b158-ab76-432a-4d2c-7b731dc9c2a2@linux.intel.com>
 <CADGPSwgJMKfQChfxMNU4S_xv1vfHr7_GY6rGwgeDOVuW6+mpVg@mail.gmail.com>
 <CADGPSwhCPvdu=KmQP6RHMJnh292UO0uBAt+KyJqqOWY5DWDc3w@mail.gmail.com>
 <CADGPSwiCY9=kUpKmcUwAhvCHmvGDSrxoBXEkzgQpEpiakKEv6A@mail.gmail.com> <87v9sfixv3.fsf@gmail.com>
In-Reply-To: <87v9sfixv3.fsf@gmail.com>
From:   alex zheng <tc0721@gmail.com>
Date:   Fri, 25 Oct 2019 16:44:34 +0800
Message-ID: <CADGPSwhg=HgGL+J0kvgu=uZAo+_E9W3Aj3nLRDsyr4FoLs=8Wg@mail.gmail.com>
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng@dji.com" <xiaowei.zheng@dji.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Felipe Balbi <felipe.balbi@linux.intel.com> =E4=BA=8E2019=E5=B9=B410=E6=9C=
=8823=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:02=E5=86=99=E9=81=93=
=EF=BC=9A
>
>
> Hi,
>
> (please don't top-post)
>
> alex zheng <tc0721@gmail.com> writes:
> > Hi, all
> >
> > We found that this is a known issue of synopsys DWC3 USB controller,
> > when the PARKMODE_SS of DWC3 is enable, the controller may hang or do
> > wrong TRB schedule in some heavy load conditions.
> >
> > Setting DISABLE_PARKMODE_SS to 1 can work around this bug.
>
> Is this something that affects some versions but not others? If the
> case, we should teach the driver to handle this based on a revision
> check.

It seems that all DWC3 USB3.0 controller witch have parkmode_ss may
run into this issue, but we did not do a further test, and I find that
there is already a fix patch in maillist yesterday, see title: usb:
"dwc3: Update entries for disabling SS instances in park mode"

>
> cheers


>
> --
> balbi
