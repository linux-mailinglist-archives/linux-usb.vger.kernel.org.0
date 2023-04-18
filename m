Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2FF6E5F45
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 13:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjDRLDL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 07:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDRLDJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 07:03:09 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A656273C
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
        Content-Type; bh=kfz7jdUN5bzyUqJFMb5YxYNh21En4J5U4I3bb5wnNqY=;
        b=QfR3+40Cpufhw4VgG1BDqn1RWm9mV77h5GlSZsw3wOCg0zfkodj7kgyXjIfCWW
        8KjOEBTxxRzCGniuDlbHl3TlUTMzf+ELN87ITw+Ms7AXjz4jAZxlDRTV3Vm2P7pt
        NVhFGvfdW6+rdHrapqD736jrvzTu/BdPue/rRvlXW6v4A=
Received: from [172.21.25.67] (unknown [218.201.129.19])
        by zwqz-smtp-mta-g4-3 (Coremail) with SMTP id _____wCHJjvIeD5kp9AaBw--.30530S2;
        Tue, 18 Apr 2023 19:02:33 +0800 (CST)
Message-ID: <3d018e04-6802-73a0-872b-1cab10086eee@163.com>
Date:   Tue, 18 Apr 2023 19:02:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] drivers: usb: wwan: treat any error as a fatal error
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>, Alan Stern <stern@rowland.harvard.edu>
References: <20230414055306.8805-1-qianfanguijin@163.com>
 <ZDj6Vhv6XHUADSFQ@hovoldconsulting.com>
 <a0226d7b-c03a-5e45-4ecb-2748c25126a2@suse.com>
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <a0226d7b-c03a-5e45-4ecb-2748c25126a2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHJjvIeD5kp9AaBw--.30530S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyUJw4fGr1fKr1fWr4fuFg_yoW8AF1fpF
        WxX3WDKFWDWF12yrn7Zr1j9FyFqr43Ar4rGF4rX34IgF1DWr9IgrW8ta47Wa9Fgr4rJ3W2
        vr4jy3s7tw1UuaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWVbkUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGhZV7VaEE8ASzwAAso
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



在 2023/4/17 17:50, Oliver Neukum 写道:
>
>
> On 14.04.23 09:01, Johan Hovold wrote:
>> On Fri, Apr 14, 2023 at 01:53:06PM +0800, qianfanguijin@163.com wrote:
>>> From: qianfan Zhao <qianfanguijin@163.com>
>>>
>>> Kernel print such flood message when the modem dead (the device is not
>>> disconnected but it doesn't response anything):
>>>
>>> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on 
>>> endpoint 05.
>>> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on 
>>> endpoint 05.
>>> ...
>>>
>>> So treat any error that doesn't recognized as a fatal error and do not
>>> resubmit again.
>>
>> This could potentially break setups that are currently able to recover
>> from intermittent errors.
>
> Yes. The basic issue is that a physically disconnected device
> produces the same errors as an intermittent failure for a short
> time before the disconnection is detected.
>
> Hence the correct way to handle this would be like usbhid does
> with hid_io_error(), that is a delay before resubmitting
> and eventually a device reset.
Thanks, and `acm_read_bulk_callback` is also a good example, create a
delayed work and resubmit later.
>
>> Try adding the missing known fatal ones as you suggested in your other
>> thread first.
>>
>> There could still be an issue with -EPROTO (-71) error that would
>> require some kind of back-off or limit, but that would need to be
>> implemented in a more central place rather than in each and every usb
>> driver (as has been discussed in the past).
>
> Exactly. How would that look like conceptually?
> A centralized work with a pool of URBs to be retried after a delay
> and eventually a device reset?
>
> Handling unbinding a driver would be tough, though.
>
>     Regards
>         Oliver

