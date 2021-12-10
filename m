Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182D6470070
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 13:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240867AbhLJMLA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 07:11:00 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41850 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235331AbhLJMLA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 07:11:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFEFEB827E9
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 12:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDE0C341C6;
        Fri, 10 Dec 2021 12:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639138043;
        bh=GNkCndZLKtbEnBTxpRrr1Lpw17bDArYTzU0DZUsVe+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eaoUkgYlkmrkyq+qr4Hea7BZXJokhNg43zB6aIC9amTLjU2scts7usNyQrCMSzN9+
         zqwFdUlrwNlhgHKI4Ne2OLpF7uxbhNYH6yLaxZyzjmLdW0eTxzwKOUzboMO8HPM4oZ
         9y7UirOa0Mu6LDxuZI5zayctulgpUlTduDOR37hA=
Date:   Fri, 10 Dec 2021 13:07:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH] usb: hub: avoid warm port reset during USB3 disconnect
Message-ID: <YbNC764D4ESw9cDN@kroah.com>
References: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 01:16:53PM +0200, Mathias Nyman wrote:
> During disconnect USB-3 ports often go via SS.Inactive link error state
> before the missing terminations are noticed, and link finally goes to
> RxDetect state
> 
> Avoid immediately warm-resetting ports in SS.Inactive state.
> Let ports settle for a while and re-read the link status a few times 20ms
> apart to see if the ports transitions out of SS.Inactive.
> 
> According to USB 3.x spec 7.5.2, a port in SS.Inactive should
> automatically check for missing far-end receiver termination every
> 12 ms (SSInactiveQuietTimeout)
> 
> The futile multiple warm reset retries of a disconnected device takes
> a lot of time, also the resetting of a removed devices has caused cases
> where the reset bit got stuck for a long time on xHCI roothub.
> This lead to issues in detecting new devices connected to the same port
> shortly after.
> 
> Tested-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/core/hub.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

Does this fix a specific commit, or has it always been this way?  And is
this for 5.16-final or 5.17-rc1 and/or stable trees?

thanks,

greg k-h
