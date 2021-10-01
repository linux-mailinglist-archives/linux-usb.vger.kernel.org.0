Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C673441F460
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 20:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355614AbhJASLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Oct 2021 14:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhJASLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Oct 2021 14:11:47 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D59C061775
        for <linux-usb@vger.kernel.org>; Fri,  1 Oct 2021 11:10:03 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so9946606pjw.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Oct 2021 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KFuOrTMhH3SQsw1rM/3FEXg4ao/BGYA5Ilqe0th6JM=;
        b=NDbfA3XjG5EhuNjh+dRar041dNJzw1gWHW6t+j97IW2pEjdJSk+YfuCAkrm4fDmjkO
         0pVPJaITMLoKmUdk6x7lCcT+oIBj+ETmUCSbdmpCdzHtL5l7zoz7tIvrGEfpKbPxiIYu
         /+P6IplqX3kirO8xwKxQmGhFDwpB3qeScSFXJVTc2it/D+aS3MMDemWs535izc/INWUw
         nUzYVdFPjGWsRtC7OdTOPI5KlsLMhNqOMT55cuSSJ3jFhvPS84t3GqwTqBxu514MA6C1
         M425dYCXlqS0TK5NPkHcYAR+SwVvSNx3oDZqFPnKdEA9d5B8B2pAY67LX+y0krOYYvOx
         +gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KFuOrTMhH3SQsw1rM/3FEXg4ao/BGYA5Ilqe0th6JM=;
        b=iwjO9DfL7bkancefVWf8c0BLB5JB8BCxWVGMeLlPfLVRlO7nxGaaIZvyh0FnNvH6X9
         BJChluxfDspdkqBPhyE8cMr+QFeQ6mm98bbh//QF9nwyYDiqmf0uOJRG8MPHWLHOnoS/
         jNRXjMRzeHTiO58pZN8cIivRECWmx6eNRF2Ow3tUJhy8HwSDabAcSbN3T2R6wFUt98Wn
         kA6q8mrsgvocUfZZsBcquBAu8q4v3J7evzQ/zKYRl3xaBJTeWBCRJjIfuWkBKupA5Hme
         unqsjiH+31+1mIs/itdDspMmdkwh/1s3nswmiipiIlu+E6d/35/Y6YIZldZzuH4DfX6k
         Ls+A==
X-Gm-Message-State: AOAM5320MYkyzPwHNuhFNRuwlQ5ptYpa20AOeuXecWryWr9L2+P7cRz4
        cTTFgSncBjPyvPf+XNyYTUroCpZWJH0bD3zdQ7ZT9A==
X-Google-Smtp-Source: ABdhPJxhssf74vi65MJPjZjUi4lYRyXsEkvUbEqnuapdQ7I4PrjXBFhCptKglUzo8lM7g8GATcVf+T3EH0hIEL6uJtY=
X-Received: by 2002:a17:90b:3b84:: with SMTP id pc4mr14704315pjb.220.1633111802704;
 Fri, 01 Oct 2021 11:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-5-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065953-mutt-send-email-mst@kernel.org> <CAPcyv4hP6mtzKS-CVb-aKf-kYuiLM771PMxN2zeBEfoj6NbctA@mail.gmail.com>
 <6d1e2701-5095-d110-3b0a-2697abd0c489@linux.intel.com> <YVXWaF73gcrlvpnf@kroah.com>
 <1cfdce51-6bb4-f7af-a86b-5854b6737253@linux.intel.com> <YVaywQLAboZ6b36V@kroah.com>
 <CAPcyv4gqs=KuGyxFR61QWqF6HKrRg851roCGUqrq585+s2Cm=w@mail.gmail.com> <20211001164533.GC505557@rowland.harvard.edu>
In-Reply-To: <20211001164533.GC505557@rowland.harvard.edu>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 1 Oct 2021 11:09:52 -0700
Message-ID: <CAPcyv4i__reKFRP1KjWUov_W5jBQN9_vbUbKRL_V7KMM3oPuuQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] virtio: Initialize authorized attribute for
 confidential guest
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
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
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 1, 2021 at 9:47 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, Oct 01, 2021 at 09:13:54AM -0700, Dan Williams wrote:
> > Bear with me, and perhaps it's a lack of imagination on my part, but I
> > don't see how to get to a globally generic "authorized" sysfs ABI
> > given that USB and Thunderbolt want to do bus specific actions on
> > authorization toggle events. Certainly a default generic authorized
> > attribute can be defined for all the other buses that don't have
> > legacy here, but Thunderbolt will still require support for '2' as an
> > authorized value, and USB will still want to base probe decisions on
> > the authorization state of both the usb_device and the usb_interface.
>
> The USB part isn't really accurate (I can't speak for Thunderbolt).
> When a usb_device is deauthorized, the device will be unconfigured,
> deleting all its interfaces and removing the need for any probe
> decisions about them.  In other words, the probe decision for a
> usb_device or usb_interface depends only on the device's/interface's
> own authorization state.
>
> True, the interface binding code does contain a test of the device's
> authorization setting.  That test is redundant and can be removed.
>
> The actions that USB wants to take on authorization toggle events for
> usb_devices are: for authorize, select and install a configuration;
> for deauthorize, unconfigure the device.  Each of these could be
> handled simply enough just by binding/unbinding the device.  (There
> is some special code for handling wireless USB devices, but wireless
> USB is now defunct.)

Ah, so are you saying that it would be sufficient for USB if the
generic authorized implementation did something like:

dev->authorized = 1;
device_attach(dev);

...for the authorize case, and:

dev->authorize = 0;
device_release_driver(dev);

...for the deauthorize case?
