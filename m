Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FCC4AF0A8
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 13:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbiBIMDs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 07:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbiBIMDO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 07:03:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0737C00190E
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 03:39:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5AB936114D
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 11:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE66C340E7;
        Wed,  9 Feb 2022 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644406759;
        bh=aGWQEHQnXlgZ5CIujaYLiNjiluvdwkjgX6cw2FOAIFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OpdS5zGOYIVrDv0WdNsZp1CcZ3/IokBMKxjPMjjm6P7IwjaXfv9OHJwMnIJZpk4TX
         cngxgO9so+j940fn1pT8r2U8M7LkMjm+LTGprUX/uwkESKONXSRuXmm99UgWUE+Jnl
         VeYVglodvHDyPfrg/13SmQ3EBZQ4iJQrL0kNeeGA=
Date:   Wed, 9 Feb 2022 12:39:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eduard-Bogdan Budai <eduard.budai@rcs-rds.ro>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Bug report for pl2303 converter (ATEN USB to serial Bridge,
 idVendor=067b, idProduct=23a3, bcdDevice= 1.05)
Message-ID: <YgOn5PIQWOrcv146@kroah.com>
References: <10d4dbe9-4b17-aeb5-0abe-bf0829173c1d@rcs-rds.ro>
 <e85bac58-6d40-b61a-b217-8c4ee3c5853e@rcs-rds.ro>
 <YgJCwn5s1Cv/LT5I@kroah.com>
 <35338b26-41db-e772-235a-502caa30e00f@rcs-rds.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35338b26-41db-e772-235a-502caa30e00f@rcs-rds.ro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 12:13:28PM +0200, Eduard-Bogdan Budai wrote:
>  Thank you very much for your answer.
> 
> The newest kernel that is in the standard Ubuntu 20.04 repositories is
> today Linux 5.13.0-28-generic #31~20.04.1-Ubuntu SMP Wed Jan 19 14:08:10
> UTC 2022 x86_64). After moving from 5.13.0-27-generic #29~20.04.1-Ubuntu
> to the newest 5.13.0-28-generic #31~20.04.1-Ubuntu, the dmesg showed:
> 
> [Wed Feb  9 11:38:51 2022] usb 3-2: new full-speed USB device number 4
> using xhci_hcd
> [Wed Feb  9 11:38:51 2022] usb 3-2: New USB device found, idVendor=067b,
> idProduct=23a3, bcdDevice= 1.05
> [Wed Feb  9 11:38:51 2022] usb 3-2: New USB device strings: Mfr=1,
> Product=2, SerialNumber=0
> [Wed Feb  9 11:38:51 2022] usb 3-2: Product: ATEN USB to Serial Bridge
> [Wed Feb  9 11:38:51 2022] usb 3-2: Manufacturer: Prolific Technology
> Inc.
> [Wed Feb  9 11:38:51 2022] usbcore: registered new interface driver
> usbserial_generic
> [Wed Feb  9 11:38:51 2022] usbserial: USB Serial support registered for
> generic
> [Wed Feb  9 11:38:51 2022] usbcore: registered new interface driver
> pl2303
> [Wed Feb  9 11:38:51 2022] usbserial: USB Serial support registered for
> pl2303
> [Wed Feb  9 11:38:51 2022] pl2303 3-2:1.0: unknown device type, please
> report to linux-usb@vger.kernel.org
> 
> A 5.4.0-99-generic #112~18.04.1-Ubuntu SMP Thu Feb 3 14:09:57 UTC 2022
> x86_64 from a Ubuntu 18.04 recognizes the same adapter as a ttyUSB0
> (which is what is needed to be used).
> 
> Unfortunately, the environment in which happened what I described below
> has certain restrictions that don't allow me to try a newer kernel than
> the newest that is in the standard Ubuntu repositories...

I would suggest going and getting support from those that are imposing
those odd restrictions on you, as they are not allowing you to use the
hardware you need to use :(

Good luck!

greg k-h
