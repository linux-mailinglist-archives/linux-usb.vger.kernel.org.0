Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E2B50B95D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 16:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448275AbiDVODm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 10:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352501AbiDVODl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 10:03:41 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C437C5A09E
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 07:00:47 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id w187so5253914ybe.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 07:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0SrTaFKBXdt581CIWUIgRZrhLx7z7RQiSd+BxSGtxO0=;
        b=BoAh/SsxPgqenHS6yyP+mc242tbBpMiY0c1IEgRPucQQKpQoaDowTHjb2xj4EhildT
         eOoWFdxUeY28zV93Xg9NITysermurVV5ofbgm7WuRJ/UR6bCbTa71ONT8WzUKH8W0Htl
         eq349Yzfz3dmsQTHu3LU3GKRsZGeXlzD6QgI+eRv0G8qtI+kgALsuitAverr1gea5XVg
         INK6ilZsIfv2Q3k2H27IayREy6j0GsUyKm8A1V54D9kkbEDLZZR2Az32gi4I2WegpMgp
         cNFTVP6GJdpaZ/z2oKYxi7hIATa7OPPVfoYWclR5DdXCmO9Kh7WEJ3yqjGsZFllAmBOd
         VfjQ==
X-Gm-Message-State: AOAM531x9XIa9/ZxZFCh++qoAPYx8Tsvr5JYKehqySPK8Yp1F+08kBiI
        Nt9bMXWK8ekFxAHak6yZeItWmRgDwgXbe3YtReQ=
X-Google-Smtp-Source: ABdhPJx1T27lE2wlb2UG+ylbTYX60SzIDdqm/4TD76y0LEInoRVarSGmSlSO0zYQ84kRlieRlAbXwz5qQ0Ei111Wbog=
X-Received: by 2002:a25:cb4b:0:b0:645:d702:eb15 with SMTP id
 b72-20020a25cb4b000000b00645d702eb15mr1740959ybg.500.1650636046666; Fri, 22
 Apr 2022 07:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr> <YmKv37an0DR7/iPE@kroah.com>
In-Reply-To: <YmKv37an0DR7/iPE@kroah.com>
From:   Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date:   Fri, 22 Apr 2022 23:00:35 +0900
Message-ID: <CAMZ6RqKhJ5aypM+dBF38nL626PDdD-gr2AHJz1ozpov+OSzbAw@mail.gmail.com>
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

On Fri. 22 Apr. 2022 at 22:38, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Mar 17, 2022 at 12:55:05PM +0900, Vincent Mailhol wrote:
> > This series rework usb_maxpacket() to change its prototype from:
> > | static inline __u16
> > | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> >
> > into:
> > | static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
> >
> > and rewrite the function using usb_pipe_endpoint().
> >
> > Rationale:
> >
> >   * The third argument of usb_maxpacket(): is_out can be derived from
> >     its second one: pipe using usb_pipeout(pipe). Furthermore,
> >     usb_pipeout(pipe) is being called within usb_maxpacket()
> >     regardless to confirm the input.
> >
> >   * This function is not exposed to the UAPI so return type should be
> >     u16, not __u16.
> >
> >   * usb_pipe_endpoint() (defined a couple of lines before) does most
> >     of the work. Use it instead of reimplementing the same thing
> >     again.
> >
> > In order to do so, usb_maxpacket() is temporarily changed into a variadic
> > function to ignore its third argument.
> >
> > The series goes as follow:
> >
> >     * Patch 1: make usb_maxpacket() variadic to accommodate during the
> >       migration
> >
> >     * Patch 2 to 7: migrate all the users of usb_maxpacket() (one
> >       patch per tree)
> >
> >     * Patch 8: remove the third argument of usb_maxpacket() now that
> >       everyone is migrated
> >
> >     * Patch 9: rework usb_maxpacket()'s body using usb_pipe_endpoint()
>
> Now queued up, thanks for sticking with this!

Thanks to you for your patience and explanations!

> Can you send the follow-up patch that removes the vararg?  I'll keep
> that in my tree to try to catch any remaining things that come in and
> get it merged when it's ok to.

It is this patch:
https://lore.kernel.org/linux-usb/20220317035514.6378-9-mailhol.vincent@wanadoo.fr/

Or do you prefer me to resend it on the mailing list?


Yours sincerely,
Vincent Mailhol
