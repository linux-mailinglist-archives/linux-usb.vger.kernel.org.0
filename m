Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3E52B11E4
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 23:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgKLWkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 17:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgKLWkQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 17:40:16 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85316C0613D1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 14:40:16 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id m143so8286338oig.7
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 14:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twdpsqWRomOQ3n7t0sTmHP94v2wyY8onYBOacViXVNY=;
        b=sq/XmLF6k2Kz7wzqX6W7V8dhl0pIqr2pqKlboR03g2qlL9X4vyk62At3ed0ds1yrmm
         iPw39q5zZbvaBEQpiSNTG/AfPQNBbLDbytz1dZ8WUUmXz9ju3VPciuZG+mua7Tl9p58x
         p2aJsmjuASxXFYQ8ir9zgj6VtYqdusdRa/XS46PpeYMWXda6rRAuQ8qEU5BhycjgEqup
         xAa+aDkiManZ1iZiGlT3sF0fIlgbWE55SItBGz9DJYYUvbhX3YfspNUQQ21pKc3v+tpv
         tO/BMFSfKCxmYaUCav6HIo3vB3mtKsVPtbkBUhuGHfXdK48kGTtGS5C46qg+1RtNXvDI
         pX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twdpsqWRomOQ3n7t0sTmHP94v2wyY8onYBOacViXVNY=;
        b=J/uW31KsUO+0G0pHIHyEBx5SUDh+Ll9uQ1MK2dwswU6G9u/sK4xURQUIrpoHO5nN1R
         +OIx+sSrkssHY4vtx2gEAElqa6UOzxXR4YKO0I/8zjLfSgOfcflG9h0t1kb+hqtCELr1
         bhMg7LSitK8d4v12zFle7kBXza0Q84ssNV3aLqWYDmX/VpfRpBHJS92cS/0exCQm/uY6
         h7vMxGAVXGLzr0jAL60v74DObDNWTXQEsmMAiIIqyG9Qz4br4ZqYVAxIuABAVs4oJCbx
         g3SOyxe6gkp1pM9AOVcqsdesMnMY/a7C7Z1lPxMVzwHiOACh7KM8tzdSKIsBFZ8u2+GM
         gV3w==
X-Gm-Message-State: AOAM531KHt6059p33wV3kk5J42nPE2oI7JobANMbbSM/LVa8sA3GZsno
        A2IqTNv0TduHmVEUlxUj9q5R2JaqKYGVyk2Wue+RNh8KlNW9yA==
X-Google-Smtp-Source: ABdhPJy19icx/Ub9Cs1LQ9daGIlngxxfKGKQRJE967BBuizqJvbCw960kO7Mg59mWQXH+6yEZwR97aIEXnZiX6qOjjA=
X-Received: by 2002:aca:b854:: with SMTP id i81mr50331oif.6.1605220815977;
 Thu, 12 Nov 2020 14:40:15 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com> <20201111091816.GH14896@b29397-desktop>
In-Reply-To: <20201111091816.GH14896@b29397-desktop>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 13 Nov 2020 00:39:57 +0200
Message-ID: <CAB=otbSFNLrSQHsnQk1j1jgzN2q-ZAdE_2Azd00-Tmm5zgbPhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: gadget: f_uac2: add adaptive sync support for capture
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gschmottlach@gmail.com" <gschmottlach@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 11:18 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-11-08 02:18:30, Ruslan Bilovol wrote:
> > Current f_uac2 USB OUT (aka 'capture') synchronization
> > implements 'ASYNC' scenario which means USB Gadget has
> > it's own freerunning clock and can update Host about
> > real clock frequency through feedback endpoint so Host
> > can align number of samples sent to the USB gadget to
> > prevent overruns/underruns
> >
> > In case if Gadget can has no it's internal clock and
> > can consume audio samples at any rate (for example,
> > on the Gadget side someone records audio directly to
> > a file, or audio samples are played through an
> > external DAC as soon as they arrive), UAC2 spec
> > suggests 'ADAPTIVE' synchronization type.
> >
> > Change UAC2 driver to make it configurable through
> > additional 'c_sync' configfs file.
> >
> > Default remains 'asynchronous' with possibility to
> > switch it to 'adaptive'
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > ---
> >  Documentation/ABI/testing/configfs-usb-gadget-uac2 |  1 +
> >  Documentation/usb/gadget-testing.rst               |  1 +
> >  drivers/usb/gadget/function/f_uac2.c               | 96 ++++++++++++++++++++--
> >  drivers/usb/gadget/function/u_uac2.h               |  2 +
> >  4 files changed, 91 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> > index 2bfdd4e..4fbff96 100644
> > --- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
> > +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> > @@ -7,6 +7,7 @@ Description:
> >               c_chmask - capture channel mask
> >               c_srate - capture sampling rate
> >               c_ssize - capture sample size (bytes)
> > +             c_sync - capture synchronization type (async/adaptive)
>
> Can't apply it based on the latest code, this file has changed.

This patch set is based on Felipe's -next branch which seems
to be a little bit outdated.

Thanks,
Ruslan
