Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D47214779
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 18:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGDQls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 12:41:48 -0400
Received: from smtp116.iad3a.emailsrvr.com ([173.203.187.116]:51632 "EHLO
        smtp116.iad3a.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726632AbgGDQls (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 12:41:48 -0400
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Jul 2020 12:41:47 EDT
X-Auth-ID: halbert@halwitz.org
Received: by smtp39.relay.iad3a.emailsrvr.com (Authenticated sender: halbert-AT-halwitz.org) with ESMTPSA id 995904286;
        Sat,  4 Jul 2020 12:33:38 -0400 (EDT)
Subject: Re: Kernel crash during USB device enumeration or MSC mounting
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux USB List <linux-usb@vger.kernel.org>
References: <aa7c2ad9-3daa-7fec-3f2a-9e35a3196938@halwitz.org>
 <20200704153429.GA433456@kroah.com> <20200704153607.GB433456@kroah.com>
 <20200704160914.GB650205@rowland.harvard.edu>
From:   Dan Halbert <halbert@halwitz.org>
Message-ID: <e4028d6d-7a62-1887-67eb-81e39d25c162@halwitz.org>
Date:   Sat, 4 Jul 2020 12:33:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200704160914.GB650205@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Classification-ID: acc82e9c-8ce5-4137-b2d2-8000d3cbd7be-1-1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/4/20 12:09 PM, Alan Stern wrote:
> It looks to me as though the user is reformatting the USB drive on the
> microcontroller while it is mounted on the host.  At least, the log
> message:
> 
> [40864.285807] FAT-fs (sdc1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
> 
> seems to indicate that a FAT filesystem was mounted, and the circuitpython
> command storage.erase_filesystem() completely reinitializes the device's
> filesystem.
> 
> This is definitely a user error: It is forbidden for a device to
> manipulate data that it is exporting to a host as a USB drive.  And it's
> not surprising that doing so would cause the host to crash.
> 
> If you really want to call storage.erase_filesystem() while the device is
> connected to the host, you should at least unmount the drive on the host
> beforehand.

Thanks for your observations, which are very helpful in my thinking 
about this. That's correct, that code does reformat the filesystem, but 
it also does a USB reset, so the host should ideally not make an 
assumption that its idea of what is on the drive is correct when it 
re-enumerates.

We cannot tell the host from the MSC side that we want to unmount 
cleanly from the drive. We could disconnect from USB first.

I just confirmed with one of our users that he has also seen crashes on 
simple unplug of the mounted device.

I would hope that the host would not crash when the MSC device does 
something untoward, and that it would be more robust. It is a potential 
kernel attack mechanism otherwise.

The first crash trace I mentioned in my reply to Greg does seem to be 
inside the USB stack, not in the filesystem code. It's possible there 
are two problems here, or it's possible the filesystem code gets 
confused and is making the USB stack confused as well.

Dan
