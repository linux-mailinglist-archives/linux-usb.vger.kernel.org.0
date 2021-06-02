Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A31398DCA
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 17:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFBPFb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 11:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbhFBPFb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 11:05:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DFB1613F6;
        Wed,  2 Jun 2021 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622646215;
        bh=Ek85uSKF94D2n9y1q8XHBCGXkMJ9NApAAtfnQHZ9XZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uWsVJ9rJyqxhKM1DekDkPk68ArKflaWvvosDIKEwbRlvdLKlAelGBR6G5ryUt2KmH
         cv5gf3RE8kwMOyG3Mx2psmVUIDVJBzEmxkp6AVdbSYuGzgxMQCdcGe1arOs/DiMMae
         UarnzmPCVeZF+kGo9Sor2A3ca9x02ateKRNqirSE=
Date:   Wed, 2 Jun 2021 17:03:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        Prike Liang <Prike.Liang@amd.com>
Subject: Re: [PATCH v5] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle on AMD Renoir
Message-ID: <YLedxEnOOWPfMYec@kroah.com>
References: <20210527154534.8900-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527154534.8900-1-mario.limonciello@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 27, 2021 at 10:45:34AM -0500, Mario Limonciello wrote:
> The XHCI controller is required to enter D3hot rather than D3cold for AMD
> s2idle on this hardware generation.
> 
> Otherwise, the 'Controller Not Ready' (CNR) bit is not being cleared by
> host in resume and eventually this results in xhci resume failures during
> the s2idle wakeup.
> 
> Suggested-by: Prike Liang <Prike.Liang@amd.com>
> Link: https://lore.kernel.org/linux-usb/1612527609-7053-1-git-send-email-Prike.Liang@amd.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/usb/host/xhci-pci.c | 7 ++++++-
>  drivers/usb/host/xhci.h     | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)

Should it go to stable kernels, and if so, how far back?

thanks,

greg k-h
