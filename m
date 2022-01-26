Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B68749CF42
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 17:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238198AbiAZQJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 11:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238830AbiAZQJa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 11:09:30 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCE2C06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 08:09:30 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id k17so251617ybk.6
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 08:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=529XVh5BuvK1QlZT7G6RrU4b8iwD2uzEXpb52K40egw=;
        b=LbnkPMtG39bUcvM3JgQhHGgPpbVKEIYImh+Ogz/o1J2ghbQMcpEHHOGMo1EgIvN7CJ
         7L8b5v3oFJooz9g1vkz7F/mW5pqrgT1fDX+UhoVlMY4MJ7hnPWM0h+vke0lGtHe7HNaC
         iuDT2W8JL3Sb3/dDkLDLgCAfosheD4WfRVZGp7ZlVjrBJ42Zt4UnrZ9qMcwSWMe+nxNd
         GpePipQ2dtn5Sl9TkXTF5w/HtDZNjRs6AzPsgGYwpoVhZ+vNt/iFbpNNSIuyZEbXWOVg
         5h5SOghB4iVyRlf++nfM3IlsdDJY0VWYhxCv9UBhpFIO6WG3V1l2up1XPTN0JHCzPYGm
         C7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=529XVh5BuvK1QlZT7G6RrU4b8iwD2uzEXpb52K40egw=;
        b=q7nrbqrLe56MuN/AIswNlyFA9f+wVObrIJpPiv8CMv2E1tFNo+6VwsW9oB3lt3tCZD
         eP0Q3zXQNwj3WZrHRRLfYQbKeujJjRHK05yBdrVa0w1AnPqbZqrr0OeIEbPK83AoDBMX
         tx+3WHEyLZoz4ImbkWpzYPQjgfqAFs0gNMT/+O1wLxmA+Yh+0pCrApisqQtVAPYCIBmk
         f2Im4/zKiHAh9xNWMmD3Zrya8hd5DUYO+0Pkd8LpFoNCUTDsuWdEu6gavQKW5xzeYvrN
         ZbAA4+BqOSlEAv546YZ6RY5xn902HEO6jhzKi4eEnd6XRR3p3kI04O/vEa+CCwJloNBg
         zkVg==
X-Gm-Message-State: AOAM533SLEG7cSGG5jEnlmm80fcvP6MHX73j84WirveHu36jqJWDsSK7
        bIfBH1YV5YzwWVas29XgHegMvRlpXZIsGs++bJtkNSCUVdg=
X-Google-Smtp-Source: ABdhPJxXq9cX5AIOUcucw5+8VcVecWLbpILQR/pEl8jXb+0sFTqCtQNAbvp6AfTs7ylQnxsMAnFBjVJe02ecwaZO2l8=
X-Received: by 2002:a25:8c82:: with SMTP id m2mr13219111ybl.292.1643213369036;
 Wed, 26 Jan 2022 08:09:29 -0800 (PST)
MIME-Version: 1.0
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com> <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com> <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
 <YecIA5hEYqrZo+6G@kroah.com> <YecSDHXscl4LX5g9@google.com>
 <YefLk+hmEfg6Tp6F@kroah.com> <CAD039W4US=SSbk63wVa0oTkHJjyes03QU5BbGvAgjommLdfpjg@mail.gmail.com>
 <YelMeE/U63Qlsa7a@kroah.com>
In-Reply-To: <YelMeE/U63Qlsa7a@kroah.com>
From:   Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date:   Wed, 26 Jan 2022 21:39:17 +0530
Message-ID: <CAD039W5XS_mOFOUVU1E7rAQEdFWL=Q2d8CuG__M851CvrU7tUQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@google.com>, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 5:20 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 20, 2022 at 03:29:38PM +0530, Rajaram Regupathy wrote:
> > On Wed, Jan 19, 2022 at 1:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jan 18, 2022 at 11:16:28AM -0800, Benson Leung wrote:
> > > > Hi Greg,
> > > >
> > > > On Tue, Jan 18, 2022 at 07:33:39PM +0100, Greg KH wrote:
> > > > > On Tue, Jan 18, 2022 at 10:01:02PM +0530, Rajaram Regupathy wrote:
> > > > > > > Again, why does this have to be a library?
> > > > > > >
> > > > > > The aim of having a library is to abstract application(s) from OS,
> > > > > > platform, PD Controller or Embedded Controller protocols ambiguities
> > > > > > and provide common methods. The methods will be similar/closer to UCSI
> > > > > > standard.
> > > > >
> > > > > What methods are needed by an operating system that your library is
> > > > > going to provide?  How will it be done in a unified way that the current
> > > > > user/kernel api isn't providing already today?
> > > > >
> > > >
> > > > A unified libtypec would be useful because the USB Type-C and USB PD
> > > > specifications are evolving, and continue to change. Spec changes affect the
> > > > decoding of the objects that are exposed by the connector class (the existing
> > > > API), and we are at a point where if we left it as-is, you'd have multiple
> > > > userspace implementations that would have to independently be updated and
> > > > fixed every time there's a new USB PD spec revision or version update.
> > > >
> > > > Just as a concrete example, Jameson (jthies@google.com), who works on my team,
> > > > recently put together a little helper utility to decode the typec connector
> > > > class in order to print it to our feedback report collector. This was all
> > > > done before libtypec:
> > > >
> > > > https://chromium.googlesource.com/chromiumos/platform2/+/749621a6288cc5e80b31a9e6050437a419209fb9/debugd/src/helpers/typec_connector_class_helper.cc
> > > >
> > > > A problem we ran into almost immediately was that the utility was based on
> > > > the most recent USB PD specification documents (USB PD R2.0 and USB PD R3.1),
> > > > and had definitions on how to decode PD 2.0 and PD 3.1 objects that it would
> > > > read from the typec connector class, however, it was missing definitions for
> > > > USB PD R3.0 (a spec revision which is not obvious how to find in USB-IF's
> > > > document archive).
> > > >
> > > > So, we added it: https://chromium.googlesource.com/chromiumos/platform2/+/eb1efefc187feab1182a7680f42fcec6bb14c618
> > > >
> > > > Now, every other hypothetical type-c connector class user application or daemon
> > > > could potentially make this mistake, and would have to duplicate the work
> > > > to fix it.
> > > >
> > > > If we had libtypec, it would be the unified place to make such a change, and
> > > > we'd reduce the burden of new typec apps from having to do all this decode
> > > > in the future.
> > >
> > > Ok, that's fine, but please work to create a library that can handle
> > > such changes in non-breaking ways.  The first version of this library
> > > does not look like it would do that at all as it is exporting way too
> > > many things in a "public" interface.
> >
> > - Fixed compile error caused due to new version of compiler
> > - Fixed license details.
>
> The license details are still quite vague.  Please try to put proper
> SPDX license identifiers on the individual files so that they are not
> vague at all.  What you have here will prevent people from being able to
> use this code until it is cleaned up, sorry.

I have updated license details. It is aligned and made compatible with
similar usb frameworks.

>
> > The library provides interfaces very similar/same as the UCSI standard
> > from USB.org.
>
> What do you mean by this?  Exposing raw device structures?  Or something
> else?

No raw device. library reconstructs "data" from interfaces provided by
the platforms and makes it available in a standard(UCSI) way to
applications.

I definitely agree and will keep in mind  your guidance of not
exporting way too many things in a "public" interface.

>
> > Additionally the library uses what is available in the existing
> > framework and  acts as a wrapper between
> > lower layers and the applications and not a self reliant entity.
> > Could you please help better understand your concern ?
>
> How can this be used?

Few possible usages :

1) Informational utilities like lstype
2) Analyzing Utilities - With usb-c products in different versions,
vendors and e-cables usb-c port may not work as intended. this utility
shall check
usb-c port's operation and report/notify.
3) Test Utilities - Test tools similar to UCSIControl.exe
4) Policy Managers: like
https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/typecd/README.md
etc..
>
> How about adding support for this with lsusb as an example to show how
> it might be incorporated.  Or better yet, what about adding this to
> libusb so that all platforms will work.  That is, if this is even
> relevant for userspace USB access, which I still can't figure out if it
> is or not...

IMHO, I believe usb-c is not usb and hence integrating usb-c
operations with usb utilities or libraries is not a modular approach.
(usbcore vs typec).

Having said that  if it would be good to integrate lstypec with lsusb
as you recommended, would be happy to push patches to lsusb

>
> Anyway, the license stuff should be fixed up first.  If you have an
> employer, please work with them to get this right as they all have legal
> training for this type of thing.  If you do not have an employer, I
> recommend taking the free LF online course that helps to describe
> licenses and copyrights and how to use them.
>
> thanks,
>
> greg k-h
