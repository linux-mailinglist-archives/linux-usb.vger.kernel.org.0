Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E5322CB18
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 18:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGXQcP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 12:32:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgGXQcO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jul 2020 12:32:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE2A5206D8;
        Fri, 24 Jul 2020 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595608334;
        bh=Wu2M+P+zLSH1QV4Giv5fhpeU8je67kqtz8vmJQLi3/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ODrtc6EcKksQ4acJLxYHw4/EQ9dbraxCzGryTdcIWOCgwDcAmn3nceXt5O80GJ0b+
         7zs28U7fpcITpEU/1It2KuG2dilbeDPpgqHoVv7k9f+fybJoleh29uA489wpBdV/i0
         PtMgOnF52xv31j9fRmmPlweOQdv0l1/HNu/YeCpU=
Date:   Fri, 24 Jul 2020 18:32:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/27] xhci features for usb-next
Message-ID: <20200724163215.GA543850@kroah.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
 <20200723150411.GA2529859@kroah.com>
 <be21534d-df11-c957-43eb-e64a05a45404@linux.intel.com>
 <20200724070643.GH3880088@kroah.com>
 <f8e1a53e-6095-3a7c-977e-b3a7ec7f0bca@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8e1a53e-6095-3a7c-977e-b3a7ec7f0bca@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 02:11:44PM +0300, Mathias Nyman wrote:
> > What other interface is asked for?  And yes, I would push back, what is
> > wrong with TTY here?  It should be the most "low overhead" interface
> > that works with common userspace tools that we have.
> 
> I've been asking the same questions about the TTY limitations.
> 
> Currently there's a driver providing a character device in development.
> The developers are aware that they need to clarify and justify the need for a
> new interface to get the driver upstream. My concerns and suggestions are noted.
> 
> As I don't understand these TTY limitations I'll have to let people publishing the
> driver do this part. I expect that the driver will clarify things.
> 
> Anyway, I rather support them and work on providing the infrastructure needed 
> to write such a driver, and give them the opportunity to implement whatever is needed.

Don't add frameworks for no users.

Making this a char driver is not going to fly with me, I think I
remember seeing old patches that tried to do this in the past that were
submitted to some random Android kernel, and they just did not make any
sense.

It is easier to hide custom ioctls (i.e. custom syscalls) in a char
driver than it is in a tty driver, so don't fall into that trap :)

good luck!

greg k-h
