Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FA5247A8A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 00:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbgHQWhX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 18:37:23 -0400
Received: from iodev.co.uk ([193.29.56.124]:41312 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729191AbgHQWhX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 18:37:23 -0400
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Aug 2020 18:37:22 EDT
Date:   Tue, 18 Aug 2020 00:18:15 +0200
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/8] media: solo6x10: Make use of cpu_to_le16_array()
Message-ID: <20200817221815.GH6339@abuya>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
 <20200817184659.58419-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817184659.58419-2-andriy.shevchenko@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/Aug/2020 21:46, Andy Shevchenko wrote:
> Since we have a new helper, let's replace open coded variant by it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Anton Sviridenko <anton@corp.bluecherry.net>
> Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
> Cc: Ismael Luceno <ismael@iodev.co.uk>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> v2: new patch
>  drivers/media/pci/solo6x10/solo6x10-disp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-disp.c b/drivers/media/pci/solo6x10/solo6x10-disp.c
> index ad98ca7fb98b..09c0cf8a5fcb 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-disp.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-disp.c
> @@ -202,16 +202,15 @@ int solo_set_motion_block(struct solo_dev *solo_dev, u8 ch,
>  {
>  	const unsigned size = sizeof(u16) * 64;
>  	u32 off = SOLO_MOT_FLAG_AREA + ch * SOLO_MOT_THRESH_SIZE * 2;
> +	unsigned int y;
>  	__le16 *buf;
> -	int x, y;
>  	int ret = 0;
>  
>  	buf = kzalloc(size, GFP_KERNEL);
>  	if (buf == NULL)
>  		return -ENOMEM;
>  	for (y = 0; y < SOLO_MOTION_SZ; y++) {
> -		for (x = 0; x < SOLO_MOTION_SZ; x++)
> -			buf[x] = cpu_to_le16(thresholds[y * SOLO_MOTION_SZ + x]);
> +		cpu_to_le16_array(buf, &thresholds[y * SOLO_MOTION_SZ], SOLO_MOTION_SZ);
>  		ret |= solo_p2m_dma(solo_dev, 1, buf,
>  			SOLO_MOTION_EXT_ADDR(solo_dev) + off + y * size,
>  			size, 0, 0);
> -- 
> 2.28.0
> 

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
