Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21593C61F2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 19:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhGLRdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 13:33:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:60550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230033AbhGLRda (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 13:33:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C81EC61178;
        Mon, 12 Jul 2021 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626111042;
        bh=H0JMHNh/sSgvf73iGLnKTvGS0AP0pYuM25c1eoveLxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S4x07RcSCXlH0uDGVc/MO7Su/ecpX0e9jhM5P9DJkjuTSrCecz6wQe1pIe+QlsLWE
         5f8MZjEURgrjKf7e148b1ONCflD22AEdk7ns9yhnFKZfevd9e/qBvj2RL9Ko8B5c+A
         EFHkGZTDrppAHLIabVjltur7XqR8f/uWAa75RwW0=
Date:   Mon, 12 Jul 2021 19:30:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Vahram Aharonyan <Vahram.Aharonyan@synopsys.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: gadget: Fix GOUTNAK flow for Slave mode.
Message-ID: <YOx8P3B0ZMwEGu+N@kroah.com>
References: <75f383c94960b2c1305304bb380e6b6504c67262.1626085155.git.Minas.Harutyunyan@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75f383c94960b2c1305304bb380e6b6504c67262.1626085155.git.Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 12, 2021 at 02:22:09PM +0400, Minas Harutyunyan wrote:
> Because of dwc2_hsotg_ep_stop_xfr() function uses poll
> mode, first need to mask GINTSTS_GOUTNAKEFF interrupt.
> In Slave mode GINTSTS_GOUTNAKEFF interrupt will be
> aserted only after pop OUT NAK status packet from RxFIFO.
> 
> In dwc2_hsotg_ep_sethalt() function before setting
> DCTL_SGOUTNAK need to unmask GOUTNAKEFF interrupt.
> 
> Tested by USBCV CH9 and MSC tests set in Slave, BDMA and DDMA.
> All tests are passed.
> 
> Fixes: a4f827714539a ("usb: dwc2: gadget: Disable enabled HW endpoint in
> dwc2_hsotg_ep_disable")

Please do not wrap this line.

> Fixes: 6070636c4918c ("usb: dwc2: Fix Stalling a Non-Isochronous OUT EP")
> 

No need for a blank line there please.

thanks,

gre gk-h
