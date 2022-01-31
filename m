Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A484A4009
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 11:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358105AbiAaKW4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 05:22:56 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:39634 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358090AbiAaKWz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 05:22:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9D3861303
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 10:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFD4C340E8;
        Mon, 31 Jan 2022 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643624575;
        bh=J6x/1Y4vi5PSU7wHBKW0kKsd+BnRIjW1uAfo+3DT63Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E1/+B+z+OyzbxNY1iNMxGSiRzGPgwLRPY1niIvXPpoPCXBnbRseh3qlxA8jyGntXU
         +okxL2MZxRlW7TJDumbOvY07hIKshKZ6O1BctNFld8kbCRxD4Cjeq3bLm6QoeoZog/
         nEs4c77bGolimpGpNoeiqNxL3Eh7NYIUltzCtiVk=
Date:   Mon, 31 Jan 2022 11:22:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, John Keeping <john@metanate.com>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v10] usb: f_fs: Fix use-after-free for epfile
Message-ID: <Yfe4fOK7e7Prf3Sc@kroah.com>
References: <1643256595-10797-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643256595-10797-1-git-send-email-quic_ugoswami@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 27, 2022 at 09:39:55AM +0530, Udipto Goswami wrote:
> Consider a case where ffs_func_eps_disable is called from
> ffs_func_disable as part of composition switch and at the
> same time ffs_epfile_release get called from userspace.
> ffs_epfile_release will free up the read buffer and call
> ffs_data_closed which in turn destroys ffs->epfiles and
> mark it as NULL. While this was happening the driver has
> already initialized the local epfile in ffs_func_eps_disable
> which is now freed and waiting to acquire the spinlock. Once
> spinlock is acquired the driver proceeds with the stale value
> of epfile and tries to free the already freed read buffer
> causing use-after-free.
> 
> Following is the illustration of the race:
> 
>       CPU1                                  CPU2
> 
>    ffs_func_eps_disable
>    epfiles (local copy)
> 					ffs_epfile_release
> 					ffs_data_closed
> 					if (last file closed)
> 					ffs_data_reset
> 					ffs_data_clear
> 					ffs_epfiles_destroy
> spin_lock
> dereference epfiles
> 
> Fix this races by taking epfiles local copy & assigning it under
> spinlock and if epfiles(local) is null then update it in ffs->epfiles
> then finally destroy it.
> Extending the scope further from the race, protecting the ep related
> structures, and concurrent accesses.
> 
> Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in ffs_func_eps_disable)

Nit, this should have been:
Fixes: a9e6f83c2df1 ("usb: gadget: f_fs: stop sleeping in ffs_func_eps_disable")

I've fixed it up now, thanks.

greg k-h
