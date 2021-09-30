Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A358541E2DD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 22:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348103AbhI3Uyx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 16:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344464AbhI3Uyw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 16:54:52 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE745C06176A
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 13:53:09 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ce20-20020a17090aff1400b0019f13f6a749so7415390pjb.4
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2qejnfdUY8QWELT35ESORodSvftZM3gHJyDt93Qq8uI=;
        b=CUV7eUpdDe63xSCyeA5r9yN4N81HMfi00d9dCTu2g6Y1QDXRMIKSN7KVxpOpex4R4G
         pLTEfol+/8HIkj80GwEeD3mLgeXqDqiPvHeQ5l1tWfx0ImoZw0Zx2zcVEr8E0ZCjUzHM
         gvkScgFJ0p80ga65nSCzha0vGzMCgwbTmCtT3wuBUj9EB2kEgh1CtMcVUzGxVerYQF+U
         J8nlGmdESK2QB3GBZCKwqIMn7p3kXDe4lPSVvFYqLvvvYpa8hSwM3J9Ba6OfkoIKBIQH
         bqn4zl1Hz2+Ywd5H94eavdUwBAhhFF2uACxiWEWUL4gAFa0kAd+416a9ZlRoWtHW6Ll4
         L1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2qejnfdUY8QWELT35ESORodSvftZM3gHJyDt93Qq8uI=;
        b=V8/28bijcfwBFFK4KfIr6xk7MyibZdvGr4gCGx2qSVM1s8zRchpsNPDT+pkE85gHaC
         zKTMwde5HDVmO76GZBjvgPGu9XADA/Wu529jmS/hi6aJnIDs4gR32MHyFVvgcjYtrHl5
         940/8QGTK2gcfxwE/07l9U1Wgf17+z0JpEtdUWsj5S+q12VHZ+u6CHVx1K7OfnbNx63W
         5MZvOwxVgUx5LoCT9H1WBrGaCnEP74VJqq3KElBtKoA8Asy0DooJxLib4hc5UMiWcCtb
         lgNBEDfsk/ZL+oWESvZ0aLT2KU8tYNUVIXGuJvtg3CKRp5dfGOSxd0NoA9BFqgNJQK5v
         gsfw==
X-Gm-Message-State: AOAM531KA1rldIx5SmCqWshB5u9xE4TpzCMUaLRMywhC+WyhKWiTlPll
        8p5rMSu/JANOjg2lRI45nvGINQEoWrPtb2+aiUdopA==
X-Google-Smtp-Source: ABdhPJxO5ZRL2F463Ble7fhX3kBlKD2hVMBPqBF5zNBEMi6BOkVEi8Omb9sco1NJAISIFCO6t8sjObGDAHXQjZOa7bE=
X-Received: by 2002:a17:902:e80f:b0:13b:721d:f750 with SMTP id
 u15-20020a170902e80f00b0013b721df750mr6161717plg.18.1633035189290; Thu, 30
 Sep 2021 13:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org> <YVXBNJ431YIWwZdQ@kroah.com>
 <20210930144305.GA464826@rowland.harvard.edu> <20210930104924-mutt-send-email-mst@kernel.org>
 <20210930153509.GF464826@rowland.harvard.edu> <20210930115243-mutt-send-email-mst@kernel.org>
 <00156941-300d-a34a-772b-17f0a9aad885@linux.intel.com> <20210930204447.GA482974@rowland.harvard.edu>
In-Reply-To: <20210930204447.GA482974@rowland.harvard.edu>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 30 Sep 2021 13:52:59 -0700
Message-ID: <CAPcyv4j8DvsMYppRtm=+JQWc7nJGoXeAGGz9U150x0p_KekqcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andi Kleen <ak@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "Reshetova, Elena" <elena.reshetova@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 1:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, Sep 30, 2021 at 12:23:36PM -0700, Andi Kleen wrote:
> >
> > > I don't think the current mitigations under discussion here are about
> > > keeping the system working. In fact most encrypted VM configs tend to
> > > stop booting as a preferred way to handle security issues.
> >
> > Maybe we should avoid the "trusted" term here. We're only really using it
> > because USB is using it and we're now using a common framework like Greg
> > requested. But I don't think it's the right way to think about it.
> >
> > We usually call the drivers "hardened". The requirement for a hardened
> > driver is that all interactions through MMIO/port/config space IO/MSRs are
> > sanitized and do not cause memory safety issues or other information leaks.
> > Other than that there is no requirement on the functionality. In particular
> > DOS is ok since a malicious hypervisor can decide to not run the guest at
> > any time anyways.
> >
> > Someone loading an malicious driver inside the guest would be out of scope.
> > If an attacker can do that inside the guest you already violated the
> > security mechanisms and there are likely easier ways to take over the guest
> > or leak data.
> >
> > The goal of the device filter mechanism is to prevent loading unhardened
> > drivers that could be exploited without them being themselves malicious.
>
> If all you want to do is prevent someone from loading a bunch of
> drivers that you have identified as unhardened, why not just use a
> modprobe blacklist?  Am I missing something?

modules != drivers (i.e. multi-driver modules are a thing) and builtin
modules do not adhere to modprobe policy.

There is also a desire to be able to support a single kernel image
across hosts and guests. So, if you were going to say, "just compile
all unnecessary drivers as modules" that defeats the common kernel
image goal. For confidential computing the expectation is that the
necessary device set is small. As you can see in the patches in this
case it's just a few lines of PCI ids and a hack to the virtio bus to
achieve the goal of disabling all extraneous devices by default.
