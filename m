Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8F3221083
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 17:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgGOPKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 11:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgGOPKE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 11:10:04 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A59EC061755;
        Wed, 15 Jul 2020 08:10:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t15so3108174pjq.5;
        Wed, 15 Jul 2020 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XNp2mtzWkyOXrH3uMDe1zxno4jUg2B4E5FPg/MLAXcM=;
        b=b8NsdDUkMwwRdLtOlm0ekKerAdkiGqQAUJ9dGPA7igyMOfKkcsP8mxHkmacLATgCO8
         PEGsMQndtBRCdDTgupeRuUbPo5/T0f1W7zb8ABG4Hl7q4kgpOSCfvXEtn4eet/X42CkE
         q7RSlxrZyIq3npSOmxfCOQ2VyFcwKX7fw3ehNsysiisIt72D1iiBp4hJMv0QztiCDuDe
         aspUcslUldMxATzW27TQt8g7YUWXvb1aJBeTnslaN/QMKqbc0r8rE7Uvhm/3tONUVq5M
         VmARrFgna9o0qccrA4LWqyDwBE8CdMgZOk+TAf6z9NtfLXVyOn4ocwVT/qU7/5cXE3AN
         bKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XNp2mtzWkyOXrH3uMDe1zxno4jUg2B4E5FPg/MLAXcM=;
        b=AhzqzN0SRS9ujnAYacRURjUF22zEq0O3mGHa98eYFOm7NCJvlTDBXhxt0N4cAec9Yk
         sGMztwnYpOYBVtG9O6hETVPgSkkEuJCPjQbU3rE3qAbBgVAOqW7/VduiAiQzil1abxj6
         rd7/tkxVU2rTiykW/F4wvHTV0X7VjTkeuETrZld3EZuPzLgxYmc7k2fGLGHW7bu2vIqk
         xfNUkXUNPhKMNAjKSi6IetKJCQFygfbDtOU9wil+v/yYv9Nuosbc3+OcVozFmea17rVf
         R9uAvWIp5NcklOqKC2Sy05E7bkOnM5lBJIMcQe2kizcZJq7fXZBC3sH5htDhuVigj4Pr
         +RFg==
X-Gm-Message-State: AOAM532HtHNcTDv1DeSfBbP8gOV4l/5g5C3tZhZq12LEgt0AJ7c8Cm3N
        n7F8lHR2mNXoE7/+E56mDdo=
X-Google-Smtp-Source: ABdhPJzEhKi3066t5hrZzbF5B5pcNZrvyrz/2+31gySXijMDTCgvafm/3iSfg/xWcBrJyawyiCgE0Q==
X-Received: by 2002:a17:902:c142:: with SMTP id 2mr8930549plj.222.1594825804046;
        Wed, 15 Jul 2020 08:10:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w123sm2489460pfd.2.2020.07.15.08.10.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 08:10:03 -0700 (PDT)
Date:   Wed, 15 Jul 2020 08:10:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Marius Zachmann <mail@mariuszachmann.de>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <20200715151002.GA120273@roeck-us.net>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
 <20200715030740.GB164279@roeck-us.net>
 <CACtzdJ1XNjF7d4WcMCtxWkGiWHoF37aQfYNMn+9UtKHeo07X1g@mail.gmail.com>
 <20200715144737.GD201840@roeck-us.net>
 <CACtzdJ2c6H+hbbt42Y4mjF_xgbJEiPEROK-hawGxqanH_ZHpug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACtzdJ2c6H+hbbt42Y4mjF_xgbJEiPEROK-hawGxqanH_ZHpug@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 15, 2020 at 05:03:52PM +0200, jaap aarts wrote:
> On Wed, 15 Jul 2020 at 16:47, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Wed, Jul 15, 2020 at 01:18:58PM +0200, jaap aarts wrote:
> > > On Wed, 15 Jul 2020 at 05:07, Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On Tue, Jul 14, 2020 at 12:03:38PM +0200, jaap aarts wrote:
> > > > > Adds fan/pwm support for H1000i platinum.
> > > > > Custom temp/fan curves are not supported, however
> > > > > the presets found in the proprietary drivers are avaiable.
> > > > >
> > > > > Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> > > >
> > > > +Marius Zachmann for input.
> > > >
> > > > Questions:
> > > > - Does this really have to be a different driver or can it be merged into
> > > >   the corsair-cpro driver ?
> > > I cannot find this driver at the moment, the only corsair driver I can find
> > > is the HID driver. As far as I know all asetek gen 6 products use the same
> > > interface. Out of curiosity I contacted asetek to confirm, but other userland
> > > drivers have used the same code for all products of previous generations.
> > > > - What about HID vs. USB driver ?
> > > This is not really a HID. I asked in the kernel newbies mailing list and
> > > I was told HWMON is probably the right place. Most of the code is
> > > related to HWMON so this seems to be the right place to me as well.
> >
> > Question is if this identifies itself as HID device. If it does,
> > it would either have to be blacklisted in the HID core, or it would
> > have to be implemented as hid driver. The latter would be preferred,
> > since otherwise a userspace application accessing it directly would
> > no longer work. Either case, the driver can and should still reside
> > in hwmon; that was not the question.
> Thanks for the clarification, lsusb lists bInterfaceClass as 255 or
> "Vendor Specific Class", so not as a HID.

Ok.

Thanks,
Guenter
