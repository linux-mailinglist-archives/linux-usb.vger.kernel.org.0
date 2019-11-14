Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C264FC308
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 10:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfKNJun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 04:50:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:54776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfKNJun (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Nov 2019 04:50:43 -0500
Received: from localhost (unknown [61.58.47.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CE9520409;
        Thu, 14 Nov 2019 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573725042;
        bh=bBLmNXYqqfTB/+wigdmi3boQJkJEcM/aKCJWATsyjq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YniPVf/eS6SKJSKG/uDubvODeLS3/PO70H4MHWneFeGIvOnBgv5jJwVpo8Wn1Hh4L
         voQaNoJHgFHECgC95C5Zm7QCd8OE83Q4krHhteHt7/MA25w+qAJDyUNwqg9j5E6YO9
         qV0u4Kqcni73YhZ9l4W/ywegRMi9fLa9CtDwrMVA=
Date:   Thu, 14 Nov 2019 17:50:39 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 133/136]
 drivers/usb/gadget/udc/atmel_usba_udc.c:229:46: error: 'usb_debug_root'
 undeclared; did you mean 'usb_ep_ops'?
Message-ID: <20191114095039.GC631558@kroah.com>
References: <201911141648.6cE1p47v%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911141648.6cE1p47v%lkp@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 14, 2019 at 04:15:55PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   9c54450066cc56b1a47b2472333103569c402d0e
> commit: fc05dc6c6ab3619084ef340f53c4a869cb3ea6e6 [133/136] usb: gadget: atmel: create debugfs directory under usb root
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout fc05dc6c6ab3619084ef340f53c4a869cb3ea6e6
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/usb/gadget/udc/atmel_usba_udc.c: In function 'usba_init_debugfs':
> >> drivers/usb/gadget/udc/atmel_usba_udc.c:229:46: error: 'usb_debug_root' undeclared (first use in this function); did you mean 'usb_ep_ops'?
>      root = debugfs_create_dir(udc->gadget.name, usb_debug_root);
>                                                  ^~~~~~~~~~~~~~
>                                                  usb_ep_ops
>    drivers/usb/gadget/udc/atmel_usba_udc.c:229:46: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +229 drivers/usb/gadget/udc/atmel_usba_udc.c
> 
>    223	
>    224	static void usba_init_debugfs(struct usba_udc *udc)
>    225	{
>    226		struct dentry *root;
>    227		struct resource *regs_resource;
>    228	
>  > 229		root = debugfs_create_dir(udc->gadget.name, usb_debug_root);
>    230		udc->debugfs_root = root;
>    231	
>    232		regs_resource = platform_get_resource(udc->pdev, IORESOURCE_MEM,
>    233					CTRL_IOMEM_ID);
>    234	
>    235		if (regs_resource) {
>    236			debugfs_create_file_size("regs", 0400, root, udc,
>    237						 &regs_dbg_fops,
>    238						 resource_size(regs_resource));
>    239		}
>    240	
>    241		usba_ep_init_debugfs(udc, to_usba_ep(udc->gadget.ep0));
>    242	}
>    243	
> 

I will go drop this patch from my tree too.  Please fix it up and
resend.

thanks,

greg k-h
