Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5032967A1
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 01:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373373AbgJVXZj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 19:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373369AbgJVXZi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 19:25:38 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC63C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 16:25:38 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id l16so3463730eds.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 16:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PHrw0JfjJb9twAK3ln44mr+GANmK39ZjwO95rghOQdQ=;
        b=UH/1lsGD9S6xaaoRApk4Nn23uH2VJ7+Oc/a5lKr2+7MqiTQ/YhkUikfK+zgYYch1lf
         gx9p3iO981SwYgZyP+/nNqu7msU4Gy5+BlCzR3zePM99c6+BOQPr9DPcF48Nlfy+UZCJ
         ZTTAAEScd1rLvJlyna0Gidt+aBXjpynj46gFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PHrw0JfjJb9twAK3ln44mr+GANmK39ZjwO95rghOQdQ=;
        b=CvNFBhNHQwq4HZAKZ36tcORynOFDB/VNzzCIpx+CiaMGkyzZO72cgOLBoLSh0yoPnP
         lRg8xHJa1uSL75GadItxUZH2OiXLv4sk/oQgFgxLqam13T9qG5fRDGtRtoaCEGhy6ka3
         E2tAcHtX97WQ9ifzeO1l1FEXG9A52lb9X0lZLxLW1d5nvmmOlQJPoWxD73lBe/YCT1aT
         ZsBf1NNtKdFVFxNlT8CAQAPWxSsNMPuhJD3zozEe0iWGh4g3EjfUIDFmN0V80p/DJfHG
         6GkJH2jvyh3QqKMoqVNziHpmtheMNIANLgmf/a4K5+Q5OpkBXCFsENnPf4LVgkSgH9Gf
         0mbQ==
X-Gm-Message-State: AOAM533kqvPPdzTq+LJR1DGTCDoBU5k81l3tT/YuKaP+ezi40pUwUiyS
        dY29LFteGRAxIP0ejqDP9HW0nYHOVunj/h1CfjcWvw==
X-Google-Smtp-Source: ABdhPJyOYbg4gQQD8ecWNaqg9c3TuCugFn5dWP7WA2YesbbY1EuTRCL6KLGGq52xf1q8l4Vm/dKoA07oeJwe+l5nluk=
X-Received: by 2002:a50:a267:: with SMTP id 94mr4365625edl.30.1603409135139;
 Thu, 22 Oct 2020 16:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201022061554.3418060-1-pmalani@chromium.org>
 <20201022065719.GA1440360@kroah.com> <CACeCKacvhtSfQ=hGYHi3AdrTT+XY2RpKmPHuYWoxNVmRWMeBBA@mail.gmail.com>
 <20201022071753.GA1470296@kroah.com> <CACeCKafjm-T5WnQNRbpKm3OwxqYH+_MxLMg60-=RrpJFBzcKyA@mail.gmail.com>
 <20201022124248.GQ1667571@kuha.fi.intel.com>
In-Reply-To: <20201022124248.GQ1667571@kuha.fi.intel.com>
From:   Benson Leung <bleung@chromium.org>
Date:   Thu, 22 Oct 2020 16:25:23 -0700
Message-ID: <CANLzEkskrWXWLC+csObYwB+JUFdH+p6V6giMHtsKY-L61cTG9g@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: Expose Product Type VDOs via sysfs
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Thu, Oct 22, 2020 at 5:43 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Oct 22, 2020 at 12:25:07AM -0700, Prashant Malani wrote:
> > Hi Greg,
> >
> > On Thu, Oct 22, 2020 at 12:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > > > > +What:                /sys/class/typec/<port>-partner/identity/product_type_vdo
> > > > > > +Date:                October 2020
> > > > > > +Contact:     Prashant Malani <pmalani@chromium.org>
> > > > > > +Description:
> > > > > > +             Product Type VDOs part of Discover Identity command result. 3 values
> > > > > > +             are displayed (for the 3 possible Product Type VDOs), one per line.
> > > > >
> > > > > sysfs is "one value per file", not "one value per line".  This is not
> > > > > ok.
> > > >
> > > > I see. Would listing these out as three separate vdos (i.e vdo0, vdo1,
> > > > vdo2) be better?
> > >
> > > Given that your current implementation is not acceptable, something has
> > > to change :)
> >
> > Got it. I'd like to see if Heikki has any suggestions on naming these
> > entries better.
>
> Why not have product type specific attribute files?
>
> So if the partner is UFP, then we expose ufp1 and ufp2 files that
> return the UFP1 and UFP2 VDO values and hide the other files:
>
>         % ls /sys/class/typec/port0-partner/identity/
>         id_header cert_stat product ufp1 ufp2
>
> If the partner is DFP, then you expose the dfp file and hide
> everything else:
>
>         % ls /sys/class/typec/port0-partner/identity/
>         id_header cert_stat product dfp
>
> And so on.

I would caution against any decoding of the VDO contents in the kernel
and making assumptions about the # or the names of these three
individual objects.

Since PD 2.0 through PD 3.0, and PD 3.0's different subrevisions (1.0,
1.3, 2.0), the # of VDOs that have been supported has changed in the
various spec versions.

PD R3.0 V2.0 actually added extra objects here (UFP VDO1 UFP VDO2, DFP
VDO), but thanks to some troublemaker (me, actually...), the PD spec's
next version deprecates and deletes two of them (the AMA VDO and the
UFP VDO2 are gone, thanks to an ECR I put into USB PD).

(If you've got USB PD working group access, the two ECRs in question
are: https://groups.usb.org/wg/powerdelivery/document/11007 and
https://groups.usb.org/wg/powerdelivery/document/10967).

Since the different spec versions need to all be supported (since the
firmware of PD devices are baked for a particular version of the PD
spec at the time they are released and don't change in practice), the
software on USB PD hosts should provide these objects up to the next
layer without adding any extra decoding, and the upper layer
(userspace) can figure out the specifics based on comparing different
revision and version fields to figure out what vdo1, vdo2, and vdo3
are.

Anyway, hope this helps, and sorry in advance for making this section
of the PD spec more complicated to handle over time...

Benson
>
> thanks,
>
> --
> heikki



-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
