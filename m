Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE0EB41DD72
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 17:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245570AbhI3Pab (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 11:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245398AbhI3Paa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 11:30:30 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DAAC06176A
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 08:28:47 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t11so4268093plq.11
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jx2U1fXVMAX8YVJnygiZPmNCKOQJD2Hj7BS/kMAYEgs=;
        b=agBAaxvELaCg38+3MxkDJ5W3WTSUor6hjrK6UKjt7TpCZZuOPc7FM6IKQBxSyoc52K
         ilxpSY9wGu5Gckh+Y8wN93EqxSZzaoJx/7UfSc/o94BA/avp/+GptpxHQJdaTadAAjUO
         dApT93yF6zsQdX+lxSSJHyhabVLKYswM5ji7mIpRt06U+F8zgITyyWPHLuyJeCwWWRGN
         Y15ffW0I+FZnbmTTtme+SdoYeyiWGTduhyGuvTThXHcvhLrxiSGC2HEm/q23MDFOHhgq
         oCJmcf19GZOambHRb3p397D+7b6T+d8k74DqQhG9jcverKvnrcGX3TISXhAdq6YTGeUa
         BG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jx2U1fXVMAX8YVJnygiZPmNCKOQJD2Hj7BS/kMAYEgs=;
        b=axc7Zrxv008CqQjWNZBa31kyCwUp3w6aB4zpcexTV38O3zmhZX9b41sbBDx1rpIYY/
         c5wT+87D5KLdjVDEQo/iFRSWhJAHzfPpn32iU+UnXZwwM4png+3ZkUHkxnd0Bspi72Uj
         geU4ePiKU+5ihPP0OPrpxFAxIAVZzapsfKHDj8rvohAMtK+KsyeEAendfFIZx2ZI4wvU
         EqjOw1FugOrd5ZB/CVE6BADwD66tXZVc/3Qd+IjKpJ7gDLmG+od1+TOWQO0gxvuAukP4
         n9IDQCHMyup9OsYtISRUdW8/weBNOU3Vl2rWU7F/AGpprPjvC3Wbwzz/NSNLyUn6+MXb
         Ew7Q==
X-Gm-Message-State: AOAM530lDPTyhKWHBrVHA3SH7oXj6UVniz0Ho9a/nAzJCPOZiULsNF7b
        4tpz/Ou3KK9WBRho89J6Fi3aT0ZWL4DmjkdHo2SCdQ==
X-Google-Smtp-Source: ABdhPJy+Q5gdj1FvBjL6jYwPI7vYzDx17vSL3eDwmyx/hbSgqCzUcrj89W/AlsE7w1znCFVh/khI/9h4dUStCMaYHDk=
X-Received: by 2002:a17:90a:d686:: with SMTP id x6mr13753493pju.8.1633015726357;
 Thu, 30 Sep 2021 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-2-sathyanarayanan.kuppuswamy@linux.intel.com> <CA+CmpXtXn5wjxwow5va5u9qHcQDLkd4Sh2dcqB545SXaxV1GkQ@mail.gmail.com>
In-Reply-To: <CA+CmpXtXn5wjxwow5va5u9qHcQDLkd4Sh2dcqB545SXaxV1GkQ@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 30 Sep 2021 08:28:36 -0700
Message-ID: <CAPcyv4iNp41mZcpzGCPR9Xty83j+abk_SOxvsx1xaQ8wALRv0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] driver core: Move the "authorized" attribute from
 USB/Thunderbolt to core
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
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
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 4:20 AM Yehezkel Bernat <yehezkelshb@gmail.com> wrote:
>
> On Thu, Sep 30, 2021 at 4:05 AM Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> >
> > no functional
> > changes other than value 2 being not visible to the user.
> >
>
> Are we sure we don't break any user-facing tool with it? Tools might use this to
> "remember" how the device was authorized this time.

That's why it was highlighted in the changelog. Hopefully a
Thunderbolt developer can confirm if it is a non-issue.
Documentation/ABI/testing/sysfs-bus-thunderbolt does not seem to
answer this question about whether authorized_show and
authorized_store need to be symmetric.
