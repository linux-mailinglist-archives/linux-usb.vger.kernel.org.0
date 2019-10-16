Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A802D8885
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 08:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387750AbfJPGOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 02:14:31 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35047 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfJPGOb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 02:14:31 -0400
Received: by mail-qt1-f196.google.com with SMTP id m15so34507115qtq.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GawCBMh9NqIamtg2SCquuU1mF2daZgV9LLd8P7nFDiA=;
        b=CXoo/fxf0E8vVt7V01SYD4EOrQEbYvFRaZGjmwWsldsThEeLmd7ndBq5a1QN61duLS
         H1qumH85+uXVEeEqNYNF+yytPOTjc2zTElfS+D1c78Dd1a6ba9MRl0Ee+w5xIrc8ZRSA
         JvAwakO2alwHOK4cJRtxRBJfc08OuYNUfGCq+XbHx1on7nejEvC3xlzJxOyrLr3mIKOG
         oczoyDadGf4jb0vNHn7pKDmhJ5Vw8dPlBAnycccgF/iNi+FcejU9CCUf/F8qxQ9oCedu
         aaRInZcTYJrE3EZf0dMyQzN53JS2CapS1aFlF6BZeRdhoaMjOOdDm0jfwsZNBSzIEWaO
         EJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GawCBMh9NqIamtg2SCquuU1mF2daZgV9LLd8P7nFDiA=;
        b=qFfiQWaJlK1r9TFvVaFQwWMpRYwQw/UFQCW6ISSJ3lh4OnB/RQuv9XmEpYPSH7MgBv
         n2ym6bVbUtKOkg9lVvlOw01Xd4hsMhjYua8983XT2BsFLu6GBeNaBSL+DxCQCTcBNfbz
         GXXNU+alfEmaFb9+UBxkXiWBuFZCKoeLPRt9rW5UFEMX6KPeV32BrcAhFnB6lX94RvQe
         E7VZG+5n/AVDDWpnqucvgboRQAUqU8TwlX1iwAgapwybWYWPnsjNebodjFcmLSE9Ql0D
         VtxaFId0JnxobHTl0Dm8Wi/wpr2g4QHE6gc6wwRHu66MKH9ycs1UohxVFXlo8y1CbQ5d
         XGNQ==
X-Gm-Message-State: APjAAAVf4LZ8IG1vEhYb3cZ5f+D5NO6jTVT+pdGcHLGTgs45mAqMH0yT
        KTsLuWqIB4S2ezowhiSlyIqBNTxfi8QOtTGz7i0PCQ==
X-Google-Smtp-Source: APXvYqwiV4mxddPn7dV0fiVkZcslq0XHJF+3rn4ldkXT/4VjJjQHGBpNHo6hrlxrom6jnAhtRDMsMkYuqTbw/k8u56M=
X-Received: by 2002:ac8:3021:: with SMTP id f30mr42138162qte.80.1571206470472;
 Tue, 15 Oct 2019 23:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191014061355.29072-1-drake@endlessm.com> <20191014154322.GA190693@google.com>
 <CAD8Lp45hmYhrj9v-=7NKrG2YHmxZKFExDsHCL67hap+Y2iM-uw@mail.gmail.com> <CAJZ5v0jCh87azmBuhj1T_M+OV8tu7v7Y7WV_zaf56+fxhXU3KQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jCh87azmBuhj1T_M+OV8tu7v7Y7WV_zaf56+fxhXU3KQ@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Wed, 16 Oct 2019 14:14:19 +0800
Message-ID: <CAD8Lp46BJvCo4c3c2XTrbPyF3k8p0QG24WbsWQ2Sc=7ikcyC8w@mail.gmail.com>
Subject: Re: [PATCH] PCI: increase D3 delay for AMD Ryzen5/7 XHCI controllers
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 16, 2019 at 1:52 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Tue, Oct 15, 2019 at 7:31 AM Daniel Drake <drake@endlessm.com> wrote:
> > It's actually coming out of D3cold here, however what happens right
> > before this is that __pci_start_power_transition() calls
> > pci_platform_power_transition(D0) to leave D3cold state, then
> > pci_update_current_state() reads PMCSR and updates dev->current_state
> > to D3hot.
>
> Which pci_update_current_state() do you mean, exactly?
>
> Note that pci_platform_power_transition() itself contains one, which
> triggers after a successful change of the ACPI power state of the
> device (which should be the case here).

That's the one I mean.

pci_pm_default_resume_early
- pci_power_up
-- __pci_start_power_transition
--- pci_platform_power_transition
---- pci_update_current_state(D0)

At this point, PMCSR is read and dev->current_status is set to D3 accordingly.

Then, continuing in pci_power_up(), pci_raw_set_power_state(D0) is
called and the extra delay is needed there after writing PMCSR to
transition to D0.
I didn't go further along the call trace because at that point the
problem has already been triggered.

> That I agree with and the platform firmware doesn't compensate for
> that (which it could do, arguably).

I tried to get official AMD support on this but their response was
that they don't have available resources to dedicate to Linux support.
Without guidance from AMD I don't think there's any chance of a
firmware change from the platform vendor.

I think we just have to figure out how to work with it. It seems that
Windows 10 delays longer or uses some other scheme. Another
alternative that I just tried is retrying the PMCSR write & readback
if it didn't complete the transition on the first try. That works
fine, let me know if it's preferred to implement something along those
lines as a more generic workaround.

Daniel
