Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C61D9996D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 18:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390095AbfHVQkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 12:40:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:49502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732772AbfHVQkM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 12:40:12 -0400
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net [184.188.36.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A39C1206B7;
        Thu, 22 Aug 2019 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566492011;
        bh=NmcRQzXeQSbMpgliwymS2P//ES1g91LD3PV54eKVOck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TUV+6Uj4D0IeJqx1y1qFnCWyJLvcZTRD/Mk5bj3Virrc6Mzwts+0y749MBjMzEh/F
         0kjsQBd2PVEODqxUxtW/Abj1jUcbA3Hr2OB6IKQC2/FRpKBXHpzF683/oqEF/kL6Eq
         D3rb0uqSr+n6VzByHAQZ6sqg3MuFWYIkEeenp8kI=
Date:   Thu, 22 Aug 2019 09:40:11 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     shuah@kernel.org, valentina.manea.m@gmail.com,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usbip: Skip DMA mapping and unmapping for urb at
 vhci
Message-ID: <20190822164011.GA7093@kroah.com>
References: <20190808155435.10050-1-suwan.kim027@gmail.com>
 <20190808155435.10050-2-suwan.kim027@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808155435.10050-2-suwan.kim027@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 12:54:34AM +0900, Suwan Kim wrote:
> vhci doesn’t do DMA for remote device. Actually, the real DMA
> operation is done by network card driver. vhci just passes virtual
> address of the buffer to the network stack, so vhci doesn’t use and
> need dma address of the buffer of the URB.
> 
> But HCD provides DMA mapping and unmapping function by default.
> Moreover, it causes unnecessary DMA mapping and unmapping which
> will be done again at the NIC driver and it wastes CPU cycles.
> So, implement map_urb_for_dma and unmap_urb_for_dma function for
> vhci in order to skip the DMA mapping and unmapping procedure.
> 
> When it comes to supporting SG for vhci, it is useful to use native
> SG list (urb->num_sgs) instead of mapped SG list because DMA mapping
> fnuction can adjust the number of SG list (urb->num_mapped_sgs).
> And vhci_map_urb_for_dma() prevents isoc pipe from using SG as
> hcd_map_urb_for_dma() does.
> 
> Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>

Can you please redo this patch based on my usb-next branch that has
Christoph's DMA changes in it?  It should make your change much simpler
and smaller.

Please do that and resend the whole series.

thanks,

greg k-h
