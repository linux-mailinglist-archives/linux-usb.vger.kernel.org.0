Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF5921F7FD
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 19:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgGNRRD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 13:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgGNRRC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 13:17:02 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0273C061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 10:17:02 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id v26so3854498vkn.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=laL9jqyDAhx8XNNdn2YvqLz5e2HsHmGbabHru5+6+ac=;
        b=VBuqWZc3c+PV/wsheMBO3Vhs1BGr9+VWwRe05MDbpZdOf/G+daYhXw4yDzDIfW1fED
         0lyxr9FjVC4EHq9r2uYZMsdGn8/tizR7hUsSwZjkerZ1wGgHr1OEHHQgSyshpcxJqqTf
         7N4uMIWxxiO/fnIi4BbjtufFGzGoAK1VsSk1yoamyQcz10vtvr8/R6VJ64EoIaW/8H67
         wvPp8gR3TyuOB9oSm5zH92PYfdfxFnytZyCnvhcBpdFNYdtibwY31XF1nQbwoU2ZE/EY
         Y1igfMjeV6q1ZQRZfPD6/j+u35LjChvDXySpQk3KA9drVbJMTEAEowF9B68b7xc6hMmT
         D5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=laL9jqyDAhx8XNNdn2YvqLz5e2HsHmGbabHru5+6+ac=;
        b=MTutF6t7958eHt2r8XFFG8rReCxmM5ObtM4G+9wrLEVIbcIpXvfawxl4YMHfH4a0+U
         Us5LjvrkYSi9k114LCUEe0aVpO3w/desfXaImPX+0qdqsDASZy/gkxvgOs8vT7k51hB4
         uH5O4Vc/jrqMN5K7nyt4Kj/tqXOUiQvum2HYPgkxWX5MxEhFRaIXz6jAS0zZR15wBLuF
         pnCch6qHQOIZRef4aO97r+exf6TlBWfn5ub/eNOAS6Eyc+JhlxOH1XGiG2pVhnRFyXq5
         zwJ5uIeHmY82T02dnoI5aP7Y6YFzst6jeQbfC9VASd4Ia/Tb0zSzz21xqzyE7kEYSZdp
         NvrA==
X-Gm-Message-State: AOAM5322uvsFfcUiC9culOoc5vs9HxWCxi3J4eeHEQHtsq5uaaofF2iS
        As6BE1oLf7WZF4ZPXx4lb5sl7wHGW5HqIOEYv96MMQ==
X-Google-Smtp-Source: ABdhPJzHNFrugBMO2S61VslrpSRXmFF2CHqMHlK2gROBSdoqMAnqNd/Z46gTkqHWdvA45vYX+KRznEjm7iQcOKGJrdc=
X-Received: by 2002:ac5:c189:: with SMTP id z9mr4800999vkb.79.1594747021495;
 Tue, 14 Jul 2020 10:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200713204300.345975-1-badhri@google.com> <20200714060520.GB657428@kroah.com>
 <040b4cde-91d4-7776-60b5-8f55b6e75831@roeck-us.net>
In-Reply-To: <040b4cde-91d4-7776-60b5-8f55b6e75831@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 14 Jul 2020 10:16:25 -0700
Message-ID: <CAPTae5JHSrp5H47Dr9mrkS_PF_W8MH1TFMzNCc4Geva0-b-B0A@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Move to high priority workqueue for
 processing events
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     reg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 13, 2020 at 11:58 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/13/20 11:05 PM, reg Kroah-Hartman wrote:
> > On Mon, Jul 13, 2020 at 01:43:00PM -0700, Badhri Jagan Sridharan wrote:
> >> "tReceiverResponse 15 ms Section 6.6.2
> >> The receiver of a Message requiring a response Shall respond
> >> within tReceiverResponse in order to ensure that the
> >> sender=E2=80=99s SenderResponseTimer does not expire."
> >>
> >> When the cpu complex is busy running other lower priority
> >> work items, TCPM's work queue sometimes does not get scheduled
> >> on time to meet the above requirement from the spec.
> >> Elevating the TCPM's work queue to higher priority allows
> >> TCPM to meet tReceiverResponse in a busy system.
> >>
> >> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >> ---
> >>  drivers/usb/typec/tcpm/tcpm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tc=
pm.c
> >> index 82b19ebd7838e0..088b6f1fa1ff89 100644
> >> --- a/drivers/usb/typec/tcpm/tcpm.c
> >> +++ b/drivers/usb/typec/tcpm/tcpm.c
> >> @@ -4747,7 +4747,7 @@ struct tcpm_port *tcpm_register_port(struct devi=
ce *dev, struct tcpc_dev *tcpc)
> >>      mutex_init(&port->lock);
> >>      mutex_init(&port->swap_lock);
> >>
> >> -    port->wq =3D create_singlethread_workqueue(dev_name(dev));
> >> +    port->wq =3D alloc_ordered_workqueue("%s", WQ_HIGHPRI, dev_name(d=
ev));
> >
> > How are you "guaranteeing" that this is really going to change anything
> > on a highly loaded machine?
> >
> > Yes, it might make things better, but if you have a hard deadline like
> > this, you need to do things a bit differently to always ensure that you
> > meet it.  I do not think this change is that fix, do you?
> >
Yes Greg I agree with you, moving to HIGHPRI was making it better but
is not going to
solve the problem always. I was wondering whether are there better
ways of doing this.

>
> Good point. The worker in drivers/watchdog/ !watchdog_dev.c might be
> useful as a starting point. There may be better examples - this is
> just one I know of which had a similar problem. See commits
> 38a1222ae4f3 and 1ff688209e2e.
>
> Guenter

Thanks a lot Guenter !! Very useful pointers, will review the
approaches in both the
commits !
