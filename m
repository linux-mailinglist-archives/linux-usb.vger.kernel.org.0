Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BCF45169B
	for <lists+linux-usb@lfdr.de>; Mon, 15 Nov 2021 22:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350033AbhKOVfE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Nov 2021 16:35:04 -0500
Received: from mga04.intel.com ([192.55.52.120]:39246 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349333AbhKOVD6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Nov 2021 16:03:58 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232254620"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="232254620"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 12:58:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="645025149"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2021 12:58:41 -0800
To:     Mark Hills <mark@xwax.org>
Cc:     linux-usb@vger.kernel.org
References: <2111051005210.3125@stax.localdomain>
 <2a5d79d8-e12e-4e72-38f7-ab743b3a1efd@linux.intel.com>
 <2111061157310.2377@stax.localdomain>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: XHCI unplug of USB-C device is not detected
Message-ID: <597a8c22-3a0a-23c4-396b-fb539916a4c2@linux.intel.com>
Date:   Mon, 15 Nov 2021 23:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2111061157310.2377@stax.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6.11.2021 14.23, Mark Hills wrote:
> 
>> Also see if disabling runtime suspend for both roothubs helps:
>> # echo on > /sys/bus/usb/devices/usb1/power/control
>> # echo on > /sys/bus/usb/devices/usb2/power/control
> 
> Yes, it helps. I pinpointed it on usb3. The webcam can now be plugged and 
> re-plugged. It also survives a suspend/resume of the machine now and I can 
> see the change in portsc:
> 
>   -Powered Connected Enabled Link:U3 PortSpeed:4 Change: Wake:
>   +Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> 
> So it seems this is a workaround -- thank you.
> 
> Is it worth getting to the root of this problem (and can I capture any 
> data to help?) or is it just that some devices are buggy?

To me this looks more like a like a wakeup issue on your platform than a buggy usb device.
I'd look more into the what PCI D state the xHC controller is put into during
runtime suspend, and make sure it actually can generate a PME wake from that state. 
PCI code will select D state based on values from ACPI firmware DSDT tables so those might
be worth looking into. 

Assuming of course this is a PCI xhci controller  

-Mathias 


