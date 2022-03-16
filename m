Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50854DBB02
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 00:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240917AbiCPX1l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 19:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238816AbiCPX1k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 19:27:40 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3166B64C9
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 16:26:25 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2e59939b862so40587267b3.10
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 16:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSiAnwTUF0swgLbeTQB2X23s9tJhZ8t3IkH4f+pKXm0=;
        b=6oN52JKcJT3uAnd7TvwOF71bIpEiI/JKuWE8INaaD/xDI54Tt/eLm01fk59a54xE9A
         VFWxRC4biS4M1QFvIWetVLqWNnWxSsgh5jDIhXAJYZwyD6DK4OW7In8FoF+peZWimfYG
         n8aEcPZPnlxOvpqeqLmQ1oxWA9KTvAzBrDtPUA7oVHqxw/17TS836kWRQISMdI+FumEn
         WNcV54joUz6n6FekaFGRL3Lrx/60qwh04diEsSGVlRHHmxinnKfPYMut8xSED3NysqBr
         L/roEM4zObx4AnitBgn75TCHavpwJM0R9bXSNYrQeLRGQDjGHz10iH45obKSAtaeDbLj
         uR8g==
X-Gm-Message-State: AOAM530EHf2WHXhK7vEOISgyfLWO62YIHH5nlXttGLzzMYBke/vfNMn6
        DlU5MWqCk3WZj5yZeOsgsItatT3b8la+EucrqaQKA7cp
X-Google-Smtp-Source: ABdhPJzn2p2ovUNnU+X2UhqtLiXBuXGJLIy5Jm9riEfAJHOuZg6Xp19qUAJvgIczcFSx1JIHjJ0Oo/O9K4uW1n1BzQk=
X-Received: by 2002:a81:c443:0:b0:2d0:dfa3:9ed9 with SMTP id
 s3-20020a81c443000000b002d0dfa39ed9mr3086639ywj.220.1647473184323; Wed, 16
 Mar 2022 16:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr> <20220316161935.2049-10-mailhol.vincent@wanadoo.fr>
 <YjIbkR7njaFX7NKi@rowland.harvard.edu>
In-Reply-To: <YjIbkR7njaFX7NKi@rowland.harvard.edu>
From:   Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date:   Thu, 17 Mar 2022 08:26:13 +0900
Message-ID: <CAMZ6RqLtC9HOnxK=E18o4FqJT9ixJQj7vJOctKExhNACAHoZGg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] usb: rework usb_maxpacket() using usb_pipe_endpoint()
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
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

On Thu. 17 Mar 2022 at 02:17, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Thu, Mar 17, 2022 at 01:19:35AM +0900, Vincent Mailhol wrote:
> > Rework the body of usb_maxpacket() in order not to reinvent the wheel
> > and just rely on the usb_pipe_endpoint() helper function instead.
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/usb.h | 14 +-------------
> >  1 file changed, 1 insertion(+), 13 deletions(-)
> >
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 8127782aa7a1..653d34ff0999 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -1971,19 +1971,7 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
> >
> >  static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
> >  {
> > -     struct usb_host_endpoint        *ep;
> > -     unsigned                        epnum = usb_pipeendpoint(pipe);
> > -
> > -     if (usb_pipeout(pipe))
> > -             ep = udev->ep_out[epnum];
> > -     else
> > -             ep = udev->ep_in[epnum];
> > -
> > -     if (!ep)
> > -             return 0;
> > -
> > -     /* NOTE:  only 0x07ff bits are for packet size... */
> > -     return usb_endpoint_maxp(&ep->desc);
> > +     return usb_endpoint_maxp(&usb_pipe_endpoint(udev, pipe)->desc);
>
> The original code was careful to handle the case where ep was a NULL
> pointer.  What will your routine do if usb_pipe_endpoint(udev, pipe)
> returns NULL?

Sorry, you are absolutely right. Will send a v4.

Thank you!


Yours sincerely,
Vincent Maihol
