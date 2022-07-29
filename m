Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD45584CEA
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jul 2022 09:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiG2Hs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 03:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbiG2Hsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 03:48:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8F3804A8
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 00:47:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A0AA61B57
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 07:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195A5C433C1;
        Fri, 29 Jul 2022 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1659080878;
        bh=ogKeY+osJbpgPbhp/7i4ekQUyZRAuA2Pc/A6Ga9LRhM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nJ5lWgp6GzYArq4f+Ii1/yvZ39wF07voldZsnhb/6eNdryg1Jrn0DdvDEVTYle9hL
         e4CoyIDPh7IfiT2vkVaf5p1k8CSW0ztXGS7RkD1VlcCI2t6ceV6iH9Y8NxHRBwLK/N
         lsMl+74rPD3FNNpswkbKJfVRJ2EaHouxHkncsMRk=
Date:   Fri, 29 Jul 2022 09:47:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>, Maxim Devaev <mdevaev@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: gadget: f_hid: Add Get-Feature report
Message-ID: <YuOQq2d0vPe5Uh7p@kroah.com>
References: <20220726005824.2817646-1-vi@endrift.com>
 <YuJD7Xp3Ue86Y+I+@kroah.com>
 <012961c6-8910-cee6-e479-2ad8261ddd72@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <012961c6-8910-cee6-e479-2ad8261ddd72@endrift.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 28, 2022 at 11:07:20AM -0700, Vicki Pfau wrote:
> 
> 
> On 7/28/22 01:08, Greg Kroah-Hartman wrote:
> > On Mon, Jul 25, 2022 at 05:58:25PM -0700, Vicki Pfau wrote:
> >> --- /dev/null
> >> +++ b/include/uapi/linux/usb/g_hid.h
> >> @@ -0,0 +1,38 @@
> >> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> >> +/*
> >> + * g_hid.h -- Header file for USB HID gadget driver
> >> + *
> >> + * Copyright (C) 2022 Valve Software
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License
> >> + * along with this program; if not, write to the Free Software
> >> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> > 
> > This whole license "boilerplate" is not needed, and should be removed
> > (especially things like addresses, that's crazy).
> > 
> > Only thing that is needed is the SPDX line.
> 
> I was just copying the header from g_printer.h and changing as needed. It hasn't been touched since 2017, so if that's no longer the convention you might want to update it too.

Good point, I will look into that.

> >> + */
> >> +
> >> +#ifndef __UAPI_LINUX_USB_G_HID_H
> >> +#define __UAPI_LINUX_USB_G_HID_H
> >> +
> >> +#include <linux/types.h>
> >> +
> >> +struct usb_hidg_report {
> >> +	__u16 length;
> >> +	__u8 data[512];
> > 
> > Why 512?
> 
> I was reading the specs and one of them said the maximum report length for USB 3 (I believe) was 512 bytes (in contrast with USB 2's 64). I can try to find where it said this, or add a define for max report length.

Either is fine, magic values like this should always be documented
somehow.

> >> +};
> >> +
> >> +/* The 'g' code is also used by gadgetfs and hid gadget ioctl requests.
> >> + * Don't add any colliding codes to either driver, and keep
> >> + * them in unique ranges (size 0x20 for now).
> >> + */
> >> +#define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)
> > 
> > This should be in the same .h file so that we don't get confused and
> > accidentally use the same ioctl.
> 
> The same .h file as which? g_printer.h and gadgetfs.h are separate files.

Whatever the uapi .h file is, should have the list of ioctls, not
scattered around the core kernel files.

> 
> > 
> >> +
> >> +#endif /* __UAPI_LINUX_USB_G_HID_H */
> >> diff --git a/include/uapi/linux/usb/gadgetfs.h b/include/uapi/linux/usb/gadgetfs.h
> >> index 835473910a49..9754822b2a40 100644
> >> --- a/include/uapi/linux/usb/gadgetfs.h
> >> +++ b/include/uapi/linux/usb/gadgetfs.h
> >> @@ -62,7 +62,7 @@ struct usb_gadgetfs_event {
> >>  };
> >>  
> >>  
> >> -/* The 'g' code is also used by printer gadget ioctl requests.
> >> +/* The 'g' code is also used by printer and hid gadget ioctl requests.
> > 
> > Yeah, put the definition here.
> 
> Should I move the g_printer.h definitions here at the same time? Maybe stub out g_printer.h and make it include gadgetfs.h?

Move them in the first patch in the series would be great.  And no need
for stubbed out .h file, that's not needed for internal .h files.

thanks,

greg k-h
