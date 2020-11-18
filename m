Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DBF2B7E84
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 14:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKRNqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 08:46:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:33652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgKRNqn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 08:46:43 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4EA02467D;
        Wed, 18 Nov 2020 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605707201;
        bh=34lK8bZUGDMBID7px3kxSasd8nspHaj9e8T7IzzwUg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2Of+hoTJrzJPPlOkTRlbK+S4NdZP+7qmLVCiX7G8w/AbGYaxcKgBXI/P8oIy28F7S
         Zc+VNJUnMYp1s9gSPoFZlX39Ui2bFGkLkOvk+9MS513Ef5RMC+G78TYS1Lsu4rZ9du
         4kXKyg8ILmCEJOyG0trA0KpLSop4DsJJImgEIbrg=
Date:   Wed, 18 Nov 2020 14:47:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Paulian Bogdan Marinca <paulian@marinca.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: Fix use-after-free in
 remove_unplugged_switch()
Message-ID: <X7Ul792kd0wiXCxM@kroah.com>
References: <20201118133745.65628-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118133745.65628-1-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 18, 2020 at 04:37:45PM +0300, Mika Westerberg wrote:
> Paulian reported a crash that happens when a dock is unplugged during
> hibernation:
> 
> [78436.228217] thunderbolt 0-1: device disconnected
> [78436.228365] BUG: kernel NULL pointer dereference, address: 00000000000001e0
> ...
> [78436.228397] RIP: 0010:icm_free_unplugged_children+0x109/0x1a0
> ...
> [78436.228432] Call Trace:
> [78436.228439]  icm_rescan_work+0x24/0x30
> [78436.228444]  process_one_work+0x1a3/0x3a0
> [78436.228449]  worker_thread+0x30/0x370
> [78436.228454]  ? process_one_work+0x3a0/0x3a0
> [78436.228457]  kthread+0x13d/0x160
> [78436.228461]  ? kthread_park+0x90/0x90
> [78436.228465]  ret_from_fork+0x1f/0x30
> 
> This happens because remove_unplugged_switch() calls tb_switch_remove()
> that releases the memory pointed by sw so the following lines reference
> to a memory that might be released already.
> 
> Fix this by saving pointer to the parent device before calling
> tb_switch_remove().
> 
> Reported-by: Paulian Bogdan Marinca <paulian@marinca.net>
> Fixes: 4f7c2e0d8765 ("thunderbolt: Make sure device runtime resume completes before taking domain lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/icm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index b51fc3f62b1f..05323c442b56 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ -1976,7 +1976,9 @@ static int complete_rpm(struct device *dev, void *data)
>  
>  static void remove_unplugged_switch(struct tb_switch *sw)
>  {
> -	pm_runtime_get_sync(sw->dev.parent);
> +	struct device *parent = sw->dev.parent;
> +
> +	pm_runtime_get_sync(parent);

If you are saving a pointer to a structure, shouldn't you increment the
reference count?

	struct device *parent = get_device(sw->dev.parent);

Then you know it is valid when you use it later on.

Just remember to call put_device() when you are done.

thanks,

greg k-h
