Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1B1D01E6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 22:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730165AbfJHUFc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 16:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730070AbfJHUFc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 16:05:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A69CE206C0;
        Tue,  8 Oct 2019 20:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570565130;
        bh=WnWovhGuam+8iC1WkJ54DLr8k30VyWvOMA+nx0c3eXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YUHSnWMehtC/wmq9pr4CbXv7iGaJ+lmcRKJ8mQwUmk1cHdoYU0A0/Yg02ybZTai2C
         k+0Du0uwsvnAGQzbx55WbIF3KMTDzKQOTXAz9lMcsmofQ5BoEvpp/HGK2Juee8Whr3
         NJOScg2RJhfCNEc6x0VSPXnZtTrjD2R35gFhd94E=
Date:   Tue, 8 Oct 2019 22:05:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Matthias Maennich <maennich@google.com>,
        Jessica Yu <jeyu@kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: Unknown symbol errors in usb storage driver
Message-ID: <20191008200527.GB3129397@kroah.com>
References: <e593864c-848f-0b6d-3408-f4c619f0cde5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e593864c-848f-0b6d-3408-f4c619f0cde5@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 09:53:16PM +0200, Heiner Kallweit wrote:
> Since a while I see the following. I didn't bisect yet, maybe issue is caused by
> 32bca2df7da2 ("usb-storage: export symbols in USB_STORAGE namespace")?
> 
>   DEPMOD  5.4.0-rc2-next-20191008+
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe1
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe2
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_disconnect
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_control_msg
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_post_reset
> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
> 


It's a depmod bug, see lkml for the discussion and potential fixes.
People are working on it :)

thanks,

greg k-h
