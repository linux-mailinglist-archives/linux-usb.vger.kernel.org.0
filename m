Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586D24AD1F6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 08:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347944AbiBHHL7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 02:11:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbiBHHL5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 02:11:57 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C34C0401F2
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 23:11:56 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id p22-20020a17090adf9600b001b8783b2647so1280721pjv.5
        for <linux-usb@vger.kernel.org>; Mon, 07 Feb 2022 23:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzT2zSb2THNUuyQZXITuwOuNUzZi7qz7YcPLPaKf/rI=;
        b=Lhm693r23Ti8wAB6bYk3E1Q2q3lTbPPIe+OT0/XGp/NvM3hMz6KA9q0SB7rouXhXdf
         7aEzUb+JY9J2Mg77bkN5Oyj5qsYnl1jUHVVPP3Fyf9yWXYCxYlYcVTwHx2M0eTv0Ve7/
         AWQKoZi56HQ1Ea63v4l4bx2UHAYM2awxgpMaDa/3GJxgeKWM6vDhmhi/sM56Ov58gOyZ
         BncDRnnBa/9tV1DFDdme4f8v72+zodrFDj8X0yFVPgFtoGDpT0RurTr9U+r/+WXtM3su
         +oydKlnkCLVo6d7ii1ktaTPqSbihzH5wpKPTIE1otKbBrTRWAbgdasf7C1HPdR/yb2hs
         5WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzT2zSb2THNUuyQZXITuwOuNUzZi7qz7YcPLPaKf/rI=;
        b=Es/tlTemOtUwbBAx1b0v5MgOT1vdH6+72X+ix7zh3efKLz+PKc+cwBy6eM4wEKuX95
         fACwagxEa/LioYt2kDMT0+jyy2gHxxfqRO8JahE3+RDnkkh07cwEu61HPpDM/vXAdbNo
         PWSDcThvynYpHCvHBeGvnIH6EuhiDY/eKvpwbzc2ObonzC8tplV27nYIadSBjFKSQVKw
         qCxclfVa6pYJOuQbuEPxnwai7d3c9mK8Cbrngr26oCnrM5AYAtE1uFBq+POyNb0+uo6D
         XI6S/r9VrvgeYqivjuhaR8lIcD20hrm4zC7epKEUFgOISKigYcgL4NTltmHT/09OLzW/
         BsvQ==
X-Gm-Message-State: AOAM531J0BUNyzLFTW/VY8VqskHhnCBtkl8kWGzEtZ3oPpYeWNBMEHAy
        7SrgeZ4zIpYU+tEru1zTKXavNOFFodjxHamf2MtbPDwJGVA=
X-Google-Smtp-Source: ABdhPJyE+FvacCbFr+U5+PSFkIVoti6qzgI8AF6+tnabk9G2exslpk9RmMoKfrI9b9ZZoHaVkUk+ZWm5v74HlT1gFUU=
X-Received: by 2002:a17:90b:4d92:: with SMTP id oj18mr2896123pjb.236.1644304315799;
 Mon, 07 Feb 2022 23:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20220129093036.488231-1-pumahsu@google.com> <413ce7e5-1c35-c3d0-a89e-a3c7f03b4db7@linux.intel.com>
In-Reply-To: <413ce7e5-1c35-c3d0-a89e-a3c7f03b4db7@linux.intel.com>
From:   Puma Hsu <pumahsu@google.com>
Date:   Tue, 8 Feb 2022 15:11:19 +0800
Message-ID: <CAGCq0La83AKrdk4w2b6wJLZVB0oKB7_AH3iqc4R0K1vDnqrX9A@mail.gmail.com>
Subject: Re: [PATCH v6] xhci: re-initialize the HC during resume if HCE was set
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     mathias.nyman@intel.com, Greg KH <gregkh@linuxfoundation.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Albert Wang <albertccwang@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 3, 2022 at 3:11 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 29.1.2022 11.30, Puma Hsu wrote:
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
> > v5: Add a debug log. Follow Mathias Nyman <mathias.nyman@linux.intel.com>'s comment.
> > v6: Fix the missing declaration for str.
> >
> >  drivers/usb/host/xhci.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index dc357cabb265..6f1198068004 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -1091,6 +1091,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
> >       int                     retval = 0;
> >       bool                    comp_timer_running = false;
> >       bool                    pending_portevent = false;
> > +     char                    str[XHCI_MSG_MAX];
> >
> >       if (!hcd->state)
> >               return 0;
> > @@ -1146,8 +1147,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
> >               temp = readl(&xhci->op_regs->status);
> >       }
> >
> > -     /* If restore operation fails, re-initialize the HC during resume */
> > -     if ((temp & STS_SRE) || hibernated) {
> > +     /* If restore operation fails or HC error is detected, re-initialize the HC during resume */
> > +     if ((temp & (STS_SRE | STS_HCE)) || hibernated) {
> > +             xhci_warn(xhci, "re-initialize HC during resume, USBSTS:%s\n",
> > +                       xhci_decode_usbsts(str, temp));
> >
> >               if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
> >                               !(xhci_all_ports_seen_u0(xhci))) {
> >
>
> Ended up modifying this patch a bit more than I first intended,
> - don't print warning in hibernation case, only error.
> - maybe using a lot of stack for a debug string isn't really needed.
> - make sure we read the usbsts register before checking for the HCE bit.
>
> Does the below work for you? If yes, and you agree I'll apply it instead

Hi Mathias,
Yes, your patch works for me, thanks!
Will you submit a new patch? or should I update to a new version?
Thanks.

> ---
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index dc357cabb265..04ec2de158bf 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1091,6 +1091,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>         int                     retval = 0;
>         bool                    comp_timer_running = false;
>         bool                    pending_portevent = false;
> +       bool                    reinit_xhc = false;
>
>         if (!hcd->state)
>                 return 0;
> @@ -1107,10 +1108,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>         set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
>
>         spin_lock_irq(&xhci->lock);
> -       if ((xhci->quirks & XHCI_RESET_ON_RESUME) || xhci->broken_suspend)
> -               hibernated = true;
>
> -       if (!hibernated) {
> +       if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
> +               reinit_xhc = true;
> +
> +       if (!reinit_xhc) {
>                 /*
>                  * Some controllers might lose power during suspend, so wait
>                  * for controller not ready bit to clear, just as in xHC init.
> @@ -1143,12 +1145,17 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>                         spin_unlock_irq(&xhci->lock);
>                         return -ETIMEDOUT;
>                 }
> -               temp = readl(&xhci->op_regs->status);
>         }
>
> -       /* If restore operation fails, re-initialize the HC during resume */
> -       if ((temp & STS_SRE) || hibernated) {
> +       temp = readl(&xhci->op_regs->status);
> +
> +       /* re-initialize the HC on Restore Error, or Host Controller Error */
> +       if (temp & (STS_SRE | STS_HCE)) {
> +               reinit_xhc = true;
> +               xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
> +       }
>
> +       if (reinit_xhc) {
>                 if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
>                                 !(xhci_all_ports_seen_u0(xhci))) {
>                         del_timer_sync(&xhci->comp_mode_recovery_timer);
>
