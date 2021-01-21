Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFC52FF491
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 20:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbhAUSwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 13:52:04 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:57315 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbhAUIlb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 03:41:31 -0500
Date:   Thu, 21 Jan 2021 08:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1611218438;
        bh=wHJYWN+L0FZFqOYsVnSp+JCGu0MbOW5LGyytW+iiiuA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ErM583F8If0z5tA5k9WpektF1OoS66+L1DvoU5vOjlstoDDht9XfYc6/6dKVhwXmI
         f6iMj8sYRdNJ9kJyiPsfrf3xiF2oC7LCDnPcI4VQphMmKnVAemZiz/M6PxIe5GRTwK
         VhmlTe4geSsF91v4hAmCTV/8KzrzIC9fdTw9P6t6cVsF0+OMy6a52ww+47I3IlX+yf
         vxdGDTcNRpUJvc6iO4e+GBQJmDcwMQgSsZMRJmgmEGgTpsN/A4jp6UCWq/Y5I1wR4p
         RC+gdnlc7MyJYX7oktIAE0R51hHuLmmUiHLKAe1iFX/RPweVzT0PmLq4KDVDsxDqdB
         QZxUol28KOAyQ==
To:     Daniel Vetter <daniel@ffwll.ch>
From:   Simon Ser <contact@emersion.fr>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, hudson@trmm.net,
        markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        peter@stuge.se
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
Message-ID: <3Z19WWZiwCROiC8aR0bsJrIP7KOEC6_tOAvAfniv5qhloBUFz2VWxGFFh-JFMw7g1id2AevBrYxSAzoZ3XAnXoUTsTLe-i1qgSBAY3bhhx4=@emersion.fr>
In-Reply-To: <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
References: <20210120170033.38468-1-noralf@tronnes.org> <20210120170033.38468-2-noralf@tronnes.org> <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com> <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de> <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday, January 21st, 2021 at 9:27 AM, Daniel Vetter <daniel@ffwll.ch>=
 wrote:

> > I would not call it USB. I could imagine that at some point a generic
> > USB protocol could serve simple displays (i.e. in the sense of USB HID
> > or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB
> > should be reserved for this case.
>
> We end up calling those DisplayPort, since that's what's being
> transported over thunderbolt or usb-C. So the usb connector would be
> called usb-C. I think the reason we don't do fancy connector names is
> that adding them is a bit a pain. Plus drm/i915 specifically has some
> very quirky connector enumerating that doesn't match much with reality
> unfortunately anyway :-/

Maybe could add "USB-C" to the list of subconnector types and use that?
