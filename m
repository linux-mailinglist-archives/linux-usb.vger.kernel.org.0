Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 108BB751AC
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 16:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388363AbfGYOqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 10:46:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:64275 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387829AbfGYOqH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jul 2019 10:46:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 07:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; 
   d="scan'208";a="170264934"
Received: from jerryopenix.sh.intel.com (HELO jerryopenix) ([10.239.158.171])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2019 07:46:06 -0700
Date:   Thu, 25 Jul 2019 22:44:41 +0800
From:   "Liu, Changcheng" <changcheng.liu@intel.com>
To:     shuah <shuah@kernel.org>
Cc:     valentina.manea.m@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usbip: tools: fix GCC8 warning for strncpy
Message-ID: <20190725144441.GA10957@jerryopenix>
References: <20190725132209.GA27590@jerryopenix>
 <2cac538b-3806-8b1f-9dce-34be9d862102@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cac538b-3806-8b1f-9dce-34be9d862102@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08:19 Thu 25 Jul, shuah wrote:
> On 7/25/19 7:22 AM, Liu, Changcheng wrote:
> > GCC8 started emitting warning about using strncpy with number of bytes
> > exactly equal destination size which could lead to non-zero terminated
> > string being copied. Use "SYSFS_PATH_MAX - 1" & "SYSFS_BUS_ID_SIZE - 1"
> > as number of bytes to ensure name is always zero-terminated.
> > 
> > Signed-off-by: Changcheng Liu <changcheng.liu@aliyun.com>
> > ---
> > v1 -> v2:
> >   * Correct array tail index
> > ---
> >   tools/usb/usbip/libsrc/usbip_common.c        | 6 ++++--
> >   tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
> >   2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
> > index bb424638d75b..b8d7d480595a 100644
> > --- a/tools/usb/usbip/libsrc/usbip_common.c
> > +++ b/tools/usb/usbip/libsrc/usbip_common.c
> > @@ -226,8 +226,10 @@ int read_usb_device(struct udev_device *sdev, struct usbip_usb_device *udev)
> >   	path = udev_device_get_syspath(sdev);
> >   	name = udev_device_get_sysname(sdev);
> > -	strncpy(udev->path,  path,  SYSFS_PATH_MAX);
> > -	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE);
> > +	strncpy(udev->path,  path,  SYSFS_PATH_MAX - 1);
> > +	udev->path[SYSFS_PATH_MAX - 1] = '\0';
> > +	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE - 1);
> > +	udev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
> 
> strlcpy() would be better choice here. Any reason to not use that?
> 
@Shuah: linux tools link with libc which doesn't implment strlcpy yet.
So tools source code can't use strlcpy function like other kernel source
code.

> >   	sscanf(name, "%u-%u", &busnum, &devnum);
> >   	udev->busnum = busnum;
> > diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> > index 5a3726eb44ab..051d7d3f443b 100644
> > --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> > +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> > @@ -91,7 +91,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
> >   	copy_descr_attr16(dev, &descr, idProduct);
> >   	copy_descr_attr16(dev, &descr, bcdDevice);
> > -	strncpy(dev->path, path, SYSFS_PATH_MAX);
> > +	strncpy(dev->path, path, SYSFS_PATH_MAX - 1);
> > +	dev->path[SYSFS_PATH_MAX - 1] = '\0';
> >   	dev->speed = USB_SPEED_UNKNOWN;
> >   	speed = udev_device_get_sysattr_value(sdev, "current_speed");
> > @@ -110,7 +111,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
> >   	dev->busnum = 0;
> >   	name = udev_device_get_sysname(plat);
> > -	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE);
> > +	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE - 1);
> > +	dev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
> 
> strlcpy() would be better choice here. Any reason to not use that?
> 
> >   	return 0;
> >   err:
> >   	fclose(fd);
> > 
> 
> thanks,
> -- Shuah
