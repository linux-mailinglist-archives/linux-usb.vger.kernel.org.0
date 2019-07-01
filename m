Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B9324D00
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 12:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfEUKkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 06:40:17 -0400
Received: from verein.lst.de ([213.95.11.211]:59239 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbfEUKkR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 06:40:17 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id D8FA368AFE; Tue, 21 May 2019 12:39:54 +0200 (CEST)
Date:   Tue, 21 May 2019 12:39:54 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     laurentiu.tudor@nxp.com
Cc:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de, leoyang.li@nxp.com,
        linux-kernel@vger.kernel.org, robin.murphy@arm.com,
        noring@nocrew.org, JuergenUrban@gmx.de
Subject: Re: [PATCH v4 2/3] usb: host: ohci-sm501: init genalloc for local
 memory
Message-ID: <20190521103954.GC1973@lst.de>
References: <20190516114721.27694-1-laurentiu.tudor@nxp.com> <20190516114721.27694-3-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516114721.27694-3-laurentiu.tudor@nxp.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 16, 2019 at 02:47:20PM +0300, laurentiu.tudor@nxp.com wrote:
> +	hcd->localmem_pool = devm_gen_pool_create(dev, PAGE_SHIFT,
> +						  dev_to_node(dev),
> +						  "ohci-sm501");
> +	if (IS_ERR(hcd->localmem_pool)) {
> +		retval = PTR_ERR(hcd->localmem_pool);
> +		goto err5;
> +	}
> +
> +	local_mem = devm_ioremap(dev, mem->start, resource_size(mem));
> +	if (!local_mem) {
> +		retval = -ENOMEM;
> +		goto err5;
> +	}
> +
> +	retval = gen_pool_add_virt(hcd->localmem_pool,
> +				   (unsigned long)local_mem,
> +				   mem->start - mem->parent->start,
> +				   resource_size(mem),
> +				   dev_to_node(dev));

I wonder if having a helper for these operations would be useful,
explaining what we do here.  That is create a pool for a resource,
where the virtual address is the ioremap of said resource.  We
could also make that a managed API so that you can get rid of the
cleanup path.
