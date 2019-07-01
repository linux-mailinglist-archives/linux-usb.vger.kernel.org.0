Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E31D23183
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 12:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731269AbfETKmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 06:42:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38696 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730320AbfETKmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 06:42:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id D4D9E27E23C
Subject: Re: [REGRESSION] usb: gadget: f_fs: Allow scatter-gather buffers
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>, "Yang, Fei" <fei.yang@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen Yu <chenyu56@huawei.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <CALAqxLUMRaNxwTUi9QS7-Cy-Ve4+vteBm8-jW4yzZg_QTJVChA@mail.gmail.com>
 <7caebeb2-ea96-2276-3078-1e53f09ce227@collabora.com>
 <CALAqxLUfJYUtmQDC_aDMxW7KcPUawGoRq-PNUfmzQuNKh97FmQ@mail.gmail.com>
 <CALAqxLVUFfrPVVjR74V3PhhtcCytfp=cUYjo=BcJ14D1fkVXTw@mail.gmail.com>
 <7ec57c29-d1ab-dc4c-755d-a6009b9132b5@collabora.com>
 <CALAqxLUgnTB7aZ4edXCaG8SJsJzfY1_yNEPc6Losssw5Xy9-XA@mail.gmail.com>
 <36620156-d119-b1b2-989e-0c13b783296e@collabora.com>
Message-ID: <db5665cf-6274-c254-720c-798fec79d131@collabora.com>
Date:   Mon, 20 May 2019 12:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <36620156-d119-b1b2-989e-0c13b783296e@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

<snip>

>> Is there anything else I can try for you?
> 
> Have you tried compiling FunctionFS with debugging enabled?
> You do so bu uncommenting:
> 
> /* #define DEBUG */
> /* #define VERBOSE_DEBUG */
> 
> at the beginning of drivers/usb/gadget/function/f_fs.c
> 
> Is there anything suspicious in the kernel log when you run it then?
> 


<snip>

> 
> One question that comes to my mind is this: Does the USB transmission
> stall (e.g. endpoint stall) or not? In other words, is adb connection
> broken because USB stops transmitting anything, or because the
> data is transmitted but its integrity is broken during transmission
> and that causes adb/adbd confusion which results in stopping their
> operation? Does anything keep happening on FunctionFS when adb
> connection is broken?

Any discoveries about the problem?

Andrzej
