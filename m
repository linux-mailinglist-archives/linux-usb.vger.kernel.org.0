Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286AF358260
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 13:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhDHLoa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 07:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48959 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhDHLo1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 07:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617882256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ojI36GqCcSZZKDE7ZJzPVmk370WGjalSRm35dXXJjG4=;
        b=Pqq6oBVtRps9LxP1kUyxz7z+HtwiijqR4gjR8sKvI9lRErdbKpIJvqlqEKS9tGSmsud0kG
        LSTkESewUws1UBgxwkrkgf5wX2KGO/rIsMzRmEKJYMknk4MQVcaW5t776bnWhHirxRLVk5
        QXaWlZKTF5spqK4Kb7fP8DoFMMCokbo=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-xdcEap95PaCahXmYMZXpxA-1; Thu, 08 Apr 2021 07:44:04 -0400
X-MC-Unique: xdcEap95PaCahXmYMZXpxA-1
Received: by mail-pg1-f200.google.com with SMTP id i1so1207003pgg.20
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 04:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ojI36GqCcSZZKDE7ZJzPVmk370WGjalSRm35dXXJjG4=;
        b=m9zQXXGpx1ZAFJzJ/GojVA+QD2Zfhe47nYEq9L9qFqi5j8T9w33BFJnSs01hPkjRHe
         iH8z5pA9VFIdpMyIAi2mNZhTaFT5/rVXgZzyjwmEULnDABh2deZ7AGpzioPW+PU3/y3q
         HeFO+NIf+ntStyjMgqw58yht8YHtXocps6t8KHOrN0MvYJVoNjvEAHHgzqylhYtxv7ck
         Yy8T2WqmOYqKTLrtg2ljeYJ9fdS1+0O4WzjLr7wLY8BEuuoh9eEkNsjf8olw/eiY4cBD
         GNVuqb0v+G01Y8lvsL7jWmpJSQFZIH8NbK9YXQNVF7cL3C6EQncLIQnRwMLR99Mc1uog
         usqQ==
X-Gm-Message-State: AOAM533Av0GeCspnDuoIxCb/JjWTxXckNhhqAsfXlElmzV8izI8dJQLR
        84USjsA6xtoJScdYXdxx30pbTh1ZfJJwvD0II0N+vnfbVQyHOjE3pG1t9jt4x/PgNVfXyxBANIB
        o8nVK64b+yaegX3YFgKirZ2XQtRDZYtgU8h8H
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr8097141pjr.234.1617882243166;
        Thu, 08 Apr 2021 04:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXWoD4uZFLjX3W//O+WsdPii+AkkUpUkXJnA0RNfYAyKcsVoeyvydz2BlU3advUFqA9gChFbY15nQwPpfmGv8=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr8097093pjr.234.1617882242926;
 Thu, 08 Apr 2021 04:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143458.508959-1-lee.jones@linaro.org> <20210406085605.GS2916463@dell>
 <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com> <20210408070605.GC2961413@dell>
In-Reply-To: <20210408070605.GC2961413@dell>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 8 Apr 2021 13:43:52 +0200
Message-ID: <CAO-hwJJrn4mzPwzYvusGNa6KhLZ+kCn=svzgGJD=6q+Urz=YsA@mail.gmail.com>
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

On Thu, Apr 8, 2021 at 9:06 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Wed, 07 Apr 2021, Benjamin Tissoires wrote:
>
> > On Tue, Apr 6, 2021 at 10:56 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Fri, 26 Mar 2021, Lee Jones wrote:
> > >
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > >
> > > > Lee Jones (25):
> > > >   HID: intel-ish-hid: Remove unused variable 'err'
> > > >   HID: ishtp-hid-client: Move variable to where it's actually used
> > > >   HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
> > > >   HID: intel-ish: Supply some missing param descriptions
> > > >   HID: intel-ish: Fix a naming disparity and a formatting error
> > > >   HID: usbhid: Repair a formatting issue in a struct description
> > > >   HID: intel-ish-hid: Fix a little doc-rot
> > > >   HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
> > > >   HID: hid-alps: Correct struct misnaming
> > > >   HID: intel-ish-hid: Fix potential copy/paste error
> > > >   HID: hid-core: Fix incorrect function name in header
> > > >   HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in
> > > >     header
> > > >   HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
> > > >   HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
> > > >   HID: hid-picolcd_core: Remove unused variable 'ret'
> > > >   HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote
> > > >     abuses
> > > >   HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
> > > >   HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
> > > >   HID: hid-uclogic-params: Ensure function names are present and correct
> > > >     in kernel-doc headers
> > > >   HID: hid-sensor-custom: Remove unused variable 'ret'
> > > >   HID: wacom_sys: Demote kernel-doc abuse
> > > >   HID: hid-sensor-hub: Remove unused struct member 'quirks'
> > > >   HID: hid-sensor-hub: Move 'hsdev' description to correct struct
> > > >     definition
> > > >   HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
> > > >   HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning
> > >
> > > These have been on the list for a couple of weeks now.
> > >
> > > Is there anything I can do to help expedite their merge?
> > >
> > > I'm concerned since -rc6 has just been released.
> >
> > Sorry for the delay.
> >
> > I am currently queuing them locally and running a few tests on them. I
> > don't expect anything to happen, but better be safe than anything.
> >
> > FWIW, I am splitting the series in 3:
> > - 11 patches for intel ish are going to be queued in for-5.13/intel-ish
> > - the thrustmaster one in for-5.13/thrustmaster
> > - the rest (13 patches) will be sent in for-5.13/warnings.
>
> Sounds good to me.  Thanks Benjamin.
>
After a few attempts at fixing my CI, I have now pushed this series as
mentioned previously.

Cheers,
Benjamin

