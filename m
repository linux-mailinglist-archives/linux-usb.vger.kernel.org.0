Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35F494B49
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 11:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359709AbiATJ7z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 04:59:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238429AbiATJ7v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 04:59:51 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D118C061401
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 01:59:51 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id o80so16155151yba.6
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DU6SDCJ2do9YUkvc0ElI01ddyt5tZD7x1b+apC8NmYg=;
        b=MVXGAVJJOdMD5Pig/F5T5Mr2bGv9JV/EBWkCJOfvfaRp9fdH6xccckBTtv418xUiKi
         3Hd34nunt4esTT6lVOpG1wXfnO3mJBFrhgauScukO7hX0gzcPZnRYtfcPGNieRn/OSDp
         xK7bclR8r0+rxFZM+q/X5hod+fnoN/ucExL4anX/4XdTnvs2AMKeEyijOHhdIfrAsYY/
         w68Cis8ZISE9nEAxN3SdF2N0Ru/YeXcbSNuMIleYDZ8TF9Bx5wP/Ym7YaUdNk0j9W5QW
         4XMVEHqM5JkTPsgtqWWdTNklB2B3Acp+KGKH7zAsfwUFWTRCqeskN1DkrJ8SSw2mB+wq
         9rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DU6SDCJ2do9YUkvc0ElI01ddyt5tZD7x1b+apC8NmYg=;
        b=btDyoD1ZlR0VaYT2wipAgKIceSwnDQLPjw69gvXau4bflcBkvmRRQNxU1OijxgiTrl
         7ewTzVEeZdMvfVLU8fWm7a2tuz8uVhDPj9EaYTGQBDhYJruf+xpUYSHibuRcroYPrt6l
         REq29lkbS90BUVzJgzd2HoZexK0iQ0MDHf2xLcZo+nmQUS3/hTXPn2Gf97hgbaP4iLyP
         plcR6/YhAuoLx9vF2+7RrvUMGa3R7U1pTGZf3edygfcPuiLgM3BV3RQvtfSE0ROVZvN/
         8TDSiQaCZcMg+xj1D2YX/v7EFpuLQMug+U8tHpH+iYYvYKbKDZcx8a/nc04XLRLeF2J5
         ftKA==
X-Gm-Message-State: AOAM532NyglTpf023IAvsDoUO/T2JxRk++KV5QgkJZ/tHrLI1B6zdhJV
        j9wKimXHSmpnT7ntCi1zrAlfVLpzSc+Gf6/ZwjA=
X-Google-Smtp-Source: ABdhPJx/sdPLChz6lByFZW8Onx2cFN+qRqNm6U+TVWdHGEtrmx8dIxWNd+EZbtS3juCkYabcZyFpo234Kh61XPYzBG4=
X-Received: by 2002:a25:908e:: with SMTP id t14mr2990589ybl.636.1642672790806;
 Thu, 20 Jan 2022 01:59:50 -0800 (PST)
MIME-Version: 1.0
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com> <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com> <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
 <YecIA5hEYqrZo+6G@kroah.com> <YecSDHXscl4LX5g9@google.com> <YefLk+hmEfg6Tp6F@kroah.com>
In-Reply-To: <YefLk+hmEfg6Tp6F@kroah.com>
From:   Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date:   Thu, 20 Jan 2022 15:29:38 +0530
Message-ID: <CAD039W4US=SSbk63wVa0oTkHJjyes03QU5BbGvAgjommLdfpjg@mail.gmail.com>
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

On Wed, Jan 19, 2022 at 1:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 18, 2022 at 11:16:28AM -0800, Benson Leung wrote:
> > Hi Greg,
> >
> > On Tue, Jan 18, 2022 at 07:33:39PM +0100, Greg KH wrote:
> > > On Tue, Jan 18, 2022 at 10:01:02PM +0530, Rajaram Regupathy wrote:
> > > > > Again, why does this have to be a library?
> > > > >
> > > > The aim of having a library is to abstract application(s) from OS,
> > > > platform, PD Controller or Embedded Controller protocols ambiguities
> > > > and provide common methods. The methods will be similar/closer to UCSI
> > > > standard.
> > >
> > > What methods are needed by an operating system that your library is
> > > going to provide?  How will it be done in a unified way that the current
> > > user/kernel api isn't providing already today?
> > >
> >
> > A unified libtypec would be useful because the USB Type-C and USB PD
> > specifications are evolving, and continue to change. Spec changes affect the
> > decoding of the objects that are exposed by the connector class (the existing
> > API), and we are at a point where if we left it as-is, you'd have multiple
> > userspace implementations that would have to independently be updated and
> > fixed every time there's a new USB PD spec revision or version update.
> >
> > Just as a concrete example, Jameson (jthies@google.com), who works on my team,
> > recently put together a little helper utility to decode the typec connector
> > class in order to print it to our feedback report collector. This was all
> > done before libtypec:
> >
> > https://chromium.googlesource.com/chromiumos/platform2/+/749621a6288cc5e80b31a9e6050437a419209fb9/debugd/src/helpers/typec_connector_class_helper.cc
> >
> > A problem we ran into almost immediately was that the utility was based on
> > the most recent USB PD specification documents (USB PD R2.0 and USB PD R3.1),
> > and had definitions on how to decode PD 2.0 and PD 3.1 objects that it would
> > read from the typec connector class, however, it was missing definitions for
> > USB PD R3.0 (a spec revision which is not obvious how to find in USB-IF's
> > document archive).
> >
> > So, we added it: https://chromium.googlesource.com/chromiumos/platform2/+/eb1efefc187feab1182a7680f42fcec6bb14c618
> >
> > Now, every other hypothetical type-c connector class user application or daemon
> > could potentially make this mistake, and would have to duplicate the work
> > to fix it.
> >
> > If we had libtypec, it would be the unified place to make such a change, and
> > we'd reduce the burden of new typec apps from having to do all this decode
> > in the future.
>
> Ok, that's fine, but please work to create a library that can handle
> such changes in non-breaking ways.  The first version of this library
> does not look like it would do that at all as it is exporting way too
> many things in a "public" interface.

- Fixed compile error caused due to new version of compiler
- Fixed license details.

The library provides interfaces very similar/same as the UCSI standard
from USB.org.
Additionally the library uses what is available in the existing
framework and  acts as a wrapper between
lower layers and the applications and not a self reliant entity.
Could you please help better understand your concern ?

>n
> thanks,
>
> greg k-h
