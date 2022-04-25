Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0803C50E2C5
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 16:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239160AbiDYOOc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 10:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242411AbiDYONS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 10:13:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CDC5F5E
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 07:10:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D5B15615F8
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 14:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C1CC385A4;
        Mon, 25 Apr 2022 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650895813;
        bh=9tVw7yDZL81YdG+2ZWi2I6ynkpUkEOvRh7L9bm1zsBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jLfhxG0j2Wn+hftYO+Zv3EP+4YSOdtgsNsKPHpID6+3yLUFGbyog9Rm1gA28O9/Jw
         CMO9txEO4imE9fsYCbHlLjWDAOkKADRgMSdGVP0SH0ir914nESMu3Ky+K0egmeV82+
         Sd1nxMxNHL0xB39ZzwK7GHp2CXveaFMwn94oT75A=
Date:   Mon, 25 Apr 2022 16:10:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmarwaNQYn1GwFbQ@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425132315.924477-1-hadess@hadess.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 03:23:15PM +0200, Bastien Nocera wrote:
> There is a need for userspace applications to open USB devices directly,
> for all the USB devices without a kernel-level class driver, and
> implemented in user-space.
> 
> End-user access is usually handled by the uaccess tag in systemd,
> shipping application-specific udev rules that implement this without too
> much care for sandboxed applications, or overall security, or just sudo.
> 
> A better approach is what we already have for evdev devices: give the
> application a file descriptor and revoke it when it may no longer access
> that device.

Who is going to use this "better" approach?  Is there support in libusb
for it?  Who talks raw usbfs other than libusb these days?

> 
> This patch is the USB equivalent to the EVIOCREVOKE ioctl, see
> commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full details.

c7dc65737c9a ("Input: evdev - add EVIOCREVOKE ioctl") is how I thought
we were supposed to write out commits in changelogs these days :)

> 
> Note that this variant needs to do a few things that the evdev revoke
> doesn't need to handle, particular:
> - cancelling pending async transfers
> - making sure to release claimed interfaces on revoke so they can be
>   opened by another process/user, as USB interfaces require being
>   exclusively claimed to be used.

I love the idea of a real revoke() someday, but can't you just do the
"unbind/bind" hack instead if you really want to do this?  Who wants to
pass usbfs file descriptors around these days?

thanks,

greg k-h
