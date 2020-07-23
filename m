Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A370422B218
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 17:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgGWPEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 11:04:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgGWPEI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 11:04:08 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 684DC20737;
        Thu, 23 Jul 2020 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595516648;
        bh=VoqjkwNxgNKP689SrWGHkrqfoM/xVbawMZ8sEp2vtcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jof8XdmBWslEIt3YrdVkmLgkL6eCdnwwm/rn7BMHHTR+BSR+R/7Lx+6dEZhujjkC1
         elHQN0toqQLYP4GnXO4gyJAFdELnxmXJrFljUaRBtK5E0peAvu8cKA9aCHv9R46gPg
         k7IO7u0Ba/8myBgS9WH6pRg7Cmxl4Kfk95k4I2sw=
Date:   Thu, 23 Jul 2020 17:04:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/27] xhci features for usb-next
Message-ID: <20200723150411.GA2529859@kroah.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 23, 2020 at 05:45:03PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> This series for usb-next is almost completely about decoupling and
> cleaning up relations between xhci, xhci debug capability (DbC),
> and the DbC tty support.
> 
> Real motivation behind this is to later turn DbC into a proper device
> allowing us to bind different drivers to it, like dbctty.

I don't really understand why you want to do that, but ok :)

What is that going to help with?

thanks,

greg k-h
