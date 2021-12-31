Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644CF4822A9
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 08:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242777AbhLaH7d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 02:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhLaH7c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 02:59:32 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1084C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 23:59:32 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id w80so5142843oie.9
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 23:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=o1yKjUtXuqMwfKL+r25vO1BpedxL3qD37kreHXVHa98=;
        b=dZc/VEmM5CZ3q8BbvEIXM9ph8c8muPWOLKgE07beOeqb3yzJwZ4I6/jU0IFEK7CX7C
         C53vCX4gtscIHUXqKL1oJNt7FKgFSR9dYjAk/Fyg32Teocrwgn1ftIz93PZkIqjQS1Ge
         usWGfQD1BLcFS3vl7/Y1h7JV+Zjf02kCAC60i+Q1e2Jf1LoA//In3l1sS5xMB8LRTDHh
         tV1H+fPiquGEvQuezKyUHVM9JTbdBuZcQQhusbDNEFcV1hYHEtHpMSlghL9bl7c9voxl
         ml0FNyk3EtE1PtJ7qd+5DUdkuu8FLkTr9d7g6EX0fJfgUVwTocoHSJjqQ0jCkGc0uz7B
         tiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=o1yKjUtXuqMwfKL+r25vO1BpedxL3qD37kreHXVHa98=;
        b=eaAtK+R1QtaVbd+ltarYRc2y+KpJrQPv+0F0To/+uygUUOh+D1QHfLKWZl9sfF7o8P
         LY8Nh/+ms0wl0tUXuadxu0tqEoZP0SjI8r5Yy7hzjgIE5tGQRWQ4CJJEBv6c0I9tSsJC
         Wz7i7UVi8oQKJzCeP2ODS9YHF+NdizCWs+Sa2KF2Xy1NGNGoctNpSBcD00dCvaQk1dUB
         j0IfCJsakOPiyy/BnP7NP36DnmcpZZG9fYBlg9sV1tUVklSHpYriyLQfQoVQccD6z7r/
         TNY0HQZslUb4oJIzBRWqksTddMj8sinOo/l7ofZqgWAH8jTZa5tzAQdxMlwGOSkMCf0R
         mbLw==
X-Gm-Message-State: AOAM533s8xo/yCWg4QxlKj/UB+lxnuF1StowRRscYZhSoD8ygBelUc/B
        JbJTS2h1b28lOpxcm0Lo6GH3qd7KafAvwE4h+do=
X-Google-Smtp-Source: ABdhPJxUqgcInbS1q/hsXg0t+/9sXKiGEyMDFUoAIZ1NNt8jjxUKvRHVKykyB+9blqv7zopJkNKr2khKJ6VbBZ2tTsE=
X-Received: by 2002:aca:911:: with SMTP id 17mr25685793oij.171.1640937571876;
 Thu, 30 Dec 2021 23:59:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4007:0:0:0:0:0 with HTTP; Thu, 30 Dec 2021 23:59:31
 -0800 (PST)
In-Reply-To: <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com> <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
 <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com> <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
 <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com>
From:   youling 257 <youling257@gmail.com>
Date:   Fri, 31 Dec 2021 15:59:31 +0800
Message-ID: <CAOzgRdaLM-M0K8B=GPK8httVnuXSSPOfD_d5sG_Fkt17jGJiWA@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

2021-12-31 15:02 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
> youling 257 wrote:
>> 2021-12-31 11:46 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
>>> Hi,
>>>
>>> youling 257 wrote:
>>>> test this patch, cat /sys/bus/usb/devices/4-1/speed, 10000
>>>> [   74.694284] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
>>>> 2 using xhci_hcd
>>>> [   74.750329] usb-storage 4-1:1.0: USB Mass Storage device detected
>>>>
>>>> but speed, pcie to usb3.2 gen2x2, WRITE: bw=642MiB/s (673MB/s),
>>>> 642MiB/s-642MiB/s (673MB/s-673MB/s), io=1000MiB (1049MB),
>>>> run=1557-1557msec
>>>> READ: bw=467MiB/s (490MB/s), 467MiB/s-467MiB/s (490MB/s-490MB/s),
>>>> io=1000MiB (1049MB), run=2140-2140msec
>>>>
>>>> the mainboard usb3.2 gen2x1, WRITE: bw=838MiB/s (878MB/s),
>>>> 838MiB/s-838MiB/s (878MB/s-878MB/s), io=1000MiB (1049MB),
>>>> run=1194-1194msec
>>>> READ: bw=753MiB/s (790MB/s), 753MiB/s-753MiB/s (790MB/s-790MB/s),
>>>> io=1000MiB (1049MB), run=1328-1328msec
>>>>
>>>
>>> Let's avoid top-post.
>>>
>>> Some comments:
>>> 1) Just because the host is capable of gen2x2, it doesn't mean it will
>>> run at gen2x2 speed. Your device can only operate up to gen2x1 speed, so
>>> that's the limit. The test speed for gen2x1 above is not unreasonable.
>
>> my device can only operate up to gen2x1 10gbps speed on window, only
>> 5gbps on linux kernel 5.16rc7.
>
> With the change I provided, you were able to run test at gen2x1, albeit
> slower than expect. (i.e. write speed at 673MB/s for ASmedia host must
> be SSP). The issue with device unable to operate at SSP is at least
> answered.
>
> If you're looking to find out why the performance is slow, confirm these
> items first:
>
> 1) Are you using the same application to test on Linux to compare with
> Windows? (Looks like you're using CrystalDiskMark for your Windows test)
linux kdiskmark, windows crystaldiskmark
> 2) If you're using the same application, are you using the same test
> parameters and version?
kdiskmark and crystaldiskmark used same parameters, seq1M Q8T1, linux
500MB/s, windows 1000MB/s.
> 3) Is your device operating in BOT or UASP in Linux? UAS Protocol is
> generally faster. Newer device generally uses UASP, and I assume yours
> is a newer device (check your enclosure). Make sure there's no quirk
> preventing the device operating in UASP.
>
> If all of those are checked out, you can start capturing logs so others
> may look into it.
>
> BR,
> Thinh
>
> (btw, I'll be on vacation for a week, maybe others can help while I'm
> away.)
>
