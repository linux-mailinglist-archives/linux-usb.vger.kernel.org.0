Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D7450B982
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 16:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448318AbiDVOK0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 10:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445040AbiDVOKY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 10:10:24 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABF25A17F
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 07:07:28 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f16645872fso86493057b3.4
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 07:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RKyQ5lrZPhnOtbgDYDJu/aJj4GIFkQhUgiR9fbmhCo=;
        b=BTA4DgWF19UDorXjh4G0+Z2J+GfS3xj+AIjyLlWR0U8ieLvjxSXLIcSYmV8W3AmNKQ
         qwyGfpeKGjG0SfOmwnUvMMZqnkrbVi1anUZC1RPhKEqEjUnELw4LALK6l6EsCRxgVKwT
         7XNmj+6wyXM2uPYbpKwg1bIxKW55fLDHU8zHv5VFW/buxXMz6kZ0FJkD1mLcI2KEkMzX
         svF5T1bkZPWyc5dMQVSqPkdCoT12vaDJrxe4zUtC+SWlUkHckhVE6mrCHMzuJHBoCL/0
         FpcKrOBI8p3OE8SzJyW4+O74ms/752RYW3SVsBC33DD/jF8T3Jib0Gg0EJuA4EdjRyXO
         6mdA==
X-Gm-Message-State: AOAM531TTLwnhA8gHVhud1G7tEe7XsUbQAiHVbyaFSNoUqFrG3l9ZrW0
        wfBl2UvMXYckgOmv2lrVXZuKspQ1ALx8/3ZKqYY66nhpSDI=
X-Google-Smtp-Source: ABdhPJwTFBid7b65+PN0IbNYhgiX8pcfJC9EkXnHrDlhYGM0qUBwU/FOYVijuVEND6f1aKqK1SrUvVUgwsXmiOwPWYU=
X-Received: by 2002:a81:ff12:0:b0:2db:2d8a:9769 with SMTP id
 k18-20020a81ff12000000b002db2d8a9769mr4882908ywn.172.1650636448103; Fri, 22
 Apr 2022 07:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr> <YmKv37an0DR7/iPE@kroah.com>
 <CAMZ6RqKhJ5aypM+dBF38nL626PDdD-gr2AHJz1ozpov+OSzbAw@mail.gmail.com>
In-Reply-To: <CAMZ6RqKhJ5aypM+dBF38nL626PDdD-gr2AHJz1ozpov+OSzbAw@mail.gmail.com>
From:   Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date:   Fri, 22 Apr 2022 23:07:17 +0900
Message-ID: <CAMZ6RqJrondTGhM8P4uZ47GxUfBiMLO0oc2VDwhUxnStE4Kx_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] usb: rework usb_maxpacket() and remove its third argument
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri. 22 Apr. 2022 at 23:00, Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
> On Fri. 22 Apr. 2022 at 22:38, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Thu, Mar 17, 2022 at 12:55:05PM +0900, Vincent Mailhol wrote:
> > > This series rework usb_maxpacket() to change its prototype from:
> > > | static inline __u16
> > > | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> > >
> > > into:
> > > | static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
> > >
> > > and rewrite the function using usb_pipe_endpoint().
> > >
> > > Rationale:
> > >
> > >   * The third argument of usb_maxpacket(): is_out can be derived from
> > >     its second one: pipe using usb_pipeout(pipe). Furthermore,
> > >     usb_pipeout(pipe) is being called within usb_maxpacket()
> > >     regardless to confirm the input.
> > >
> > >   * This function is not exposed to the UAPI so return type should be
> > >     u16, not __u16.
> > >
> > >   * usb_pipe_endpoint() (defined a couple of lines before) does most
> > >     of the work. Use it instead of reimplementing the same thing
> > >     again.
> > >
> > > In order to do so, usb_maxpacket() is temporarily changed into a variadic
> > > function to ignore its third argument.
> > >
> > > The series goes as follow:
> > >
> > >     * Patch 1: make usb_maxpacket() variadic to accommodate during the
> > >       migration
> > >
> > >     * Patch 2 to 7: migrate all the users of usb_maxpacket() (one
> > >       patch per tree)
> > >
> > >     * Patch 8: remove the third argument of usb_maxpacket() now that
> > >       everyone is migrated
> > >
> > >     * Patch 9: rework usb_maxpacket()'s body using usb_pipe_endpoint()
> >
> > Now queued up, thanks for sticking with this!
>
> Thanks to you for your patience and explanations!
>
> > Can you send the follow-up patch that removes the vararg?  I'll keep
> > that in my tree to try to catch any remaining things that come in and
> > get it merged when it's ok to.
>
> It is this patch:
> https://lore.kernel.org/linux-usb/20220317035514.6378-9-mailhol.vincent@wanadoo.fr/
>
> Or do you prefer me to resend it on the mailing list?

Actually, you already added it to your tree:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=386311fd6ef976eb1e3febd836b4ce2425f0ef37

I am not sure I understand what you want me to do here. Sorry.
