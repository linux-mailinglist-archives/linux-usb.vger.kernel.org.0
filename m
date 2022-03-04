Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8924CDA36
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 18:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbiCDRYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 12:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiCDRYr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 12:24:47 -0500
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6086E156C75
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 09:23:59 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2dc28791ecbso85459907b3.4
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 09:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fG19ikPUR6MlFUzUu5C8Yp2dYlinRGD24BB+wEQPspM=;
        b=t3mJ2ifw/3zmfyjJcV82U6U98r9hZDwgKDapznAiVSEFzDDiFCpERREXu6500mRCQS
         H6lB/34IPKyU8qgZidG4OH7MOHmRanRLsWY76kfx9b0dPG0NNhVI/ckr2tLDj+qLuw/u
         z++aIXqcJHGW8lAyio688M2Cf0qaNAPAE+GGiuPQ9P/wCgBmqSsP0gf/vf1nd+1GlO2B
         ZVNUj4U9Np8vW0eavDtcQrZuSqclrw+eferK12AVJbWHXWBvrXyc347bfb3vvteg8DAj
         jAgAucDIuRZyDatM4MlKxvCOaiBzORf1zublj1E9N3Y1NA4WF46TDy0ZUKmttetiF4tZ
         mehQ==
X-Gm-Message-State: AOAM533n1NIeYNN31bDdBD81KJTztdH/SOZobuPdRDHvLhuY2ccAEdd7
        IfkIC0NEeqakkq015hA1CO66PjTkNitnxrTAqV14touGWG8=
X-Google-Smtp-Source: ABdhPJykaTI5dihl88vmURyShlsZpRxOBIrZlqA8FJi8YKVr7Pk4utfUgjYWnJ7kqyNBrq2fQwAJMjAjXazB+0dBP4E=
X-Received: by 2002:a81:6bc6:0:b0:2db:fe24:d5ee with SMTP id
 g189-20020a816bc6000000b002dbfe24d5eemr16583360ywc.392.1646414637996; Fri, 04
 Mar 2022 09:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr> <YiIgGOkNntEiu78O@kroah.com>
In-Reply-To: <YiIgGOkNntEiu78O@kroah.com>
From:   Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date:   Sat, 5 Mar 2022 02:23:46 +0900
Message-ID: <CAMZ6RqKcHtNmcp+F1ZpGckCdOdeUp4HbY+ccVcjO4Xh2=unzFg@mail.gmail.com>
Subject: Re: [PATCH] usb: rework usb_maxpacket() and remove its third argument
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

<Removed people in CC>

On Fri. 4 Mar. 2022 at 23:20, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Mar 04, 2022 at 07:53:50PM +0900, Vincent Mailhol wrote:
> > Change the prototype of usb_maxpacket() from:
> > | static inline __u16
> > | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> >
> > into:
> > | static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
> >
> > and rewrite the function.
> >
> > Rationale:
> >
> >   * The third argument of usb_maxpacket(): is_out can be derived from
> >     its second one: pipe using usb_pipeout(pipe). Furthermore,
> >     usb_pipoout(pipe) is being called within usb_maxpacket()
> >     regardless to confirm the input.
> >
> >   * This function is not exposed to the UAPI so return type should be
> >     u16, not __u16.
> >
> >   * Let's not reinvent the wheel and rely on usb_endpoint_maxp() to
> >     make this a one liner function.
> >
> > All the users of usb_endpoint_maxp() are then updated.
> >
> > Two of the users: oxu210hp-hcd.c and isp1760-hcd.c rely on a local
> > macro: max_packet() to mask the maximum size. Because this masking is
> > already performed by usb_maxpacket(), this patch also removes these
> > redundant sanitization and remove the local macro if not needed any
> > more (keep it in oxu210hp-hcd.c which uses it elsewhere but remove it
> > in isp1760-hcd.c).
>
> This type of "change all callers of this function" is brutal to do like
> this, as is evident by the number of people you had to cc: here.
>
> How about doing it the normal way.  Create a new function, with the
> proper options you wish to see be used, and then move everyone over to
> it, and when that is done, remove the old function.  Bonus points for
> doing this with some crazy macros to keep the old name in the end (it
> can be done, but I don't recommend it for the faint-of-heart, so it's
> not required.)

Thank you for the explanation :)

If I understand correctly, I should:
  * First change linux/usb.h
  * Wait for other trees to pull the patch
  * Change the drivers
  * Clean up linux/usb.h

I did not find the inspiration for a better name so I would like to
keep the old one.
Would the below code meet your expectation of "doing some crazy macros"?

| static inline u16 __usb_maxpacket(struct usb_device *dev, int pipe)
| {
|     return usb_endpoint_maxp(&usb_pipe_endpoint(dev, pipe)->desc);
| }
|
| #define usb_maxpacket(dev, pipe, deprecated...) __usb_maxpacket(dev, pipe)

Thank you,


Yours sincerely,
Vincent Mailhol
