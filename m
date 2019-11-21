Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975471051A1
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 12:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfKULrm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 06:47:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:35660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfKULrl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 06:47:41 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A15E820898;
        Thu, 21 Nov 2019 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574336860;
        bh=wRKeuD/PxkjAM1WnX5lnMqYRRTds4PbZEw2zPMfCtQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q1wr1G5BXOauPYfshMMQsPGecaL3MqoDuUOuz/b5n1WDqN+bvpsndOSRA9djzieZU
         8hAB3NRUCbQggMfzM3ADHTl0Z/9U591tcx1KNVgZ809m1K9fbQ/Qf3T64kI+r8AFr7
         o8x/6UyaMnl6bGJrdkooSFeBBiopo7lZwPqyYUOs=
Date:   Thu, 21 Nov 2019 12:47:37 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
Message-ID: <20191121114737.GA427660@kroah.com>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 21, 2019 at 03:38:04PM +0800, Kai-Heng Feng wrote:
> Hi,
> 
> Currently there are two quirks for Dell TB16 to workaround an issue:
> "xhci: Bad Ethernet performance plugged in ASM1042A host", and
> "r8152: disable RX aggregation on Dell TB16 dock".
> 
> However, the issue wasn't analyzed and root caused. I'd like to understand what's really going on here.
> Reverting those two patches, and as soon as doing TX/RX over the ethernet on TB16, xhci_hcd errors out:
> 
> [   69.803804] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.803807] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1010 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.803900] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.803901] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1020 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.803998] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.803999] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1030 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.804096] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.804099] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1040 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.955830] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.955847] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1050 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.956704] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.956718] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1060 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.963802] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.963819] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1070 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   70.112302] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   70.112321] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1080 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> 
> So, under what circumstances the DMA pointer can be out of the TD?

What kernel version are you running that causes these errors?

thanks,

greg k-h
