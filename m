Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB7328A690
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 11:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJKJNk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 11 Oct 2020 05:13:40 -0400
Received: from smtp6-g21.free.fr ([212.27.42.6]:26382 "EHLO smtp6-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbgJKJNk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 11 Oct 2020 05:13:40 -0400
Received: from mail.corsac.net (unknown [IPv6:2a01:e34:ec2f:4e20::5])
        by smtp6-g21.free.fr (Postfix) with ESMTPS id 2F18B780394
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2020 11:13:38 +0200 (CEST)
Received: from scapa.corsac.net (unknown [IPv6:2a01:e34:ec2f:4e20:6af7:28ff:fe8d:2119])
        by mail.corsac.net (Postfix) with ESMTPS id BE1E097
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2020 11:13:03 +0200 (CEST)
Received: from corsac (uid 1000)
        (envelope-from corsac@debian.org)
        id a343d
        by scapa.corsac.net (DragonFly Mail Agent v0.12);
        Sun, 11 Oct 2020 11:13:03 +0200
Message-ID: <f61c830e08eacbc12507b3671abd3e8b9fc11013.camel@debian.org>
Subject: Re: /net/usb/ipheth.c incompatibility with Apple iOS 14
From:   Yves-Alexis Perez <corsac@debian.org>
To:     Greg KH <gregkh@linuxfoundation.org>, Kiran <kiranmkota@gmail.com>
Cc:     linux-usb@vger.kernel.org, Diego Giagio <diego@giagio.com>
Date:   Sun, 11 Oct 2020 11:12:59 +0200
In-Reply-To: <20200928175053.GA2202486@kroah.com>
References: <CAAn0qaXmysJ9vx3ZEMkViv_B19ju-_ExN8Yn_uSefxpjS6g4Lw@mail.gmail.com>
         <20200928175053.GA2202486@kroah.com>
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On Mon, 2020-09-28 at 19:50 +0200, Greg KH wrote:
> On Sun, Sep 27, 2020 at 07:14:39AM -0700, Kiran wrote:
> > Effect on end user: when a linux machine is connected via USB to an
> > iPhone that has been updated to iOS 14 and has personal hotspot mode
> > turned on, the user cannot connect to the internet.
> > 
> > Troubleshooting: DNS works, the linux machine can ping the iPhone
> > gateway, pinging google.com hangs. It appears that there is a change
> > to the USB packets that iOS expects.
> > 
> > Here is a link to what I think is the most relevant part of a Github
> > issue discussion with more specific details:
> > 
> > https://github.com/libimobiledevice/libimobiledevice/issues/1038#issuecomment-699630379
> > 
> > This is my first linux bug report and I'm not familiar with kernel
> > development. The other people in the Github post will be better to
> > talk to regarding a fix. But if I can provide more info, just let me
> > know.
> 
> Not much we can do about this, but if you come up with a patch that
> works, please let us know and we will be glad to review it.

Hi Greg,

I'm experiencing the issue myself so I should be able to test a patch and
submit it properly once we have one.

Unfortunately it seems that we don't really have a clue how the driver is
really supposed to behave and negotiate with the device. I'm adding Diego
Giagio to CC because his address is in the file header and in case he could
jump in and help, but I'm not holding my breath since the copyright date is
from 2009.

It'd be nice if we had some documentation and/or contact at Apple, but other
than that I guess we'll have to poke around and see how the itunes driver do
their job in MacOS or Windows.

Regards,
- -- 
Yves-Alexis
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8vi34Qgfo83x35gF3rYcyPpXRFsFAl+CzJsACgkQ3rYcyPpX
RFt2Rgf/VzM6ym/SL+90osHG6Z92xGnPKoR1j3RJcJtVSAuZwXADnzeKB0dd8Bvx
TSiFYkTItY0KzFmDvuZ4jFqhnhuG2Qd8q8kJlLNh7lQKXa79547a2vBNA9oRF25a
5hnAsK0KEJTtDYmCptUUpH8V18U5zlIqFfF+/eWyzyBdWyh4bnv5U22kQeXtyY1o
iGEhGQ4+U/lJTfjdb/t5ZS47EJIbKRN8ExrdKszp6ob7Sd6TOn5tJwfbJ0juu+50
f9o4mFXTs1um8PHNMY/cmVuLY31SSZEO6cjh6RMvg6D+LQY/tNYM33D0Pio5/zcM
+L5UuP9vyA2Hnh6g/BAIId+WiBUaNQ==
=i4w2
-----END PGP SIGNATURE-----
