Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D891E10F80A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 07:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfLCGrt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 01:47:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:54852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfLCGrt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Dec 2019 01:47:49 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2FAC20684;
        Tue,  3 Dec 2019 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575355669;
        bh=QCnh2qpItw7jaWIVuaOS/SUFTg5WSudjUaezjAa3J2E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tUvTo0s2Pu5WeAUFI/XhMhaBRM+nP+pVommJpyQBHNpbU+p4WTPqqDbrLeoWZFF3X
         Wun4xXpB4pn83LIlxBvlcQ9m5G+wzYRZ6450CYK8gYLi3uPQsnzNpohZNpfwnPnEfT
         xhHJSHdcQhJ7XPYlar6DVJOvqCGnl3H39b9BuoAo=
Date:   Tue, 3 Dec 2019 07:47:46 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH RESEND v2 2/2] Doc: ABI: add usb charger uevent
Message-ID: <20191203064746.GB1791585@kroah.com>
References: <1575342235-14791-1-git-send-email-peter.chen@nxp.com>
 <1575342235-14791-2-git-send-email-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575342235-14791-2-git-send-email-peter.chen@nxp.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 03, 2019 at 11:03:55AM +0800, Peter Chen wrote:
> When the USB charger is inserted or removed, the users could get
> USB charger state and type through the uevent.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/ABI/testing/usb-charger-uevent | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/ABI/testing/usb-charger-uevent
> 
> diff --git a/Documentation/ABI/testing/usb-charger-uevent b/Documentation/ABI/testing/usb-charger-uevent
> new file mode 100644
> index 000000000000..93ffd3a54a7f
> --- /dev/null
> +++ b/Documentation/ABI/testing/usb-charger-uevent
> @@ -0,0 +1,45 @@
> +What:		Raise a uevent when a USB charger is inserted or removed
> +Date:		2019-11-11
> +KernelVersion:	5.5

No new features for 5.5, this would be 5.6, right?

thanks,

greg k-h
