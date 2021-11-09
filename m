Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BA544A601
	for <lists+linux-usb@lfdr.de>; Tue,  9 Nov 2021 06:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhKIFNO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Nov 2021 00:13:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhKIFNM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Nov 2021 00:13:12 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DCBC061764
        for <linux-usb@vger.kernel.org>; Mon,  8 Nov 2021 21:10:27 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d24so30818004wra.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Nov 2021 21:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wChQfCcRN8/h4bsmukuc7LMGPInLM49zrDhyAhinlqc=;
        b=e1iCXh6FUM+zNl6Shpg9UNX5ZOG1m5JqUzsx7ykiMPNSCkQhzYki77QU18eiKEZXSH
         XlWbUC1hQxwoeKsPtDsnE1Wj26HzRehUzx04QB6IA4+M7k5ki5LSAFI+cCqivJjO56nS
         OXJc7Om1NK7Outorntm5sr1QGH2Hz9yw3eNMI4zoXp5nEGRH7m2+rHyF+KVNmR0gXK/c
         5pBWpiMSHN16gqu/V7gIU6dEQ1Ikg+HTSIg0j2dTd/HSVcUlC4JJtd5/p5CaZGstXcdA
         TRsUh8zkfHf2jxZlh+g87wWqFUdmFn+VgkxAiJjTpKGtDrZu4NzTnWs5aIyDTYCoG8Ha
         IbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wChQfCcRN8/h4bsmukuc7LMGPInLM49zrDhyAhinlqc=;
        b=K/GsUbo4fiFeIeRTPjoNfD7mRqEs6fLjpQNgjm0n8E93vabHNIlp5kjbz3mefp6CNa
         6KjstHeFHTjN0O/AU/KosUtC7c21BE9owggoI+AL7gIamCvZZNDguujaWyBJFDXZPaV+
         hY7AQtUgT7WUiMtuJfcCqaMhnrfLd9dC802XztR8hQWPMovsoQTIz3qXuzEPkKrCNNES
         N857x0CrdSpJzb0p/eT+v13Ex3FlkbuMqzr1EoU1zHqjuE7cPcZh9DoGcOF8jUztOVca
         hITF9NEmwUkmiIRumRe85oApta8WIvWsrfk0F3zoLHNNOHLtseYY6fl90ffMtFF6yGQj
         Supw==
X-Gm-Message-State: AOAM531ZlCFIEwOs5JFS8YBrTNANjUv4RvFNGknUY63k1Aoz9pGGZDFS
        OD2hNAluhlCFmM5yC/m0Lo0rP9zbDGRYmbS/ei0pjg==
X-Google-Smtp-Source: ABdhPJysyG8kDS71v04oKrDBw4a2yzyW7tkmiQNLXXJxYIYgOAWLA43awMFFV2xk3XNQDkhNLo3z9H5w6JZ5026TkqI=
X-Received: by 2002:a5d:5186:: with SMTP id k6mr6021712wrv.146.1636434625375;
 Mon, 08 Nov 2021 21:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20211104062616.948353-1-albertccwang@google.com> <20211106012513.GA19852@jackp-linux.qualcomm.com>
In-Reply-To: <20211106012513.GA19852@jackp-linux.qualcomm.com>
From:   Albert Wang <albertccwang@google.com>
Date:   Tue, 9 Nov 2021 13:10:13 +0800
Message-ID: <CANqn-rj3hJcKet=Fn3QwWqRZL11YfitBgjiE4kz-ttOfgqpARw@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Fix null pointer exception
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, badhri@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ok, let me do that.

Thanks,
Albert

On Sat, Nov 6, 2021 at 9:25 AM Jack Pham <quic_jackp@quicinc.com> wrote:
>
> On Thu, Nov 04, 2021 at 02:26:16PM +0800, Albert Wang wrote:
> > In the endpoint interrupt functions
> > dwc3_gadget_endpoint_transfer_in_progress() and
> > dwc3_gadget_endpoint_trbs_complete() will dereference the endpoint
> > descriptor. But it could be cleared in __dwc3_gadget_ep_disable()
> > when accessory disconnected. So we need to check whether it is null
> > or not before dereferencing it.
> >
> > Signed-off-by: Albert Wang <albertccwang@google.com>
>
> Nice catch.  I think this might have been caused when the call to
> dwc3_remove_requests() in __dwc3_gadget_ep_disable() was moved after
> the endpoint descriptors is cleared.  So you can probably add:
>
> Fixes: f09ddcfcb8c5 ("usb: dwc3: gadget: Prevent EP queuing while
> stopping transfers").
>
> Reviewed-by: Jack Pham <quic_jackp@quicinc.com>
>
> > ---
> >  drivers/usb/dwc3/gadget.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 23de2a5a40d6..83c7344888fd 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -3252,6 +3252,9 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
> >       struct dwc3             *dwc = dep->dwc;
> >       bool                    no_started_trb = true;
> >
> > +     if (!dep->endpoint.desc)
> > +             return no_started_trb;
> > +
> >       dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
> >
> >       if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
> > @@ -3299,6 +3302,9 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
> >  {
> >       int status = 0;
> >
> > +     if (!dep->endpoint.desc)
> > +             return;
> > +
> >       if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
> >               dwc3_gadget_endpoint_frame_from_event(dep, event);
> >
> > --
> > 2.33.1.1089.g2158813163f-goog
> >
