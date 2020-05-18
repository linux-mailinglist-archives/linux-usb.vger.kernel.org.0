Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137121D79FB
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 15:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgERNff (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 09:35:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:64625 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726775AbgERNff (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 09:35:35 -0400
IronPort-SDR: BgxX+mo4GwtS0LRt7jon4Dkdii9FcyFcUJVDNGr/Ix5r8beM0gFKJSsQW6ZqDTwZcK8Lqwja6e
 ng1WJBy3ILKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 06:35:34 -0700
IronPort-SDR: b+0BUGM31BW8JI4QsMPM5wO6d+1unXO1fRR8+5S0gjFWPJdYpJNl7gRJ1KWd2kE7x5B29JXV+2
 vfc6OBwF7p+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="373390387"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 18 May 2020 06:35:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 May 2020 16:35:30 +0300
Date:   Mon, 18 May 2020 16:35:30 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     jakub@bilan.me
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: your mail
Message-ID: <20200518133530.GB1298122@kuha.fi.intel.com>
References: <526351589195104@mail.yandex.com>
 <20200511113506.GB2062175@kuha.fi.intel.com>
 <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
 <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
 <CAHp75VdUeBt++mJCvWkHm82XQ+ze1U6OpQ9fv8Hb2d1Nfsz3pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdUeBt++mJCvWkHm82XQ+ze1U6OpQ9fv8Hb2d1Nfsz3pw@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jakub,

On Mon, May 11, 2020 at 04:40:05PM +0300, Andy Shevchenko wrote:
> On Mon, May 11, 2020 at 3:29 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 5/11/20 1:44 PM, Andy Shevchenko wrote:
> 
> ...
> 
> > > I would rather disable them and issue a firmware bug.
> > > Vendors, including us, should do something sane about this.
> >
> > I have to partially disagree here. I agree that for future hardware
> > versions the firmware team of those devices should offer a saner
> > interface. But for the current hardware gen I guess we are stuck
> > with this and having a DMI table for popular models (well any model
> > a Linux user is willing to submit a quirk for) is better then simply
> > not having things working under Linux.
> >
> > I do wonder what Windows does here though. Perhaps the INT3513 device
> > has some ACPI methods to query for more info, like how many Type-C
> > controllers there actually are?
> 
> I think they do silly things there in usual obscure MS way, i.e.
> hardcoding everything in the driver per platform.
> That's why I'm really disappointed how things are going on.

I've been trying to figure out which exact NUC10i3 your NUC is? I
can't find a NUC10i3 that uses Comet Lake -S?

If your NUC isn't actually "-S" variant, then the ACPI device entry
with HID INT3515 should return 0 from its _STA method.

But can you please share the full name of your board (like NUC10i3FNH
or something like that - should read on the bottom of the device).
Also, dmesg output would be useful.

thanks,

-- 
heikki
