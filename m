Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87159765C35
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 21:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjG0Tio (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 15:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjG0Tim (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 15:38:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC33273C
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:38:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2358F2E4;
        Thu, 27 Jul 2023 21:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690486659;
        bh=QYXUdkx7fg7+czm6gafo0W1rp4FXvsBk4RFfJB0ftjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R7/w7FGBTSZIuB+syxCTUCNvyvHSqARfZymEd0ULlNgCmpni00BhRu9LWZPAfJcag
         4WZPHcyrD+/pMylRvBCtJcbSQkujaqPQGquKXLoafiBH8xwdZ1XU2FCw6yi9ikGerO
         9fRd08WHi5upcSrcjm0TgExfog3nzAdurr04KTfI=
Date:   Thu, 27 Jul 2023 22:38:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     marco@zatta.me, USB list <linux-usb@vger.kernel.org>
Subject: Re: Something is really broken for Logitech webcams
Message-ID: <20230727193844.GB16455@pendragon.ideasonboard.com>
References: <6dcde4c2-9400-44af-c8b4-5e63b947a2bf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6dcde4c2-9400-44af-c8b4-5e63b947a2bf@suse.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

On Thu, Jul 27, 2023 at 01:48:28PM +0200, Oliver Neukum wrote:
> Hi,
> 
> looking at bd21f0222adab
> ("USB: Fix chipmunk-like voice when using Logitech C270 for recording audio.")
> we see that it introduced RESET_RESUME for the C270 webcam
> 
> For that camera I asked a user to provide lsusb, which got this
> (a bit shortened)
> 
> Bus 001 Device 004: ID 046d:0825 Logitech, Inc. Webcam C270
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.00
>    bDeviceClass          239 Miscellaneous Device
>    bDeviceSubClass         2
>    bDeviceProtocol         1 Interface Association
>    bMaxPacketSize0        64
>    idVendor           0x046d Logitech, Inc.
>    idProduct          0x0825 Webcam C270
> 
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass        14 Video
>        bInterfaceSubClass      1 Video Control
>        bInterfaceProtocol      0
>        iInterface              0
> 
> So this thing says that it is UVC. That means that it should trigger
> e387ef5c47dde ("usb: Add USB_QUIRK_RESET_RESUME for all Logitech UVC webcams")
> adding the following declaration:
> 
> static const struct usb_device_id usb_interface_quirk_list[] = {
>          /* Logitech UVC Cameras */
>          { USB_VENDOR_AND_INTERFACE_INFO(0x046d, USB_CLASS_VIDEO, 1, 0),
>            .driver_info = USB_QUIRK_RESET_RESUME },
> 
> wich AFAICT matches the device.
> 
> On the face of it, this makes no sense. What is going on here?
> Do we really need to assume that Logitech has been selling a whole slew
> of cameras in both UVC and something else, which we have no driver for,
> but nobody complains?

The first Logitech webcams that were developed against the UVC
specification were not fully UVC-compatible. They were thus advertised
with a vendor-specific class. The uvcvideo driver supports them, you can
find the list in uvc_driver.c:

Logitech Quickcam Fusion			0x08c1
Logitech Quickcam Orbit MP			0x08c2
Logitech Quickcam Pro for Notebook		0x08c3
Logitech Quickcam Pro 5000			0x08c5
Logitech Quickcam OEM Dell Notebook		0x08c6
Logitech Quickcam OEM Cisco VT Camera II	0x08c7

This explains why usb_quirk_list has 6 corresponding entries.

Why Marco's patch is needed, I'm not sure. It seems that the device and
interface quirks are handled at different points of time, maybe that
plays a role ?

> Could somebody please look at this or am I somehow not right in the head?
> 
> And Marco specifically, did you make your patch based on a bisection?

-- 
Regards,

Laurent Pinchart
