Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512864AF3AF
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 15:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbiBIOIk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 09:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbiBIOIj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 09:08:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E05C0613C9
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 06:08:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CACB61A9D
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 14:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6620C340ED;
        Wed,  9 Feb 2022 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644415721;
        bh=r0ilACL0fgeiGnVYC9pMEByreU+ejOh2Nmjn25m5W+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ns6+hgNYwGpcXSquN5B4IChxQKZX9mBYyaey2ku03d99+BePmXB1K5ZblMwXfLPoK
         38Goas4+XKctHWT3gTx7YrZuyUdJ1S8zw7wOhvBl9xYE/jmMzXYEtZmD0oRCZeypmZ
         RW8ooHkOndkEHns4eZQIhV6QGWodpTvELt8zWrs2GZGHrT4mGpUQMUKGB1mMsztMwv
         b8CGsMqxNiDTrXgXa3VTXTMdBnTzed6gY12zEIDkxLiZ8L66J1b/Uv2TVi/48Dkm/a
         eZq4JuWPWyHCmFrXzkQxYGpRZTqoL2dc1AoNqVZe5WMVOKf6PN5WwIpDvZ4hr5zMiv
         efWz9dg7QILWA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nHndu-00028c-Q5; Wed, 09 Feb 2022 15:08:22 +0100
Date:   Wed, 9 Feb 2022 15:08:22 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Eduard-Bogdan Budai <eduard.budai@rcs-rds.ro>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: Bug report for pl2303 converter (ATEN USB to serial Bridge,
 idVendor=067b, idProduct=23a3, bcdDevice= 1.05)
Message-ID: <YgPK1r8nQuItp4Uh@hovoldconsulting.com>
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

Apparently Ubuntu has backported

	894758d0571d ("USB: serial: pl2303: tighten type HXN (G) detection")

to their 5.13 kernel, but not yet

	aa5721a9e0c9 ("USB: serial: pl2303: fix GC type detection")

This has been fixed in all upstream stable trees since 5.15.6.

I have no idea when Ubuntu will fix this in their tree. You'll need to
ask them.

> So, in my humble opinion, we will just have to wait for the 5.16 to
> appear in the standard Ubuntu repositories.

Anything newer than 5.15.6 should do.

Johan
