Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E144902D6
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jan 2022 08:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237479AbiAQHS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 02:18:28 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36494 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237344AbiAQHS2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 02:18:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF9C260F70
        for <linux-usb@vger.kernel.org>; Mon, 17 Jan 2022 07:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0BEC36AE3;
        Mon, 17 Jan 2022 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642403907;
        bh=uJBStLzddrE3gHC69VNTKqO1utAdxcbcNDJen0vmPhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8gAjIJ/A23G45CRchYUVFRvXimqP0FXJKEsY24lhMKpX9wnLixBspt8bXJRZnEKA
         3FKp2sJ3WT+jH++WHnWMjN7UL6GJujxz7GmGOF6EcosQ3kcv4jBlfiZ8M+l8tRtIQy
         UI2u7ZaTsQepW84RM2AWXupg6S2sJ9++7MjMcitM=
Date:   Mon, 17 Jan 2022 08:18:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rajaram Regupathy <rajaram.regupathy@gmail.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
Message-ID: <YeUYQB4neDz8Z0Tb@kroah.com>
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 16, 2022 at 08:49:47PM +0530, Rajaram Regupathy wrote:
> HI
> 
> libtypec
> ++++++
> 
> USB-Type C and USB Power Delivery systems are with multiple
> specification versions, platform designs and microcontroller vendors
> for managing  data, power and display.
> 
> libtypec is aimed to provide a generic way for userspace System
> Software on Linux, Android, Chrome OS or Other OSes to build developer
> tools or
> other management applications for USB-Type C and USB Power Delivery
> class devices.

Great, can we add this to the usbutils package, and `lsusb`?

> Features
> ======
> - libtypec - get method for port and port-partner capabilities
> -  utils/lstypec -  displaying information about USB typec class
> devices in the system and the devices connected to them
> 
> Release:
> =======
> 
> Binary : https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec_v0.1/libtypec_0.1.tar.xz
> Source : https://github.com/Rajaram-Regupathy/libtypec/archive/refs/tags/libtypec_v0.1.tar.gz

Like was pointed out, there is no license listed for this code, so no
one can use it.

Also, it doesn't build for me:
	$ make
	 50%] Building C object CMakeFiles/lstypec.dir/lstypec.c.o
	100%] Linking C executable lstypec
	usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
	usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec_sysfs_ops.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
	ollect2: error: ld returned 1 exit status
	ake[2]: *** [CMakeFiles/lstypec.dir/build.make:98: lstypec] Error 1
	ake[1]: *** [CMakeFiles/Makefile2:839: CMakeFiles/lstypec.dir/all] Error 2
	ake: *** [Makefile:121: all] Error 2

Why does this need to be a library at all?

thanks,

greg k-h
