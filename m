Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA7E50FA6E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 12:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348592AbiDZKbG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 26 Apr 2022 06:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240781AbiDZKaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 06:30:35 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8DCEDB5D
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 03:07:35 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id AC288E0008;
        Tue, 26 Apr 2022 10:07:33 +0000 (UTC)
Message-ID: <d49aeb3cd8f67674eb87bf4bc93f617937649bc7.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 26 Apr 2022 12:07:32 +0200
In-Reply-To: <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
References: <20220425132315.924477-1-hadess@hadess.net>
         <YmarwaNQYn1GwFbQ@kroah.com>
         <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
         <Yma3k3lRMIEFypMN@kroah.com>
         <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
         <YmbCBwEMvKO5z0Dh@kroah.com> <YmdYfK5Vi+lEl7FX@quokka>
         <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
         <YmedlsENjNjc8yML@kroah.com>
         <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2022-04-26 at 10:46 +0200, Oliver Neukum wrote:
> 
> 
> On 26.04.22 09:21, Greg Kroah-Hartman wrote:
> > Yes, but, it's not so simple.  Many people have asked for revoke()
> > to be
> > added as a syscall like is in the BSDs, but the BSDs only allow
> > that for
> > a very small subset of file descriptor types, and doing it in a
> > generic
> > fashion seems very difficult (I tried a few years ago and gave up,
> > but
> > my knowledge of the vfs layer is minimal.)
> Well, then we should go for the minimalist approach and just
> add a hook to VFS. Multiple different ioctl()s are definitely a bad
> idea.
> An frevoke() looks much easier to do than one based on paths.
> If I understand the issue behind the proposal correctly the caller
> has opened the device.

Doesn't look like FreeBSD at least has an frevoke() syscall anymore, it
had an FREVOKE flag, which is now a define for the O_VERIFY option
which has quite different semantics:
https://www.freebsd.org/cgi/man.cgi?sektion=2&query=open

"O_VERIFY may be used to indicate to the kernel that the contents of
the file should be verified before allowing the open to proceed.  The
details of what "verified" means is implementation specific. The run-
time linker (rtld) uses this flag to ensure shared objects have been
verified before operating on them."

The AIX frevoke() also has different semantics:
https://www.ibm.com/docs/en/aix/7.3?topic=f-frevoke-subroutine

"All accesses to the file are revoked, except through the file
descriptor specified by the FileDescriptor parameter to the frevoke
subroutine."
and:
"Currently the frevoke subroutine works only on terminal devices."

The point of USBDEVFS_REVOKE, and the other variants is to revoke
access to the device, not to the file descriptor itself.

If you're reticent to adding new ioctls, we could try and do that
exclusively through BPF. The only thing that didn't look like the BPF
codepath could do was wake up the fd so that fd could be poll()ed and
error out immediately.
