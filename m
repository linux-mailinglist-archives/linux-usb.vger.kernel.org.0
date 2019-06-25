Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A2854CF9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 12:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732261AbfFYK67 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 06:58:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:4483 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732391AbfFYK6v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Jun 2019 06:58:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 03:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="152261881"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga007.jf.intel.com with ESMTP; 25 Jun 2019 03:58:49 -0700
Subject: Re: USB bug
To:     Alan Stern <stern@rowland.harvard.edu>,
        Harutyun Khachatryan <kh_harut@mail.ru>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.1906241349270.1609-300000@iolanthe.rowland.org>
From:   Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <0c3d2bff-0093-2cbc-d16c-a27aa2ef1523@intel.com>
Date:   Tue, 25 Jun 2019 14:01:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1906241349270.1609-300000@iolanthe.rowland.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.6.2019 21.11, Alan Stern wrote:
> On Sun, 23 Jun 2019, Harutyun Khachatryan wrote:
> 
>> Dear Alan Stern,
>>
>> I thought that I should wait Mathias's response. I am terribly sorry for
>> that. I am sending dmesg log and trace content as you asked. I tried the
>> procedure on kernel 5.1.12-050112-generic since it's most recent now and
>> the bug still exists in it. If you need for 5.0 write me back. Thank you
>> in advance.
>>
>> Regards, Harutyun Khachatryan
> 
> Mathias, can you please look through the log and trace output that
> Harutyun sent?  His message doesn't appear to have gotten onto the
> mailing list, so I have attached copies of his files here.
> 
> I guess he tried to follow the procedure given in
> 
> 	https://marc.info/?l=linux-usb&m=155293069118478&w=2
> 
> Namely:
> 
> Boot with the Seagate HDD attached
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> <Plug in other USB device>
> <Wait 10 seconds>
> <Unplug other USB device>
> <Unplug the Seagate HDD>
> <Plug in other USB device>
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace
> 
> The problem is that the other USB device is not detected.  Harutyun
> didn't say at what points in the log the other device was plugged in,
> or which port it was plugged into.  It looks like the Seagate HDD was
> plugged into 4-1.
> 

There are no other port events than the disconnect of the 4-1 Seagate HDD
in the traces: (port link goes to Inactive first, then Disabled)

153.590150: xhci_handle_port_status: port-0: Powered Not-connected Disabled Link:Inactive PortSpeed:0 Change: CSC PLC Wake
153.590130: xhci_handle_event: EVENT: TRB 0000000005000000 status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:C
153.590157: xhci_hub_status_data: port-0: Powered Not-connected Disabled Link:Inactive PortSpeed:0 Change: CSC PLC Wake:
153.590158: xhci_hub_status_data: port-1: Powered Connected Enabled Link:U2 PortSpeed:4 Change: Wake:
153.590160: xhci_hub_status_data: port-2: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
153.590163: xhci_hub_status_data: port-3: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
...
153.689459: xhci_handle_event: EVENT: TRB 0000000005000000 status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:C
153.689477: xhci_handle_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: WRC PRC Wake:
< disabling slot, freeing ring etc here>

After a while the SS bus is suspended, xhci traces show wake flags are
set for SS roothub ports. Then there's nothing for 12 seconds, after which
we see a Interrupt URB being handled a few times every a second, probably
the external hub. Nothing else, no other port activity or traffic is seen.

154.839474: xhci_hub_status_data: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
154.839476: xhci_hub_status_data: port-1: Powered Connected Enabled Link:U2 PortSpeed:4 Change: Wake: WDE WOE
154.839478: xhci_hub_status_data: port-2: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
154.839479: xhci_hub_status_data: port-3: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
166.604073: xhci_handle_event: EVENT: TRB 000000044dd539c0 status 'Success' len 0 slot 4 ep 3 type 'Transfer Event' flags e:C
166.604080: xhci_handle_transfer: INTR: Buffer 000000044dd57000 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
166.604083: xhci_inc_deq: INTR ..
166.604086: xhci_urb_giveback: ep1in-intr: urb 0000000046808855 pipe 1077969792 slot 4 length 8/8 sgs 0/0 stream 0 flags 00000204

I can't spot any activity on the HS/FS side of xhci at all, and the SS bus
(usb4) is suspended here with a device (external hub?) in U2 link state.
Best guess so far is that it is related to runtime or link power management
withand the external hub.

Could be related to the SS device with LPM resume issue fixed here:
https://marc.info/?l=linux-usb&m=156101728630448&w=2

Harutyun Khachatryan, how about disabling runtime power management
for hubs before disconnecting the Seagate drive, can you check if
that helps. (as sudo or root, do)

echo on > /sys/bus/usb/devices/usb3/power/control
echo on > /sys/bus/usb/devices/usb4/power/control
echo on > /sys/bus/usb/devices/usb3/3-2/power/control
echo on > /sys/bus/usb/devices/usb4/4-2/power/control

Does it help?

-Mathias
