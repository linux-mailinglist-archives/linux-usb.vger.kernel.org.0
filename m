Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2596F2FD278
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 15:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbhATOQ1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 20 Jan 2021 09:16:27 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:42428 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbhATMqY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 07:46:24 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id CAC70180031;
        Wed, 20 Jan 2021 07:44:48 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [46.235.227.227]) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384
 (256/256 bits)) (No client certificate requested) by smtp.bonedaddy.net
 (Postfix) with ESMTPS id 3B0CB180031 for <pabs3@bonedaddy.net>; Wed, 20 Jan
 2021 06:59:06 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none)
 header.from=collabora.com
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 4D2CF1F456A9
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
To:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Paul Wise <pabs3@bonedaddy.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Porter <mporter@linaro.org>,
        Karol Lewandowski <k.lewandowsk@samsung.com>
Cc:     linux-usb@vger.kernel.org
References: <CGME20210119200737eucas1p12bfb53d11543ee2ccb1a4bc2138f6535@eucas1p1.samsung.com>
 <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <ef8906a7-0412-dbe3-d30a-2ac6d4f1b76d@samsung.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <72b91ed1-d2c8-cc02-9de4-344e8f423233@collabora.com>
Date:   Wed, 20 Jan 2021 12:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ef8906a7-0412-dbe3-d30a-2ac6d4f1b76d@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

W dniu 19.01.2021 o 21:15, Krzysztof Opasiak pisze:
> 
> 
> On 19.01.2021 21:06, Paul Wise wrote:
>> Hi Greg, all,
>>
>> Right now all the Linux userspace USB gadget projects (libusbg,
>> libusbgx, gt, gadgetd, cmtp-responder etc) are spread out across
>> different GitHub organisations and user accounts.
> 
> Anything that could increase the bandwidth on the components that I
> maintain makes perfect sense to me.
> I've been moved to a little bit different challenges and I've very
> little to no time for the maintenance...
> 

I can offer 2h/week to help maintaining/developing.

(re-pasting the links to de-obfuscate them after Krzysztof's reply)

https://github.com/libusbg/libusbg
https://github.com/libusbgx/libusbgx
https://github.com/kopasiak/gt
https://github.com/gadgetd/gadgetd
https://github.com/cmtp-responder/cmtp-responder

As far as I know switching from libusbg to libusbgx is a move endorsed by 
libusbg's author.
@Matt: Am I right?

For sure gt depends on libusbgx, not libusbg.

>>
>> I would like to move each of these projects to the linux-usb GitHub
>> organisation and add some more folks to the list of admins so that
>> these projects can be more collaboratively maintained. The linux-usb
>> GitHub organisation is currently solely owned by Greg Kroah-Hartman.
>>

https://github.com/linux-usb

>>
>> I don't propose to move maintenance of these projects to kernel.org
>> since the issue and pull request databases for them are on GitHub and
>> would need to be preserved.
>>
> 

Having an umbrella project for userspace USB gadget projects seems
a good idea to me.

Andrzej

