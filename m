Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271CB219857
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 08:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgGIGON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 02:14:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgGIGOM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 02:14:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9FEB206A5;
        Thu,  9 Jul 2020 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594275252;
        bh=eJ37KQepXsq7ZbcPCZXnc3xOtAie6Pp6DP5wKWUwKJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GvSQXDN6VhqS8FOO8X76vXoe0PxXTf6HP+tZLXcqU2CWRBQL2Id2l/bgVb0L4UQ84
         iE/WBjP/wipRKUSy1PMgFlxTm46nDAunoFwcsapUQKyiLqMwXCR0/Syr/4MC0c7+4S
         bgyxZoX+vuR4Vhdkbt2x1yHE2TKDeGGhc495xz/E=
Date:   Thu, 9 Jul 2020 08:14:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        David Miller <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: USB MASS STORAGE
 DRIVER
Message-ID: <20200709061409.GA130260@kroah.com>
References: <20200708095500.13694-1-grandmaster@al2klimov.de>
 <20200708103928.GC585606@kroah.com>
 <6b78a3fd-04b9-fc8e-b5c6-f03372a4cd31@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b78a3fd-04b9-fc8e-b5c6-f03372a4cd31@al2klimov.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 08:41:54PM +0200, Alexander A. Klimov wrote:
> 
> 
> Am 08.07.20 um 12:39 schrieb Greg KH:
> > On Wed, Jul 08, 2020 at 11:55:00AM +0200, Alexander A. Klimov wrote:
> > > Rationale:
> > > Reduces attack surface on kernel devs opening the links for MITM
> > > as HTTPS traffic is much harder to manipulate.
> > > 
> > > Deterministic algorithm:
> > > For each file:
> > >    If not .svg:
> > >      For each line:
> > >        If doesn't contain `\bxmlns\b`:
> > >          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> > > 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> > >              If both the HTTP and HTTPS versions
> > >              return 200 OK and serve the same content:
> > >                Replace HTTP with HTTPS.
> > > 
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > 
> > Your subject lines are very odd compared to all patches for this
> > subsystem, as well as all other kernel subsystems.  Any reason you are
> > doing it this way and not the normal and standard method of:
> > 	USB: storage: replace http links with https
> > 
> > That would look more uniform as well as not shout at anyone.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> Hi,
> 
> I'm very sorry.
> 
> As Torvalds has merged 93431e0607e5 and many of you devs (including big
> maintainers like David Miller) just applied this stuff, I assumed that's OK.
> 
> And now I've rolled out tens of patches via shell loop... *sigh*
> 
> As this is the third (I think) change request like this, I assume this rule
> applies to all subsystems – right?

Yes, you should try to emulate what the subsystem does, look at other
patches for the same files, but the format I suggested is almost always
the correct one.  If not, I'm sure maintainers will be glad to tell you
otherwise :)

thanks,

greg k-h
