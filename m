Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FB64A2D5C
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jan 2022 10:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbiA2JXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jan 2022 04:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbiA2JXt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jan 2022 04:23:49 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AF6C061748
        for <linux-usb@vger.kernel.org>; Sat, 29 Jan 2022 01:23:49 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id z14-20020a17090ab10e00b001b6175d4040so7485764pjq.0
        for <linux-usb@vger.kernel.org>; Sat, 29 Jan 2022 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bqzBoRkDi8kVZLIMHecE3nTUwM1cKHwe7YhWSOKzDP4=;
        b=s97mGS9tiPyBqXIXKy3aSh/N4MQ9p3JSjfDa3iVBO/Yre+GETk8gTsrVUntRjvG8/m
         rQrNRXjXcrI0pnn6CapBI1VN2KoFgEQfUybFE0qXREGW7/Ct7OPgPDUzdb0iFQbg5Lok
         GPiSGiEUkxt5e7FpuZofX6lubQiidNESe0CzO+sgmdijG9oXNeQT3Wh2eIlRUgiBEcNS
         G1JfC8l3U2YHhQuvDFlTkIcZQskxd0h9YRiuPXbnanlukqx+0Bt105wGtXQkOAA5SpkV
         pTFHnmpt6XZHRqqG6WQoU6w09u/PM1eStPysheNrb67/4Oj9WUDoVpjQSOb1oF95rTIr
         zcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bqzBoRkDi8kVZLIMHecE3nTUwM1cKHwe7YhWSOKzDP4=;
        b=dM7k8rs5BqPkjEf9xsEysp04WTRWaGjb4g4bHIdn/M/pAvsFJ9gsAekSlW73c/p7p0
         SPanq96AJYoYYxxCqKR6WiaJHZL6WAHRqJuNP5MlEjYMT8dHrbjDaZHhlm5tow5LTqJc
         tQYvZek6lczpyVbx4Mu4sCZbH51rujt1Gg1nEF/Z2O3j7YDpe/LfUg9+0JYMp9TwHazX
         gnvBWAEv9hlRliBe52ItWP8CLh0hbN1nW87nmOXo1ENUrawrQiPWUbxX1agiDYly+TKr
         07X0TFQliTrYr6cmD1o0CmGJkZWZXGl4Vqh5+uRHKzDMF+EbhY16F5HVn1zeRr/h0Qo7
         6nOA==
X-Gm-Message-State: AOAM532tkkmFh2Q+dpEOw+DXs3oceqP2k5YUlPETlmYwRPHH4gRBDlQ2
        J15DTzIBvoQlPoD9vRxBmTTT+Ju+vUZW6W9CoJRiIQjFK1mwOA==
X-Google-Smtp-Source: ABdhPJxkwCr5AJ3CWlNsUJ2kZldTLSWl6JJt6MW+qo5eS2oZPFbsWd6uXO4KRJK6Arlc6JioXfqDrw3X/aq49qkQFHs=
X-Received: by 2002:a17:90b:1881:: with SMTP id mn1mr23751902pjb.236.1643448228173;
 Sat, 29 Jan 2022 01:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20220119064013.1381172-1-pumahsu@google.com> <e2baf3c5-0d80-9143-5fec-98a9e1474068@linux.intel.com>
In-Reply-To: <e2baf3c5-0d80-9143-5fec-98a9e1474068@linux.intel.com>
From:   Puma Hsu <pumahsu@google.com>
Date:   Sat, 29 Jan 2022 17:23:12 +0800
Message-ID: <CAGCq0LbWSqTJ+M+jxryUmn44FefC7cmS5ouP8BLyFY9z1RePMA@mail.gmail.com>
Subject: Re: [PATCH v5] xhci: re-initialize the HC during resume if HCE was set
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     mathias.nyman@intel.com, Greg KH <gregkh@linuxfoundation.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Albert Wang <albertccwang@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 27, 2022 at 9:43 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 19.1.2022 8.40, Puma Hsu wrote:
> > When HCE(Host Controller Error) is set, it means an internal
> > error condition has been detected. Software needs to re-initialize
> > the HC, so add this check in xhci resume.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Puma Hsu <pumahsu@google.com>
> > ---
> > v2: Follow Sergey Shtylyov <s.shtylyov@omp.ru>'s comment.
> > v3: Add stable@vger.kernel.org for stable release.
> > v4: Refine the commit message.
> > v5: Add a debug log. Follow Mathias Nyman <mathias.nyman@linux.intel.co=
m>'s comment.
> >
> >  drivers/usb/host/xhci.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index dc357cabb265..41f594f0f73f 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -1146,8 +1146,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibe=
rnated)
> >               temp =3D readl(&xhci->op_regs->status);
> >       }
> >
> > -     /* If restore operation fails, re-initialize the HC during resume=
 */
> > -     if ((temp & STS_SRE) || hibernated) {
> > +     /* If restore operation fails or HC error is detected, re-initial=
ize the HC during resume */
> > +     if ((temp & (STS_SRE | STS_HCE)) || hibernated) {
> > +             xhci_warn(xhci, "re-initialize HC during resume, USBSTS:%=
s\n",
> > +                       xhci_decode_usbsts(str, temp));
> >
> >               if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
> >                               !(xhci_all_ports_seen_u0(xhci))) {
> >
>
> Tried to compile, something is missing in this patch:
>
> drivers/usb/host/xhci.c:1152:25: error: =E2=80=98str=E2=80=99 undeclared =
(first use in this function); did you mean =E2=80=98qstr=E2=80=99?

Sorry for missing the declaration, I will fix it.

> -Mathias
