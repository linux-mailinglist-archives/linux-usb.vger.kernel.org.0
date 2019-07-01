Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD44BE969
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 19:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbfD2Rnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 13:43:32 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44866 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2Rna (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 13:43:30 -0400
Received: by mail-ua1-f68.google.com with SMTP id p13so3785509uaa.11
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ofJyIqXwomA7GmqHzXwPuN8m6L/H0ryPXhElh4AzLbo=;
        b=b9QWvLYtbc+VcNpxKV+IAdHf8oOksS7WNX6Jars+H2fG+d6ckHlQ4BFMCrET38xecj
         gSQ6VW5/T+RIZwE3S2Kc+cQK/ngg2sceJ2wMxtRGy0aUsrkJA41QOvbvb7RCsq6AXXbR
         3/oNq6sHc+kr5KfFz9Cc5x0ei1ULxzSvuFGZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ofJyIqXwomA7GmqHzXwPuN8m6L/H0ryPXhElh4AzLbo=;
        b=ZXkDA0L+i+Dg5Z6nl5rZre9L1jCfWFnK2N1ZjqZRagI4WI5Y0dIjUKe9yzOpT6XN0J
         SteDBbmoUiqL2eQxEWT3ZWpTPVPfsR3vVQSiQq2Rr/udLFP2SBEUadxt6dAjhfzhdi0W
         3P0oS+klrBZFYpr6vT/VjgiUz5j+S88dwQDSTYicMl/mJi0ZZ01No5CxJGXnZl68pbQU
         iyic4YNGtl5XYlgbBurPbktEr9fhvJZIf4f18v2O0LHeZYqvQ6xoOkHSo6W65BkP8Rtz
         ryDu9CLW32Cmn+H1QIr2GaPr8rLw3hZ7A5XHCVOlLevGCC0em/m8WSaL4YlQfS4EtAQX
         17dQ==
X-Gm-Message-State: APjAAAUEd+6fkfglkcLrwLHLOs0TSnf+pk/dYallH9I8T0NcL2Yo0YxQ
        fI8lujT86m+EVJ5P6oHUqehKoBk/1xs=
X-Google-Smtp-Source: APXvYqzsVZNO5MTKvo5l3ZavZ8++jtuCqOj94sRvUAr5WQVbzbX0ns1HjTQCMIEZok8KW5rJgnh8Tg==
X-Received: by 2002:ab0:3419:: with SMTP id z25mr12803895uap.102.1556559808965;
        Mon, 29 Apr 2019 10:43:28 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id p8sm8636321vsd.14.2019.04.29.10.43.26
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 10:43:28 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id o33so3780659uae.12
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:43:26 -0700 (PDT)
X-Received: by 2002:ab0:20c1:: with SMTP id z1mr6396608ual.109.1556559806547;
 Mon, 29 Apr 2019 10:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <87k1fis1b5.fsf@linux.intel.com>
 <SN1PR12MB2431EB450993E07730C3672FA73D0@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=WKJMks9oCdUVS9vTKp9yD_VPE_uaAmTM9HgNoz8tt4pA@mail.gmail.com>
 <SN1PR12MB24312AEFA71B7EEF6FE4EB59A73E0@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=WmtKYt5hn8s1PrjEgFcJqyc-8UWbyEmjPPVq0o4YgD5w@mail.gmail.com>
 <CAD=FV=WM7k-6moen+sgzZXnX-Zcw_BY9L=RTTrmt6pSHpXPLng@mail.gmail.com> <SN1PR12MB2431C9312AD486935C9B728AA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2431C9312AD486935C9B728AA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Apr 2019 10:43:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtNUu0GyamvOv8x4rFHjFZdOaLMkFN=Rh0mJED08fW2Q@mail.gmail.com>
Message-ID: <CAD=FV=VtNUu0GyamvOv8x4rFHjFZdOaLMkFN=Rh0mJED08fW2Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Apr 29, 2019 at 5:05 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> > To add a bit of breadcrumbs, I did the rebase atop my patches and also
> > did some basic review of yours.  Other than a few nits I think I found
> > at least one bug where you're unlocking a spinlock twice in the
> > partial power down case.
> Yeah thank you so much for the review it really helps to make
> conclusions on the implementations. I have tested those patches on
> HAPS-DX platform and have not got any problem. Hibernation and partial
> power down flows are working ok.

Do you happen to have any boards that have "OTG_EN_PWROPT =3D 0"?  I'd
love testing of my patch series with that.


> > I continue to be convinced that the right thing to do is to finish
> > landing my series and then once you've spun yours atop mine we can
> > look at landing it.
> >
> > Here's all my picks atop Felipe's tree that show how I resolved
> > things:  https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__chromiu=
m.googlesource.com_chromiumos_third-5Fparty_kernel_-2Blog_refs_sandbox_dian=
ders_190426-2Ddwc2-2Dstuff&d=3DDwIFaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFK=
CJ_nBjJhGVrrlYOeOQjP_HlVzYqrC_D7niMJI&m=3Dmdz-R9O5TUR_zXEeeCZO2341dvcwZro2c=
edCZzIIans&s=3DmVfBGtiMQg2XVHXmGCWcd584g0DYRH1JDVnEnJWE6P8&e=3D
> >
> >
> > -Doug
> >
>
> I will make my changes then will go ahead and rebase.

Thanks!


-Doug
