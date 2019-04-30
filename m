Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206E5FCE1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 17:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfD3P2p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 11:28:45 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41461 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfD3P2p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 11:28:45 -0400
Received: by mail-ua1-f68.google.com with SMTP id s30so1668006uas.8
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psxi8sV7eLiIF2qdnqe7ws85kk7WgDvg8LIHII21pqQ=;
        b=MRnAbiQQZrENnFVqNVQM3wn9WZUfrhCjLXSuXHXDuSuMKcIXRioW5qp2YA6xxhrklS
         6PA5t30rFUy4SUv2Q10p3TMKSuFD7QmhIn/z52d1VhvpteTDlsH7xSokckh2OrVyRAR6
         OZvFsa4Q6GYkPxLbtIHHpq5isnp7SjPjoY43c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psxi8sV7eLiIF2qdnqe7ws85kk7WgDvg8LIHII21pqQ=;
        b=hlZU6SmSmmibVrngOILldoXx3TMHiWDwQLquHHTGq5aSsF9GYZUIWKUQq0S4gitmuK
         +8oaKW4yEQQbdfL7mrwp9dgNGJ6zhpcswtN+OvDHkUEBRoodVAi5GE7JonNAzL9dFFKi
         R2lOxXQzUvizKS+4+A/gzaoEOlvjCI3Marpo/N0oz5yJ/LzEEXhk1iFPiIfeaYJNan0r
         KbqSIDUdfCKr+XhX2tZHkDssZB9C2AbiZweP+LK4bL9DGYW56FxOhrI6g5Ft661gOSQS
         9jW9R6wJ5wzIFFIf7d/kFrxFroXZyH37D+dsWex2nkZgubA7TUHPtcMqajMrNQ/hf/vB
         brcA==
X-Gm-Message-State: APjAAAV7ZJh1UHxkTD6yWu+QLk6wHKnBTMcDMbE3Wnf5vIUq4r8IFX7o
        +PGZN2BSGQ/pTvFbJ3slWaN8dlh7oPk=
X-Google-Smtp-Source: APXvYqz/3PBVpaWtgFdat3rhnCsm2miZyhpEWxXTePocMtrvjX3O5ljRuicePyb42ror7FUJ0c7QQQ==
X-Received: by 2002:ab0:64d2:: with SMTP id j18mr11174033uaq.127.1556638123502;
        Tue, 30 Apr 2019 08:28:43 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id k128sm2845246vkb.54.2019.04.30.08.28.41
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 08:28:42 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id p13so4889602uaa.11
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 08:28:41 -0700 (PDT)
X-Received: by 2002:ab0:324b:: with SMTP id r11mr11542291uan.124.1556638121492;
 Tue, 30 Apr 2019 08:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555075927.git.arturp@synopsys.com> <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
 <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com>
 <SN1PR12MB2431BD7144CBA0C34C58CE8CA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=XhXc8dD8n-XEBG=tSC4Av+JW9hN-U=d3JP8vCiX5DopQ@mail.gmail.com> <SN1PR12MB2431D122F3EF3085493F60ECA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2431D122F3EF3085493F60ECA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Apr 2019 08:28:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ux_egPvzCbm_fMMwT97WPXABsbdeHRQr+KUjbZ4RTijw@mail.gmail.com>
Message-ID: <CAD=FV=Ux_egPvzCbm_fMMwT97WPXABsbdeHRQr+KUjbZ4RTijw@mail.gmail.com>
Subject: Re: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers() function.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Apr 29, 2019 at 11:59 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> On 4/29/2019 21:34, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Apr 29, 2019 at 3:51 AM Artur Petrosyan
> > <Arthur.Petrosyan@synopsys.com> wrote:
> >>
> >> On 4/27/2019 00:43, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Fri, Apr 12, 2019 at 6:38 AM Artur Petrosyan
> >>> <arthur.petrosyan@synopsys.com> wrote:
> >>>>
> >>>> - Added backup of DCFG register.
> >>>> - Added Set the Power-On Programming done bit.
> >>>>
> >>>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> >>>> ---
> >>>>    drivers/usb/dwc2/gadget.c | 10 ++++++++++
> >>>>    1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> >>>> index 6812a8a3a98b..dcb0fbb8bc42 100644
> >>>> --- a/drivers/usb/dwc2/gadget.c
> >>>> +++ b/drivers/usb/dwc2/gadget.c
> >>>> @@ -5004,6 +5004,7 @@ int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup)
> >>>>    {
> >>>>           struct dwc2_dregs_backup *dr;
> >>>>           int i;
> >>>> +       u32 dctl;
> >>>>
> >>>>           dev_dbg(hsotg->dev, "%s\n", __func__);
> >>>>
> >>>> @@ -5019,6 +5020,15 @@ int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup)
> >>>>           if (!remote_wakeup)
> >>>>                   dwc2_writel(hsotg, dr->dctl, DCTL);
> >>>>
> >>>> +       if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
> >>>> +               dwc2_writel(hsotg, dr->dcfg, DCFG);
> >>>> +
> >>>> +               /* Set the Power-On Programming done bit */
> >>>> +               dctl = dwc2_readl(hsotg, DCTL);
> >>>> +               dctl |= DCTL_PWRONPRGDONE;
> >>>> +               dwc2_writel(hsotg, dctl, DCTL);
> >>>> +       }
> >>>
> >>> I can't vouch one way or the other for the correctness of this change,
> >>> but I will say that it's frustrating how asymmetric hibernate and
> >>> partial power down are.  It makes things really hard to reason about.
> >>> Is there any way you could restructure this so it happens in the same
> >>> way between hibernate and partial power down?
> >>>
> >>
> >>> Specifically looking at the similar sequence in
> >>> dwc2_gadget_exit_hibernation() (which calls this function), I see:
> >>>
> >>> 1. There are some extra delays.  Are those needed for partial power down?
> >> Do you mean delays in dwc2_gadget_exit_hibernation() ? If yes they are
> >> needed for hibernation flow. What relates to delays in hibernation
> >> needed for partial power down. Anything that is implemented in the
> >> hibernation delays or other things are part of hibernation and are not
> >> used in partial power down because they are two different flows of power
> >> saving.
> >
> > OK, if they aren't needed for partial power down then that's fine.
> > When I see two functions doing nearly the same sets of writes but one
> > has delays and the other doesn't it makes me wonder if that was on
> > purpose or not.
> >
> >
> >>> 2. For exiting hibernation the setting of "DCTL_PWRONPRGDONE" only
> >>> happens if "not remote wakeup".  Is it truly on purpose that you don't
> >>> do that?
> >> Currently partial power down doesn't support remote wakeup flow.
> >
> > Oh.  What happens if you have partial power down enabled and try to
> > enable remote wakeup?  Does it give an error?
> As far as I have been debugging I have not seen error in that case.
>
> Do you mean like it should print a message saying that current partial
> power down code doesn't support remote wakeup?

Not sure.  ...why don't we just forget about this question?  I don't
have enough gadget knowledge nor any way to test.

-Doug
