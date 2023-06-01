Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C93771F6C1
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 01:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjFAXm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 19:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjFAXmz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 19:42:55 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4336136
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 16:42:53 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30af20f5f67so1436995f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Jun 2023 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685662972; x=1688254972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0zmHP8JGK6g/aq3iYcHo/6GKlgds8CC7jKahig4m+o=;
        b=nrU64l8FrW2dwcmzwlsxiKsxcLQQNfsBWjX/80cpMU0NRuCwejzmnqkvOH+BNJ/J9y
         NMp7skqjFj0afUGLQUhPxdcVD2tuTWZCzNikcJRTHMZir9gG+V1uiNiJ2z72lQnRgopB
         h4z6PcO0ZS2MhnzMXxVLUDaNwyWDpZSP/pT2w5x6xXSH00SV5Bdu0gI0Rk0u/2+6e5MD
         leM39t0uJa6Rjw6/dh8hWjDHqfc4dHMv+Bdyg1XGeZg5B0eUN+2hSUO5K19sOlhnqXYU
         cdOCGQXWHn+aPMg1zpDPcXKphaiB1WXZWUsmexg4q1ItlqAlNrAq0OikTSrqeg3Oq4br
         /rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685662972; x=1688254972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0zmHP8JGK6g/aq3iYcHo/6GKlgds8CC7jKahig4m+o=;
        b=cS2T57eVTipfsDxfrtpK6XQZ1CnzepIO+0qox7yK+fxv17RvEfOWA5psrpRyVQQBe4
         3nVbK5VdbJonLteAWwe2Z7zi1hfgtsQ6nitgTsGekR1JMQbJFVNL95k9rASA4SmkYJm8
         XQXu46u1QOJxjFwrr3pkH9g89V+xUBKAF7DV2h/AbjcfyiAeOOYfffnXPU/MvXXPjHkc
         Y3SnLLl+1cU6JRg+FPq9e9jnO3ba/rCmCyqcD+0090Ca97qROVWPFIOWSCcdJPFpzIRV
         39cToeAh2Nc/+cw1GK9ERF/mCJdQUVqiAiywxf+bCp81zfjSTwJ3VsAruToUN7GbXteX
         Fumw==
X-Gm-Message-State: AC+VfDwWsJVRcG9Lq5DhSw251emMRPcDD4iqKtNSyKS8z1nNasbgBnDr
        +dHPkm8o4C2Ga+JUdAQkZlV5GeiTanQzZ9AdtxZoTQ==
X-Google-Smtp-Source: ACHHUZ7DtFXG0k9ql1QidgJih9xorFkvlA0pbNtLecjSeL0Nycq8xnN2F2dyADPE/uLQlrJIGb+4rmj8etHFqA3sE6A=
X-Received: by 2002:adf:fc87:0:b0:30a:dce8:f8b5 with SMTP id
 g7-20020adffc87000000b0030adce8f8b5mr3005225wrr.58.1685662972198; Thu, 01 Jun
 2023 16:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230601230456.2234972-1-royluo@google.com> <4f049d62-d103-4491-9c7e-16c7cf94eac1@rowland.harvard.edu>
In-Reply-To: <4f049d62-d103-4491-9c7e-16c7cf94eac1@rowland.harvard.edu>
From:   Roy Luo <royluo@google.com>
Date:   Thu, 1 Jun 2023 16:42:16 -0700
Message-ID: <CA+zupgxPfAwbLq=CUy_frj9CMqYKmQKj2enC1_VvkMFAiA5FCg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: core: add sysfs entry for usb device state
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     raychi@google.com, badhri@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bastien Nocera <hadess@hadess.net>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 1, 2023 at 4:21=E2=80=AFPM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Thu, Jun 01, 2023 at 11:04:56PM +0000, Roy Luo wrote:
> > Expose usb device state to userland as the information is useful in
> > detecting non-compliant setups and diagnosing enumeration failures.
> > For example:
> > - End-to-end signal integrity issues: the device would fail port reset
> >   repeatedly and thus be stuck in POWERED state.
> > - Charge-only cables (missing D+/D- lines): the device would never ente=
r
> >   POWERED state as the HC would not see any pullup.
> >
> > What's the status quo?
> > We do have error logs such as "Cannot enable. Maybe the USB cable is ba=
d?"
> > to flag potential setup issues, but there's no good way to expose them =
to
> > userspace.
> >
> > Why add a sysfs entry in struct usb_port instead of struct usb_device?
> > The struct usb_device is not device_add() to the system until it's in
> > ADDRESS state hence we would miss the first two states. The struct
> > usb_port is a better place to keep the information because its life
> > cycle is longer than the struct usb_device that is attached to the port=
.
> >
> > Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
>
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 97a0f8faea6e..35d94288726b 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -2018,6 +2018,23 @@ bool usb_device_is_owned(struct usb_device *udev=
)
> >       return !!hub->ports[udev->portnum - 1]->port_owner;
> >  }
> >
> > +static void update_port_device_state(struct usb_device *udev)
> > +{
> > +     struct usb_port *port_dev =3D NULL;
> > +     struct usb_hub *hub =3D NULL;
> > +     struct kernfs_node *state_node =3D NULL;
> > +
> > +     if (udev->parent) {
> > +             hub =3D usb_hub_to_struct_hub(udev->parent);
> > +             port_dev =3D hub->ports[udev->portnum - 1];
> > +             WRITE_ONCE(port_dev->state, udev->state);
> > +             state_node =3D sysfs_get_dirent(port_dev->dev.kobj.sd, "s=
tate");
> > +             if (state_node) {
> > +                     sysfs_notify_dirent(state_node);
> > +             }
> > +     }
> > +}
>
> I didn't notice the "=3D NULL" initializers before.  You might want to
> remove them, since they are completely unnecessary.
>
> Alan Stern

Ack, sending out v2.

Thanks,
Roy
