Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D99AFBC3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 13:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfIKLtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 07:49:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46039 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbfIKLtG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Sep 2019 07:49:06 -0400
Received: by mail-io1-f67.google.com with SMTP id f12so44975647iog.12
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2019 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pt9n59Xh89lcvDG7F3KB+ad2c5bCRWrFgBU89mDdIF0=;
        b=s3IP81L3ko+a35IbBsxOpDaYKcaLR+XsiyXdS+gACPhd3Zg9tpfEB5s0WqsNCkb/ld
         jzTUe0fr1/fKFvBulJ05ljCkKy7aFniUsx/6UVED3kqEIStfMaB42lhaQZ6EzbV5QXY4
         noCXTdBBYecwqpAwxOla7XRqIqdkiIkbdI/FZx1MdWF6MlBDq+sIMJjoKAK497BZfbez
         lzT/1oSxZ598DrjH0jMYFrrYBNm63v6Mcuam5ZhavAkwpykZp+yxR3QJPKxFGYHrVHBt
         7mJJp2Xc2WiAbX6JH4hmNJXZgnvgemVDhBPkYw7uHXbKMiIOu/deHKuCywSvZJdYqLHk
         YIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pt9n59Xh89lcvDG7F3KB+ad2c5bCRWrFgBU89mDdIF0=;
        b=bCye937IOXrcqmHG/WWNkxmai1X50D+gTOVKmbWHSo0GuE6UMbypmNdU2TVMTp0O5X
         bO/WXsXRgN6cCd+OiW9/2JxQ+EVQDLHt0pPDz8L79lRmGqv6KjoFKL8SrnVJGU6K8Jq4
         lkmF11dobD36Vq/Nn1vtway1pkl1xczI4CpPjaA37Cer8UnHjqYdSn6252nHkrmMSOvL
         20wLiRB8Mi3La8uwprVvQsWXLlJsFGCUFVN4s4R1bSja8fi5ahlpT7NvWAtkhSOhp34Z
         T5GSPfCV1e6ScR/0z2CGFDViQF5av0EdeW6fpC+yXCIivrzkd/ODbnMqUfFXX6XsYaos
         5A9g==
X-Gm-Message-State: APjAAAXO+zShYE4tMUqBaRpo4vDlXUxq9KCJsGgI0VGeVkjLPOpXd5UD
        UjXi0r/k13dyo1FTPicd0COUFE6bb/tmz/uGeiPA5BBMLeE=
X-Google-Smtp-Source: APXvYqxlBQa/pWCmQtM8lPVAXpB2e9g5uT8Bm+hPW3kKFvwwJtOaLE+5YYKw8CrWQllIEI6Nk4MBeu28X+R8MWb0zlk=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr6876408iof.58.1568202545749;
 Wed, 11 Sep 2019 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-4-mathieu.poirier@linaro.org> <20190910143459.GC3362@kroah.com>
In-Reply-To: <20190910143459.GC3362@kroah.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 11 Sep 2019 05:48:55 -0600
Message-ID: <CANLsYkzE+Qnb4v-WQMy1OYQOdwjXhjPAdD7gWnChmVTQNcxs+A@mail.gmail.com>
Subject: Re: [BACKPORT 4.14.y 03/18] drm/omap: panel-dsi-cm: fix driver
To:     Greg KH <greg@kroah.com>
Cc:     "# 4 . 7" <stable@vger.kernel.org>, linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 10 Sep 2019 at 08:35, Greg KH <greg@kroah.com> wrote:
>
> On Thu, Sep 05, 2019 at 10:17:44AM -0600, Mathieu Poirier wrote:
> > From: Tony Lindgren <tony@atomide.com>
> >
> > commit e128310ddd379b0fdd21dc41d176c3b3505a0832 upstream
> >
> > This adds support for get_timings() and check_timings()
> > to get the driver working and properly initializes the
> > timing information from DT.
> >
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 56 +++++++++++++++++--
> >  1 file changed, 51 insertions(+), 5 deletions(-)
>
> THis looks like a "new feature", right?  Why is this a stable patch?

I thought it was part of 4.19.y but looking at it again I see that it
is there as part of the mainline base rather than a backport.

Please drop.

Thanks,
Mathieu

>
> thanks,
>
> greg k-h
