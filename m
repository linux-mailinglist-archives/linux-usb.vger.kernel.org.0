Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09AC494D62
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 12:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbiATLuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 06:50:22 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:34570 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbiATLuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 06:50:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6883561687
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 11:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6F7C340E0;
        Thu, 20 Jan 2022 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642679419;
        bh=p5xdhRegvMyQDeCxJsRgBc0Wi4g5Ae9EfrcnIDUzxlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zb4s8VXRg25VIZnecgAv3O7g2KT78jBB3p7QT5SYxQieU1HJVt7UKcAee9aFWLtWq
         CCNgxENDGRGxIp0qDDvOPnOxmxHQ/zb8sdCurbAak0CO/6ejeL7XltOx+BhPfE9kfu
         WpMPgx0EjOuRheoKFlDsUbFTIXxAxuHdSVv6LY1c=
Date:   Thu, 20 Jan 2022 12:50:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rajaram Regupathy <rajaram.regupathy@gmail.com>
Cc:     Benson Leung <bleung@google.com>, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
Message-ID: <YelMeE/U63Qlsa7a@kroah.com>
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com>
 <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com>
 <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
 <YecIA5hEYqrZo+6G@kroah.com>
 <YecSDHXscl4LX5g9@google.com>
 <YefLk+hmEfg6Tp6F@kroah.com>
 <CAD039W4US=SSbk63wVa0oTkHJjyes03QU5BbGvAgjommLdfpjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD039W4US=SSbk63wVa0oTkHJjyes03QU5BbGvAgjommLdfpjg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 03:29:38PM +0530, Rajaram Regupathy wrote:
> On Wed, Jan 19, 2022 at 1:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 11:16:28AM -0800, Benson Leung wrote:
> > > Hi Greg,
> > >
> > > On Tue, Jan 18, 2022 at 07:33:39PM +0100, Greg KH wrote:
> > > > On Tue, Jan 18, 2022 at 10:01:02PM +0530, Rajaram Regupathy wrote:
> > > > > > Again, why does this have to be a library?
> > > > > >
> > > > > The aim of having a library is to abstract application(s) from OS,
> > > > > platform, PD Controller or Embedded Controller protocols ambiguities
> > > > > and provide common methods. The methods will be similar/closer to UCSI
> > > > > standard.
> > > >
> > > > What methods are needed by an operating system that your library is
> > > > going to provide?  How will it be done in a unified way that the current
> > > > user/kernel api isn't providing already today?
> > > >
> > >
> > > A unified libtypec would be useful because the USB Type-C and USB PD
> > > specifications are evolving, and continue to change. Spec changes affect the
> > > decoding of the objects that are exposed by the connector class (the existing
> > > API), and we are at a point where if we left it as-is, you'd have multiple
> > > userspace implementations that would have to independently be updated and
> > > fixed every time there's a new USB PD spec revision or version update.
> > >
> > > Just as a concrete example, Jameson (jthies@google.com), who works on my team,
> > > recently put together a little helper utility to decode the typec connector
> > > class in order to print it to our feedback report collector. This was all
> > > done before libtypec:
> > >
> > > https://chromium.googlesource.com/chromiumos/platform2/+/749621a6288cc5e80b31a9e6050437a419209fb9/debugd/src/helpers/typec_connector_class_helper.cc
> > >
> > > A problem we ran into almost immediately was that the utility was based on
> > > the most recent USB PD specification documents (USB PD R2.0 and USB PD R3.1),
> > > and had definitions on how to decode PD 2.0 and PD 3.1 objects that it would
> > > read from the typec connector class, however, it was missing definitions for
> > > USB PD R3.0 (a spec revision which is not obvious how to find in USB-IF's
> > > document archive).
> > >
> > > So, we added it: https://chromium.googlesource.com/chromiumos/platform2/+/eb1efefc187feab1182a7680f42fcec6bb14c618
> > >
> > > Now, every other hypothetical type-c connector class user application or daemon
> > > could potentially make this mistake, and would have to duplicate the work
> > > to fix it.
> > >
> > > If we had libtypec, it would be the unified place to make such a change, and
> > > we'd reduce the burden of new typec apps from having to do all this decode
> > > in the future.
> >
> > Ok, that's fine, but please work to create a library that can handle
> > such changes in non-breaking ways.  The first version of this library
> > does not look like it would do that at all as it is exporting way too
> > many things in a "public" interface.
> 
> - Fixed compile error caused due to new version of compiler
> - Fixed license details.

The license details are still quite vague.  Please try to put proper
SPDX license identifiers on the individual files so that they are not
vague at all.  What you have here will prevent people from being able to
use this code until it is cleaned up, sorry.

> The library provides interfaces very similar/same as the UCSI standard
> from USB.org.

What do you mean by this?  Exposing raw device structures?  Or something
else?

> Additionally the library uses what is available in the existing
> framework and  acts as a wrapper between
> lower layers and the applications and not a self reliant entity.
> Could you please help better understand your concern ?

How can this be used?

How about adding support for this with lsusb as an example to show how
it might be incorporated.  Or better yet, what about adding this to
libusb so that all platforms will work.  That is, if this is even
relevant for userspace USB access, which I still can't figure out if it
is or not...

Anyway, the license stuff should be fixed up first.  If you have an
employer, please work with them to get this right as they all have legal
training for this type of thing.  If you do not have an employer, I
recommend taking the free LF online course that helps to describe
licenses and copyrights and how to use them.

thanks,

greg k-h
