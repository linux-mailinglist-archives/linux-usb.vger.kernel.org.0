Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41AC450FBC3
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345831AbiDZLPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349487AbiDZLNx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:13:53 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C542D45ADC
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:10:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 49950CE1A4F
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 11:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03865C385A0;
        Tue, 26 Apr 2022 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650971442;
        bh=PSnB5n9Oy0FIntYg4S3JiHi7XxetpXLfpd8AjK/N1X8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fo6FU028U1Zlx5FJF/QLeOVXx60XRSn2JVhhbZ0B1zdEr7Nmr+5QIwgi7dNF80UXR
         o3eQbsxKwvsBTKby2gXdqw6i9rrpFh0Z2aWFaJqVRq3bbbPM49i+vtH7fyqKHq/aCU
         Lxq+FRy9vt9H4aE6ngK5MeyqDictrDLRrbGj+BR0=
Date:   Tue, 26 Apr 2022 13:10:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmfTL1gsV7lNS8iE@kroah.com>
References: <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com>
 <YmdYfK5Vi+lEl7FX@quokka>
 <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
 <YmedlsENjNjc8yML@kroah.com>
 <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
 <d49aeb3cd8f67674eb87bf4bc93f617937649bc7.camel@hadess.net>
 <YmfJr46kLZ3MtiCU@kroah.com>
 <e43f9fe95a763efbe959084ea3f2dcd0a75f666f.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e43f9fe95a763efbe959084ea3f2dcd0a75f666f.camel@hadess.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 12:37:14PM +0200, Bastien Nocera wrote:
> On Tue, 2022-04-26 at 12:30 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 26, 2022 at 12:07:32PM +0200, Bastien Nocera wrote:
> > > On Tue, 2022-04-26 at 10:46 +0200, Oliver Neukum wrote:
> > > > 
> > > > 
> > > > On 26.04.22 09:21, Greg Kroah-Hartman wrote:
> > > > > Yes, but, it's not so simple.  Many people have asked for
> > > > > revoke()
> > > > > to be
> > > > > added as a syscall like is in the BSDs, but the BSDs only allow
> > > > > that for
> > > > > a very small subset of file descriptor types, and doing it in a
> > > > > generic
> > > > > fashion seems very difficult (I tried a few years ago and gave
> > > > > up,
> > > > > but
> > > > > my knowledge of the vfs layer is minimal.)
> > > > Well, then we should go for the minimalist approach and just
> > > > add a hook to VFS. Multiple different ioctl()s are definitely a
> > > > bad
> > > > idea.
> > > > An frevoke() looks much easier to do than one based on paths.
> > > > If I understand the issue behind the proposal correctly the
> > > > caller
> > > > has opened the device.
> > > 
> > > Doesn't look like FreeBSD at least has an frevoke() syscall
> > > anymore, it
> > > had an FREVOKE flag, which is now a define for the O_VERIFY option
> > > which has quite different semantics:
> > > https://www.freebsd.org/cgi/man.cgi?sektion=2&query=open
> > 
> > Take a look at this implementation:
> >         https://man.openbsd.org/revoke.2
> > 
> I don't think anyone wants to implement path based syscalls, and again,
> it's equivalent to remote closing the fd, not to disabling the access
> to the device:
> "If the file is a special file for a device which is open, the device
> close function is called as if all open references to the file had been
> closed."

You forgot the sentence before that which is the functionality we want
here:
	Subsequent operations on any such descriptors fail, with the
	exceptions that a read() from a tty which has been revoked
	returns a count of zero (end of file), and a close() call will
	succeed.

And don't do it only for a tty device, but for any device that
implements it.

And yes, we don't want to work off of a path, but a file descriptor:
	int revoke(int fd);

> If there's an implementation done at the VFS level, it should probably
> try to steer away from those earlier disparate implementations.

Agreed.

thanks,

greg k-h
