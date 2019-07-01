Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC9918B24
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 16:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfEIOCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 10:02:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54690 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbfEIOCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 10:02:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 0F2BF260253
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [REGRESSION] usb: gadget: f_fs: Allow scatter-gather buffers
To:     John Stultz <john.stultz@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "Yang, Fei" <fei.yang@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen Yu <chenyu56@huawei.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <CALAqxLUMRaNxwTUi9QS7-Cy-Ve4+vteBm8-jW4yzZg_QTJVChA@mail.gmail.com>
Message-ID: <7caebeb2-ea96-2276-3078-1e53f09ce227@collabora.com>
Date:   Thu, 9 May 2019 16:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALAqxLUMRaNxwTUi9QS7-Cy-Ve4+vteBm8-jW4yzZg_QTJVChA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,
W dniu 08.05.2019 o 04:18, John Stultz pisze:
> Since commit 772a7a724f69 ("usb: gadget: f_fs: Allow scatter-gather
> buffers"), I've been seeing trouble with adb transfers in Android on
> HiKey960, HiKey and now Dragonboard 845c.
> 
> Sometimes things crash, but often the transfers just stop w/o any
> obvious error messages.
> 
> Initially I thought it was an issue with the HiKey960 dwc3 usb patches
> being upstreamed, and was using the following hack workaround:
>    https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/hikey960-5.1&id=dcdadaaec9db7a7b78ea9b838dd1453359a2f388
> 
> Then dwc2 added sg support, and I ended up having to revert it to get
> by on HiKey:
>    https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/hikey-5.1&id=6e91b4c7bd1e94bdd835263403c53e85a677b848
> 
> (See thread here: https://lkml.org/lkml/2019/3/8/765)

So the thread says there are problems at boot, but here you mention about
adb transfers, which must obviously be happening after the board has booted.
Do you experience problems at boot or not?

If a crash happens, what is in the log?


Andrzej
