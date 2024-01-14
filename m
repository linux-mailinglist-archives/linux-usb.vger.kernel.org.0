Return-Path: <linux-usb+bounces-5029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C44CA82D082
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 13:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCECC1C20C9A
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECC520F1;
	Sun, 14 Jan 2024 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ngutj379"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F44290D
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 12:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30530C433C7;
	Sun, 14 Jan 2024 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705235127;
	bh=4VJ9jg2yL+8LFfYQvzh1+82fWVdzjqc34sSEeeuQ18c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ngutj379tjmRw5GY4b0URmZ14sVvMxiARq3FvuNsr0e1G5jVO5tHdR6RZFtwqoHn2
	 5/fg9yoN08CDpKz0km4TUWfgrPcS6x1kKJUm9W7Q81KZZiTf97LzYGUF6lxp6h1kUW
	 8bwXIz6805EcEVIr80gMgwTrYrR0+YMbZdKsElcA=
Date: Sun, 14 Jan 2024 13:25:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: benjamin.tissoires@redhat.com, hdegoede@redhat.com,
	ivan.orlov0322@gmail.com, heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <2024011404-ravioli-feast-c6b7@gregkh>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112080108.1147450-1-xu.yang_2@nxp.com>

On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> Generally, usb role switch device will be registered by usb controller
> driver. Then this usb controller device will be the parent of the usb
> role switch device. And also the usb controller device will not be a
> standalone device, it may be registered by other glue drivers. Currently,
> the glue driver can't aware the usage of usb role switch device. So it
> will remove usb controller device when the glue driver is deregistered.
> In this case, below kernel dump will be shown if the user of usb role
> swich (such as tcpm) tries to put it.

Note, manual removal of modules is just that, manual.  No module is
every auto-unloaded.

So how are you seeing this error in a real system?

> 
> [  248.891875] Hardware name: NXP i.MX95 19X19 board (DT)
> [  248.896998] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  248.903948] pc : usb_role_switch_put+0x28/0x4c
> [  248.908385] lr : tcpm_unregister_port+0xb8/0xf8 [tcpm]
> [  248.913533] sp : ffff8000836fbbc0
> [  248.916835] x29: ffff8000836fbbc0 x28: ffff0000899fd880 x27: 0000000000000000
> [  248.923959] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> [  248.931083] x23: ffff000081417970 x22: ffff00008aab10e8 x21: ffff00008aab0080
> [  248.938207] x20: ffff00008aab3110 x19: ffff00008a138c00 x18: ffffffffffffffff
> [  248.945331] x17: 0000000000000000 x16: 00e0030000000000 x15: 0000000000000000
> [  248.952455] x14: 0000000000000001 x13: 0000000000000040 x12: 0000000000000000
> [  248.959579] x11: 0000000000000000 x10: ffffffffffffffff x9 : ffff8000836fbaf0
> [  248.966703] x8 : ffff8000836fbaf0 x7 : ffff000084237728 x6 : 0000000000000400
> [  248.973827] x5 : 0000000041001000 x4 : fffffc000228ee60 x3 : 00000000820000f4
> [  248.980951] x2 : ffff00008a3b9b28 x1 : 00000000820000f5 x0 : 0000000000000000
> [  248.988076] Call trace:
> [  248.990512]  usb_role_switch_put+0x28/0x4c
> [  248.994602]  tcpm_unregister_port+0xb8/0xf8 [tcpm]
> [  248.999385]  tcpci_remove+0x5c/0xbc [tcpci]
> [  249.003571]  i2c_device_remove+0x2c/0x9c
> [  249.007489]  device_remove+0x4c/0x80
> [  249.011059]  device_release_driver_internal+0x1c8/0x224
> [  249.016268]  driver_detach+0x50/0x98
> [  249.019830]  bus_remove_driver+0x6c/0xbc
> [  249.023739]  driver_unregister+0x30/0x60
> [  249.027647]  i2c_del_driver+0x54/0x68
> [  249.031296]  tcpci_i2c_driver_exit+0x18/0x990 [tcpci]
> [  249.036340]  __arm64_sys_delete_module+0x180/0x260
> [  249.041124]  invoke_syscall+0x48/0x114
> [  249.044868]  el0_svc_common.constprop.0+0xc8/0xe8
> [  249.049557]  do_el0_svc+0x20/0x2c
> [  249.052858]  el0_svc+0x40/0xf4
> [  249.055909]  el0t_64_sync_handler+0x13c/0x158
> [  249.060251]  el0t_64_sync+0x190/0x194
> [  249.063904] Code: b140041f 540000e8 f9402000 f9403400 (f9400800)
> [  249.069985] ---[ end trace 0000000000000000 ]---
> 
> To fix this issue, this will try to get/put all relevant modules when the
> user tries to get/put usb role switch device.

With this change, is the module now unable to be loaded if the hardware
is present?

And again, why isn't this properly represented in the driver model so
that if the module is unloaded, the relevant code paths are not properly
cleaned up and the device is removed _before_ the module is unloaded?

thanks,

greg k-h

