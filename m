Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4D558ADB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 21:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfF0TRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 15:17:37 -0400
Received: from fallback15.mail.ru ([94.100.179.50]:56288 "EHLO
        fallback15.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfF0TRg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 15:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=HBkjWKP3tFjNi6ZZ+ZK9LXJ8173TfLcSkUZrdmEXTCU=;
        b=Z53wC0ruTrrs4F9PYsU1Gr9MRs8egvK0F27u9y52RfP57NPLXJo5od+iHpz6BWEM7pzwljcFzozgqOhSfcltJst4aYhmzCI/+2iYWmdRiuIZ9pG8+NqHruMrVuYXGa+DXsHACky6OaisAYIOhouh5Edg+zBhZIjZDgp2R7yuY7Y=;
Received: from [10.161.8.33] (port=57868 helo=smtp14.mail.ru)
        by fallback15.m.smailru.net with esmtp (envelope-from <kh_harut@mail.ru>)
        id 1hgZtk-0000EL-84; Thu, 27 Jun 2019 22:17:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=HBkjWKP3tFjNi6ZZ+ZK9LXJ8173TfLcSkUZrdmEXTCU=;
        b=Z53wC0ruTrrs4F9PYsU1Gr9MRs8egvK0F27u9y52RfP57NPLXJo5od+iHpz6BWEM7pzwljcFzozgqOhSfcltJst4aYhmzCI/+2iYWmdRiuIZ9pG8+NqHruMrVuYXGa+DXsHACky6OaisAYIOhouh5Edg+zBhZIjZDgp2R7yuY7Y=;
Received: by smtp14.mail.ru with esmtpa (envelope-from <kh_harut@mail.ru>)
        id 1hgZta-00022Q-7s; Thu, 27 Jun 2019 22:17:22 +0300
Subject: Re: USB bug
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.1906241349270.1609-300000@iolanthe.rowland.org>
 <0c3d2bff-0093-2cbc-d16c-a27aa2ef1523@intel.com>
From:   Harutyun Khachatryan <kh_harut@mail.ru>
Message-ID: <afe2c5d9-d435-beac-e015-181e0790f465@mail.ru>
Date:   Thu, 27 Jun 2019 23:17:18 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <0c3d2bff-0093-2cbc-d16c-a27aa2ef1523@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-77F55803: 260C666A7D66B36A5A78504BD2AC2941481933ED0AD08792B628FACBBF6C64876F01B01FA0313873C7B75F9035D394FB
X-7FA49CB5: 0D63561A33F958A575FB9F887AF743EDB3F1D4B7403AEFA2896F71D402040B8A8941B15DA834481FA18204E546F3947CD23BF7408B3F9022F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8BF77088377309FF52A471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224992B0BE0DA6BB795D3AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE73C350047980234DBCD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE73611F2D37873D32BD99A60562D1D3A1875ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-Mailru-Sender: D506DE885219FA6AACC540DC0644B2C193F167A19BCDD52566087F9DEB502637C1762CDF3CC0E93FC16205A4B6DDF17FC77752E0C033A69E72BAB3D1E5E95DF258F734EE8946DBCD3453F38A29522196
X-Mras: OK
X-77F55803: 669901E4625912A97F9F52485CB584D7271FD7DF62800FDC21840F6D13696A215D057087E85900F730345F449E5309372E772F064DB4DBE6
X-7FA49CB5: 0D63561A33F958A5947D7249CC2AE06271BEB957846648342EDE52065942B4CB8941B15DA834481FA18204E546F3947CD166953D3EA3826BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8BEC1C9C6CFAD2A0F5A471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-MI: 800000
X-Mailru-Sender: A5480F10D64C9005D917D4885F602B38E9FA4517CE363BE043139340FCE0CEB4CAD9E41E18892B0FFD10878B7E0ACC67FB559BB5D741EB96E710EA8653A4FBC80F2DC73CC0BFB1A30DA7A0AF5A3A8387
X-Mras: OK
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Mathias Nyman,

the commands has actually helped. But it is strange that the system 
behavior has changed, without that command no more usb devices can be 
connected to the machine. Even Seagate HDD after disconnecting was not 
able to be connected again. So only with that commands you had written 
all usb devices was able to work.

Regards, Harutyun Khachatryan

On 6/25/19 3:01 PM, Mathias Nyman wrote:
> On 24.6.2019 21.11, Alan Stern wrote:
>> On Sun, 23 Jun 2019, Harutyun Khachatryan wrote:
>>
>>> Dear Alan Stern,
>>>
>>> I thought that I should wait Mathias's response. I am terribly sorry 
>>> for
>>> that. I am sending dmesg log and trace content as you asked. I tried 
>>> the
>>> procedure on kernel 5.1.12-050112-generic since it's most recent now 
>>> and
>>> the bug still exists in it. If you need for 5.0 write me back. Thank 
>>> you
>>> in advance.
>>>
>>> Regards, Harutyun Khachatryan
>>
>> Mathias, can you please look through the log and trace output that
>> Harutyun sent?  His message doesn't appear to have gotten onto the
>> mailing list, so I have attached copies of his files here.
>>
>> I guess he tried to follow the procedure given in
>>
>>     https://marc.info/?l=linux-usb&m=155293069118478&w=2
>>
>> Namely:
>>
>> Boot with the Seagate HDD attached
>> mount -t debugfs none /sys/kernel/debug
>> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
>> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
>> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>> <Plug in other USB device>
>> <Wait 10 seconds>
>> <Unplug other USB device>
>> <Unplug the Seagate HDD>
>> <Plug in other USB device>
>> Send output of dmesg
>> Send content of /sys/kernel/debug/tracing/trace
>>
>> The problem is that the other USB device is not detected. Harutyun
>> didn't say at what points in the log the other device was plugged in,
>> or which port it was plugged into.  It looks like the Seagate HDD was
>> plugged into 4-1.
>>
>
> There are no other port events than the disconnect of the 4-1 Seagate HDD
> in the traces: (port link goes to Inactive first, then Disabled)
>
> 153.590150: xhci_handle_port_status: port-0: Powered Not-connected 
> Disabled Link:Inactive PortSpeed:0 Change: CSC PLC Wake
> 153.590130: xhci_handle_event: EVENT: TRB 0000000005000000 status 
> 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:C
> 153.590157: xhci_hub_status_data: port-0: Powered Not-connected 
> Disabled Link:Inactive PortSpeed:0 Change: CSC PLC Wake:
> 153.590158: xhci_hub_status_data: port-1: Powered Connected Enabled 
> Link:U2 PortSpeed:4 Change: Wake:
> 153.590160: xhci_hub_status_data: port-2: Powered Not-connected 
> Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> 153.590163: xhci_hub_status_data: port-3: Powered Not-connected 
> Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> ...
> 153.689459: xhci_handle_event: EVENT: TRB 0000000005000000 status 
> 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:C
> 153.689477: xhci_handle_port_status: port-0: Powered Not-connected 
> Disabled Link:RxDetect PortSpeed:0 Change: WRC PRC Wake:
> < disabling slot, freeing ring etc here>
>
> After a while the SS bus is suspended, xhci traces show wake flags are
> set for SS roothub ports. Then there's nothing for 12 seconds, after 
> which
> we see a Interrupt URB being handled a few times every a second, probably
> the external hub. Nothing else, no other port activity or traffic is 
> seen.
>
> 154.839474: xhci_hub_status_data: port-0: Powered Not-connected 
> Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
> 154.839476: xhci_hub_status_data: port-1: Powered Connected Enabled 
> Link:U2 PortSpeed:4 Change: Wake: WDE WOE
> 154.839478: xhci_hub_status_data: port-2: Powered Not-connected 
> Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
> 154.839479: xhci_hub_status_data: port-3: Powered Not-connected 
> Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
> 166.604073: xhci_handle_event: EVENT: TRB 000000044dd539c0 status 
> 'Success' len 0 slot 4 ep 3 type 'Transfer Event' flags e:C
> 166.604080: xhci_handle_transfer: INTR: Buffer 000000044dd57000 length 
> 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> 166.604083: xhci_inc_deq: INTR ..
> 166.604086: xhci_urb_giveback: ep1in-intr: urb 0000000046808855 pipe 
> 1077969792 slot 4 length 8/8 sgs 0/0 stream 0 flags 00000204
>
> I can't spot any activity on the HS/FS side of xhci at all, and the SS 
> bus
> (usb4) is suspended here with a device (external hub?) in U2 link state.
> Best guess so far is that it is related to runtime or link power 
> management
> withand the external hub.
>
> Could be related to the SS device with LPM resume issue fixed here:
> https://marc.info/?l=linux-usb&m=156101728630448&w=2
>
> Harutyun Khachatryan, how about disabling runtime power management
> for hubs before disconnecting the Seagate drive, can you check if
> that helps. (as sudo or root, do)
>
> echo on > /sys/bus/usb/devices/usb3/power/control
> echo on > /sys/bus/usb/devices/usb4/power/control
> echo on > /sys/bus/usb/devices/usb3/3-2/power/control
> echo on > /sys/bus/usb/devices/usb4/4-2/power/control
>
> Does it help?
>
> -Mathias
