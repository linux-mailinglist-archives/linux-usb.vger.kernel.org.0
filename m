Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC99481031
	for <lists+linux-usb@lfdr.de>; Wed, 29 Dec 2021 06:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhL2Fxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Dec 2021 00:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbhL2Fxl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Dec 2021 00:53:41 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6C9C06173E
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 21:53:41 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id l16so3058642plg.10
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 21:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gPygxIj4M3rVCXjL59zHPUyygCm0APrKFxe3mJwzlR8=;
        b=g3nP9CRBjfMgDZxnvdQVEO4J7WzUjv2hLeR5hkAYmRsJBrNZfw2qx8XrF/ae0nj3qj
         F+SCfDvBT5bDZ8xSe806Durg3+KT0c4D8u56CY5HglqlVXHLNiPt+bpBCppSeBKjZpbB
         0+Zyjfg370zXR1NLjsPQUKzl/m2yNGQxMyiYEkPB3Ho7rKHcsLReXZNfZ3kYGO76r7w+
         ykD6Fba4/wBNn4Pev7Fx8gBp4EFdjV+Rpsk1BM1qUtFg2efNc0pnyoclKSDThz0qTvrA
         KTCxvoiDUt7OFbH4RhrRjqAxpWGpc24q2l8MhXj6YHPM4PKKlGCQ/JVraXr/wQeMNkJL
         FEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gPygxIj4M3rVCXjL59zHPUyygCm0APrKFxe3mJwzlR8=;
        b=3393laea0wPoyb+Q83VhqSnB1z1jh1HpYZY1ATdDwdo3rDWa9bOjIgAWYc4bc7ds09
         hJckzW/Hev1CUxkkHLul0JU980/YWK9Sfus5JrawmV8Ir9Qp5IKGzuCJrvd8r+RUt9uJ
         H4USl0mW2MeoKksiDwx5gLgNt/YWnEbN2UDpP5P3QUjkxvjpGWUpMMKB/b71lOAgNvvE
         V8oeJlwwIHffUw0UYWr3hp3nSRXme25zvOnjshJ57cR7C+DvNVXkXOuGaXowIEaOQH8h
         UygM63+4lvwmwsQXYjxfIrjQHOH5vna5Ko6QZRI825TGa0/pMQ1+bSUYZjhhGpLFaN1h
         PPwQ==
X-Gm-Message-State: AOAM5302xFdeNEuxmxlmSDQLopZkRVsVeW1LivKb/xz2mmUCuEFnib8w
        1LRDPtia7V97T+ruwckS/jz04fkcrC4glXuW1UO15g==
X-Google-Smtp-Source: ABdhPJzIgzCurZV5GvCp8MZCKzwjSknX3P+DVfBx7/hRhvGVaS431XJqwU2/TSc5/UZ0pnnAPXbqH9htTobXE5s+XhQ=
X-Received: by 2002:a17:90b:f91:: with SMTP id ft17mr15060849pjb.95.1640757220049;
 Tue, 28 Dec 2021 21:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20211228060246.2958070-1-pumahsu@google.com> <YcrKNP4TRXB6nsCI@kroah.com>
In-Reply-To: <YcrKNP4TRXB6nsCI@kroah.com>
From:   Puma Hsu <pumahsu@google.com>
Date:   Wed, 29 Dec 2021 13:53:04 +0800
Message-ID: <CAGCq0Lb8ZoGpbkLNhXG=OyWgvz_Qn3ABmq_uvMPJdyEKygMH+Q@mail.gmail.com>
Subject: Re: [PATCH] xhci: re-initialize the HC during resume if HCE was set
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mathias.nyman@intel.com, Albert Wang <albertccwang@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit is not used to fix a specific commit. We find a condition
that when XHCI runs the resume process but the HCE flag is set, then
the Run/Stop bit of USBCMD cannot be set so that HC would not be
enabled. In fact, HC may already meet a problem at this moment.
Besides, in xHCI requirements specification revision 1.2, Table 5-21
BIT(12) claims that Software should re-initialize the xHC when HCE is
set. Therefore, I think this commit could be the error handling for
HCE.

Thanks in advance.


Thanks in advance.




  =E2=80=A2  Puma Hsu =E8=A8=B1=E8=AA=8C=E5=AE=8F
  =E2=80=A2  Software Engineer, Pixel Phone
  =E2=80=A2  Tel: +886 2 8729 0870
  =E2=80=A2  pumahsu@google.com





On Tue, Dec 28, 2021 at 4:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Dec 28, 2021 at 02:02:46PM +0800, Puma Hsu wrote:
> > When HCE(Host Controller Error) is set, it means an internal
> > error condition has been detected. It needs to re-initialize
> > the HC too.
> >
> > Signed-off-by: Puma Hsu <pumahsu@google.com>
> > ---
> >  drivers/usb/host/xhci.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index dc357cabb265..c546d9533410 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -1146,8 +1146,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hiber=
nated)
> >               temp =3D readl(&xhci->op_regs->status);
> >       }
> >
> > -     /* If restore operation fails, re-initialize the HC during resume=
 */
> > -     if ((temp & STS_SRE) || hibernated) {
> > +     /* If restore operation fails or HC error is detected, re-initial=
ize the HC during resume */
> > +     if ((temp & STS_SRE) || (temp & STS_HCE) || hibernated) {
> >
> >               if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
> >                               !(xhci_all_ports_seen_u0(xhci))) {
> > --
> > 2.34.1.448.ga2b2bfdf31-goog
> >
>
> What commit does this fix?  Does it need to be backported to older
> kernels as well?
>
> thanks,
>
> greg k-h
