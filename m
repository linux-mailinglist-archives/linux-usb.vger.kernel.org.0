Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21F9307BB8
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 18:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhA1REA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 12:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbhA1RCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 12:02:22 -0500
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C0BC0613ED
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 09:01:27 -0800 (PST)
Received: from [195.4.92.124] (helo=sub5.freenet.de)
        by mout1.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l5Afb-00007Y-NS; Thu, 28 Jan 2021 18:01:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:To:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3mGE2yXi2Ohd4P8EXREARx+pfrrRSNGGu+pQ0tMGGz0=; b=mQzc0c4dJ8yLwKwrZ+DTqXhSV9
        rBD8odu8fyXBzQHOwZaDk3ArOdGkmqJsy2YB/b1FwRqIqSQ7x+i6q8zKFQ0Xkllb9+WwqtOqxNGvM
        7W2bNnwSIeOLXUNU/kLEcedsILrvEmO/uHwSNOY/2jPKpszNlh2V3BjXvQBGBJKz59S+CaTxd3KeH
        2vMIZ9QvWqCx7KARtTGOxLr52vQCCdqohv/hMnAHDPUeJZ/FGHkrTFHnDR9jD/5B4mItebJ6eDPWH
        tWBJTjuGRWw5d0PAt46jyq8AhGZKfSDfgTcJwjTFNkDsoYUE85kyUekBSXVcWqVZCrZtmeGMwTyIv
        Klx+h5Ug==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:60120 helo=mail.maya.org)
        by sub5.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l5Afa-0002uv-CN; Thu, 28 Jan 2021 18:01:23 +0100
Received: internal info suppressed
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
 <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
 <d9fd7812-43cc-2813-5222-5e39b63fccbc@01019freenet.de>
 <8de6ecb9-4a39-5742-a358-d6965feffc79@linux.intel.com>
 <021e1727-0e2e-0207-ace2-4382489eea1f@linux.intel.com>
 <de0cab7e-6e25-fe80-b1d7-d50f63d6e54c@01019freenet.de>
 <9c3c9dd7-bcfb-785c-8c11-39f78a7fca01@01019freenet.de>
 <ab675d28-d80f-ed72-5db0-943cb26819f1@linux.intel.com>
From:   Andreas Hartmann <andihartmann@01019freenet.de>
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
Message-ID: <8d7c6b41-2706-86b3-b52f-1f55cee791d2@01019freenet.de>
Date:   Thu, 28 Jan 2021 18:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ab675d28-d80f-ed72-5db0-943cb26819f1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!60120
X-FNSign: v=2 s=575E0B8040521486F2384427B2EED68D2798FE8D2AA40D2E1B9CB8BB336AD8C5
X-Scan-TS: Thu, 28 Jan 2021 18:01:22 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 28.01.21 at 15:14 Mathias Nyman wrote:
> 
>>> If I'm understanding it correctly, you're always creating a bounce
>>> buffer though it is not necessary (at least in my case - my test patch
>>> proofed, that no changes at all are necessary). Why aren't you checking
>>> for URB_NO_TRANSFER_DMA_MAP at the very beginning? Or is it your purpose
>>> to first basically test your new code path? That would be ok.
> 
> Bounce buffer is only used when there is no other way of meeting the xHCI
> alignment requirements. Worst case is once every 255 TRB, and for maximum 1024bytes.
> Each TRB can point to 64K of data.

This driver is from ~2012 - I'm not sure if they already considered USB 3.x at 
this time (comments to USB 2 and 1 can be found). *I* could not find any 512 Bytes 
related alignment code - but that doesn't say much. I tried to map the xHCI spec 
to the Linux urb API - I'm not sure how to map TRBs or TDs. Could a urb be 
understood as a TRB?

> I can't go against the spec just because it doesn't cause issues in your
> two usecases. The overhead of the bounce buffer usage is so small there's no
> point in that kind of optimization.

That's why I am a bit unsure at the moment regarding the result of the test. As I 
meanwhile know that it's working even w/o doing anything (by chance?), I can't say 
for sure that your patch is working as expected. The only thing I can say, is (see 
below): it doesn't hurt any more.

> URB_NO_TRANSFER_DMA_MAP only indicates the data was DMA mapped before driver
> submitted the URB, so usb core does not need to map it.
> 
> I was speculating that it could be a cause why data is so oddly aligned
> (urbs with data starting at less than 512 bytes from 64k boundary), and
> thus not meeting the xHC boundary and aligment requirements even if data
> is otherwise contiguous.
> 
> xHC controller doesn't care who mapped the data, or if data is in a sg list
> or already contiguous in urb->transfer_buffer as long as we follow
> the aligment and boudary rules.
> 
> Bug was that driver assumed the data that needed to be bounce
> buffered was in a sg list. Your cased proved it could be in
> urb->transfer_buffer instead.

That's true for sure: the driver fills the data into transfer_buffer (it uses 
usb_fill_bulk_urb).

>>> I tested with the notebook (in both directions) - it seems to work - I
>>> didn't get any problems though I used 24 kB bulk packets. Throughput was
>>> unaltered high.
>>>
>>> I'm doing the same test tomorrow with the other USB 3.1 controller!
>>
>> Successfully tested on the other USB 3.1 host.
>>
> 
> Thank you, much appreciated.
> 
> I think I'll submit this patch as it is (with a proper commit message)
> can I add reported-by: Andreas Hartmann <andihartmann@01019freenet.de>, and
> tested-by: Andreas Hartmann <andihartmann@01019freenet.de> tags to the patch?

That's OK for me.


Thanks
Andreas
