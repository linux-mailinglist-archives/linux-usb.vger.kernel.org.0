Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E902107DB
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 11:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbgGAJSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 05:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGAJSA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 05:18:00 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6528BC061755
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 02:18:00 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 17so22415029wmo.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=twVZXkY6BhygpK2M79Ns9GsoGVLMhJD+Dw3WFSCPqfU=;
        b=vBBUpyZVa9IsPUfg9VuM7Cw3GOxH4pZzL09MR61wOhpG5D7Gv9Lfu28Jipmcq5px6j
         +Dbggi4+JJkUQ1BHmKlKJtiV9RkDjK/dgCHqlQPPwxc9KT5+k/MXSeR8rmbpwB3esOJ2
         S+R7d416J/ujOEn/sTW0ObngWbcvPR71Hj6BrjzDnzJDvX1TIkoDsj6NCaBBaCbcGdK/
         Z/H+Wj1jdKhNN1WlMn298JxbZExu+cAo/wueBIuEGb6WR79Yt7JxjMktTY3C3ZgNTCWi
         sNBvT8M56J5/ACMFrkUXF4LhnrlcTyzGvoC+vyMWgT7nLSwLYhXCGfeTx5Y485UL48vW
         KK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=twVZXkY6BhygpK2M79Ns9GsoGVLMhJD+Dw3WFSCPqfU=;
        b=pAzlO3TUr5BQJBpGc6WgwYhj+reKRq8FN/NznLGOKexsSxhi0yTOjbkkcGiooiKU7e
         f6UeQG3ocg5HOewvh/oysLFwJxAbMZby5nuS3RhoSPCPmGBP5TgXeqapVP+OCCEgk3Mb
         lLcJKJGCaddqu6YrmyNHFfI+0C83R+Vn+x7oZO3//9Yde7qrG387Nbu7b7D6W7Wp5Ibl
         05FOwB8kcGExx1TR3Rv9CrmG55tTGPDBaUy8sPyNnsvUt1jQMV8Y9M1TJhiUpd7Rj0wE
         l/bvfhgaLW3jrZkXaJDsG93ikXstHNEAy1wqf6neCcKdMEgGMrv/uWyTCpAd0Mrg+Wgd
         BPVg==
X-Gm-Message-State: AOAM532YQaWs06g2N0brBwl+mtCODbaQhG/Qih39MrPU5D/yDKPckG86
        Ge2ot9yjd/n2/dIo+rRDrg0=
X-Google-Smtp-Source: ABdhPJxd5/OS8g0gMespazNpL/j7Em5ljDedMHRZeYMSv0dp3J3+tJYdz8Oer7dJAwse9rn72y4qag==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr17816267wmd.86.1593595079044;
        Wed, 01 Jul 2020 02:17:59 -0700 (PDT)
Received: from dhe (p200300ded71b970079d5254590bfd822.dip0.t-ipconnect.de. [2003:de:d71b:9700:79d5:2545:90bf:d822])
        by smtp.gmail.com with ESMTPSA id v20sm6125531wmh.26.2020.07.01.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:17:58 -0700 (PDT)
Date:   Wed, 1 Jul 2020 11:17:55 +0200
From:   David Heinzelmann <heinzelmann.david@gmail.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Fabian Melzow <fabian.melzow@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 4 comp_code 1
Message-ID: <20200701091755.GA17742@dhe>
References: <20200620211913.1535bac0@ping>
 <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
 <20200630185803.2a72c123@ping>
 <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 30, 2020 at 10:03:29PM +0300, Mathias Nyman wrote:
> On 30.6.2020 19.58, Fabian Melzow wrote:
> > Hi!
> > 
> > Am Mon, 29 Jun 2020 20:47:24 +0300
> > schrieb Mathias Nyman <mathias.nyman@linux.intel.com>:
> > 
> >> First issue I see is that the attempt to recover from a transaction
> >> error with a soft retry isn't working. We expect the hardware to
> >> retry the transfer but nothing seems to happen. Soft retry is
> >> described in xhci specs 4.6.8.1 and is basically a reset endpoint
> >> command with TSP set, followed by ringing the endpoint doorbell.
> >> Traces indicate driver does this correctly but hardware isn't
> >> retrying. We get don't get any event, no error, success or stall.
> >>
> >> This could be hardware flaw.
> >> Any chance you could try this on a xHC from some other vendor?
> > 
> > There is no other xHC hardware available to me.
> > 
> >> Second issue is a driver flaw, when nothing happened for 20 seconds
> >> we see the URB is canceled. xhci driver needs to stop then endpoint
> >> to cancel the URB, but there is a hw race and endpoint ends up halted
> >> instead of stopped. The xhci driver can't handle a halted endpoint in
> >> its stop endpoint handler properly, and the URB is never actually
> >> removed from the ring.
> >>
> >> The reason you see the IO_PAGE_FAULT is probably because once the
> >> ring starts running the driver will handle the cancelled URB, and
> >> touch already freed memory: AMD-Vi: Event logged [IO_PAGE_FAULT
> >> domain=0x000d address=0xdc707028 flags=0x0020]
> >>
> >> I have a patch for this second case, I haven't upstreamed it as it
> >> got some conflicting feedback earlier. It won't solve the 20 second
> >> delay, but should solve the the IO_PAGE_FAULT and the "WARN Set TR
> >> Deq Ptr cmd failed due to incorrect slot or ep state" message
> >>
> >> Can you try it out?
> > 
> > I successful applied the patch against Linux 5.7.4, but get this error when
> > compiling drivers/usb/host/xhci-ring.c:
> > 
> >   CC [M]  drivers/usb/host/xhci-ring.o
> > drivers/usb/host/xhci-ring.c: In function ‘xhci_handle_cmd_stop_ep’:
> > drivers/usb/host/xhci-ring.c:857:3: error: implicit declaration of function ‘xhci_reset_halted_ep’ [-Werror=implicit-function-declaration]
> >   857 |   xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type);
> >       |   ^~~~~~~~~~~~~~~~~~~~
> > 
> 
> Right, forgot that you need another patch before this.
> 
> both patches attached, also applied to 5.8-rc1 in branch "fix_invalid_context_at_stop_endpoint"
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint
> 
> -Mathias
> 

Hi,

I've been investigating what appears to be an identical problem recently which I think is related
to the description from xhci 4.6.9. I have an fx2 device which stalls its endpoint while at the
same time the URBs are aborted from the software.

Kernel logs which occured when the xhci driver is stucked at the halted endpoint.

Jun 29 17:27:12 dhe-pc kernel: xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
Jun 29 17:27:12 dhe-pc kernel: xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
Jun 29 17:27:12 dhe-pc kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
Jun 29 17:27:21 dhe-pc kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 6
Jun 29 17:27:21 dhe-pc kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 00000001173dc630 trb-start 00000001173dcc30 trb-end 0000000000000000 seg-start 00000001173dc000 seg-end 00000001173dcff0
Jun 29 17:27:21 dhe-pc kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 00000001173dc630 trb-start 0000000116e53000 trb-end 0000000116e53830 seg-start 0000000116e53000 seg-end 0000000116e53ff0

I have applied your patch to kernel version 5.8-rc3 and I can confirm that the patch solves
my problem for the halted endpoint.

I still get the following error messages from time to time.

Jul 01 09:56:56 dhe kernel: xhci_hcd 0000:00:14.0: WARN Event TRB for slot 11 ep 4 with no TDs queued?
Jul 01 09:56:56 dhe kernel: xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
Jul 01 09:56:56 dhe kernel: xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.

or

Jul 01 10:09:27 dhe kernel: xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
Jul 01 10:09:27 dhe kernel: xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 13
Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66d90 trb-start 0000000473d66e70 trb-end 0000000000000000 seg-start 0000000473d66000 seg-end 0000000473d66ff0
Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66d90 trb-start 0000000473d65000 trb-end 0000000473d65a70 seg-start 0000000473d65000 seg-end 0000000473d65ff0
Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 13
Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66e60 trb-start 0000000473d66e70 trb-end 0000000000000000 seg-start 0000000473d66000 seg-end 0000000473d66ff0
Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66e60 trb-start 0000000473d65000 trb-end 0000000473d65a70 seg-start 0000000473d65000 seg-end 0000000473d65ff0

but the core problem that the xhci is stucked at the halted endpoint state does not occur anymore.
If you are interested in more detailed debug logs I can provide them.

David

