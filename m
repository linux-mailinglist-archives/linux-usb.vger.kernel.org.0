Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7013C698B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 06:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhGMEz4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 00:55:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhGMEz4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Jul 2021 00:55:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73CA26120A;
        Tue, 13 Jul 2021 04:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626151987;
        bh=C+YJZalNy0kYj1g1OL3uaQcdULnQ1iagJh1RmrDDXeE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jbXNQdEZnDdKX1bVidvL8or/ZmBv+9mXNslxNxBjs5VdVfoWRQNnZ+elhgI/z5I5W
         lOBZU9zdl2SGH4o8tB65Ffz7hX3IHbw6pvtUXinJwf5HgoMerS0UqOnrabiYqwI04T
         /1i8Vad4lhEnP7GhTpfb+OZ7xrGHn6v3aHVp199A=
Date:   Tue, 13 Jul 2021 06:53:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
Message-ID: <YO0cL+4gzLSyTY7f@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <ac8342bbedc5aa0f5754cb6830e6d5628cc022f1.camel@bonedaddy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac8342bbedc5aa0f5754cb6830e6d5628cc022f1.camel@bonedaddy.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 13, 2021 at 11:43:57AM +0800, Paul Wise wrote:
> On Wed, 2021-01-20 at 04:06 +0800, Paul Wise wrote:
> 
> > Right now all the Linux userspace USB gadget projects (libusbg,
> > libusbgx, gt, gadgetd, cmtp-responder etc) are spread out across
> > different GitHub organisations and user accounts.
> > 
> > https://github.com/libusbg/libusbg
> > https://github.com/libusbgx/libusbgx
> > https://github.com/kopasiak/gt
> > https://github.com/gadgetd/gadgetd
> > https://github.com/cmtp-responder/cmtp-responder
> > 
> > I would like to move each of these projects to the linux-usb GitHub
> > organisation and add some more folks to the list of admins so that
> > these projects can be more collaboratively maintained.
> 
> FYI, we have now moved libusbgx, gt and ptp-gadget across:
> 
> https://github.com/linux-usb-gadgets/libusbgx
> https://github.com/linux-usb-gadgets/gt
> https://github.com/linux-usb-gadgets/ptp-gadget
> 
> We still need to move gadgetd/libusbg and archive libusbg.

What do you mean "archive libusbg"?

> We are also interested in finding funding for development.

What type of funding and for what specific development?  What is lacking
in the current projects here that needs to be resolved?  And who have
you asked for funding from so far?

thanks,

greg k-h
