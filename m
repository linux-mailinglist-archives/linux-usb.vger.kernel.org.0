Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5FD1FC990
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 11:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgFQJKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 05:10:49 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:46646 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQJKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 05:10:48 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200617091045epoutp030da720d9b4238235ebe97b83eb33f09e~ZScL6BQtc0623606236epoutp03f
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2020 09:10:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200617091045epoutp030da720d9b4238235ebe97b83eb33f09e~ZScL6BQtc0623606236epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1592385045;
        bh=cnvdSqePKOw4GcHAMhTO0+4xYz3OUiqLllx4zrkOOEw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=EKk6/LBXPz85GTfap95n7M0QyHlv94I3nm4SAEE3aF3PAf42Kv9zomn0LthLigX/8
         0S2S/3FfJDv1c9VT17tH5TIeDlh+FWj6yXED1jX3gH3/wvla08utweIHIQkjUz31XK
         RPnypDzZyVjumsIllGZt/uWmNuShk8OzS54/Z8Zw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20200617091044epcas2p28926b9ba14991d8b996132bca8467924~ZScLjwJq12760127601epcas2p2J;
        Wed, 17 Jun 2020 09:10:44 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.189]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 49mznF6WYfzMqYm1; Wed, 17 Jun
        2020 09:10:41 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.24.27441.01ED9EE5; Wed, 17 Jun 2020 18:10:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20200617091039epcas2p12f072d6080b577855d50d8a9bed9ec45~ZScHK8XyV2672226722epcas2p1Z;
        Wed, 17 Jun 2020 09:10:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200617091039epsmtrp1e7c1f9fc0bdf0485e31ac0eb7ec69662~ZScHKTsQl0828208282epsmtrp1Q;
        Wed, 17 Jun 2020 09:10:39 +0000 (GMT)
X-AuditID: b6c32a47-fc5ff70000006b31-bc-5ee9de102169
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        26.A2.08382.F0ED9EE5; Wed, 17 Jun 2020 18:10:39 +0900 (KST)
Received: from KORDO034583 (unknown [12.36.185.87]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200617091039epsmtip1905137eb50430fb4326a949ac587036b~ZScHBydi_2230622306epsmtip1F;
        Wed, 17 Jun 2020 09:10:39 +0000 (GMT)
From:   =?ks_c_5601-1987?B?waTA58jG?= <jh0801.jung@samsung.com>
To:     "'Greg KH'" <greg@kroah.com>
Cc:     <linux-usb@vger.kernel.org>
In-Reply-To: <20200617075249.GA1547648@kroah.com>
Subject: RE: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Date:   Wed, 17 Jun 2020 18:10:39 +0900
Message-ID: <033901d64487$2bab03f0$83010bd0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKBClLTwb4/WaJRuwyIWdkboRdm6AIio10FAkn7014B4TMw2KdUe5ig
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7bCmma7AvZdxBie6RS3OLZjBaLFoWSuz
        A5PH24cBHp83yQUwReXYZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoq
        ufgE6Lpl5gBNV1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUGBoW6BUn5haX5qXr
        JefnWhkaGBiZAlUm5GR8+fODteC8QsWLn81MDYwXJLsYOTkkBEwkptxYzdLFyMUhJLCDUeL2
        rW/MEM4nRokdXxdCOd8YJfqWzmeFafk/cQkrRGIvo8SGZVvZIZwXjBJXD7QwgVSxCdhK3Fz7
        jg3EFhFQkDh/7BQ7iM0sIC8x+dxhZhCbU8BQYvb0o4wgtrCAh8S81VfANrAIqEp8ffsFLM4r
        YClxd30jE4QtKHFy5hMWiDlGEktWz2eCmbn97RxmiOsUJHacfc0IsddN4uXJJ1A1IhKzO9vA
        3pEQuMYu8e7EHKCDOIAcF4n/BxUheoUlXh3fwg5hS0m87G+DsuslTm9cB9Xbwyjx8cYuNoiE
        scSsZ+2MEHOUJY7cgrqNT6Lj8F+o8bwSHW1CENWqEgcbb7JA2NIS33rfMU5gVJqF5LNZSD6b
        heSzWUg+WMDIsopRLLWgODc9tdiowBg5ujcxgtOelvsOxhlvP+gdYmTiYDzEKMHBrCTC6/z7
        RZwQb0piZVVqUX58UWlOavEhRlNgYE9klhJNzgcm3rySeENTIzMzA0tTC1MzIwslcd5iqwtx
        QgLpiSWp2ampBalFMH1MHJxSDUyHeA+pSntNrOXiFt5s0uN37k/PxxZ7HpuTn1Y+17xexJE8
        T5Or/GJbgrxb1WmZO9vuOWp3f/xW/HU+24nwfbN1VCS2fhb98+7VxBDXYp4PKkIz/IKd723Z
        b1MRKlbfua+Ta9K0Ntbzog4+K4qb/RRF3+hmmuz3CF/MVbjpnOi35IxZHEmn5h878EdTgmnr
        qatsPJEKUiuy0zJOX++eoLuRR3J211bnP9wije1NbEXfc3f+SY71mPSoxP7K/eR/d4/+jTf2
        aWVkKK3Yz+25U11Wia+1wSZH68XDojMXN7xUF0+z/b8yc5FC9v936/dcf8GwRHDCviWL42bv
        vi7l6ic4+VbTFZGJt5aZ21oqZCuxFGckGmoxFxUnAgA65kCmBAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWy7bCSnC7/vZdxBkc2mVicWzCD0WLRslZm
        ByaPtw8DPD5vkgtgiuKySUnNySxLLdK3S+DK+PLnB2vBeYWKFz+bmRoYL0h2MXJySAiYSPyf
        uIS1i5GLQ0hgN6PEzzlz2SAS0hI7O6cyQdjCEvdbjkAVPWOUuHV/OwtIgk3AVuLm2ndgDSIC
        ChLnj51iB7GZBeQlJp87zAzR8JhR4u7Gj4wgCU4BQ4nZ04+C2cICHhLzVl9hBbFZBFQlvr79
        AhbnFbCUuLu+kQnCFpQ4OfMJC8RQE4nGw90sMAu2v53DDHGdgsSOs68ZIY5wk3h58gkTRI2I
        xOzONuYJjMKzkIyahWTULCSjZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cT
        Izj8tTR3MG5f9UHvECMTB+MhRgkOZiURXuffL+KEeFMSK6tSi/Lji0pzUosPMUpzsCiJ894o
        XBgnJJCeWJKanZpakFoEk2Xi4JRqYOIvfp41n+WQzMfJHLreItXCx6dLdlkuVuDh7FnDI/Q7
        X6KsvOxSnOOHf9tOvJot1a/0f+2F9vsxfE+z71hrPbubOcnRW8Hnz7Tlc84IqFusiuGp9uX5
        I394vlXZZP3QyAix9i/16w9PjdxcteXe4w83Vs1cfHdNZYGw7/myBYnqmiqNalNDF1pOfNWo
        u0Pl79ekrTbKebctA+t026czaXZemvzBRqfo6P3drzQKWLwUhR1XuSxet28D153ZnW/WrShl
        Cyp9q755HUv5Hs+QA1Vzblf4PQ39osoVlReeeWP5lC9FGouV/3x+1DRtsw1n94JpOq56v8W+
        STrE7Jt9+iTb6vXV33etq2dTk2S7sE+JpTgj0VCLuag4EQCyK0vU7gIAAA==
X-CMS-MailID: 20200617091039epcas2p12f072d6080b577855d50d8a9bed9ec45
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791
References: <CGME20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791@epcas2p3.samsung.com>
        <1592358930-28684-1-git-send-email-jh0801.jung@samsung.com>
        <20200617051738.GB1331778@kroah.com> <20200617075249.GA1547648@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
> owner@vger.kernel.org] On Behalf Of Greg KH
> Sent: Wednesday, June 17, 2020 4:53 PM
> To: JaeHun Jung
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
> 
> On Wed, Jun 17, 2020 at 07:17:38AM +0200, Greg KH wrote:
> > On Wed, Jun 17, 2020 at 10:55:30AM +0900, JaeHun Jung wrote:
> > > In mobile, a co-processor is used when using USB audio to improve
> > > power consumption.
> > > hooking is required for sync-up when operating the co-processor. So
> > > register call-back function.
> > > The main operation of the call-back function is as follows:
> > > - Initialize the co-processor by transmitting data
> > >   when initializing.
> > > - Change the co-processor setting value through
> > >   the interface function.
> > > - Configure sampling rate
> > > - pcm open/close
> > >
> > > Bug: 156315379
> > >
> > > Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc
> >
> > No need for Bug or Change-Id on patches submitted to us, same for the
> > odd "ANDROID:" in the subject.
> >

Ok, I will delete it.

> > > Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
> > > ---
> > >  sound/usb/card.c     | 16 ++++++++++++++++
> > >  sound/usb/card.h     |  1 +
> > >  sound/usb/clock.c    |  5 +++++
> > >  sound/usb/pcm.c      | 33 +++++++++++++++++++++++++++++++++
> > >  sound/usb/usbaudio.h | 30 ++++++++++++++++++++++++++++++
> > >  5 files changed, 85 insertions(+)
> >
> > Did you run scripts/get_maintainer.pl on this patch to determine that
> > maybe the alsa-devel list should also be needed?
> >

Yes, it was sent looking for maintainer of sound/usb.
This callbacks is for sync with Audio Core.
So, I was implement on sound/usb.

> >
> >
> > >
> > > diff --git a/sound/usb/card.c b/sound/usb/card.c index
> > > fd6fd17..2f3fa14 100644
> > > --- a/sound/usb/card.c
> > > +++ b/sound/usb/card.c
> > > @@ -111,6 +111,7 @@ MODULE_PARM_DESC(skip_validation, "Skip unit
> > > descriptor validation (default: no)  static
> > > DEFINE_MUTEX(register_mutex);  static struct snd_usb_audio
> > > *usb_chip[SNDRV_CARDS];  static struct usb_driver usb_audio_driver;
> > > +struct snd_usb_audio_vendor_ops *usb_audio_ops;
> > >
> > >  /*
> > >   * disconnect streams
> > > @@ -210,6 +211,12 @@ static int snd_usb_create_stream(struct
> snd_usb_audio *chip, int ctrlif, int int
> > >  	return 0;
> > >  }
> > >
> > > +void snd_set_vender_interface(struct snd_usb_audio_vendor_ops
> > > +*vendor_ops) {
> > > +	usb_audio_ops = vendor_ops;
> > > +}
> > > +EXPORT_SYMBOL_GPL(snd_set_vender_interface);
> >
> > You are exporting a lot of new symbols, but you have no user of these
> > symbols, which is not allowed, as you know.  Please also post your
> > user of them so we can see if you are doing things correctly or not.
> >

Yes, I know.
This is called from Audio core module.
Audio related drivers associated with this module cannot disclose because
of security.
I think this is true of other vendors as well.

> > Also, only one set of "vendor ops" does not make any sense at all,
> > this needs to be on a per-host-controller basis, right?  If so, why is
> > this all in the sound driver?
> 

Currently, this interface is only for USB audio. USB information is that is
has in the xhci host driver.
When USB audio is connected, F/W of audio core performs the control of USB
host for low power.

> Also, your api is making a lot of assumptions about the running system,
> there seems to not be any way to always "know" what bus/device the
> callbacks are being used for in many places.

This is only used in limited scenarios. And the information of USB host get
through from exynos_usb_audio driver.

> 
> Why not just add the needed functionality to the sound driver itself
> instead of trying to rely on these odd "callbacks"?

Audio core operates in F/W and is module.
Because there are many connected modules, it is cannot on built-in and
module to implement the non-callbacks

> 
> thanks,
> 
> greg k-h

