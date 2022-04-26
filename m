Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A850FB3B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 12:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349384AbiDZKqe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 26 Apr 2022 06:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345309AbiDZKqJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 06:46:09 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43251131
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 03:37:17 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 8D882E000F;
        Tue, 26 Apr 2022 10:37:14 +0000 (UTC)
Message-ID: <e43f9fe95a763efbe959084ea3f2dcd0a75f666f.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 26 Apr 2022 12:37:14 +0200
In-Reply-To: <YmfJr46kLZ3MtiCU@kroah.com>
References: <YmarwaNQYn1GwFbQ@kroah.com>
         <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
         <Yma3k3lRMIEFypMN@kroah.com>
         <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
         <YmbCBwEMvKO5z0Dh@kroah.com> <YmdYfK5Vi+lEl7FX@quokka>
         <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
         <YmedlsENjNjc8yML@kroah.com>
         <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
         <d49aeb3cd8f67674eb87bf4bc93f617937649bc7.camel@hadess.net>
         <YmfJr46kLZ3MtiCU@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2022-04-26 at 12:30 +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 26, 2022 at 12:07:32PM +0200, Bastien Nocera wrote:
> > On Tue, 2022-04-26 at 10:46 +0200, Oliver Neukum wrote:
> > > 
> > > 
> > > On 26.04.22 09:21, Greg Kroah-Hartman wrote:
> > > > Yes, but, it's not so simple.  Many people have asked for
> > > > revoke()
> > > > to be
> > > > added as a syscall like is in the BSDs, but the BSDs only allow
> > > > that for
> > > > a very small subset of file descriptor types, and doing it in a
> > > > generic
> > > > fashion seems very difficult (I tried a few years ago and gave
> > > > up,
> > > > but
> > > > my knowledge of the vfs layer is minimal.)
> > > Well, then we should go for the minimalist approach and just
> > > add a hook to VFS. Multiple different ioctl()s are definitely a
> > > bad
> > > idea.
> > > An frevoke() looks much easier to do than one based on paths.
> > > If I understand the issue behind the proposal correctly the
> > > caller
> > > has opened the device.
> > 
> > Doesn't look like FreeBSD at least has an frevoke() syscall
> > anymore, it
> > had an FREVOKE flag, which is now a define for the O_VERIFY option
> > which has quite different semantics:
> > https://www.freebsd.org/cgi/man.cgi?sektion=2&query=open
> 
> Take a look at this implementation:
>         https://man.openbsd.org/revoke.2
> 
I don't think anyone wants to implement path based syscalls, and again,
it's equivalent to remote closing the fd, not to disabling the access
to the device:
"If the file is a special file for a device which is open, the device
close function is called as if all open references to the file had been
closed."

If there's an implementation done at the VFS level, it should probably
try to steer away from those earlier disparate implementations.
