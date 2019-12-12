Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B135511CC05
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 12:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfLLLQp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 06:16:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:59806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728458AbfLLLQp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 06:16:45 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84DEA2173E;
        Thu, 12 Dec 2019 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576149405;
        bh=GHoy0mbKgaoPZbeIHcXogZOk5KdiK25KeYpomrIPWaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Iu82OoWe7YCN8p3mFmWsEIPzL/7NvSAe95iQogoGLbZaLunp8tTjGpPSWmQeTjAN/
         EFzlCXaDX3UB2NUL1haLDfBGgN66EPCrAwie/uCVxj6iAB/ti48HB0mo2roZBIBeZi
         S8Z3kJ/JhOWvv39mgp78N4D9tLBdX+vTMx/zoxd4=
Date:   Thu, 12 Dec 2019 12:16:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: add ID for the Intel Comet Lake -H
 variant
Message-ID: <20191212111642.GB1534818@kroah.com>
References: <20191212093713.60614-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212093713.60614-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 12, 2019 at 12:37:13PM +0300, Heikki Krogerus wrote:
> The original ID that was added for Comet Lake PCH was
> actually for the -LP (low power) variant even though the
> constant for it said CMLH. Changing that while at it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/dwc3/dwc3-pci.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Felipe, any objection for me just taking this to my tree now?

thanks,

greg k-h
