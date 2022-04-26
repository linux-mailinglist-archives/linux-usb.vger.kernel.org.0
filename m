Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B160C50F23B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 09:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343956AbiDZHZQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 03:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343965AbiDZHZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 03:25:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7573F894
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 00:22:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E418A61601
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 07:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE2FC385A0;
        Tue, 26 Apr 2022 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650957721;
        bh=c7As/rgh0lQt/r5Kx5t55nF0thvn6V/6WYn5a68PP58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UVxCqw49/jORmsbtJfZTVzbuM5TsxIMFsgDgis6Vv0Z8MMA26Pi+cj6H9pnjneN9y
         FL+F/pulSUd9xnKrlxeozgyG6HSE3v3SKh7gn+fH5Niv2nZN/Q/kYq/tZ7ArSvGRKA
         tven44xyJLeIhQ6nxa0HzWz4x/YcegoTAIl5cqTM=
Date:   Tue, 26 Apr 2022 09:21:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmedlsENjNjc8yML@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com>
 <YmdYfK5Vi+lEl7FX@quokka>
 <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 09:14:04AM +0200, Oliver Neukum wrote:
> 
> 
> On 26.04.22 04:27, Peter Hutterer wrote:
> >
> > chiming in here: the hidraw ioctl is independent (as already mentioned)
> > but it's basically the same approach and/or intent. The hidraw revoke ioctl is
> > "the evdev revoke, but for hidraw", this one is "the evdev revoke, but for
> > usb". Not very creative, but at least we can point to prior art and say "this
> > seems to be useful" :)
> >
> > The primary focus of all this are joystick devices (unless I missed some other
> > grand plans Bastien had that I'm not aware of), that should put things in
> > context a bit. 
> >
> Hi,
> 
> taking the advantages as a given, I must still ask, why this, if it is
> so useful,
> should be implemented for each subsystem separately. I cannot help but
> say that this should go into the VFS.

Yes, but, it's not so simple.  Many people have asked for revoke() to be
added as a syscall like is in the BSDs, but the BSDs only allow that for
a very small subset of file descriptor types, and doing it in a generic
fashion seems very difficult (I tried a few years ago and gave up, but
my knowledge of the vfs layer is minimal.)

However doing it as a per-device/subsystem ioctl also seems crazy so
perhaps we do just implement it at the vfs layer and let whatever
device/filesystem type that wants to support it, hook up to it.  That
would make it much easier over time to implement in a way that works for
everyone and is easier to understand from userspace.

thanks,

greg k-h
