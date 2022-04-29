Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B3514FD6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 17:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378238AbiD2Ptx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 11:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378617AbiD2Ptw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 11:49:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A39733365
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 08:46:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19B81B833A7
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 15:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880F5C385A7;
        Fri, 29 Apr 2022 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651247189;
        bh=g5k+KEhmTWniGGF1Pr1q2zMLtVoWz7Xz6i5msM4iaCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AyHWGFd+3Ba65jJav4PA8n9u0cBgHQE5NaIdL8Sx+HwI/3TkGhQHyzxuvha1x2vMe
         ZToJ5Nwy5/SVVlB752pX6cMqCgwyrk9k4dotIznS56gT3p5qMby0+bwV/bH+Yml0vz
         MxrBTSXUtonsDhte0Qd+20HGB597b3cAtDCIr2bs=
Date:   Fri, 29 Apr 2022 17:46:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     linux-usb@vger.kernel.org, marcel@holtmann.org
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Message-ID: <YmwIUztEs9OlZQB8@kroah.com>
References: <20220429153138.935435-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429153138.935435-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 29, 2022 at 05:31:38PM +0200, Jose Ignacio Tornos Martinez wrote:
> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip when usb device is unbound.
> Besides, "skip_unconfigure" sysfs entry has been created for
> testing purposes with these or other devices.
> 
> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/bluetooth/btusb.c  |  8 +++++++-
>  drivers/usb/core/generic.c |  2 +-
>  drivers/usb/core/sysfs.c   | 36 ++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h        |  2 ++
>  4 files changed, 46 insertions(+), 2 deletions(-)

No documentation for this new sysfs attribute you wish to create?
That's not going to help us with review :(

thanks,

greg k-h
