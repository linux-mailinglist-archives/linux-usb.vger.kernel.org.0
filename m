Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7238346B2B3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 07:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236422AbhLGGEq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 7 Dec 2021 01:04:46 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:43372 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhLGGEq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 01:04:46 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Dec 2021 01:04:46 EST
IronPort-SDR: Qx9nxJzVQ1uM4kgkfp/fJtujYTDSPzu2TkzpXwaKKrwTDELuW48NzKmEWKull8FvKCTVEVDAxD
 c1D3K1qJjkbRKX6Lwp/94C/XVTj6YOl/9O4o+pwAZ3ifrGgJ1I4j6OtbzNrac0R77BKu7vqqr0
 j/mplzao5VMg1IxwWAPMWlUUA0RyHLzwJXqIBTdjbDnBGVHSHmUqDzcEVguU/X+GPYwhdVQv0c
 8qhN3kHTt090xaceX7jRCS+z2v7bYnlndnQ1oxXWMfsrSCCqZ7dgPNs+ZcwGdWVTUgJCf9944G
 rNLfEOhwQBqWicbFNQqHDp8K
X-IronPort-AV: E=Sophos;i="5.87,293,1631606400"; 
   d="scan'208";a="69361193"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 06 Dec 2021 21:54:10 -0800
IronPort-SDR: ajFAqxV1lMnHHp2pvHDBoiDdNHjFjj+e9tQyXCA9kkFeNlCLTTEzmj6VSk69KSqkApiYp0hPRf
 pBnorFtuc/M7sqBCT9/CL604bUOP8gjH9ZyJe4mBr4XYxEFlzhJDR27uo8Xx6O8YrnaNOIbs2f
 44aGldLE8y3kn3Vab8Oegd5x13iy1Yfv/cDP8hfCXVoY0+M67y3cJTKrlub4BoWA9iJkQrnKIw
 siZcMlu05zeXp7VN93ME2UWVIDSi1pN2DKO8Z/uekvTilw8LBg8+sayYfpyBAJFAbUsEd/FrD8
 66M=
From:   "Chugh, Sanjeev" <Sanjeev_Chugh@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Thread-Topic: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Thread-Index: AQHX5k6IjsbHRxGuxkKr8PpAjenqEKwgvGyAgAXPsAA=
Date:   Tue, 7 Dec 2021 05:54:06 +0000
Message-ID: <361b7459f1d64f5e8b7bccaa2dd536e5@svr-ies-mbx-01.mgc.mentorg.com>
References: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
 <YaoS3RoqkGkf6NFa@kroah.com>
In-Reply-To: <YaoS3RoqkGkf6NFa@kroah.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg,

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Friday, December 3, 2021 6:22 PM
> To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
> release
> 
> On Wed, Dec 01, 2021 at 06:28:08AM +0530, Sanjeev Chugh wrote:
> > Rogue usb sticks can cause endless port connect change events due to
> > unstable electric connection between usb chip and the port. Port
> > connect change will cause device enumeration for the new device
> > connection and new device processing is done with the usb hub mutex
> > acquired. This can cause very short time gap between unlock/lock of
> > hub device mutex. So if some thread is running at low priority than
> > hub_thread, it can face hub device mutex starvation.
> >
> > This commit introduces a sleep of 25ms after the hub device mutex is
> > unlocked in hub_events so that if hub_thread is stuck in a endless
> > loop, all other threads will get fair amount of chance to acquire the
> > usb hub mutex.
> >
> > Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
> > ---
> >  drivers/usb/core/hub.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c index
> > 00070a8..0be2acc 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -5763,6 +5763,17 @@ static void hub_event(struct work_struct *work)
> >  out_hdev_lock:
> >  	usb_unlock_device(hdev);
> >
> > +	/*
> > +	 * Rogue usb sticks can cause endless device connection
> > +	 * events due to unstable electric connection.
> 
> What is a "usb stick"?  Any usb device could cause this, right?

In my test case, I have used a usb pen drive of Sandisk Make of 32 GB capacity. But yes, any faulty usb device or even faulty usb cable used for the usb device connection can cause this issue.
> 
> > This
> > +	 * can cause very short time gap between unlock/lock
> > +	 * of hub device mutex thus causing mutex starvation
> > +	 * for some other lower priority thread. Thus sleep
> > +	 * would give fair chance to all other threads to
> > +	 * acquire the usb hub mutex.
> > +	 */
> > +	msleep(25);
> 
> What normal code path did you just slow down here?  Why not slow down the
> disconnect path instead of the connect path?
> 
In case of faulty usb device, USB device enumeration doesn't succeed at all and comes out of hub_port_init() from a failure path. There is no device disconnection path in this flow. Therefore, this delay is added after hub_port_connect_change() is done trying to handle the port connect change event.

> thanks,
> 
> greg k-h

Thanks !

-Sanjeev
