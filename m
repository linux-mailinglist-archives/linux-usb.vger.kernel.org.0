Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE7F444BCE
	for <lists+linux-usb@lfdr.de>; Thu,  4 Nov 2021 00:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhKCX4I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Nov 2021 19:56:08 -0400
Received: from mga04.intel.com ([192.55.52.120]:57966 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhKCX4H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Nov 2021 19:56:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="230342467"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; 
   d="scan'208";a="230342467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 16:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; 
   d="scan'208";a="639100544"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2021 16:53:28 -0700
To:     Alan Stern <stern@rowland.harvard.edu>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, linux-usb@vger.kernel.org,
        chris.chiu@canonical.com, Mathias Nyman <mathias.nyman@intel.com>
References: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
 <YYJRRg8QDBfy2PP7@kroah.com>
 <9e1abe71-d903-f227-38ae-a854ab9e5baf@redhat.com>
 <5c95597b-289b-ea1c-4770-8be9e8511ae0@ti.com>
 <20211103145919.GC1521906@rowland.harvard.edu>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: 5.14.14+ USB regression caused by "usb: core: hcd: Add support
 for deferring roothub registration" series
Message-ID: <3cfc755c-7559-306c-bec4-ae87052fc7c0@linux.intel.com>
Date:   Thu, 4 Nov 2021 01:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211103145919.GC1521906@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3.11.2021 16.59, Alan Stern wrote:
> On Wed, Nov 03, 2021 at 08:14:35PM +0530, Kishon Vijay Abraham I wrote:
>> + Alan, Chris, Mathias, linux-usb
>>
>> Hi Hans,
>>
>> On 03/11/21 6:18 pm, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/3/21 10:07, Greg Kroah-Hartman wrote:
>>>> On Wed, Nov 03, 2021 at 10:02:52AM +0100, Hans de Goede wrote:
>>>>> Hi Greg,
>>>>>
>>>>> We (Fedora) have been receiving multiple reports about USB devices stopping
>>>>> working starting with 5.14.14 .
>>>>>
>>>>> An Arch Linux user has found that reverting the first 2 patches from this series:
>>>>> https://lore.kernel.org/all/20210909064200.16216-1-kishon@ti.com/
>>>>>
>>>>> Fixes things (the 3th patch is just some mostly unrelated refactoring/cleanup).
>>>>>
>>>>> See here for the Arch-linux discussion surrounding this:
>>>>> https://bbs.archlinux.org/viewtopic.php?pid=2000956#p2000956
>>>>>
>>>>> And here are 2 Fedora bug reports of Fedora users being unable to use their
>>>>> machines due their mouse + kbd not working:
>>>>>
>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2019542
>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2019576
>>>>>
>>>>> Can we get this patch-series reverted from the 5.14.y releases please ?
>>>>
>>>> Sure,
>>>
>>> Thanks.
>>>
>>>> but can you also submit patches to get into 5.15.y and 5.16-rc1
>>>> that revert these changes as they should still be an issue there, right?
>>>
>>> Yes I assume this is still an issue there too, but I was hoping that
>>> Kishon can take a look and maybe actually fix things, since just
>>> reverting presumably regresses whatever these patches were addressing.
>>>
>>> We've aprox 1-3 weeks before distros like Arch and Linux will switch
>>> to 5.15.y kernels.  So we have some time to come up with a fix
>>> there, where as for 5.14.y this is hitting users now.
>>
>> Is the issue with PCIe USB devices or platform USB device? Is it specific to
>> super speed devices or high speed device?
> 
> Look at the bug reports.  They are on standard PCs (so PCIe controllers) 
> and some of them involve full speed (mouse and keyboard) devices.  
> Although it looks like the problem has little to do with the device and 
> a lot to do with the controller.
> 
> Is there a good way to get more information about what is going wrong?  
> For example, by enabling tracepoints in the xhci-hcd driver?
> 
> Alan Stern
> 

To enable xhci traces and dynamic debug at boot please add:
"usbcore.dyndbg=+p xhci_hcd.dyndbg=+p trace_event=xhci-hcd trace_buf_size=80M"
to the kernel cmdline before booting.
(info added to https://bugzilla.redhat.com/show_bug.cgi?id=2019788 as well)

Symptoms look similar to an old race issue where two usb devices were reset at the same time.
xHC HW can't handle this, and to prevent it the hcd->address0_mutex was added.

for details see: 
https://lkml.org/lkml/2016/2/8/312

-Mathias
