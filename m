Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB3463C23C
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 15:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbiK2ORZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 09:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235722AbiK2ORA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 09:17:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA2D66C95
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 06:15:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACB146175C
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 14:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161C9C433D6;
        Tue, 29 Nov 2022 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669731309;
        bh=BW6QiWAvNx2ywIyD89QpWlMj5lkllVe7AkBM4nh7Cxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ThRjkogBWL51756j+mnfL3yb9wuARg+pOpsuq8whio3V1NKSaJlYqy0nW4FhaQer2
         5a8muf84m0wwE7UeW93E1s6xfa5AykRYp+wa/7buwteiG7Ln1tQbq72ZKZC9uTfJj0
         mrtGr/BsdAbA0udBgIB38b8GQgYJys0aHEgPEkIDQ0dhiTMELS2QNUpGZmf0KgcgOh
         iist/DEe/LvnaaZUolUaG41AMi1lK6ajgbLBbYkykOEuOYxRWNRPdD+gc3kpbhu5xN
         uu4UUCUU8dXrB2WGdDjnEzryBNRHTvB0M0MojZMOd0dfUQTQgzkuZCBulznrVM96jc
         xEOGYWlnr0rYg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1p01O8-0003wL-CY; Tue, 29 Nov 2022 15:15:09 +0100
Date:   Tue, 29 Nov 2022 15:15:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     Russell King <linux@armlinux.org.uk>, linux-usb@vger.kernel.org,
        alexhenrie24@gmail.com, Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Message-ID: <Y4YT7D6AoD31UdOC@hovoldconsulting.com>
References: <20221126035825.6991-1-alexh@vpitech.com>
 <Y4TItxxwSNy7OnMA@hovoldconsulting.com>
 <3642317.iIbC2pHGDl@demeter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3642317.iIbC2pHGDl@demeter>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 28, 2022 at 11:08:25AM -0700, Alex Henrie wrote:
> On Monday, November 28, 2022 7:41:59 AM MST Johan Hovold wrote:
> > On Fri, Nov 25, 2022 at 08:58:25PM -0700, Alex Henrie wrote:
> > > When a baud rate of 0 is requested, both the 8250 driver and the FTDI
> > > driver reset the baud rate to the default of 9600 (see the comment above
> > > the uart_get_baud_rate function). Some old versions of the NXP blhost
> > > utility depend on this behavior.
> > 
> > What exactly do you mean by "depend on" here? Setting B0 is supposed to
> > hang up a modem connection by deasserting the modem control lines, but
> > there's nothing mandating any particular line speed to be set in
> > hardware. Why would that even matter?
> > 
> > If the user space tool is thrown off by the fact that B0 isn't
> > implemented, perhaps that's what should be addressed.
> 
> Oh, it's definitely a bug in blhost. The program sets the baud rate to 0, then 
> tries to communicate over the UART assuming that the baud rate is 9600. It's 
> been fixed in the latest version of blhost, but I'm stuck on an old version and 
> there's nothing I can do about that.
> 
> I don't know why the 8250 and FTDI drivers map B0 to B9600, however it's very 
> old behavior that must have had a purpose.

Heh, not everything has a purpose even if it's old.

For implementation and protocol reasons a driver may need to pick some
arbitrary speed to use for B0, but this is generally not needed for USB
serial devices and only about half of the drivers do so (and then tend
to pick 9600).

Also note that the FTDI driver does in fact leave the line speed
unchanged when B0 is requested (that zero-baud check in
get_ftdi_divisor() is only used for ASYNC_SPD_CUST).

> Maybe Russell knows? Alternatively, 
> leaving the baud rate unchanged seems like reasonable behavior and would also 
> work with the old blhost. But mapping B0 to B300 makes even less sense than 
> mapping it to B9600.

Your application really should not depend on any particular hardware
setting after requesting B0.

That said, I've implemented support for B0 in cp210x which leaves the
current settings unchanged (and which incidentally allows you to
use the buggy tool).

Johan
