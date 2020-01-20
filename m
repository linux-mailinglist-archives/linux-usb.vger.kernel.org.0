Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F3B14286B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 11:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgATKsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 05:48:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:41096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgATKsG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 05:48:06 -0500
Received: from localhost (unknown [89.205.129.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56CE520674;
        Mon, 20 Jan 2020 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579517286;
        bh=A6DiGLMBVimNXD2eBpF3hX6vLvICv8s7JH2mP4Y4tEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jTYgHek6QV1bzoQqCJmuScMbN05Mx+tdKBZaUm/Fnp5yvhChqecZgVdqv6W7vXgEF
         eTWkVzz1OhDsFbEpTed0g64ZfQDVhdqdD8bN4gHR7v61F2YoBgrCJVVnWU5qSkCxCL
         wb4XLsbsL62G7Vd2zH5qAU8QqADFE3QJs5qc7ugI=
Date:   Mon, 20 Jan 2020 11:48:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: No message is showed after USB gadget has configured
Message-ID: <20200120104801.GA421434@kroah.com>
References: <20200120090357.GB19938@b29397-desktop>
 <20200120092934.GA382520@kroah.com>
 <VI1PR04MB53272657D56EE193CEB29CC68B320@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB53272657D56EE193CEB29CC68B320@VI1PR04MB5327.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 20, 2020 at 09:48:24AM +0000, Peter Chen wrote:
>  
> > On Mon, Jan 20, 2020 at 09:03:59AM +0000, Peter Chen wrote:
> > > Hi all,
> > >
> > > >From commit 1cbfb8c4f62d ("usb: gadget: Quieten gadget config
> > > >message"),
> > > there is no any message from gadget side after it connects to host and
> > > works correctly. Although we could cat "state" under
> > > /sys/class/udc/$CONTROLLER/ to know its state, we can't easily know if
> > > the gadget works or not from console, USB host could have many
> > > messages after one device has connected, why we can't keep one for USB
> > > gadget?
> > 
> > Why not make "normal" USB devices quieter too? :)
> > 
> > Surely you do not have tools that watch syslog to determine if a device is working
> > properly or not, right?  That's what sysfs is for, not syslog entries.
> > 
> 
> Yes, we use our eyes during the hot plug test for device or count the number of
> messages for it, with this change, it may cause difficult for hot plug test. For
> other tests, we could judge sysfs before later tests.
> 
> Since this message in there many years, we (and tester) may need time to adapt for
> this change.

Can you just turn on dynamic debugging for that one line with a simple
echo to the debugfs file so that you still see this in your test
framework?

thanks,

greg k-h
