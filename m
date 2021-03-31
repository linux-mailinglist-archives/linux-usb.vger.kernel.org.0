Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294AB34DA12
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 00:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhC2WVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 18:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhC2WUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 18:20:52 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AAEC061762
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 15:20:52 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u20so17604736lja.13
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XEji2TAqL8EMOw/dECJ/SLHPykwIL6tdzk/9l++9ONM=;
        b=Xm7vhW9fpntwFSs6+Gk3zPe6/sKChpK1gUaWx2UEolzwgdCJo2vumLIYJlyPge23nB
         9dvzC9l//3Pn4WRhl2py7slEh8xf2C/jA1MuTeppti/T3EKkNI1Fyoj8zk7BE24Qt869
         gUpGwmKnKRJfCN46q8tNJdnuN9mRHvszf8SL+Q6R/JPIYK/i+eClBM0ThzPGJHUZlM6N
         zdiArhgV4Hz0R6zHa5WV2AB14peEFC77Wq0oSdRCOK7UJj1CnZlZFwL3iOLr+LnJUJIT
         sB6xbk0C26JUh+RFMuRQLtEWwXMyTEn6fLW9WKz3JgInBBjMC3Ijev0tQuDDPBp+wnKN
         PTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XEji2TAqL8EMOw/dECJ/SLHPykwIL6tdzk/9l++9ONM=;
        b=JFKVbngjZoglAWNr94AavmUQIKR7Fn4/tgOHoD1HgUqxkDYZjo0LHgBYelS+7upv7f
         JQy2xju7i0tXPndqUuZ1ERwhqGM2DZPeOokjd16CBrN5Da74QssjtoWyGonzuGBTlYHI
         AbYVNBadPy3edRerT4xmkbGsC17Kd7/5juVM1Hsn0CGKL9Ynz76PyV0kV1Fr596wa8kq
         2a/dIaQZ6o9wppN2wizbkQNzN56tJpY6WM8Pg23HypgYNqrOClPm4aN4RboQtbs/js+s
         zPtJCJuROPu6z31/Js8yXKvnREmL3qL3d9drqhGq1O1Bn9+Z7M0FnG/yfAr1KplcFink
         ltNQ==
X-Gm-Message-State: AOAM530gf6sh4mC9/+Ei2LOv4pRV4LrSV/UbbsH5UO0vbo509Zaww0Kt
        h8xvQGSsLmAEaGLfU1jNRwm+wzyRdcREPuNVmQ6faQ==
X-Google-Smtp-Source: ABdhPJynPw5pUHvXH+sqNCv5EY3DjZXPvL5IqkOykyLYab0wXCEQlhycuJxSb4YXqShy3Ni3bKujxLUdjeIFmc0tzzs=
X-Received: by 2002:a2e:509:: with SMTP id 9mr19246743ljf.170.1617056450500;
 Mon, 29 Mar 2021 15:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210108015115.27920-1-john.stultz@linaro.org>
 <87bldzwr6x.fsf@kernel.org> <CALAqxLWdWj9=a-7NGDzJyrfyRABwKnJM7EQo3Zm+k9JqAhPz+g@mail.gmail.com>
 <d95d0971-624e-a0e6-ac72-6ee3b1fb1106@synopsys.com> <06a44245-4f2f-69ba-fe46-b88a19f585c2@codeaurora.org>
 <a33f7c33-f95d-60c3-70f2-4b37fcf8bac5@synopsys.com> <fa5cc67e-3873-e6d9-8727-d160740b027e@codeaurora.org>
 <3db531c4-7058-68ec-8d4b-ff122c307697@synopsys.com> <8b5f7348-66d7-4902-eac8-593ab503db96@codeaurora.org>
 <ee47c2c6-f931-6229-13cd-d41a28b3b9c7@codeaurora.org> <28bc3ce1-7ace-be25-7d7d-ca8ab1b0f0e9@synopsys.com>
 <62c7ee3a-21c4-009d-bfc0-ce9d3a84fefe@codeaurora.org>
In-Reply-To: <62c7ee3a-21c4-009d-bfc0-ce9d3a84fefe@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 29 Mar 2021 15:20:37 -0700
Message-ID: <CALAqxLVuYY5ozpddrovVDXWi-dXWF72JpPuQQXjBYLYiSmCUNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb: dwc3: Trigger a GCTL soft reset when
 switching modes in DRD
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Yu Chen <chenyu56@huawei.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 29, 2021 at 3:15 PM Wesley Cheng <wcheng@codeaurora.org> wrote:
>
>
>
> On 3/19/2021 4:09 PM, Thinh Nguyen wrote:
> > Wesley Cheng wrote:
> >>
> >>
> >> On 3/8/2021 10:33 PM, Wesley Cheng wrote:
> >>>
> >>>
> >>> On 3/8/2021 7:05 PM, Thinh Nguyen wrote:
> >>>> Wesley Cheng wrote:
> >>>>>
> >>>>> On 3/6/2021 3:41 PM, Thinh Nguyen wrote:
> >>>>>> Wesley Cheng wrote:
> >>>>>>> On 1/8/2021 4:44 PM, Thinh Nguyen wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> John Stultz wrote:
> >>>>>>>>> On Fri, Jan 8, 2021 at 4:26 AM Felipe Balbi <balbi@kernel.org> wrote:
> >>>>>>>>>> Hi,
> >>>>>>>>>>
> >>>>>>>>>> John Stultz <john.stultz@linaro.org> writes:
> >>>>>>>>>>> From: Yu Chen <chenyu56@huawei.com>
> >>>>>>>>>>>
> >>>>>>>>>>> Just resending this, as discussion died out a bit and I'm not
> >>>>>>>>>>> sure how to make further progress. See here for debug data that
> >>>>>>>>>>> was requested last time around:
> >>>>>>>>>>>   https://urldefense.com/v3/__https://lore.kernel.org/lkml/CALAqxLXdnaUfJKx0aN9xWwtfWVjMWigPpy2aqsNj56yvnbU80g@mail.gmail.com/__;!!A4F2R9G_pg!LNzuprAeg-O80SgolYkIkW4-ne-M-yLWCDUY9MygAIrQC398Z6gRJ9wnsnlqd3w$
> >>>>>>>>>>>
> >>>>>>>>>>> With the current dwc3 code on the HiKey960 we often see the
> >>>>>>>>>>> COREIDLE flag get stuck off in __dwc3_gadget_start(), which
> >>>>>>>>>>> seems to prevent the reset irq and causes the USB gadget to
> >>>>>>>>>>> fail to initialize.
> >>>>>>>>>>>
> >>>>>>>>>>> We had seen occasional initialization failures with older
> >>>>>>>>>>> kernels but with recent 5.x era kernels it seemed to be becoming
> >>>>>>>>>>> much more common, so I dug back through some older trees and
> >>>>>>>>>>> realized I dropped this quirk from Yu Chen during upstreaming
> >>>>>>>>>>> as I couldn't provide a proper rational for it and it didn't
> >>>>>>>>>>> seem to be necessary. I now realize I was wrong.
> >>>>>>>>>>>
> >>>>>>>>>>> After resubmitting the quirk, Thinh Nguyen pointed out that it
> >>>>>>>>>>> shouldn't be a quirk at all and it is actually mentioned in the
> >>>>>>>>>>> programming guide that it should be done when switching modes
> >>>>>>>>>>> in DRD.
> >>>>>>>>>>>
> >>>>>>>>>>> So, to avoid these !COREIDLE lockups seen on HiKey960, this
> >>>>>>>>>>> patch issues GCTL soft reset when switching modes if the
> >>>>>>>>>>> controller is in DRD mode.
> >>>>>>>>>>>
> >>>>>>>>>>> Cc: Felipe Balbi <balbi@kernel.org>
> >>>>>>>>>>> Cc: Tejas Joglekar <tejas.joglekar@synopsys.com>
> >>>>>>>>>>> Cc: Yang Fei <fei.yang@intel.com>
> >>>>>>>>>>> Cc: YongQin Liu <yongqin.liu@linaro.org>
> >>>>>>>>>>> Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >>>>>>>>>>> Cc: Thinh Nguyen <thinhn@synopsys.com>
> >>>>>>>>>>> Cc: Jun Li <lijun.kernel@gmail.com>
> >>>>>>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>>>>>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>>>>>>>>>> Cc: linux-usb@vger.kernel.org
> >>>>>>>>>>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> >>>>>>>>>>> Signed-off-by: John Stultz <john.stultz@linaro.org>
> >>>>>>>>>>> ---
> >>>>>>>>>>> v2:
> >>>>>>>>>>> * Rework to always call the GCTL soft reset in DRD mode,
> >>>>>>>>>>>   rather then using a quirk as suggested by Thinh Nguyen
> >>>>>>>>>>>
> >>>>>>>>>>> v3:
> >>>>>>>>>>> * Move GCTL soft reset under the spinlock as suggested by
> >>>>>>>>>>>   Thinh Nguyen
> >>>>>>>>>> Because this is such an invasive change, I would prefer that we get
> >>>>>>>>>> Tested-By tags from a good fraction of the users before applying these
> >>>>>>>>>> two changes.
> >>>>>>>>> I'm happy to reach out to folks to try to get that. Though I'm
> >>>>>>>>> wondering if it would be better to put it behind a dts quirk flag, as
> >>>>>>>>> originally proposed?
> >>>>>>>>>    https://urldefense.com/v3/__https://lore.kernel.org/lkml/20201021181803.79650-1-john.stultz@linaro.org/__;!!A4F2R9G_pg!LNzuprAeg-O80SgolYkIkW4-ne-M-yLWCDUY9MygAIrQC398Z6gRJ9wnRWITZfc$
> >>>>>>>>>
> >>>>>>>>> That way folks can enable it for devices as they need?
> >>>>>>>>>
> >>>>>>>>> Again, I'm not trying to force this in as-is, just mostly sending it
> >>>>>>>>> out again for discussion to understand what other approach might work.
> >>>>>>>>>
> >>>>>>>>> thanks
> >>>>>>>>> -john
> >>>>>>>> A quirk would imply something is broken/diverged from the design right?
> >>>>>>>> But it's not the case here, and at least this is needed for HiKey960.
> >>>>>>>> Also, I think Rob will be ok with not adding 1 more quirk to the dwc3
> >>>>>>>> devicetree. :)
> >>>>>>>>
> >>>>>>>> BR,
> >>>>>>>> Thinh
> >>>>>>>>
> >>>>>>> Hi All,
> >>>>>>>
> >>>>>>> Sorry for jumping in, but I checked the SNPS v1.90a databook, and that
> >>>>>>> seemed to remove the requirement for the GCTL.softreset before writing
> >>>>>>> to PRTCAPDIR.  Should we consider adding a controller version/IP check?
> >>>>>>>
> >>>>>> Hi Wesley,
> >>>>>>
> >>>>>> From what I see in the v1.90a databook and others, the flow remains the
> >>>>>> same. I need to check internally, but I'm not aware of the change.
> >>>>>>
> >>>>> Hi Thinh,
> >>>>>
> >>>>> Hmmm, can you help check the register description for the PRTCAPDIR on
> >>>>> your v1.90a databook?  (Table 1-19 Fields for Register: GCTL (Continued)
> >>>>> Pg73)  When we compared the sequence in the description there to the
> >>>>> previous versions it removed the GCTL.softreset.  If it still shows up
> >>>>> on yours, then maybe my v1.90a isn't the final version?
> >>>>>
> >>>>> Thanks
> >>>>> Wesley Cheng
> >>>>>
> >>>>
> >>>> Hi Wesley,
> >>>>
> >>>> Actually your IP version type may use the newer flow. Can you print your
> >>>> DWC3_VER_TYPE? I still need to verify internally to know which versions
> >>>> need the update if any.
> >>>>
> >>>> Thanks,
> >>>> Thinh
> >>>>
> >>> Hi Thinh,
> >>>
> >>> Sure, my DWC3_VER_TYPE output = 0x67612A2A
> >>>
> >>> Thanks
> >>> Wesley Cheng
> >>>
> >> Hi Thinh,
> >>
> >> Would you happen to have an update on the required sequence on the
> >> version shared?  Sorry for pushing, but we just wanted to finalize on
> >> it, since it does cause some functional issues w/o the soft reset in
> >> place, and causes a crash if we have the GCTL.softreset.
> >>
> >> Thanks
> >> Wesley Cheng
> >>
> >
> > Hi Wesley,
> >
> > I'm still trying to get that info for you. The versions without
> > GCTL.softreset should be very new. The flow with GCTL.softreset should
> > work for all versions and should not cause functional impact. We can
> > create a change to optimize and remove GCTL.softreset for the newer
> > controller versions at a later time.
> >
> > Since you and John Stultz have the setup that can be verified in the
> > real world. It would be great if John or you provide a tested patch(es)
> > to resolve this issue.
> >
> > Thanks,
> > Thinh
> >
> Hi Thinh,
>
> Thanks for the input as always.  I tested the GCTL.softreset change just
> now, and it is working fine at least on my set up.
>
> Not sure if we'd need input from other vendors as well to get this
> change merged.

Did you test the original patch from this thread unchanged, or did you
have any modifications? If the latter, feel free to send it out and
I'll validate it on my side.

thanks
-john
