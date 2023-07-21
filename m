Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924B675D0A4
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 19:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjGUR1X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 13:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjGUR05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 13:26:57 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 01E6635A3
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 10:26:22 -0700 (PDT)
Received: (qmail 1762664 invoked by uid 1000); 21 Jul 2023 13:26:22 -0400
Date:   Fri, 21 Jul 2023 13:26:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dingyan Li <18500469033@163.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        sebastian.reichel@collabora.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] USB: add usbfs ioctl to get specific
 superspeedplus rates
Message-ID: <71130307-1c5c-468b-b876-799c434002cc@rowland.harvard.edu>
References: <20230721084039.9728-1-18500469033@163.com>
 <2023072105-lethargic-saddling-ad97@gregkh>
 <130b453c.5c8f.1897872ce54.Coremail.18500469033@163.com>
 <2023072159-carol-underfeed-43eb@gregkh>
 <25f05926.7e4c.189791ece3b.Coremail.18500469033@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25f05926.7e4c.189791ece3b.Coremail.18500469033@163.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 21, 2023 at 11:43:29PM +0800, Dingyan Li wrote:
> Okay, got it. The motivation should come from real-world needs.
> 
> Just like I mentioned above, currently in libusb ioctl USBDEVFS_GET_SPEED
> is still used, especially where sysfs is not supported. My original idea
> was exactly trying to add this new ioctl into libusb. So in order to get 20Gbps
> speed, we need extra information. The basic workflow is like below:
> 
> // This is pretty much how libusb does it, get 10Gbps at most
> ret = ioctl(USBDEVFS_GET_SPEED)
> if (ret == USB_SPEED_SUPER_PLUS) then
>     speed = 10Gbps
>     // With this new ioctl, we can get 20Gbps now
>     ret = ioctl(USBDEVFS_GET_SSP_RATE)
>     if (ret == USB_SSP_GEN_2x2)
>         speed = 20Gbps
> 
> libusb can be a good place to document the usage of this new ioctl if similar patch
> can be accepted into it. And I can't think of other real-world users now. Of course,
> like you've explained, it seems quite unnecessary when sysfs is supported.

For what it's worth, many of the other ioctls in usbfs are documented 
(very incompletely) in Documentation/driver-api/usb/usb.rst.  That's 
probably the best place to add any documentation for new APIs.

Alan Stern
