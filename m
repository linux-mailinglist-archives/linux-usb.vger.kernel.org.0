Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B206C49CFDC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 17:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236482AbiAZQkE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 11:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbiAZQkE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 11:40:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17A4C06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 08:40:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D044B81EFD
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 16:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A94C340E3;
        Wed, 26 Jan 2022 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643215201;
        bh=kYnMU7aHxZemJT2PpB06XxiOtgpg8/WP6OvMgUvTQg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ulUqAP+RsOgfSEjdCasOmSPvTYQSKYTenIcY3S4/DGz8zmowrWp24zj/BYPG6ZG82
         YLkrniH2jUiHtePgEuyNkw+LGM+PT8CC1x1VqHuBgQ1M4muyqBXJC45E9KTZCv7O6A
         ulnfTQMVz60od0dUfrSddnflG+YB6d3iGDuc8q2Q=
Date:   Wed, 26 Jan 2022 17:39:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rajaram Regupathy <rajaram.regupathy@gmail.com>
Cc:     Benson Leung <bleung@google.com>, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
Message-ID: <YfF5XnBz7v2F9lvk@kroah.com>
References: <YeUYQB4neDz8Z0Tb@kroah.com>
 <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com>
 <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
 <YecIA5hEYqrZo+6G@kroah.com>
 <YecSDHXscl4LX5g9@google.com>
 <YefLk+hmEfg6Tp6F@kroah.com>
 <CAD039W4US=SSbk63wVa0oTkHJjyes03QU5BbGvAgjommLdfpjg@mail.gmail.com>
 <YelMeE/U63Qlsa7a@kroah.com>
 <CAD039W5XS_mOFOUVU1E7rAQEdFWL=Q2d8CuG__M851CvrU7tUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD039W5XS_mOFOUVU1E7rAQEdFWL=Q2d8CuG__M851CvrU7tUQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 26, 2022 at 09:39:17PM +0530, Rajaram Regupathy wrote:
> On Thu, Jan 20, 2022 at 5:20 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jan 20, 2022 at 03:29:38PM +0530, Rajaram Regupathy wrote:
> > > On Wed, Jan 19, 2022 at 1:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Jan 18, 2022 at 11:16:28AM -0800, Benson Leung wrote:
> > > > > Hi Greg,
> > > > >
> > > > > On Tue, Jan 18, 2022 at 07:33:39PM +0100, Greg KH wrote:
> > > > > > On Tue, Jan 18, 2022 at 10:01:02PM +0530, Rajaram Regupathy wrote:
> > > > > > > > Again, why does this have to be a library?
> > > > > > > >
> > > > > > > The aim of having a library is to abstract application(s) from OS,
> > > > > > > platform, PD Controller or Embedded Controller protocols ambiguities
> > > > > > > and provide common methods. The methods will be similar/closer to UCSI
> > > > > > > standard.
> > > > > >
> > > > > > What methods are needed by an operating system that your library is
> > > > > > going to provide?  How will it be done in a unified way that the current
> > > > > > user/kernel api isn't providing already today?
> > > > > >
> > > > >
> > > > > A unified libtypec would be useful because the USB Type-C and USB PD
> > > > > specifications are evolving, and continue to change. Spec changes affect the
> > > > > decoding of the objects that are exposed by the connector class (the existing
> > > > > API), and we are at a point where if we left it as-is, you'd have multiple
> > > > > userspace implementations that would have to independently be updated and
> > > > > fixed every time there's a new USB PD spec revision or version update.
> > > > >
> > > > > Just as a concrete example, Jameson (jthies@google.com), who works on my team,
> > > > > recently put together a little helper utility to decode the typec connector
> > > > > class in order to print it to our feedback report collector. This was all
> > > > > done before libtypec:
> > > > >
> > > > > https://chromium.googlesource.com/chromiumos/platform2/+/749621a6288cc5e80b31a9e6050437a419209fb9/debugd/src/helpers/typec_connector_class_helper.cc
> > > > >
> > > > > A problem we ran into almost immediately was that the utility was based on
> > > > > the most recent USB PD specification documents (USB PD R2.0 and USB PD R3.1),
> > > > > and had definitions on how to decode PD 2.0 and PD 3.1 objects that it would
> > > > > read from the typec connector class, however, it was missing definitions for
> > > > > USB PD R3.0 (a spec revision which is not obvious how to find in USB-IF's
> > > > > document archive).
> > > > >
> > > > > So, we added it: https://chromium.googlesource.com/chromiumos/platform2/+/eb1efefc187feab1182a7680f42fcec6bb14c618
> > > > >
> > > > > Now, every other hypothetical type-c connector class user application or daemon
> > > > > could potentially make this mistake, and would have to duplicate the work
> > > > > to fix it.
> > > > >
> > > > > If we had libtypec, it would be the unified place to make such a change, and
> > > > > we'd reduce the burden of new typec apps from having to do all this decode
> > > > > in the future.
> > > >
> > > > Ok, that's fine, but please work to create a library that can handle
> > > > such changes in non-breaking ways.  The first version of this library
> > > > does not look like it would do that at all as it is exporting way too
> > > > many things in a "public" interface.
> > >
> > > - Fixed compile error caused due to new version of compiler
> > > - Fixed license details.
> >
> > The license details are still quite vague.  Please try to put proper
> > SPDX license identifiers on the individual files so that they are not
> > vague at all.  What you have here will prevent people from being able to
> > use this code until it is cleaned up, sorry.
> 
> I have updated license details. It is aligned and made compatible with
> similar usb frameworks.

Nice, so the library is GPLv2?

You might want to download the 'reuse' tool and run 'reuse lint' on your
repo.  The license file name is a bit odd and doesn't parse well, but I
understand what you mean here :)

Also note, that GPLv2 is NOT a good license for a library, but hey, it's
your code, not mine.

> > > Additionally the library uses what is available in the existing
> > > framework and  acts as a wrapper between
> > > lower layers and the applications and not a self reliant entity.
> > > Could you please help better understand your concern ?
> >
> > How can this be used?
> 
> Few possible usages :
> 
> 1) Informational utilities like lstype
> 2) Analyzing Utilities - With usb-c products in different versions,
> vendors and e-cables usb-c port may not work as intended. this utility
> shall check
> usb-c port's operation and report/notify.
> 3) Test Utilities - Test tools similar to UCSIControl.exe
> 4) Policy Managers: like
> https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/typecd/README.md
> etc..
> >
> > How about adding support for this with lsusb as an example to show how
> > it might be incorporated.  Or better yet, what about adding this to
> > libusb so that all platforms will work.  That is, if this is even
> > relevant for userspace USB access, which I still can't figure out if it
> > is or not...
> 
> IMHO, I believe usb-c is not usb and hence integrating usb-c
> operations with usb utilities or libraries is not a modular approach.
> (usbcore vs typec).

Parts of USB-C is USB :)

> Having said that  if it would be good to integrate lstypec with lsusb
> as you recommended, would be happy to push patches to lsusb

Maybe parts of the output of lstypec would be good to have in lsusb, I
don't know.  Take a look at see what you think.

thanks,

greg k-h
