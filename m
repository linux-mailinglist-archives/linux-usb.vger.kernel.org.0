Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4A241DDFD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 17:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346288AbhI3PyF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 11:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36086 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346501AbhI3PyE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 11:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633017141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NVmoSKlXkLAYB9YWRq2HT/6NKIMmAUGmQq1ySxlsNKU=;
        b=I8XKNzCInjF59ispHwIXxsifPo0CMeWdEj392d3QJWmaWeWJ83z/LLT01v2QcCOY35s1AN
        W2Mxk0yfwziQ8qekdtD9kO0ynRjNV2HKWf6kWjh0h9vO25ny2xjwKX5+FXtQYS82ai2w+s
        Ydn4dV++UMK87CsgIaexpDdKmjPEJ9A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-mRUPEUFZME2EwDQ0jBs44w-1; Thu, 30 Sep 2021 11:52:19 -0400
X-MC-Unique: mRUPEUFZME2EwDQ0jBs44w-1
Received: by mail-wm1-f72.google.com with SMTP id v5-20020a1cac05000000b0030b85d2d479so3143259wme.9
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 08:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NVmoSKlXkLAYB9YWRq2HT/6NKIMmAUGmQq1ySxlsNKU=;
        b=OFvL8wqlChV5McXZ56eYyMOUeIRnldQ+Td6O65QjbCAoMpyyhEUTQ93GFaIKEUcMqa
         VcG0fMPm4ZAV8xzmr68G0ZTTWi4JT73TCyqOzG3FEBNztIxHSSUBnJnxVqyc7YggGtjb
         MqJrvUpU6R3ccQ5eqbtHvMIiyiYKznSBPF0HPoGOFboFF+qGSmkJsASYgpEdxGctMLSu
         CCszJZm25bsR+kqTkyzplKDj5Lur1QDtyVgEoeMhp6Ymlb30aS56H1W+Lrbu0K9P6uKg
         O26rPNxiX+1uQ9N1qKSJis8SXkWQi1LWNzPOqnr9zpDlKUALmZajtk2q8SIx1OmH1Ff1
         /2nQ==
X-Gm-Message-State: AOAM533axNCwDEwI2ezwairdszU6lbS+ekILHCQpqCa7QnQlaWAiTmpq
        JtH4+cKy1CLBHhULP0n9SWtob8gPBXap+oiqXPO5KdgRNTSgIgmQPkbHCK1e0UTszM9b5Wkl2lV
        wo6RhUQUp0+kwP7DdiCdu
X-Received: by 2002:adf:dc43:: with SMTP id m3mr7186939wrj.66.1633017138814;
        Thu, 30 Sep 2021 08:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvZVp74K6IQg5vdKu27+JG9+WUQkfW9TKM4Z4S4rEE1CdnJHLUxb+4aAUPcwK1d944tYc9pA==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr7186902wrj.66.1633017138595;
        Thu, 30 Sep 2021 08:52:18 -0700 (PDT)
Received: from redhat.com ([2.55.134.220])
        by smtp.gmail.com with ESMTPSA id o7sm4045187wro.45.2021.09.30.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 08:52:18 -0700 (PDT)
Date:   Thu, 30 Sep 2021 11:52:12 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
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
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
Message-ID: <20210930115159-mutt-send-email-mst@kernel.org>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org>
 <YVXBNJ431YIWwZdQ@kroah.com>
 <20210930144305.GA464826@rowland.harvard.edu>
 <20210930104640-mutt-send-email-mst@kernel.org>
 <20210930153241.GE464826@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930153241.GE464826@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 11:32:41AM -0400, Alan Stern wrote:
> On Thu, Sep 30, 2021 at 10:48:54AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Sep 30, 2021 at 10:43:05AM -0400, Alan Stern wrote:
> > > I don't see any point in talking about "untrusted drivers".  If a 
> > > driver isn't trusted then it doesn't belong in your kernel.  Period.  
> > > When you load a driver into your kernel, you are implicitly trusting 
> > > it (aside from limitations imposed by security modules).  The code 
> > > it contains, the module_init code in particular, runs with full 
> > > superuser permissions.
> > > 
> > > What use is there in loading a driver but telling the kernel "I don't 
> > > trust this driver, so don't allow it to probe any devices"?  Why not 
> > > just blacklist it so that it never gets modprobed in the first place?
> > > 
> > > Alan Stern
> > 
> > When the driver is built-in, it seems useful to be able to block it
> > without rebuilding the kernel. This is just flipping it around
> > and using an allow-list for cases where you want to severly
> > limit the available functionality.
> 
> Does this make sense?
> 
> The only way to tell the kernel to block a built-in driver is by 
> using some boot-command-line option.  Otherwise the driver's init 
> code will run before you have a chance to tell the kernel anything at 
> all.
> 
> So if you change your mind about whether a driver should be blocked, 
> all you have to do is remove the blocking option from the command 
> line and reboot.  No kernel rebuild is necessary.
> 
> Alan Stern

Right.

-- 
MST

