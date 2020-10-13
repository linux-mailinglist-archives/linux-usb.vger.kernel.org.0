Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2949228CA42
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 10:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390626AbgJMI34 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 04:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390540AbgJMI3z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 04:29:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D97C0613D0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2020 01:29:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 12A711F44F2B
Subject: Re: xhci problem -> general protection fault
To:     Mathias Nyman <mathias.nyman@linux.intel.com>, zwisler@google.com
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
 <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
 <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <48f2e022-1937-6ecc-ad8e-ef293fd2bfe1@collabora.com>
Date:   Tue, 13 Oct 2020 10:29:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

W dniu 13.10.2020 o 09:49, Mathias Nyman pisze:
> On 13.10.2020 0.53, zwisler@google.com wrote:
>> On Mon, Oct 12, 2020 at 10:20:31PM +0300, Mathias Nyman wrote:
>>> On 1.10.2020 19.43, zwisler@google.com wrote:
>>>> On Tue, Sep 29, 2020 at 01:35:31AM +0300, Mathias Nyman wrote:
>>
>>> I'm rewriting how xhci driver handles halted and canceled transfers.
>>> While looking into it I found an older case where hardware gives bad data
>>> in the output context. This was 10 years ago and on some specic hardware,
>>> see commit:
>>>
>>> ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.
>>>
>>>>
>>>> I'm happy to gather logs with more debug or run other experiments, if that
>>>> would be helpful.  As it is I don't really know how to debug the internal
>>>> state of the HC further, but hopefully the knowledge that the patch below
>>>> makes a difference will help us move forward.
>>>
>>> Great thanks, it will take some time before rewrite is ready.
>>
>> Should we/I invest time in trying to create a quirk similar to
>>
>>> ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.
>>
>> in the mean time, or should we just wait for your rewrite?
>>
> 
> I've been focusing on this part so rewrite shouldn't take long.

Thank you for doing that!

Should you be sending your patches not as a reply in this thread
kindly Cc me andrzej.p@collabora.com.

Regards,

Andrzej
