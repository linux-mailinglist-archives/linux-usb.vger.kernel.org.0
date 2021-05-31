Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A323966CB
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 19:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhEaRXZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 13:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbhEaRXF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 May 2021 13:23:05 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DB8C06F0D2
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 08:45:47 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d16so9246204pfn.12
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avqGsX/9XIcvjZ6CR878SmZpl2tJzpmFPKK6Rf+ClUI=;
        b=R1w38RBKtyUIM+pn4Q2LEAilcTQ29Mh0o7eup+yjUGd/W6n6kQ5co+Z/HXydjSa3jr
         oUcpp+a3sB65wvKB6/qAquOPFH+DymD+Z6PHn8Qe4wr6L7lEszNv07MKMLRozgCew5qu
         NTfOPE1BNIAzGJrfj0UDVYOyA/YtwNCb9eXXZlAirOlhW1CfKQ9KbXXSZnHKL+RICihb
         zrefntlYQg+n01i+7Z6cFVbhq6sw+H2VzdnB1s9oV4PK0ZSOpBXgrGQTBrf7X9LP4Eb0
         NYicRmz5MUTXcqlHiBfgyThrTTB+uO4pXG4nlsJd949jjYk817E6F6beA5nEw/7Er0uB
         l9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avqGsX/9XIcvjZ6CR878SmZpl2tJzpmFPKK6Rf+ClUI=;
        b=HWg9GF3cN8xS5HqkAuxiqOuyTpVPfFIrtWLseFbPrrshHSOz68uaGan30Lr3cppkul
         A3FZIqAXj8SJOAZJr9w1N4bGFrZqJROo5KRDA1Ix1bMBPMX8Uf/rrNO5+tky31y6jpT3
         gtEfxEr6PZAOdQsuSauibfN4HL7LQERXW989MD+5qVxsmS38vsSlIUe9sZUiw/SQYviI
         GyEDccAnMRxrK72mVszVkuen64IdVpCwfyLReJ/WsOZ1Byt/9L7iPZwjqq7uHWC9PzBd
         B7sDKCIWfWCBUx4HXELYIX7ISLuOrpW9ZvqLDhEhQJpatd2zDVlpfVUqfIcCTV0wbsSo
         KsPg==
X-Gm-Message-State: AOAM533FQ8D6u7w3DjdmnoNil5Lxz28OwaWLYrVeiBL7Zij8wWTlhcCY
        J7f/xStGUXd9JpDoIHYpflA8pqsi2gW+Ukd8k/g=
X-Google-Smtp-Source: ABdhPJzZ78CsWgzUZK5sx/m9Iw38mohSSPjJaPOO5B60nSXK4SF4O7FTdd6wJenJfgmlnDA2F7QTbyWQdOBbrsSP4UE=
X-Received: by 2002:a63:b507:: with SMTP id y7mr23332927pge.74.1622475946794;
 Mon, 31 May 2021 08:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
 <YLT3lHWFimB3GiHy@kroah.com>
In-Reply-To: <YLT3lHWFimB3GiHy@kroah.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 31 May 2021 18:45:30 +0300
Message-ID: <CAHp75Vdjrj6=8thopwD7OPb-gxyVZx895Vd66mLSA4-BggdcWg@mail.gmail.com>
Subject: Re: v5.13-rc3 --> v5.13-rc4 DWC3 breakage
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 5:49 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 31, 2021 at 05:33:02PM +0300, Andy Shevchenko wrote:
> > Hi!
> >
> > The only patch that made v5.13-rc4 effectively broke USB on Intel Merrifield.
> >
> > My reproducer:
> >  1. Boot with switch in gadget mode
> >  2. Enable USB ethernet
> >  3. Switch to host
> >  4. wait a bit for device enumeration, etc
> >  5. Switch back
> >  6. No gadget mode, kernel RCU stall detected (USB become unusable, so
> > does the system)
> >
> > [  115.792620] rcu: INFO: rcu_sched self-detected stall on CPU
> > [  115.798410] rcu:     0-....: (24089 ticks this GP)
> > idle=886/1/0x4000000000000000 softirq=3796/3797 fqs=5240
> > [  115.808333]  (t=21000 jiffies g=6505 q=12158)
> > [  115.812847] NMI backtrace for cpu 0
> > [  115.816472] CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.13.0-rc4+ #213
> > ...
> >
> > [  115.977913]  add_dma_entry+0xd4/0x1d0
> > [  115.981760]  dma_map_page_attrs+0xd8/0x220
> > [  115.986063]  usb_hcd_map_urb_for_dma+0x3b6/0x4f0
> > [  115.990895]  usb_hcd_submit_urb+0x98/0xbf0
> > [  115.995263]  dln2_rx+0x1ae/0x280 [dln2]
> > ...
> >
> > 100% Reproducibility, revert of the 25dda9fc56bd ("usb: dwc3: gadget:
> > Properly track pending and queued SG") fixes the issue.
> >
> > Please, fix it properly or revert. Thanks!
>
> Care to send the revert?

Sure, But I want to give Thinh a chance to react to this, maybe it
would be a better idea.
Let's say if nothing happens I will send it on Wednesday.

-- 
With Best Regards,
Andy Shevchenko
