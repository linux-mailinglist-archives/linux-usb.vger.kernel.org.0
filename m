Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F23048D3BB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 09:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiAMIkL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 03:40:11 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44434 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiAMIkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 03:40:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C833DB82186
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 08:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13552C36AE9;
        Thu, 13 Jan 2022 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642063208;
        bh=jBZHfE3i85F6o71aaXOLHmk6zI0ZjME/z1gF64/RCZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tLRK2jWtqZWEdu29g1tdBNX5BvWiAL1VhpeMogjbQIL5D+i9IHr2IQkKsnnpsU4q6
         bD1GDw/E8qDYUg2hGFzpZAdILTzkZMsv+A0nudyPoDpCBZdAl7ADfUP63ejiXdZuCj
         krCyL5HRNt2oRFlY0u9hkJjZaUmpmeZq4ICqC91I=
Date:   Thu, 13 Jan 2022 09:40:05 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     James <bjlockie@lockie.ca>, linux-usb <linux-usb@vger.kernel.org>
Subject: Re: problem with USB-C
Message-ID: <Yd/lZVRPgcLUqTrn@kroah.com>
References: <830aa508-5c20-c7c9-5ba9-04bcf5ac7178@lockie.ca>
 <Yd59HLmparwNaok9@kroah.com>
 <Yd72gTFL0BsC7vtR@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yd72gTFL0BsC7vtR@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 10:40:49AM -0500, Alan Stern wrote:
> > >     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid,
> > > 1.5M
> > >         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> > >     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid,
> > > 1.5M
> > >         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> > >     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> > > 1.5M
> > >         ID 30fa:0400
> > > 
> > > 
> > > Why are the hubs listed as Linux Foundation 3.0 root hubs and not 3.1 root
> > > hubs?
> > 
> > Because your devices do not advertise themselves as a USB 3.1 root hub.
> > Perhaps the documentation is incorrect?
> 
> No, that's not it at all.
> 
> The reason why the root hubs for buses 2 and 4 above are both listed as 
> "Linux Foundation 3.0 root hub" is because in hcd.c, the 
> usb31_rh_dev_descriptor and usb3_rh_dev_descriptor structures both set 
> their idProduct values to 0x03, 0x00 (0x0003 in little-endian form).  
> Therefore the hardware database can't distinguish between them.

Ah, right, I totally missed that.  I saw the two different definitions,
but missed the device number.

> One possibility would be for the usb31_rh_dev_descriptor to use 0x04, 
> 0x00 (with the corresponding update to the udev hardware database).  
> Another possibility is for the hardware database entry for product 0x0003
> to be changed simply to "Linux Foundation USB-3 root hub", so that it 
> doesn't specify 3.0, 3.1, or 3.2.

I can do that.  Should only take a few years to trickle out to the
slower distros :)

thanks,

greg k-h
