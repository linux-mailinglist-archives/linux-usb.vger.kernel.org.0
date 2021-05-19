Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E99D389215
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 16:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354935AbhESO6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 10:58:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:49942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347646AbhESO6C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 10:58:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9F94610A8;
        Wed, 19 May 2021 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621436202;
        bh=jzfdsFACYB1jXMFuw3OU+MoiYpESakhRDHm2KhGQpgk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QQKY2yl6NXZDQCGVkReASRYXs+4z2cE1grbEstvCw7PgvvYbap/bwg3R57auIKud2
         XdWEauAFPrejBMcGwsoBD9j2tlcYjj83pJrqtqTX9jpZJ6UOTQVnUt0dnvQ0cipCcy
         yjH31uX9bNG7wzK+S8jojZLor0+mcMZo0ahze6eY=
Date:   Wed, 19 May 2021 16:56:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: xhci: remove unused variable 'len' in
 xhci_unmap_temp_buf()
Message-ID: <YKUnKKRqEPzh8h6C@kroah.com>
References: <20210519123304.7885-1-thunder.leizhen@huawei.com>
 <YKUOra3I+c+xeO+s@kroah.com>
 <c7d39376-d18a-73db-dc33-03925e606ca3@huawei.com>
 <d5755fc6-3c1d-f780-5105-d39771c73427@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5755fc6-3c1d-f780-5105-d39771c73427@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 10:37:07PM +0800, Leizhen (ThunderTown) wrote:
> 
> 
> On 2021/5/19 21:40, Leizhen (ThunderTown) wrote:
> > 
> > 
> > On 2021/5/19 21:12, Greg Kroah-Hartman wrote:
> >> On Wed, May 19, 2021 at 08:33:04PM +0800, Zhen Lei wrote:
> >>> GCC reports the following warning with W=1:
> >>>
> >>> drivers/usb/host/xhci.c:1349:15: warning:
> >>>  variable 'len' set but not used [-Wunused-but-set-variable]
> >>>  1349 |  unsigned int len;
> >>>       |               ^~~
> >>>
> >>> This variable is not used, remove it to fix the warning.
> >>>
> >>> Reported-by: Hulk Robot <hulkci@huawei.com>
> >>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >>> ---
> >>>  drivers/usb/host/xhci.c | 3 +--
> >>>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> >>> index 27283654ca08..a75ed4a00997 100644
> >>> --- a/drivers/usb/host/xhci.c
> >>> +++ b/drivers/usb/host/xhci.c
> >>> @@ -1346,7 +1346,6 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
> >>>  
> >>>  static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
> >>>  {
> >>> -	unsigned int len;
> >>>  	unsigned int buf_len;
> >>>  	enum dma_data_direction dir;
> >>>  
> >>> @@ -1362,7 +1361,7 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
> >>>  				 dir);
> >>>  
> >>>  	if (usb_urb_dir_in(urb))
> >>> -		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> >>> +		(void)sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> >>>  					   urb->transfer_buffer,
> >>>  					   buf_len,
> >>>  					   0);
> >>> -- 
> >>> 2.25.1
> >>>
> >>>
> >>
> >> Wow, no.  I keep telling you that this is not ok.  Why keep sending
> >> this?
> > 
> > Sorry, I forgot to google it, someone already posted it.
> 
> Hi, Greg Kroah-Hartman:
>   I've read your two exchange emails from https://patchwork.kernel.org/project/linux-usb/patch/20210306120644.74406-1-zhangkun4jr@163.com/#24019765
>   How about just give a warning when the copy is not complete? This W=1 warning will probably be detected by someone else.

Handle the error properly.  Just spitting a message to a user where they
can't do anything about it does not seems like the correct solution to
me, would you want the kernel to do that?

thanks,

greg k-h
