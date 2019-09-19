Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7501B7B65
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 15:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732112AbfISN7n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 09:59:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42046 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729256AbfISN7m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 09:59:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id q12so2393340pff.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=izEuKfEWrn2v1J+pGhcTRekoQB77cO7+WKf1KyrMJmQ=;
        b=IlbyEZ9lIf0VAHfwXbWam2G9J1jSz3UuZ/YLPs8AKR5J+3qlTXwg67DuAkubiIx86y
         w56GV+pJcfIXbtLOpqSeHTuXIVtHmXthQQ1UYCr/uZPNW9HuDGInJD2h1may4o/BcZMi
         I8VVM4XaVZhwsxdA1yKbiV1xZH7JNi1g/iia4v2QYyN/18z0SbfQ8/TNIZTNN43o5QHI
         Od5nH7eFywkn0R5W916TKIdeyoQ8kAcNtNBsT4Rj9AyLAeFt5kAeC5ORYl6UjJ3PMhDV
         1QkYMOB4Od871ttSocawVtlmGgJ8zHR3Xe19UbZOnFSx7xzhdW2gOOQq0iARFGhB2JOP
         wZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=izEuKfEWrn2v1J+pGhcTRekoQB77cO7+WKf1KyrMJmQ=;
        b=c/45/sI403I8Rm6oKEbPBWi42slgsF5s04V3Y4OlgsIhaA25lWmX/RaKBW5vqXLtdi
         gyG1P2BYiydISi8b2nDBMeWV57Ra9A4dWbvdPu1ddWKwWJDztrmDzVmJGYEHwfJpxiJ4
         J/9n4MOozdhU7byFXHHU6aGh0grhap4WlnV1l6lIpYcli5uuCaTdRjYtQNiIWwvgA1Cc
         Z6sLKb0EdmHWwY3gaH2tL/EegFgbitadfuOsYUZlmaVf8tPFbpGQt9jUOqtCX0J3yJZ1
         98KLrqFxsjWnNY2u7L6h4ZWaDRAT844f2P7YZiGAO9hCgt2wDTWKwPV+WMet0mqnYYAq
         rr1A==
X-Gm-Message-State: APjAAAU3UIXJQYKNbhnivZwe7oxICAP+odWSHfHbNIvvjaD+hl3/6GC+
        q1Ij0LFkKTZ4GnIXKI+kErQ=
X-Google-Smtp-Source: APXvYqyBTFjIDXWPcTndLhrKqQ5QcLMkTbdGzCvm0XaNYYGgfGg7Fg069tVsU4Q+cLezZhT3ddR9Jg==
X-Received: by 2002:a62:2d3:: with SMTP id 202mr10883065pfc.141.1568901580448;
        Thu, 19 Sep 2019 06:59:40 -0700 (PDT)
Received: from localhost.localdomain ([221.155.202.134])
        by smtp.gmail.com with ESMTPSA id h8sm10599062pfo.64.2019.09.19.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 06:59:39 -0700 (PDT)
Date:   Thu, 19 Sep 2019 22:59:35 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Peter Chen <hzpeterchen@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: Event ring is full when do iozone test on UAS storage
Message-ID: <20190919135935.GA3133@localhost.localdomain>
References: <20190916094305.GB21844@b29397-desktop>
 <0aae13f2-04cf-f45a-e6ee-4bf9e515faba@linux.intel.com>
 <CAL411-oirjSLZzwoN8axqpfn-JQ8eEGMWD-w9p24Krap+dPs9g@mail.gmail.com>
 <92a09240-6489-b405-7916-26a77f2e0b06@linux.intel.com>
 <CAL411-p5TPHtBTe2cVtPsX07LhjeHw19qLjxz_XOXigEfG7_DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-p5TPHtBTe2cVtPsX07LhjeHw19qLjxz_XOXigEfG7_DQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 19, 2019 at 05:54:25PM +0800, Peter Chen wrote:
> > On 17.9.2019 12.55, Peter Chen wrote:
> > >>>
> > >>> I met "event ring full error" like below, this error is met when
> > >>> I do iozone test on UAS storage at v4.19.35 kernel, but not meet
> > >>> this error at linux-next tree (08/24). The same host and test
> > >>> UAS storage device are used. This issue is due to xhci_handle_event
> > >>> does not return 0 long time, maybe the xHC speed is fast enough
> > >>> at that time. If I force the xhci_handle_event only run 100 times
> > >>> before update ERST dequene pointer, it will not occur this error.
> > >>> I did not  see any changes for xhci_handle_event at the latest code,
> > >>> so in theory, it should have this issue too. Do you think if we need
> > >>> to improve xhci_handle_event to avoid event ring?
> > >>
> > > The root cause is UAS protocol is very fast
> > > protocol, the
> > > other threads at non-CPU0 will add TRBs during we are handling event, so if
> > > hardware (xHC) has always consumed TD the non-CPU0s are adding,
> > > the ERST dequene pointer never get change to update, then this
> > > "event ring full" error will occur.
> > >
> > > The one reason why v4.19 has this issue is the max request length is larger
> > > than the latest kernel. At v4.19, it is 512KB, At the latest kernel,
> > > it is 256 KB.
> > > see /sys/block/sda/queue/max_sectors_kb.
> > > When I change max_sectors_kb as smaller value, the test will be more smooth.
> > > Besides, At v4.19, the UAS completion handler seems take more time
> > > compares to the latest kernel.
> > >
> > > I suggest adding threshold flag for event ring when it closes to full
> > > since we can't
> > > avoid USB3 use cases when the throughput is high, but the system is a
> > > little slow.
> > > Do you agree?
> >
> > I agree that it makes sense to force a ERDP write after handling some amount
> > of events, it can solve some event ring full issues, but not the fact that
> > we spend a lot of time in the interrupt handler.
> 
> Ok, I will proposal one patch to fix event ring full issue.
> 
> >
> > Your logs show that you have TDs containing up to 128 TRBs.
> > When a TD like that finishes the driver will increase the sw dequeue pointer of the
> > transfer ring one by one until we reach the end of the TD.
> >
> > This means we call inc_deq() function 128 times in interrupt context, and each time
> > do a few comparisons. According to traces this takes ~120us. There might be some
> > tracing overhead but this could anyway be done in a saner way.
> >
> > I'll look into this
> >
> 
> Since we use hard irq for xHCI, for high performance protocol, it may hard to
> reduce interrupt context time since we have lots of request handling,
> cache operation,
> and completion are interrupt context.
> 
> > Other things to consider in addition to writing ERDP and fixing the inc_dec() loop is
> > increasing event ring size (adding more than current 1 segment), and support giving
> > back URBs in tasklet by adding the HCD_BH flag to xhci hcd.
> >
> 
> So, Mathias, which solutions do you prefer:
> - One way to quit xhci_handle_event if there are enough events have handled
> - Change giveback as bottom half

Hi Peter and Mathias,

Please consider the patch that deals with the bottom half of
xhci.

	https://patchwork.kernel.org/patch/10880073/

I think it is better to use tasklet as bottom half in xhci because
HCD layer supports tasklet bottom half and other host controller
dirvers use this feature to defer URB processing.

Moreover, some devices (1Gbit USB ethernet controller) can show
improved performance with tasklet bottom half in xhci.

Regards
Suwan Kim
