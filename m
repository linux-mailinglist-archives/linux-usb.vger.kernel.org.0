Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1103239DE
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 16:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733133AbfETOXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 10:23:54 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60016 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732127AbfETOXj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 10:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OatVHIrCWYguW9Na7RTRuHTBGkcI0B4NqgZ1cLxhQgQ=; b=F6QxfkwnuYixy1VbMF0FyONlO
        dsWCZHGjFMaTg+CXsiL17P09p9tVTwmdejillTJOVKTk/anWvWL7/2Hjnuh5LWjmsNBcyVvck9ejw
        qRag5Wnz4m1LXhBpxrUmjVbrTKqVDVxM3SLJ5hRyo/66WXxDBVFYyNwcKp+0msVjFMiON4shXUf5H
        vbUY6T4yOTY7RrgQqYAH4p/LVBT6jkqdtXedMJk6ExQoBvbX8XFofYNevHhct2O6nnOdHeb742/3u
        cTM60s4nWRGiMl3Wt1xdFEVJ5qZgbUd+XZapkxqz3GuRKvPS5fpJirF6QQ06yJccuyRVkv3a1PPwd
        Mke8wj0lw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hSjCN-0003ZB-Ee; Mon, 20 May 2019 14:23:31 +0000
Date:   Mon, 20 May 2019 07:23:31 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Oliver Neukum <oneukum@suse.com>,
        Jaewon Kim <jaewon31.kim@gmail.com>, linux-mm@kvack.org,
        gregkh@linuxfoundation.org, Jaewon Kim <jaewon31.kim@samsung.com>,
        m.szyprowski@samsung.com, ytk.lee@samsung.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: host: xhci: allow __GFP_FS in dma allocation
Message-ID: <20190520142331.GA12108@infradead.org>
References: <20190520101206.GA9291@infradead.org>
 <Pine.LNX.4.44L0.1905201011490.1498-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1905201011490.1498-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 20, 2019 at 10:16:57AM -0400, Alan Stern wrote:
> What if the allocation requires the kernel to swap some old pages out 
> to the backing store, but the backing store is on the device that the 
> driver is managing?  The swap can't take place until the current I/O 
> operation is complete (assuming the driver can handle only one I/O 
> operation at a time), and the current operation can't complete until 
> the old pages are swapped out.  Result: deadlock.
> 
> Isn't that the whole reason for using GFP_NOIO in the first place?

It is, or rather was.  As it has been incredibly painful to wire
up the gfp_t argument through some callstacks, most notably the
vmalloc allocator which is used by a lot of the DMA allocators on
non-coherent platforms, we now have the memalloc_noio_save and
memalloc_nofs_save functions that mark a thread as not beeing to
go into I/O / FS reclaim.  So even if you use GFP_KERNEL you will
not dip into reclaim with those flags set on the thread.
