Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2251B7F83
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 22:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgDXUBu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 16:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbgDXUBt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 16:01:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D07C09B04B
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id j4so14579286otr.11
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8XI1LvypvRpBnnfjlnzQMUzrYBVqCVi4omkZLAUHHT0=;
        b=EPrPgdaMmqH/8+NLEje7ykgzlxHHBtmWjq6MpgQXjVqpFTZEpVMrublr+7m3pVkfRI
         IJU8r7MUaEuZvWjxeqcHm1/e8mGMOyuG0H5uCHADhwtxE5B0dbN9dNaVxjAkMb8MR8oC
         aca78pdutVnsMDpa18xm5Be7gxdmLqjtxJRP3oYxzKBJ2zbruCqOxMenTS1jIKrb59jq
         m8uSnQIV/At9jcnk+n0nZZvzP0Hjfs1xepgTW6gKeHoe/D9JN0j5s+Qffuv3yE/CR7bd
         8tWn4AhNqjvC1ayhMm9gkNTvKbTv44eX07NDUlVeHYQ1Ez4ILLqf/2W2PqlBRGBLCcyN
         t4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XI1LvypvRpBnnfjlnzQMUzrYBVqCVi4omkZLAUHHT0=;
        b=C5m/kxtKS16yxH1YiQQVDika2hpP/FiD0m6Y8dGN1xmMlyo62yAy2/7UCsakrqnjLm
         E3H4rqFBkKpEwiww697+CSjNshivo1NwYOT2m3H0jfO0MR83C3FWgtS4u8+HTG9lInkw
         YHlh7bpEi4146ldRIE9uO6kTmRKKXrvnftN4DhJQLoiTQCa4p9JhJWpfkkW0mVwnnTv5
         TfJJMAStcQU+c1boEQSmRELmh3lViwW1+jrmiAyFomQz/iXBVn+xMvU8/sgA/seWbrzN
         xv4qG+HOMhxYPreXRrJYCA11Sbv6/hPEnLalBul0Bihg8IYJw0dumJx26SHz0C6wonFO
         vhfw==
X-Gm-Message-State: AGi0PuYuvQZt4akFrf9gwHL5uASe6cdXkd+8LR/YHg5XGBrKLgmOpkId
        MFhgbrO6RBYCpVsbLL2F5IerZldNTxREciFdQZD10g==
X-Google-Smtp-Source: APiQypICItYltUwSug3LlyQP5kPRd/5Joreyx8DjDwE5SJABX05p72jQqyzCHTts2Twb6Udiy3mcs0DShBO485Oluss=
X-Received: by 2002:a05:6830:1589:: with SMTP id i9mr9792803otr.102.1587758508417;
 Fri, 24 Apr 2020 13:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLW2R4d=Zm=TKbFprN-uYrerL1oCYsVC3VedEKtW0gCsyA@mail.gmail.com>
 <877dyfsv00.fsf@kernel.org> <CALAqxLUdzKRV6nrcLpWsykK+WPnqhUK4iwRe4_Xmo-TvEV5KOg@mail.gmail.com>
 <CALAqxLWEdHrsU+efgsp2EHsgNGA8n7SE16XNnZHcfXjdM4v-WQ@mail.gmail.com>
 <20200424171247.GA20167@jackp-linux.qualcomm.com> <CALAqxLUkg8gqY6kN1D=NbpgLDd_yMdvxOJCksrmXw0v8McHodw@mail.gmail.com>
In-Reply-To: <CALAqxLUkg8gqY6kN1D=NbpgLDd_yMdvxOJCksrmXw0v8McHodw@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 24 Apr 2020 13:01:35 -0700
Message-ID: <CALAqxLUSr8vnW3MgK+GZk80c8D58PXM6ovN66y0hwFbURrBpiA@mail.gmail.com>
Subject: Re: More dwc3 gadget issues with adb
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>, Josh Gao <jmgao@google.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Todd Kjos <tkjos@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 11:36 AM John Stultz <john.stultz@linaro.org> wrote:
> On Fri, Apr 24, 2020 at 10:12 AM Jack Pham <jackp@codeaurora.org> wrote:
> > On Tue, Apr 21, 2020 at 10:09:27PM -0700, John Stultz wrote:
> > > Does something like this make sense? It's not causing trouble on
> > > db845c either so far in my testing.
> >
> > Ok I'll bite...
> >
> > I'm now curious why it hasn't been a problem with the Qualcomm HW. Do
> > you mind please capturing a similar trace log on the db845c?  Would be
> > good to see a side-by-side comparison and see if, first of all, whether
> > the same S/G path is getting exercised (i.e. 16KiB OUT requests from ADB
> > userspace using AIO which then get broken up into 4K chunks by f_fs),
> > and what the behaviors of the reclaim_trb and giveback are when the
> > transfer is completed.
> >
> > Preferably if you could get a trace without your patch applied that
> > would be great. And maybe also one after your patch just to see if the
> > traces are truly identical or not.
>
> Sure. I've captured logs in the same manner with and without on db845c
> (against 5.7-rc2). See attached.
>
> I suspect the difference is the db845c is using an iommu (I don't
> think it will boot without it) where hikey960 isn't, but I'll let you
> take a look.

And I've added my own printk debugging that I used to track the issue
down on HiKey960 and on the db845c we are never hitting the case where
the HWO flag is set when we call dwc3_gadget_ep_reclaim_trb_sg()

thanks
-john
