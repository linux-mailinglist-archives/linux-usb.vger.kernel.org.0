Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE124CDAB8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 18:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241217AbiCDReF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 12:34:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241264AbiCDRdv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 12:33:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D840C4968E
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 09:32:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5365461E9C
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 17:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6B9C340E9;
        Fri,  4 Mar 2022 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646415178;
        bh=mqbH9cmzcVVnDf3CLe0orBmHffsSgF771a4LkCQ+Yss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uM/QSVyqZipV/pVaBhJdV0n14PhfRIKDjCk/Sclhgm44jFmnXmAmH9p3W6Q8/Yhrg
         SU0DC15l5YxNUwsvjMy6AbXCSfSv8Hcn7SjwmnfrPTe0Tj4m+5x3ybEpMO0/f4Tzko
         hzXO02QiZlBNz/mEGz0XX9vzWEsH3fQLELXfJAhg=
Date:   Fri, 4 Mar 2022 18:32:51 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: rework usb_maxpacket() and remove its third argument
Message-ID: <YiJNQwGKAyHTuPTg@kroah.com>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <YiIgGOkNntEiu78O@kroah.com>
 <CAMZ6RqKcHtNmcp+F1ZpGckCdOdeUp4HbY+ccVcjO4Xh2=unzFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ6RqKcHtNmcp+F1ZpGckCdOdeUp4HbY+ccVcjO4Xh2=unzFg@mail.gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_RED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 05, 2022 at 02:23:46AM +0900, Vincent MAILHOL wrote:
> <Removed people in CC>
> 
> On Fri. 4 Mar. 2022 at 23:20, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Fri, Mar 04, 2022 at 07:53:50PM +0900, Vincent Mailhol wrote:
> > > Change the prototype of usb_maxpacket() from:
> > > | static inline __u16
> > > | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> > >
> > > into:
> > > | static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
> > >
> > > and rewrite the function.
> > >
> > > Rationale:
> > >
> > >   * The third argument of usb_maxpacket(): is_out can be derived from
> > >     its second one: pipe using usb_pipeout(pipe). Furthermore,
> > >     usb_pipoout(pipe) is being called within usb_maxpacket()
> > >     regardless to confirm the input.
> > >
> > >   * This function is not exposed to the UAPI so return type should be
> > >     u16, not __u16.
> > >
> > >   * Let's not reinvent the wheel and rely on usb_endpoint_maxp() to
> > >     make this a one liner function.
> > >
> > > All the users of usb_endpoint_maxp() are then updated.
> > >
> > > Two of the users: oxu210hp-hcd.c and isp1760-hcd.c rely on a local
> > > macro: max_packet() to mask the maximum size. Because this masking is
> > > already performed by usb_maxpacket(), this patch also removes these
> > > redundant sanitization and remove the local macro if not needed any
> > > more (keep it in oxu210hp-hcd.c which uses it elsewhere but remove it
> > > in isp1760-hcd.c).
> >
> > This type of "change all callers of this function" is brutal to do like
> > this, as is evident by the number of people you had to cc: here.
> >
> > How about doing it the normal way.  Create a new function, with the
> > proper options you wish to see be used, and then move everyone over to
> > it, and when that is done, remove the old function.  Bonus points for
> > doing this with some crazy macros to keep the old name in the end (it
> > can be done, but I don't recommend it for the faint-of-heart, so it's
> > not required.)
> 
> Thank you for the explanation :)
> 
> If I understand correctly, I should:
>   * First change linux/usb.h

Yes.

>   * Wait for other trees to pull the patch

Pull what?

>   * Change the drivers

You can fix up many of these at the same time in a patch series.  I can
take many of them in the USB tree as well if needed.

>   * Clean up linux/usb.h
> 
> I did not find the inspiration for a better name so I would like to
> keep the old one.
> Would the below code meet your expectation of "doing some crazy macros"?
> 
> | static inline u16 __usb_maxpacket(struct usb_device *dev, int pipe)
> | {
> |     return usb_endpoint_maxp(&usb_pipe_endpoint(dev, pipe)->desc);
> | }
> |
> | #define usb_maxpacket(dev, pipe, deprecated...) __usb_maxpacket(dev, pipe)

Yeah, as you are just dropping the last argument, that might be all that
is needed as this could be quite simpler than I was thinking.

Try it and see!

thanks,

greg k-h
