Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B910E3571D2
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 18:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbhDGQJ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 12:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50239 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354329AbhDGQJt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Apr 2021 12:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617811776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GIdD8KXpZXildX/JzoGMDWLdi24taALA9x3SDqt6Iik=;
        b=ZvWEMeslR1E+khlqfNhBwhO+Zqwx0VCh3Fs1X0HAEz693HMNV8tj7KfGFi8DDunZMlh5Jp
        DJylOTRh4v+Z0mDUF2sqp93c82nh9snkPY4awEeA48CySxS/aI+Xh8dhDZQyiIfebu0PA5
        Qdlp/DIjXh8UvgZrw5WfrxuHfi7pFOA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-I6J1izo3P-qyxmTfWT7F9Q-1; Wed, 07 Apr 2021 12:09:34 -0400
X-MC-Unique: I6J1izo3P-qyxmTfWT7F9Q-1
Received: by mail-pj1-f71.google.com with SMTP id hi14so2964030pjb.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Apr 2021 09:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GIdD8KXpZXildX/JzoGMDWLdi24taALA9x3SDqt6Iik=;
        b=m8NEnPHqKBESWIx/8h7kXKH1kGQtzvL79jRcCyE2Mh4bYvQX7Co2NoI47x0bRQVMwH
         J5R4R8l+SGg3GjQzBo74s1k7mjXn7udziiqz5NshRMo4aARCzOZ9T1XXUlWzH4px2ibs
         lGkraswVldD8qfNp9M4EvrKdSlFT+O+yxXLnLefdKfN6F+mizlNYJBU/aWoCiYNnmZH4
         RRVIjYeAbG25rXKCu0yj4JHltnYC26PjlVgzEGrRp8CkWh7hBXEK1uFuHmzogvA26Rxi
         H3xQR9bc4mf/d7V84pHCD7opPYZEk9MnNzexdgzlMSWaLTKaufN6xHBYsl8CgiIiT37r
         YCFQ==
X-Gm-Message-State: AOAM531gVoye9abFgbjvboydCmC3fQpPpkYgjjAAtC+pFvOhcGB8XCzI
        Wm5XlN7AGP2QHMsu3tF5TkgIGyR5ySEKEu0qr4r0kxLoQ24dH5/OkejSRG8It8OHTf4LRVUy5SM
        EzjnSlVy27pgn8WOF9gfVaC8WVuW3WYfH3P2u
X-Received: by 2002:a17:90a:9f0b:: with SMTP id n11mr4041304pjp.56.1617811773506;
        Wed, 07 Apr 2021 09:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ/h+B/6MXT+kwdnrI/eZUAdaTH42xPX4Fl95aBz/l50kJXCNcNQsRWwTSkwUMdm87PUkq3Q6JFENBMcJAE68=
X-Received: by 2002:a17:90a:9f0b:: with SMTP id n11mr4041274pjp.56.1617811773205;
 Wed, 07 Apr 2021 09:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143458.508959-1-lee.jones@linaro.org> <20210406085605.GS2916463@dell>
In-Reply-To: <20210406085605.GS2916463@dell>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 7 Apr 2021 18:09:22 +0200
Message-ID: <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
Subject: Re: [RESEND 00/25] Rid W=1 warnings from HID
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        linaro-mm-sig@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Lopez Casado <nlopezcasad@logitech.com>,
        "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
        Masaki Ota <masaki.ota@jp.alps.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        message to <vojtech@ucw.cz>,
        Michael Haboustak <mike-@cinci.rr.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
        Vojtech Pavlik <vojtech@suse.cz>,
        Zhang Lixu <lixu.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 6, 2021 at 10:56 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 26 Mar 2021, Lee Jones wrote:
>
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >
> > Lee Jones (25):
> >   HID: intel-ish-hid: Remove unused variable 'err'
> >   HID: ishtp-hid-client: Move variable to where it's actually used
> >   HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
> >   HID: intel-ish: Supply some missing param descriptions
> >   HID: intel-ish: Fix a naming disparity and a formatting error
> >   HID: usbhid: Repair a formatting issue in a struct description
> >   HID: intel-ish-hid: Fix a little doc-rot
> >   HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
> >   HID: hid-alps: Correct struct misnaming
> >   HID: intel-ish-hid: Fix potential copy/paste error
> >   HID: hid-core: Fix incorrect function name in header
> >   HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in
> >     header
> >   HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
> >   HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
> >   HID: hid-picolcd_core: Remove unused variable 'ret'
> >   HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote
> >     abuses
> >   HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
> >   HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
> >   HID: hid-uclogic-params: Ensure function names are present and correct
> >     in kernel-doc headers
> >   HID: hid-sensor-custom: Remove unused variable 'ret'
> >   HID: wacom_sys: Demote kernel-doc abuse
> >   HID: hid-sensor-hub: Remove unused struct member 'quirks'
> >   HID: hid-sensor-hub: Move 'hsdev' description to correct struct
> >     definition
> >   HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
> >   HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning
>
> These have been on the list for a couple of weeks now.
>
> Is there anything I can do to help expedite their merge?
>
> I'm concerned since -rc6 has just been released.

Sorry for the delay.

I am currently queuing them locally and running a few tests on them. I
don't expect anything to happen, but better be safe than anything.

FWIW, I am splitting the series in 3:
- 11 patches for intel ish are going to be queued in for-5.13/intel-ish
- the thrustmaster one in for-5.13/thrustmaster
- the rest (13 patches) will be sent in for-5.13/warnings.

Cheers,
Benjamin

