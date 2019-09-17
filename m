Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42613B452D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 03:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390703AbfIQBOh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 21:14:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:48559 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728842AbfIQBOh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Sep 2019 21:14:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 18:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; 
   d="scan'208";a="198528953"
Received: from jerryopenix.sh.intel.com (HELO jerryopenix) ([10.239.158.171])
  by orsmga002.jf.intel.com with ESMTP; 16 Sep 2019 18:14:35 -0700
Date:   Tue, 17 Sep 2019 09:13:15 +0800
From:   "Liu, Changcheng" <changcheng.liu@intel.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: patch "usbip: tools: fix GCC8 warning for strncpy" added to
 usb-next
Message-ID: <20190917011315.GA26753@jerryopenix>
References: <156412454492134@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156412454492134@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,
   Do we have plan to merge this patch into 5.3 Release?
   I hit the build problem(warning turns to be error under -Werror) when
   building 5.3 version.

B.R.
Changcheng

On 09:02 Fri 26 Jul, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     usbip: tools: fix GCC8 warning for strncpy
> 
> to my usb git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> in the usb-next branch.
> 
> The patch will show up in the next release of the linux-next tree
> (usually sometime within the next 24 hours during the week.)
> 
> The patch will also be merged in the next major kernel release
> during the merge window.
> 
> If you have any questions about this process, please let me know.
> 
> 
> From 6389a62ff798e781567645c0b0ca3dd7b8a4289d Mon Sep 17 00:00:00 2001
> From: "Liu, Changcheng" <changcheng.liu@intel.com>
> Date: Thu, 25 Jul 2019 21:22:09 +0800
> Subject: usbip: tools: fix GCC8 warning for strncpy
> 
> GCC8 started emitting warning about using strncpy with number of bytes
> exactly equal destination size which could lead to non-zero terminated
> string being copied. Use "SYSFS_PATH_MAX - 1" & "SYSFS_BUS_ID_SIZE - 1"
> as number of bytes to ensure name is always zero-terminated.
> 
> Signed-off-by: Changcheng Liu <changcheng.liu@aliyun.com>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Link: https://lore.kernel.org/r/20190725132209.GA27590@jerryopenix
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  tools/usb/usbip/libsrc/usbip_common.c        | 6 ++++--
>  tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
> index bb424638d75b..b8d7d480595a 100644
> --- a/tools/usb/usbip/libsrc/usbip_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_common.c
> @@ -226,8 +226,10 @@ int read_usb_device(struct udev_device *sdev, struct usbip_usb_device *udev)
>  	path = udev_device_get_syspath(sdev);
>  	name = udev_device_get_sysname(sdev);
>  
> -	strncpy(udev->path,  path,  SYSFS_PATH_MAX);
> -	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE);
> +	strncpy(udev->path,  path,  SYSFS_PATH_MAX - 1);
> +	udev->path[SYSFS_PATH_MAX - 1] = '\0';
> +	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE - 1);
> +	udev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
>  
>  	sscanf(name, "%u-%u", &busnum, &devnum);
>  	udev->busnum = busnum;
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 5a3726eb44ab..051d7d3f443b 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -91,7 +91,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>  	copy_descr_attr16(dev, &descr, idProduct);
>  	copy_descr_attr16(dev, &descr, bcdDevice);
>  
> -	strncpy(dev->path, path, SYSFS_PATH_MAX);
> +	strncpy(dev->path, path, SYSFS_PATH_MAX - 1);
> +	dev->path[SYSFS_PATH_MAX - 1] = '\0';
>  
>  	dev->speed = USB_SPEED_UNKNOWN;
>  	speed = udev_device_get_sysattr_value(sdev, "current_speed");
> @@ -110,7 +111,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>  	dev->busnum = 0;
>  
>  	name = udev_device_get_sysname(plat);
> -	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE);
> +	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE - 1);
> +	dev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
>  	return 0;
>  err:
>  	fclose(fd);
> -- 
> 2.22.0
> 
> 
