Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D662C30DC02
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 14:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhBCN52 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 08:57:28 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:44528 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhBCN5S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 08:57:18 -0500
Received: by mail-oi1-f179.google.com with SMTP id n7so26751945oic.11;
        Wed, 03 Feb 2021 05:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9bG+R+LDoHSDl62bxWQmjX/lycjXUjJTbqnxytcR6R4=;
        b=RcisKCn4AtqljY9FCo2HwBMe1QvvgzhnkV3AIjocgY50T/aUO3G3I4zVpomwsZ7hQZ
         3YbmIrKlHOaULay2h/mZxfJI19o5jqi+LPYMk0vDfpnjOKiYgjvNUnquCPrBGz0ZRC8P
         O5keICM6oA9UQt1R2EqMGqOYRacL5fDiWmgCTMEnqG3tH/K8XREpLYKdtIkQpjiac0JL
         z4uNeDJzpgF/YezJRHba/+Epk/G/K6nEdLelM5nU2BWiMP5OlITak4kL80lqkdVJ6JCm
         ZIYs8BUiMgCKsQ1NRbNXxgP00rzauTVMfcoeIZdZIXzZdoW2j2x7WOSUjjgpThktOgeX
         5ACQ==
X-Gm-Message-State: AOAM533MnEEvasyjx9vttJB1JNSoCPpQ6fIOfBTv2fc2hFwM6SKQaC7d
        6YnGlufsLHBGbCN8XWIFocqcN8C3f3nqSKOkIDU=
X-Google-Smtp-Source: ABdhPJwl0fhGWvpqExentZHkR88WPqncy+BWJl1D41sKDIBfY5xs5KDWKVsdnhTrLD3oytZVgMVa4OsngBfA0oT5I9M=
X-Received: by 2002:aca:fc84:: with SMTP id a126mr2050137oii.71.1612360596958;
 Wed, 03 Feb 2021 05:56:36 -0800 (PST)
MIME-Version: 1.0
References: <20210129083241.72497-1-mika.westerberg@linux.intel.com>
 <20210129083241.72497-4-mika.westerberg@linux.intel.com> <20210203081415.GR2542@lahna.fi.intel.com>
In-Reply-To: <20210203081415.GR2542@lahna.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 3 Feb 2021 14:56:25 +0100
Message-ID: <CAJZ5v0jG3abpNjVorHLx5nNt964QNA+v=uBx-M4r_May0ZfEgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ACPI: Execute platform _OSC also with query bit clear
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 3, 2021 at 9:16 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi Rafael,
>
> I wonder if you are OK with this patch?

It looks good to me now, please feel free to add my ACK to it.

Thanks!

>
> On Fri, Jan 29, 2021 at 11:32:39AM +0300, Mika Westerberg wrote:
> > From: Mario Limonciello <mario.limonciello@dell.com>
> >
> > The platform _OSC can change the hardware state when query bit is not
> > set. According to ACPI spec it is recommended that the OS runs _OSC with
> > query bit set until the platform does not mask any of the capabilities.
> > Then it should run it with query bit clear in order to actually commit
> > the changes. Linux has not been doing this for the reasons that there
> > has not been anything to commit, until now.
> >
> > The ACPI 6.4 introduced _OSC for USB4 to allow the OS to negotiate
> > native control over USB4 tunneling. The platform might implement this so
> > that it only activates the software connection manager path when the OS
> > calls the _OSC with the query bit clear. Otherwise it may default to the
> > firmware connection manager, for instance.
> >
> > For this reason modify the _OSC support so that we first execute it with
> > query bit set, then use the returned value as base of the features we
> > want to control and run the _OSC again with query bit clear. This also
> > follows what Windows is doing.
> >
> > Also rename the function to better match what it does.
> >
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/acpi/bus.c | 43 +++++++++++++++++++++++++++++++------------
> >  1 file changed, 31 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index 1682f8b454a2..a52cb28c40d8 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -282,9 +282,9 @@ bool osc_pc_lpi_support_confirmed;
> >  EXPORT_SYMBOL_GPL(osc_pc_lpi_support_confirmed);
> >
> >  static u8 sb_uuid_str[] = "0811B06E-4A27-44F9-8D60-3CBBC22E7B48";
> > -static void acpi_bus_osc_support(void)
> > +static void acpi_bus_osc_negotiate_platform_control(void)
> >  {
> > -     u32 capbuf[2];
> > +     u32 capbuf[2], *capbuf_ret;
> >       struct acpi_osc_context context = {
> >               .uuid_str = sb_uuid_str,
> >               .rev = 1,
> > @@ -321,17 +321,36 @@ static void acpi_bus_osc_support(void)
> >               capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_APEI_SUPPORT;
> >       if (ACPI_FAILURE(acpi_get_handle(NULL, "\\_SB", &handle)))
> >               return;
> > -     if (ACPI_SUCCESS(acpi_run_osc(handle, &context))) {
> > -             u32 *capbuf_ret = context.ret.pointer;
> > -             if (context.ret.length > OSC_SUPPORT_DWORD) {
> > -                     osc_sb_apei_support_acked =
> > -                             capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_APEI_SUPPORT;
> > -                     osc_pc_lpi_support_confirmed =
> > -                             capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_PCLPI_SUPPORT;
> > -             }
> > +
> > +     if (ACPI_FAILURE(acpi_run_osc(handle, &context)))
> > +             return;
> > +
> > +     capbuf_ret = context.ret.pointer;
> > +     if (context.ret.length <= OSC_SUPPORT_DWORD) {
> >               kfree(context.ret.pointer);
> > +             return;
> >       }
> > -     /* do we need to check other returned cap? Sounds no */
> > +
> > +     /*
> > +      * Now run _OSC again with query flag clear and with the caps
> > +      * supported by both the OS and the platform.
> > +      */
> > +     capbuf[OSC_QUERY_DWORD] = 0;
> > +     capbuf[OSC_SUPPORT_DWORD] = capbuf_ret[OSC_SUPPORT_DWORD];
> > +     kfree(context.ret.pointer);
> > +
> > +     if (ACPI_FAILURE(acpi_run_osc(handle, &context)))
> > +             return;
> > +
> > +     capbuf_ret = context.ret.pointer;
> > +     if (context.ret.length > OSC_SUPPORT_DWORD) {
> > +             osc_sb_apei_support_acked =
> > +                     capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_APEI_SUPPORT;
> > +             osc_pc_lpi_support_confirmed =
> > +                     capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_PCLPI_SUPPORT;
> > +     }
> > +
> > +     kfree(context.ret.pointer);
> >  }
> >
> >  /* --------------------------------------------------------------------------
> > @@ -1168,7 +1187,7 @@ static int __init acpi_bus_init(void)
> >        * _OSC method may exist in module level code,
> >        * so it must be run after ACPI_FULL_INITIALIZATION
> >        */
> > -     acpi_bus_osc_support();
> > +     acpi_bus_osc_negotiate_platform_control();
> >
> >       /*
> >        * _PDC control method may load dynamic SSDT tables,
> > --
> > 2.29.2
