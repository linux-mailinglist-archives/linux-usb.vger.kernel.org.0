Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796A3169777
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 13:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgBWMKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 07:10:15 -0500
Received: from funyu.konbu.org ([51.15.241.64]:49500 "EHLO funyu.konbu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbgBWMKP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Feb 2020 07:10:15 -0500
Received: from tungsten (237.203.49.163.rev.vmobile.jp [163.49.203.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by funyu.konbu.org (Postfix) with ESMTPSA id 997CE28096F;
        Sun, 23 Feb 2020 12:10:09 +0000 (UTC)
Date:   Sun, 23 Feb 2020 21:10:04 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200223121004.GA21618@tungsten>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten>
 <20200211161522.GA1894@roeck-us.net>
 <20200215053647.GA10345@tungsten>
 <20200219211056.GA829@roeck-us.net>
 <CAKv9HNZx_YTC1QEyT-T2_BuXnnju+9czKx-JJjduk9TjUSjS7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv9HNZx_YTC1QEyT-T2_BuXnnju+9czKx-JJjduk9TjUSjS7A@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Antti,

>we should be aligning the data[0] pointer inside the struct instead.
I believe you are correct. Now, I checked to see at runtime if temp->data was
aligned and it was. I cannot tell you why :) That code is copy-paste from
the tegra-ehci driver.

>with the alignment hacks altogether and hit the issue with a heavier
I feel bad about the alignment hacks as well, and would like the original
allocation from the URB thing to be aligned... no additional kmalloc,
no memcpy.

Is there a reason why we shouldn't try to fix that?

>pointer are separate and no corruptions should occur.
The corruptions themselves are bad, and should be cured.

Thanks, Boris.

Antti Seppälä wrote:
>Hi Guenter,
>
>On Wed, 19 Feb 2020 at 23:11, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Yes, those patches didn't address the core problem. Can you test with the
>> attached two patches ?
>>
>> Thanks,
>> Guenter
>
>I took a look at your patch (usb: dwc2: Simplify DMA alignment code)
>and I don't believe it is correct.
>
>The patch re-introduces the dma_aligned_buffer struct and takes some
>care to align the beginning of the struct to dma cache lines. However
>we should be aligning the data[0] pointer inside the struct instead.
>With the code in the patch data[0] gets pushed to be at an offset from
>the alignment by kmalloc_ptr and old_xfer_buffer pointers. In other
>words data[0] is now not aligned to dma cache boundaries.
>
>Reviewing the code got me thinking that what if we stopped playing
>with the alignment hacks altogether and hit the issue with a heavier
>hammer instead? Attached you can find a new patch that introduces a
>list to keep track of the allocations. The code then looks up the
>entry from the list when it is time to restore the original pointer.
>This way the allocations for the aligned dma area and the original
>pointer are separate and no corruptions should occur.
>
>Thoughts, comments? I should note that the patch has received only
>light testing and not very thorough thinking. I can prepare a proper
>patch to be sent inline if the idea seems worth exploring further.
>
>-- 
>Antti


