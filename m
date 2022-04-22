Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0690E50B9F0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 16:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448554AbiDVOWE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 10:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392400AbiDVOWA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 10:22:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929EB5AEE3
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 07:19:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3513BB82D8A
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 14:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C142C385A8;
        Fri, 22 Apr 2022 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650637144;
        bh=P51MMtuc9cV2RABg2Z/nQvns0RHea9blN6YvSJrn6k4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YgkjARs0+kO//LVqLaGF+6ebKeI48n0Km7XzxAYJFlxPuSq104QpA/zqtmZhiHqUN
         N9CbdgNN7lDnO3nX8lYQWXRphltjXJX7gBWlKGcggs0ilL00qRaSoWUtyB0jCwHcSN
         b0xRr+LLtTbFDRFWOdYgg6IVK0XnHCEF9P+J2azA=
Date:   Fri, 22 Apr 2022 16:19:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 0/9] usb: rework usb_maxpacket() and remove its third
 argument
Message-ID: <YmK5Vc0+3eOJCXdK@kroah.com>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
 <YmKv37an0DR7/iPE@kroah.com>
 <CAMZ6RqKhJ5aypM+dBF38nL626PDdD-gr2AHJz1ozpov+OSzbAw@mail.gmail.com>
 <CAMZ6RqJrondTGhM8P4uZ47GxUfBiMLO0oc2VDwhUxnStE4Kx_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ6RqJrondTGhM8P4uZ47GxUfBiMLO0oc2VDwhUxnStE4Kx_w@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 11:07:17PM +0900, Vincent MAILHOL wrote:
> On Fri. 22 Apr. 2022 at 23:00, Vincent MAILHOL
> <mailhol.vincent@wanadoo.fr> wrote:
> > On Fri. 22 Apr. 2022 at 22:38, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Thu, Mar 17, 2022 at 12:55:05PM +0900, Vincent Mailhol wrote:
> > > > This series rework usb_maxpacket() to change its prototype from:
> > > > | static inline __u16
> > > > | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> > > >
> > > > into:
> > > > | static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
> > > >
> > > > and rewrite the function using usb_pipe_endpoint().
> > > >
> > > > Rationale:
> > > >
> > > >   * The third argument of usb_maxpacket(): is_out can be derived from
> > > >     its second one: pipe using usb_pipeout(pipe). Furthermore,
> > > >     usb_pipeout(pipe) is being called within usb_maxpacket()
> > > >     regardless to confirm the input.
> > > >
> > > >   * This function is not exposed to the UAPI so return type should be
> > > >     u16, not __u16.
> > > >
> > > >   * usb_pipe_endpoint() (defined a couple of lines before) does most
> > > >     of the work. Use it instead of reimplementing the same thing
> > > >     again.
> > > >
> > > > In order to do so, usb_maxpacket() is temporarily changed into a variadic
> > > > function to ignore its third argument.
> > > >
> > > > The series goes as follow:
> > > >
> > > >     * Patch 1: make usb_maxpacket() variadic to accommodate during the
> > > >       migration
> > > >
> > > >     * Patch 2 to 7: migrate all the users of usb_maxpacket() (one
> > > >       patch per tree)
> > > >
> > > >     * Patch 8: remove the third argument of usb_maxpacket() now that
> > > >       everyone is migrated
> > > >
> > > >     * Patch 9: rework usb_maxpacket()'s body using usb_pipe_endpoint()
> > >
> > > Now queued up, thanks for sticking with this!
> >
> > Thanks to you for your patience and explanations!
> >
> > > Can you send the follow-up patch that removes the vararg?  I'll keep
> > > that in my tree to try to catch any remaining things that come in and
> > > get it merged when it's ok to.
> >
> > It is this patch:
> > https://lore.kernel.org/linux-usb/20220317035514.6378-9-mailhol.vincent@wanadoo.fr/
> >
> > Or do you prefer me to resend it on the mailing list?
> 
> Actually, you already added it to your tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=386311fd6ef976eb1e3febd836b4ce2425f0ef37
> 
> I am not sure I understand what you want me to do here. Sorry.

Ah, sorry, you are right, I was expecting it to be the last patch in the
series, not second-to-last.  All is good!
