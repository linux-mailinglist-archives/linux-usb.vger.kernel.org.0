Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD9B1D141F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 15:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387466AbgEMNJX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 09:09:23 -0400
Received: from smtp2.axis.com ([195.60.68.18]:31701 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728481AbgEMNJW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 09:09:22 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 May 2020 09:09:21 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1662; q=dns/txt; s=axis-central1;
  t=1589375361; x=1620911361;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-transfer-encoding;
  bh=HmiGANTaWeCxvVIMvxry7eZiiySoeq97ejFPwewSvOQ=;
  b=dgZsl1WypI92QHyBpUe3F76HZxL0ZULnOQEDktrSXykw4iR5nuPNWmHp
   hlNS4uzVEVAY0+Tvf7J2/HbKsHO9CGdH+uMf5LVxqmmHesaiPHZagWdNA
   l7+58NcuHOD8lXOXz85uJo3p6T4GVnM2NbTPTljR4pKFHbSsdfB22u2fM
   adYyd3M18lzy288Cf4VWLe9a3YXIqwTq6GJd0gnhnL6JYUyvU4/kYDL79
   w81hWyku6l468Fio26SWRR2FlQZIt+tGqvYO9lKliw3BL0iNX8OT654og
   vA7Ad6DD8PXNoKAmjXH8AZik8rhgmuKyvBIsD4ul1i2AZqbaHs3NQKLxw
   w==;
IronPort-SDR: H28L571fwiwBqZmIUHb+UKInMxA0uXG+HaVBs+hqX/lnsjq8kqQfRwMsZeS1yHspWEBbF7B2sF
 7LjZLd5yi4chd4OUi9ceabe6oTqb+DnRfW7Dt2ZX3w/p5Fh8pLfiEURcoCn9VOtJSfUW6rnPs0
 tqtdFduthvkMMD24ZurRw5rrv1zClv3k1Gv74pG9yQzL5d30cMsSnwn76x+o81ZGnj0eaYCfXf
 RO3pR8NzT6g1hzUpFumT87ibfULw5jE+NWThdQjSogXUy1MuQ4P+NEGxQRsKuvuBxbCuuUdCTO
 R8I=
X-IronPort-AV: E=Sophos;i="5.73,387,1583190000"; 
   d="scan'208";a="8445975"
Date:   Wed, 13 May 2020 15:02:06 +0200
From:   Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To:     Greg KH <greg@kroah.com>
CC:     Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: sound over USB
In-Reply-To: <20200512165359.GA702234@kroah.com>
Message-ID: <alpine.DEB.2.20.2005131459520.17840@lnxricardw1.se.axis.com>
References: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com> <20200512165359.GA702234@kroah.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue, 12 May 2020, Greg KH wrote:

> On Tue, May 12, 2020 at 10:13:10PM +0530, Subhashini Rao Beerisetty wrote:
> > ...
> >  [116677.281756] usbcore: registered new interface driver snd-usb-audio
> >
> >  The following nodes are present in the /dev/snd
> >
> > $ ls -l /dev/snd/
> >
> > total 0
> >
> > drwxr-xr-x 2 root root       60 May 12 11:32 by-id
> >
> > drwxr-xr-x 2 root root       60 May 12 11:32 by-path
> >
> > crw-rw---- 1 root audio 116,  2 May 12 11:32 controlC1
> >
> > crw-rw---- 1 root audio 116,  4 May 12 11:32 pcmC1D0c
> >
> > crw-rw---- 1 root audio 116,  3 May 12 11:32 pcmC1D0p
> >
> > crw-rw---- 1 root audio 116,  1 May 12 11:32 seq
> >
> > crw-rw---- 1 root audio 116, 33 May 12 11:32 timer
> >
> >
> >
> > What are all these devices present in /dev/snd
> >
> > How do I use it for playing and recording an audio?
> >
> > Basically first I want to gain knowledge on set of test cases I can
> > run on ALSA and then learn ALSA kernel modules stuff including
> > snd_usb_audio mdule.
> >
> > So please guide me by providing related documentation/Steps.
> 
> ALSA should "just work" with this device, no need to do anything to the
> kernel driver.  Does it not work properly for you as-is?

To clarify (if it's not too obvious): Normally these devices are never 
accessed directly by programs, instead, there is a userspace library 
called alsa-lib which provides a userspace API and then handles the 
communication with the kernel devices.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
