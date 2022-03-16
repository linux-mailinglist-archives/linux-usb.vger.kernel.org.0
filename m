Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CF94DA76C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 02:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352975AbiCPBnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Mar 2022 21:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352992AbiCPBnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 21:43:01 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A2453E0F
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 18:41:48 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id l2so1854961ybe.8
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 18:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46rIVjsH1I8ddsXUapuHI/bM1nu3UlZ0AvQXrsOVXb4=;
        b=cYcpJNTw9G9tegY7Eh58PPSuiqsR4BPVOqaQNu5py5q8LS4OYW/j/AE0zadGir6I1/
         GI5UVJBGOJkHBifHK9SEGf4bo+AcTAdowBeJ6MTPzCr2ZzMA75REXYUcA7CMz+nlkxTk
         BGZvkofjLOLZ+9Jjbd0hAt+tgQKCnzuzLMsWWEIG630/d1WlPeNaKegURTjMjtwDFt3h
         BLRoun154kB+0liNwJWJUfuMIBzU7HEczOANtf+0oWChvsLMhBQNMcWW+/nhBZ4GSMVo
         mrI0KZK2ljpC2YkPZRg6gYJBS97G+ULJdlVG45rrRl7NX5jioaAAgFLCDCB/BfcTjlf9
         ++0w==
X-Gm-Message-State: AOAM532A1de+XysMqagDPdpf1tAxYAb+9VuqDRlV+2AOvjJGBHDQfIIJ
        6ucqYJQrR/jfMB6aVxoT0ti5Z9GcDRz1eq+u+d0=
X-Google-Smtp-Source: ABdhPJxPS/6WHKVDuNsdE9erAHvl+tUi3V9+2ynZ/lT8MXDYzGa5xmpTdOz0b5U/C/2QyI4LIIqoYiut+6yIAKAJCnM=
X-Received: by 2002:a25:26c8:0:b0:633:61d7:ef84 with SMTP id
 m191-20020a2526c8000000b0063361d7ef84mr8865096ybm.630.1647394907540; Tue, 15
 Mar 2022 18:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr> <20220306075524.706660-4-mailhol.vincent@wanadoo.fr>
 <YjDMJs/LU/lVAaku@kroah.com>
In-Reply-To: <YjDMJs/LU/lVAaku@kroah.com>
From:   Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date:   Wed, 16 Mar 2022 10:41:36 +0900
Message-ID: <CAMZ6RqL_mJ6Rdn2tQL=Q3fzN_JO+-nwq5uONLFmHd2UB7-Hr8g@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] usb: rework usb_maxpacket() and deprecate its
 third argument
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed. 16 mars 2022 at 02:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Mar 06, 2022 at 04:55:17PM +0900, Vincent Mailhol wrote:
> > This is a transitional patch with the goal of changing the prototype
> > of usb_maxpacket() from:
> > | static inline __u16
> > | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> >
> > into:
> > | static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
> >
> > The third argument of usb_maxpacket(): is_out gets removed because it
> > can be derived from its second argument: pipe using
> > usb_pipeout(pipe). Furthermore, in the current version,
> > ubs_pipeout(pipe) is called regardless in order to sanitize the is_out
> > parameter.
> >
> > In order to make a smooth change, we first deprecate the is_out
> > parameter by simply ignoring it (using a variadic function) and will
> > remove it latter, once all the callers get updated.
> >
> > Finally, the body of the function is reworked in order not to reinvent
> > the wheel and just relies on the usb_pipe_endpoint() helper function
> > instead.
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/usb.h | 24 +++---------------------
> >  1 file changed, 3 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 200b7b79acb5..588aa7dc3d10 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -1969,30 +1969,12 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
> >       return eps[usb_pipeendpoint(pipe)];
> >  }
> >
> > -/*-------------------------------------------------------------------------*/
> > -
> > -static inline __u16
> > -usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> > +static inline u16 usb_maxpacket(struct usb_device *dev, int pipe,
> > +                             /* int is_out deprecated */ ...)
>
> No need to change from udev->dev, right?

Right. The motivation of this change was to align with other functions
(the majority of the functions in linux/usb.h name it dev, not udev).
Comment taken, I will keep the udev name in v3.

> >  {
> > -     struct usb_host_endpoint        *ep;
> > -     unsigned                        epnum = usb_pipeendpoint(pipe);
> > -
> > -     if (is_out) {
> > -             WARN_ON(usb_pipein(pipe));
> > -             ep = udev->ep_out[epnum];
> > -     } else {
> > -             WARN_ON(usb_pipeout(pipe));
> > -             ep = udev->ep_in[epnum];
> > -     }
> > -     if (!ep)
> > -             return 0;
> > -
> > -     /* NOTE:  only 0x07ff bits are for packet size... */
> > -     return usb_endpoint_maxp(&ep->desc);
> > +     return usb_endpoint_maxp(&usb_pipe_endpoint(dev, pipe)->desc);
>
> The change to use usb_pipe_endpoint() can be done separately.
>
> Let's make these in tiny steps so that we can easily roll things back if
> things are not working.

ACK. I will respin the patch series as below:
  * Make usb_maxpacket variadic
  * Migrate the callers of usb_maxpacket()
  * Suppress the third argument of usb_maxpacket()
  * Change the body of usb_maxpacket() using usb_pipe_endpoint().


> thanks,
>
> greg k-h
