Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306692AD3CD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 11:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJKan (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 05:30:43 -0500
Received: from mga05.intel.com ([192.55.52.43]:60177 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgKJKan (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 05:30:43 -0500
IronPort-SDR: MtspCfiAGLdZRAnvwUCnYmx0XxlQMcqhw/BvgALJQyPNiyxviQ/+N+YVyqpyucV3rFJH2NgrfW
 gs3QsM8Laa7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="254659149"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="254659149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 02:30:43 -0800
IronPort-SDR: SwaWE1hcQhX7tQsTU0naZqvcWnLrIHhRMH5pdZsCnW7O9LCx3RMPEs6XXIcJx2HVfqn2Apqx1E
 UNiD35paRjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="428322863"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Nov 2020 02:30:41 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Nov 2020 12:30:40 +0200
Date:   Tue, 10 Nov 2020 12:30:40 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Berg <bberg@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: Fwd: Power supply detection issue caused by ucsi_psy?
Message-ID: <20201110103040.GD1224435@kuha.fi.intel.com>
References: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
 <20201109112051.GL4062920@kuha.fi.intel.com>
 <dab0302c9156a845923ee7fbefad7dd4305eedb3.camel@redhat.com>
 <CAB31r6XWQqM-kLYm4vb8H=45grhuwsHDYT94y5QJZVtP8w_sXg@mail.gmail.com>
 <CAB31r6XpFRPkMcrU+os6VbkdNiQty+s8a_MWhZXY=cjK3yXvmw@mail.gmail.com>
 <20201110083132.GB1224435@kuha.fi.intel.com>
 <CAB31r6Wq5c7n=Ywdq1KAgRZFemH6Wx2b-9tq46k=ipZrqarmdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB31r6Wq5c7n=Ywdq1KAgRZFemH6Wx2b-9tq46k=ipZrqarmdA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 10, 2020 at 08:22:31PM +1000, Vladimir Yerilov wrote:
> It worked! You're a wizard sir, thank you!
> :D

Excellent!

+Greg, Benjamin and the list.

> вт, 10 нояб. 2020 г. в 18:31, Heikki Krogerus <heikki.krogerus@linux.intel.com>:
> >
> > Hi Vladimir,
> >
> > On Tue, Nov 10, 2020 at 03:02:40AM +1000, Vladimir Yerilov wrote:
> > > Forwarding to y'all.
> > >
> > > Just some extra info:
> > > `cat /sys/class/power_supply/ucsi-source-psy-USBC000:001/online` shows
> > > zero when the cable is unplugged, same for
> > > `/sys/class/power_supply/ADP0/online` status, but that means nothing
> > > for upower and all system services considering that there a power
> > > source available and not setting display brightness and other
> > > parameters due to that.
> > > Checked in Ubuntu as well, same situation with their kernel 5.8.
> >
> > Please try to avoid top-posting.
> >
> > It seems that the ucsi psy does not report any changes. That is one
> > obvious bug that I can see.
> >
> > I'm attaching a patch to fix that. Can you give it a try?

thanks,

-- 
heikki
