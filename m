Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4AA225C98
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 12:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgGTKZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 06:25:22 -0400
Received: from yes.iam.tj ([109.74.197.121]:48498 "EHLO iam.tj"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728001AbgGTKZV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 06:25:21 -0400
X-Greylist: delayed 86538 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jul 2020 06:25:20 EDT
Received: from [10.0.40.34] (unknown [51.155.44.233])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 365D6340AD;
        Mon, 20 Jul 2020 11:25:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1595240719; bh=nqa/jknYi1C7oHzp0vb7GuOaC5otEjuCwBUe93Ia7TM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=G7wAiTEVxor/avhuSuObnxzJRgJNzLNgZj4pxnuEpGti7zvxZD7m8FBtUc0t06eRZ
         XxhhP2SrZJ/Uh67FDO3PFxly08Y6ApQDR57hdTVfkmnIznM/lxZSrw0am4dl085EJs
         +TWa4nF1eYfHvDtT24avQeLdtJxrYfnbd8bESeTZrIw7FKC08/bmsbDmF752zB4lVv
         Onl7DPeNiW7ZDaBn3fIuoCZWxNnicup1f/V6PleLBbaDhicA7DiyZMOLa0+G4Dkfuo
         0mX1Q0rFWs2//UHnI/+8BkRldu73sXCR/7c5/5aC3BKD9RySOUeK31YCpTUNnvC2Pi
         BdYCwc0QCn8pg==
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6 inflight:
 IN
To:     Oliver Neukum <oneukum@suse.de>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
 <20200719110901.GE266150@kroah.com>
 <c6720231-e30c-41e4-cd2b-1b4b9baa0852@elloe.vision>
 <1595235102.2531.7.camel@suse.de>
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Organization: Elloe CIC
Message-ID: <c280ec82-cc00-f4b6-cc1f-12317cc8c23c@elloe.vision>
Date:   Mon, 20 Jul 2020 11:25:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595235102.2531.7.camel@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/07/2020 09:51, Oliver Neukum wrote:
>>
>> These repeated 'zaps' and resets every 30 seconds or so are not errors?
> 
> They are errors. But whose errors? 0x28 looks like a READ10 to me.
> In other words at least Test Unit Ready and READ_CAPACITY have
> already worked at this stage.
> Without a trace it is not clear what exactly this read is for.
> Is it always the same READ?
> 
> This looks like the error handling UAS does when a command times out.
> 
>> They never stop even though the devices are not mounted nor being
>> accessed (by users).
>>
>>>> [  199.939976] blk_update_request: I/O error, dev sda, sector 500117464
>>>> op 0x0:(READ) flags 0x80700 phys_seg 5 prio class 0
>>>
>>> So only the block layer is reporting errors, not the USB layer?  Any usb
>>> controller errors?
> 
> The error is from the SCSI layer strictly speaking. It notices that a
> command is taking longer than allowed and directs UAS to do error
> handling. SUbsequently an error is reported up to the block layer.
> 
> The problem is that we have a lot of unusual stuff being tested.

I've just built a kernel with more debugging options enabled and will
find time later today to install and test.

We have limited windows of time to test due to the Mox being our primary
gateway but I've ordered another Mox A (the main CPU module) so we can
test at will.

I'll update with the additional logs later.

Our Mox has maximum additional modules connected (they're named A
through G). The main CPU module (A) has its own USB3 port (presumably
via the SoC) but we're using the 4x USB3 module (F) which, I think, uses
a separate PCIe controller.

In our earlier tests the module A USB3 port wasn't active presumably
because we missed off a config option. Once we're corrected that we'll
test on the SoC USB3 port to help narrow down the responsible kernel
module(s) and layers.

https://www.turris.com/en/mox/modules/
