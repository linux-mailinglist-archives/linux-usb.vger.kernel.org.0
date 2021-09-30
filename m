Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7040F41DD68
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 17:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245291AbhI3P13 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 11:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244779AbhI3P13 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 11:27:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9214BC06176A
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 08:25:46 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 145so5272511pfz.11
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iIxgYNDztL7Z5NZD7Jrw2Q8W9/sF09Rvn/hN4H8sJ6s=;
        b=H9ByBCwUFoisbggQfboACP31KYAVClsy6c2zsT8A18/94EX+AnluzG1qujii4U0mXT
         3l96j2LXb6DMlHQlhr/CLemSNhGGqawiFsMbdelCPbB2zN028oULxdodOhY85xhryQtb
         k+DZww7m+rKmc3v7sZs7XWqntRlSwLBw4TfVkkOlsJT5/RhGPdUOzrP6c2PZlrsEGs5D
         MvUBojQkUYkfrK5jEUOzFV8tUfb/ViVq+LQZ9DSIcsGrwmgKlFZreeu8G2wd7kuW1vnq
         kSp18ebDWzKdvr1UPRjO2MEykMiEfFsfiDuep2Z859xwM7cOMrAwL3NsmQNsK4RPHXLN
         Zbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iIxgYNDztL7Z5NZD7Jrw2Q8W9/sF09Rvn/hN4H8sJ6s=;
        b=QjnYnHUm+qQ2ARir2nGFGt+0HP7ND7TLqMB9l0Ti0BVo4G3Ie60RTIdRs2PH5T7WtT
         RBSKSiW9O64QtP4PkDzl8stjaObFYwhQ+j6L9JpArmfIHw0kDiIWiIuMJkdUHHJ2/mtv
         qmU+so3mTsTrn4lSjtkHRWJJW7mw5rsW9TVFBnbKBO3q4rwq+asaLtQ58cm5aDWY4edQ
         u4sfrl8XBYMNll7dvlsFcV1cBjINhhDf5kcVLMy98MSjT4IFjuNHK9ylcA9zcWLOOtdj
         SwjjyxPJiSdf2Orcbw4q4jAcj41IZW+V1HOuBRN324cOy7Kl0Sijw2REhQdlIIPKgzdb
         W95w==
X-Gm-Message-State: AOAM5329w0jmq/tcyt/4u1TpvMqoPVeFn6H0b79QGjI4Lrk7pCDHgDLU
        RYw8UabMhCBTAiFCmfOEkSlFrlgg+otcTYwbpSwgKw==
X-Google-Smtp-Source: ABdhPJxC9LlLHCc9VsuLNd2ENfEgS7lqcNO31wz+nFKZyLdakX6Gg7y18epJgAQ/l5pu2ntO4OPx+josqq5a+ijdZqA=
X-Received: by 2002:aa7:9d84:0:b0:447:c2f4:4a39 with SMTP id
 f4-20020aa79d84000000b00447c2f44a39mr4974478pfq.86.1633015546058; Thu, 30 Sep
 2021 08:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930014229.GA447956@rowland.harvard.edu> <CAPcyv4iiEC3B2i81evZpLP+XHa8dLkfgWmrY7HocORwP8FMPZQ@mail.gmail.com>
 <20210930145932.GB464826@rowland.harvard.edu>
In-Reply-To: <20210930145932.GB464826@rowland.harvard.edu>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 30 Sep 2021 08:25:35 -0700
Message-ID: <CAPcyv4gZp3dx9JDKiRSkuCF1=5w-g5gVd1SrcA_WfLtYjo4BQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] driver core: Move the "authorized" attribute from
 USB/Thunderbolt to core
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
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

On Thu, Sep 30, 2021 at 8:00 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Sep 29, 2021 at 06:55:12PM -0700, Dan Williams wrote:
> > On Wed, Sep 29, 2021 at 6:43 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Wed, Sep 29, 2021 at 06:05:06PM -0700, Kuppuswamy Sathyanarayanan wrote:
> > > > Currently bus drivers like "USB" or "Thunderbolt" implement a custom
> > > > version of device authorization to selectively authorize the driver
> > > > probes. Since there is a common requirement, move the "authorized"
> > > > attribute support to the driver core in order to allow it to be used
> > > > by other subsystems / buses.
> > > >
> > > > Similar requirements have been discussed in the PCI [1] community for
> > > > PCI bus drivers as well.
> > > >
> > > > No functional changes are intended. It just converts authorized
> > > > attribute from int to bool and moves it to the driver core. There
> > > > should be no user-visible change in the location or semantics of
> > > > attributes for USB devices.
> > > >
> > > > Regarding thunderbolt driver, although it declares sw->authorized as
> > > > "int" and allows 0,1,2 as valid values for sw->authorized attribute,
> > > > but within the driver, in all authorized attribute related checks,
> > > > it is treated as bool value. So when converting the authorized
> > > > attribute from int to bool value, there should be no functional
> > > > changes other than value 2 being not visible to the user.
> > > >
> > > > [1]: https://lore.kernel.org/all/CACK8Z6E8pjVeC934oFgr=VB3pULx_GyT2NkzAogdRQJ9TKSX9A@mail.gmail.com/
> > > >
> > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > >
> > > Since you're moving the authorized flag from the USB core to the
> > > driver core, the corresponding sysfs attribute functions should be
> > > moved as well.
> >
> > Unlike when 'removable' moved from USB to the driver core there isn't
> > a common definition for how the 'authorized' sysfs-attribute behaves
> > across buses. The only common piece is where this flag is stored in
> > the data structure, i.e. the 'authorized' sysfs interface is
> > purposefully left bus specific.
>
> How about implementing "library" versions of show_authorized() and
> store_authorized() that the bus-specific attribute routines can call?
> These library routines would handle parsing the input values, storing
> the new flag, and displaying the stored flag value.  That way at
> least the common parts of these APIs would be centralized in the
> driver core, and any additional functionality could easily be added
> by the bus-specific attribute routine.
>

While show_authorized() seems like it could be standardized, have a
look at what the different store_authorized() implementations do.
Thunderbolt wants "switch approval" vs "switch challenge" and USB has
a bunch of bus-specific work to do when the authorization state
changes. I don't see much room for a library to help there as more
buses add authorization support. That said I do think it would be
useful to have a common implementation available for generic probe
authorization to toggle the flag if the bus does not have any
authorization work to do, but that seems a follow-on once this core is
accepted.
