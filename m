Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E523D5741
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 12:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbhGZJgY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 05:36:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:60280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231639AbhGZJgX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Jul 2021 05:36:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7B5D60F37;
        Mon, 26 Jul 2021 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627294612;
        bh=y9tDln+5uxltAlHOfsI+z8+o5c4bHBqSRTsR6PS1Sg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mLXLDRB/Fcdj+F15RJcklxW1xHALXt8Bycj3iG1FVARYDzMP85pVZHqZblw0V6NAA
         xx8VB8kzVjrAkWOTuoQYqWa/4L26x46+asqAZNHBP9Vrio4rI7vRVaHc4+u7zvj2uQ
         JLaqXqKCpTP3RbHu76tTgUFj6X95ZMr817mwmzaI=
Date:   Mon, 26 Jul 2021 12:16:49 +0200
From:   "Greg KH (gregkh@linuxfoundation.org)" <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "Merz, Thomas" <Thomas_Merz@mentor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Hardinge, Charles" <Charles_Hardinge@mentor.com>
Subject: Re: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Message-ID: <YP6LkanQfzipHdOR@kroah.com>
References: <3c42fbd4599a4a3e8b065418592973d9@SVR-IES-MBX-03.mgc.mentorg.com>
 <YP6IzGT6gZNgudI6@kroah.com>
 <9eb2f4a413eb40609f91daf52436cc7b@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eb2f4a413eb40609f91daf52436cc7b@SVR-IES-MBX-03.mgc.mentorg.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 26, 2021 at 10:13:35AM +0000, Schmid, Carsten wrote:
> Hi Greg,
> 
> > Also, the patch is corrupted and can not be applied, even if I wanted to :(
> > So can you fix that up when you resend all of the other versions too?
> 
> I've seen that and already sent a mail to IT regarding this.
> We had to "upgrade" to O365 Outlook, and I selected "plain text" to send but ....
> Still fighting with that.
> 
> May I attach the patches as a file, generated with "git format-patch" meanwhile?
> I fear that I'm not allowed to use "git send-mail".

For backports for the stable tree, yes, I can handle attachments just
fine, you are not the only company with that problem :)

thanks,

greg k-h
