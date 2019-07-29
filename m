Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22ABE790E7
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 18:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbfG2Qcq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 12:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:42196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727093AbfG2Qcq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jul 2019 12:32:46 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CFB6206BA;
        Mon, 29 Jul 2019 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564417964;
        bh=4Fh312ELDHB8pwm4YeNcmney9Tw0t40Ua4pyc1nbM6U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=V+E6Zy9EKv6vMJgxwOih9EzJLTQBt7DNWjU75isg1g84sqJmwuHOC/D8WDZuiYsjX
         dU8kQvECb7+L+w2+HYeZrZdGB+a0o7417KEdtZYvhDn4uZaDE6mS1Zq0znXSEZcOmH
         3RN7+OPV8Mdv4wglAHN2BP9BFXasmqSY3OrtIi44=
Subject: Re: [PATCH v2 2/2] usbip: Implement SG support to vhci
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     valentina.manea.m@gmail.com, stern@rowland.harvard.edu,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuah <shuah@kernel.org>
References: <20190705164355.14025-1-suwan.kim027@gmail.com>
 <20190705164355.14025-3-suwan.kim027@gmail.com>
 <7c697904-53e3-b469-c907-25b8fb7859bc@kernel.org>
 <20190729145241.GA4557@localhost.localdomain>
From:   shuah <shuah@kernel.org>
Message-ID: <787051b9-579d-6da5-9d04-3dd0ae3c770b@kernel.org>
Date:   Mon, 29 Jul 2019 10:32:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729145241.GA4557@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/29/19 8:52 AM, Suwan Kim wrote:
> Hi Shuah,
> 
> On Tue, Jul 23, 2019 at 06:21:53PM -0600, shuah wrote:
>> Hi Suwan,
>>
>> On 7/5/19 10:43 AM, Suwan Kim wrote:
>>> There are bugs on vhci with usb 3.0 storage device. Originally, vhci
>>> doesn't supported SG, so USB storage driver on vhci breaks SG list
>>> into multiple URBs and it causes error that a transfer got terminated
>>> too early because the transfer length for one of the URBs was not
>>> divisible by the maxpacket size.
>>>
>>> In this patch, vhci basically support SG and it sends each SG list
>>> entry to the stub driver. Then, the stub driver sees the total length
>>> of the buffer and allocates SG table and pages according to the total
>>> buffer length calling sgl_alloc(). After the stub driver receives
>>> completed URB, it again sends each SG list entry to vhci.
>>>
>>> If HCD of the server doesn't support SG, the stub driver breaks a
>>> single SG reqeust into several URBs and submit them to the server's
>>> HCD. When all the split URBs are completed, the stub driver
>>> reassembles the URBs into a single return command and sends it to
>>> vhci.
>>>
>>> Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>
>>> ---
>>>    drivers/usb/usbip/stub.h         |   7 +-
>>>    drivers/usb/usbip/stub_main.c    |  52 +++++---
>>>    drivers/usb/usbip/stub_rx.c      | 207 ++++++++++++++++++++++---------
>>>    drivers/usb/usbip/stub_tx.c      | 108 +++++++++++-----
>>>    drivers/usb/usbip/usbip_common.c |  60 +++++++-- >   drivers/usb/usbip/vhci_hcd.c     |  10 +-
>>>    drivers/usb/usbip/vhci_tx.c      |  49 ++++++--
>>>    7 files changed, 372 insertions(+), 121 deletions(-)
>>
>> While you are working on v3 to fix chekpatch and other issues
>> I pointed out, I have more for you.
>>
>> What happens when you have mismatched server and client side?
>> i.e stub does and vhci doesn't and vice versa.
>>
>> Make sure to run checkpatch. Also check spelling errors in
>> comments and your commit log.
>>
>> I am not sure if your eeror paths are correct. Run usbip_test.sh
>>
>> tools/testing/selftests/drivers/usb/usbip
> 
> I don't know what mismatch you mentioned. Are you saying
> "match busid table" at the end of usbip_test.sh?
> How does it relate to SG support of this patch?
> Could you tell me more about the problem situation?
> 

What happens when usbip_host is running a kernel without the sg
support and vhci_hcd does? Just make sure this works with the
checks for sg support status as a one of your tests for this
sg feature.

Looking forward to seeing v3 soon!

thanks,
-- Shuah



