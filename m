Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB5C100130
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfKRJXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:23:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:34746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbfKRJXB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 04:23:01 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C33D20727;
        Mon, 18 Nov 2019 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574068979;
        bh=fsGjf6ja18hU8MUQbiO9eTAsWHAB0990+5cB2c9ZqKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SpLjDzhrfAUQr3tORIndwsKY6zb1PwT6N+M6sXAorpxOXIlrTXvNm56ztwtQfSsQZ
         JDDdNFfjUFP8GwtjSih7oTyqZa0ONqViZ8OHogmqVwg40OW3k3xAA9quQnLyoC4Gk0
         HHQOKW3zl6OiF6AG75KSpXWz2PPj+WaKRM96MARg=
Date:   Mon, 18 Nov 2019 10:22:56 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/4] xhci-pci: Allow host runtime PM as default also for
 Intel Ice Lake xHCI
Message-ID: <20191118092256.GA154107@kroah.com>
References: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
 <1573836603-10871-5-git-send-email-mathias.nyman@linux.intel.com>
 <20191116092552.GA390155@kroah.com>
 <f7b3a8c2-73c4-6c2d-497a-94ac6a879103@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7b3a8c2-73c4-6c2d-497a-94ac6a879103@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 11:15:21AM +0200, Mathias Nyman wrote:
> On 16.11.2019 11.25, Greg KH wrote:
> > On Fri, Nov 15, 2019 at 06:50:03PM +0200, Mathias Nyman wrote:
> > > From: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > 
> > > Intel Ice Lake has two xHCI controllers one on PCH and the other as part
> > > of the CPU itself. The latter is also part of the so called Type C
> > > Subsystem (TCSS) sharing ACPI power resources with the PCIe root ports
> > > and the Thunderbolt controllers. In order to put the whole TCSS block
> > > into D3cold the xHCI needs to be runtime suspended as well when idle.
> > > 
> > > For this reason allow runtime PM as default for Ice Lake TCSS xHCI
> > > controller.
> > > 
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > ---
> > >   drivers/usb/host/xhci-pci.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > Can this also be queued up for the stable tree (or at least for 5.4.y?)
> > 
> 
> Yes, please, 5.4.y
> Ice Lake Thunderbolt support [1] was accepted to 5.4-rc1 so 5.4.y makes sense.
> Patch is not that useful for older stable versions on its own.
> [1] 3cdb9446a117 thunderbolt: Add support for Intel Ice Lake

Ok, I'll try to remember it when it goes into Linus's tree.

thanks,

greg k-h
