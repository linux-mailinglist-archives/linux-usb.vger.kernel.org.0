Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D2B4874A0
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 10:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346350AbiAGJZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 04:25:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33666 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbiAGJZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 04:25:01 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D7828D7;
        Fri,  7 Jan 2022 10:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641547499;
        bh=ZGQxQzksgV3YgZ8qms44B/4BUHwAKeP9hxSX2TQeq2c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mJVs8PzVS6A8KQTYSqypXjXuHBN65hJwOcN9oSYsXry6KAjlrKBQhIzkE0gr0brwQ
         lfzKxGsRvV9oq6HcPQVfWF2Tmaqdx0NwI+UbCdUaWtsFo/wjsBQZVBjYVY536mEOBz
         iQm8RhlBQJGp2g+KffXKyZEeLgjAd5v3iwp+q0W8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yddr4rE05cLSj6TE@pengutronix.de>
References: <20220105115527.3592860-1-m.grzeschik@pengutronix.de> <Yddr4rE05cLSj6TE@pengutronix.de>
Subject: Re: [PATCH v6 0/7] usb: gadget: uvc: use configfs entries for negotiation and v4l2 VIDIOCS
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca
To:     Michael Grzeschik <mgr@pengutronix.de>, linux-usb@vger.kernel.org
Date:   Fri, 07 Jan 2022 09:24:57 +0000
Message-ID: <164154749753.1224575.16682991529695492259@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Michael Grzeschik (2022-01-06 22:23:30)
> Ccing Nicolas and Kieran.
>=20
> BTW: I have some wip patches in my queue to get isoc support running on
> the dummy_hcd driver. With those patches, it is easy to test this series
> on any system (like qemu) without the need of an actual udc device.
>=20
> If interested, I could improve and send them on the list.

I would say, Yes please! Being able to test on a virtual device will
help in the long run too as automated tests can be set up.

And ideally that will then abstract away any hardware / UDC bugs (which
I have certainly come up against in the past too, when working on UVC).

Thanks

Kieran

>=20
> Thanks,
> Michael
>=20
> On Wed, Jan 05, 2022 at 12:55:20PM +0100, Michael Grzeschik wrote:
> >This series improves the uvc video gadget by parsing the configfs
> >entries. With the configfs data, the driver now is able to negotiate the
> >format with the usb host in the kernel and also exports the supported
> >frames/formats/intervals via the v4l2 VIDIOC interface.
> >
> >The uvc userspace stack is also under development. One example is an gen=
eric
> >v4l2uvcsink gstreamer elemnt, which is currently under duiscussion. [1]
> >
> >[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/=
1304
> >
> >With the libusbgx library [1] used by the gadget-tool [2] it is now also
> >possible to fully describe the configfs layout of the uvc gadget with sc=
heme
> >files.
> >
> >[2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c=
76f9d512f59fdc23b65cd5c46b7fb09eb4
> >
> >[3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
> >
> >The bigger picture of these patches is to provide a more versatile inter=
face to
> >the uvc gadget. The goal is to simply start a uvc-gadget with the follow=
ing
> >commands:
> >
> >$ gt load uvc.scheme
> >$ gst-launch v4l2src ! v4l2uvcsink
> >
> >--
> >
> >v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@=
pengutronix.de/
> >v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzesch=
ik@pengutronix.de/
> >v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzesch=
ik@pengutronix.de/
> >v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschi=
k@pengutronix.de/
> >v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzesch=
ik@pengutronix.de/
> >
> >Regards,
> >Michael
> >
> >Michael Grzeschik (7):
> >  media: v4l: move helper functions for fractions from uvc to
> >    v4l2-common
> >  media: uvcvideo: move uvc_format_desc to common header
> >  usb: gadget: uvc: prevent index variables to start from 0
> >  usb: gadget: uvc: move structs to common header
> >  usb: gadget: uvc: track frames in format entries
> >  usb: gadget: uvc: add VIDIOC function
> >  usb: gadget: uvc: add format/frame handling code
> >
> > drivers/media/usb/uvc/uvc_ctrl.c           |   1 +
> > drivers/media/usb/uvc/uvc_driver.c         | 281 +-------------
> > drivers/media/usb/uvc/uvc_v4l2.c           |  14 +-
> > drivers/media/usb/uvc/uvcvideo.h           | 144 --------
> > drivers/media/v4l2-core/v4l2-common.c      |  82 +++++
> > drivers/usb/gadget/function/f_uvc.c        | 263 +++++++++++++-
> > drivers/usb/gadget/function/uvc.h          |  38 +-
> > drivers/usb/gadget/function/uvc_configfs.c | 148 ++------
> > drivers/usb/gadget/function/uvc_configfs.h | 120 +++++-
> > drivers/usb/gadget/function/uvc_queue.c    |   3 +-
> > drivers/usb/gadget/function/uvc_v4l2.c     | 404 ++++++++++++++++++---
> > drivers/usb/gadget/function/uvc_video.c    |  71 +++-
> > include/media/v4l2-common.h                |   4 +
> > include/media/v4l2-uvc.h                   | 351 ++++++++++++++++++
> > 14 files changed, 1319 insertions(+), 605 deletions(-)
> > create mode 100644 include/media/v4l2-uvc.h
> >
> >--=20
> >2.30.2
> >
> >
> >
>=20
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
