Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7D550E3E2
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 17:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbiDYPDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 11:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242676AbiDYPDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 11:03:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DF82182E
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:00:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E53AB8185E
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 15:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6475CC385A4;
        Mon, 25 Apr 2022 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650898837;
        bh=/fgieRyVgKGlgqVwBjL5ysIMnsJxsSX8QS7oM+ko/jw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aOwCkoA599eT0P/bsS6f+AZaa5b1Z0WGaO4osWv6cZEE+G4AkMtxDU92cQNFSkOY1
         zkhepVC8fysJOG4RMpeaArrUZHIibBJLgBUgtGzHryllGQck6I05+mlNmuaP4vSDeT
         KAmJS6siB4v2GV7C2HyOcf7S0WVZcUJis5hk3evg=
Date:   Mon, 25 Apr 2022 17:00:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <Yma3k3lRMIEFypMN@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 04:28:40PM +0200, Bastien Nocera wrote:
> On Mon, 2022-04-25 at 16:10 +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 25, 2022 at 03:23:15PM +0200, Bastien Nocera wrote:
> > > There is a need for userspace applications to open USB devices
> > > directly,
> > > for all the USB devices without a kernel-level class driver, and
> > > implemented in user-space.
> > > 
> > > End-user access is usually handled by the uaccess tag in systemd,
> > > shipping application-specific udev rules that implement this
> > > without too
> > > much care for sandboxed applications, or overall security, or just
> > > sudo.
> > > 
> > > A better approach is what we already have for evdev devices: give
> > > the
> > > application a file descriptor and revoke it when it may no longer
> > > access
> > > that device.
> > 
> > Who is going to use this "better" approach?  Is there support in
> > libusb
> > for it?  Who talks raw usbfs other than libusb these days?
> 
> Did you read the follow-up mail with the links to example code for the
> hid revoke support?

HID revoke does not mess with usbfs though.  Or if it does, I don't
understand the connection.

And usually the 0/X email has the context, not follow-on messages that I
didn't read yet :)


> > > This patch is the USB equivalent to the EVIOCREVOKE ioctl, see
> > > commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full details.
> > 
> > c7dc65737c9a ("Input: evdev - add EVIOCREVOKE ioctl") is how I
> > thought
> > we were supposed to write out commits in changelogs these days :)
> > 
> > > 
> > > Note that this variant needs to do a few things that the evdev
> > > revoke
> > > doesn't need to handle, particular:
> > > - cancelling pending async transfers
> > > - making sure to release claimed interfaces on revoke so they can
> > > be
> > >   opened by another process/user, as USB interfaces require being
> > >   exclusively claimed to be used.
> > 
> > I love the idea of a real revoke() someday, but can't you just do the
> > "unbind/bind" hack instead if you really want to do this?  Who wants
> > to
> > pass usbfs file descriptors around these days?
> 
> Again, please read the follow-up mail where I talk of the BPF support
> patch that would allow revoking USB fds without relying on a service in
> the middle to access devices (although that's eventually going to be
> the way to do things to allow elevating access to devices).

So would bpf be working at the usbfs level here?  I still don't
understand the connection...

thanks,

greg k-h
