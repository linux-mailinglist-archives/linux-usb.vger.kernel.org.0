Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87DF56A88D
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 18:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbiGGQra (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 12:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbiGGQrW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 12:47:22 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC734D4C7
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 09:47:21 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id s13-20020a0568301e0d00b00616ad12fee7so14375130otr.10
        for <linux-usb@vger.kernel.org>; Thu, 07 Jul 2022 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v77mHIDagwPiyw3PDHZYz+QSUKGxhJfZ8ksNQfnoYD4=;
        b=bhKhkzE2nkujxgUAQEM/2e/KeVlDNCik+LIKkwq0I4POyOLf6yF8ngccoCBPiG7g8x
         1sMZsGTtgcZcp31Rz7rZyVF7nwrPZGanKsPgmmWoakkIGLwl8i/2ZhClPL9DfSrostMV
         bBKmiLitByNTdVqWIvI1POdxiSXyvwOdT5zZHQ+V7yA/aKQrr5oonN0LWsaOHusQdNpl
         tewop3lqaz4CsyQgNR/xbRinuLKLDY5/hTL9kBicIB5kJDTI6ngtLNdkzFzAr+HjNFpa
         ZIAci3B7aYKTzJ7AKVfKdJBCkWSHhCwH9yhTBHTCE8Sdc8mnuP4GH0KBBFCPMRlRvr/u
         OXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v77mHIDagwPiyw3PDHZYz+QSUKGxhJfZ8ksNQfnoYD4=;
        b=FesmspMqdHYvmpM5vpq5th5E3aUwGGtRESly6tJQOu+kcRVAO44a0h3sRR1aLhz9Qq
         t2Ie4qR1leSRlp7tXu8vD++cLkhGSjvI4RZQYdAcbdiP5LDw0dh4xGxtMTxXZ0ruXIgq
         IWULbOmc9UioZ67CN/EOBeAKF/weXXrjC8KPYTFYW+CKIQQl0P5D0PpYFRIOV3Z8Ynej
         Up3F2FGbZTPEwBJWA1yv4rVz3qILtM/YzxuDdTjtsr8Ayt8JASpFNY5WGWIvlMf8RQnR
         uwrYz+gf8ok/N1mNhOpET8RW4/9CWYcLc+tDBdnTX0A/ChpbFqZ/siNEKfANTDE0tvb7
         5oGw==
X-Gm-Message-State: AJIora8r2zCtW+sw7z79QORutrY1OWcGIOMuYrN4V5CsYjH4YSk8Wxv0
        71W17tHQEicb6KPBma4iLrgyXxwTLk+V8J1XhzzTeNXWzfo=
X-Google-Smtp-Source: AGRyM1t9RmEexIUaUTmVLl86diDbw8SD8vy7AnJSBz4BcRQewfhzn2n8S58WbsPtm02aDkHtmZ3xBRhgSq5sfPu+btE=
X-Received: by 2002:a05:6830:920:b0:616:e889:41ad with SMTP id
 v32-20020a056830092000b00616e88941admr21615872ott.79.1657212440934; Thu, 07
 Jul 2022 09:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+BOZ0uBvKHc3idN+Pn_g4Z4e5ObYPZ4WY4f78fzj_B=8c5qJw@mail.gmail.com>
 <YscFzAAkhbPojMVL@rowland.harvard.edu>
In-Reply-To: <YscFzAAkhbPojMVL@rowland.harvard.edu>
From:   "Jozo M." <jomajm@gmail.com>
Date:   Thu, 7 Jul 2022 18:47:09 +0200
Message-ID: <CA+BOZ0tVe11y6aVqns7mLM+eJWSZtgHWB3kCaKbyeYmPu8ELDA@mail.gmail.com>
Subject: Re: gadgetfs inode.c - possible memory corruption ?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

But can't be this a deadlock ?
What if IRQ which calls complete(...) will be executed sooner than
wait_for_completion()

=C5=A1t 7. 7. 2022 o 18:11 Alan Stern <stern@rowland.harvard.edu> nap=C3=AD=
sal(a):
>
> On Thu, Jul 07, 2022 at 11:43:09AM +0200, Jozo M. wrote:
> > Hello,
> >
> > my kernel running on imx6 was crashing on USB gadgetfs because my
> > kernel was using wait_event API instead of completion (I was convinced
> > it is due to wrong HW setup).
> > During research gadgetfs inode.c function ep_io was not clear for me:
> >
> > we are submiting USB request here
> >       value =3D usb_ep_queue (epdata->ep, req, GFP_ATOMIC);
> > then we are waiting for completion here:
> >       value =3D wait_for_completion_interruptible(&done);
> > but if completion is interrupted we end up here:
> >       spin_unlock_irq (&epdata->dev->lock);
> >       DBG (epdata->dev, "endpoint gone\n");
> >       epdata->status =3D -ENODEV;
>
> You left out part of the code.  We end up at this code in the case where
> epdata->ep =3D=3D NULL, and the only way that can happen is if the endpoi=
nt
> was removed while we were waiting for the completion.
>
> > At this point ep_io is terminated and stack is not valid. Later on
> > epio_complete might be called from IRQ and it calls complete ((struct
> > completion *)req->context) but stack is no longer valid;
> > Shouldn't we put req->context =3D NULL;  before spin_unlock_irq
> > (&epdata->dev->lock); ?
> >       req->context =3D NULL;
> >       spin_unlock_irq (&epdata->dev->lock);
> >       DBG (epdata->dev, "endpoint gone\n");
> >       epdata->status =3D -ENODEV;
>
> You're right that this is a bug, but your solution is not correct.
> There is a race: epio_complete can run at the same time as this code if
> the endpoint is removed concurrently with the interrupt, and your
> approach is still subject to this race.
>
> The right way to fix the problem is to call wait_for_completion(&done)
> between the DBG and the assignment to epdata->status.  That way the
> stack will still be valid when epio_complete runs.
>
> Please feel free to submit a patch doing this.
>
> Alan Stern
