Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1AC51325E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 13:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbiD1LZY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 28 Apr 2022 07:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245064AbiD1LZU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Apr 2022 07:25:20 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB435EDE1
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 04:22:05 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id CF5CE24000E;
        Thu, 28 Apr 2022 11:22:00 +0000 (UTC)
Message-ID: <d4c72d3d8d25f25bd12cdfbf3e7efe3ea1c3f0a7.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 28 Apr 2022 13:21:54 +0200
In-Reply-To: <fbc988f7-5cd3-2ac8-12cc-f09ae005247d@suse.com>
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
         <e43f9fe95a763efbe959084ea3f2dcd0a75f666f.camel@hadess.net>
         <fbc988f7-5cd3-2ac8-12cc-f09ae005247d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2022-04-28 at 12:28 +0200, Oliver Neukum wrote:
> 
> 
> On 26.04.22 12:37, Bastien Nocera wrote:
> > 
> > I don't think anyone wants to implement path based syscalls,
> > and again,
> > it's equivalent to remote closing the fd, not to disabling the
> > access
> > to the device:
> > "If the file is a special file for a device which is open, the
> > device
> > close function is called as if all open references to the file had
> > been
> > closed."
> OK, so do we still have a need to discuss this specifically to usbfs?
> I suppose if you put this into VFS, you will need a hook to map the
> syscall to drivers that need to handling ioctl() having effects
> beyond
> their syscall abstractly speaking.

I'm afraid that I don't have any intentions on working on this feature
at the vfs level. As I already mentioned, I think that the semantics
are too different to make sense at that level.

I'm instead investigating having an ioctl-less BPF interface, with the
help of Benjamin and Peter.
