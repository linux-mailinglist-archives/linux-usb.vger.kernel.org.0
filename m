Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE7E30BA10
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 09:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbhBBIiE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 03:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhBBIh6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 03:37:58 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C246C061756
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 00:37:17 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id l14so9531639qvp.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 00:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DW6qKjgDaZfg9tmH9Lbh2Y15xJjTza3J0FSZQyXe7e8=;
        b=TqAUGL6T55G7V7o1ORKbs2CEC5wdY4D9EZvFInzXpo/wwv3c6nrrELMmnPm0RLynnn
         tgIgB+DfgoH7mli2DcK4HPsKKrlUK2GMpplKwR3a0Espw6sevr+2kbjDgvJUYcUj8tZj
         Rzynk74eJvVIJkipx2kKDjcj7CeEAsHd/Z21XyhqXb1GIS0ekg3QH+gg2upVpd0OWqJS
         nepT2AIKgJKezKQNE5vgF+L7samPiae5iwI5E9m497LrmokRG/I8kYLmlSG7Vho3QWXc
         NdkE/IuB0llrINfMXUKAs/Yy0L6kqp8uJHs2SAFf/eY4CVZb5RMXYGoWydXeBXcrt/ep
         MUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DW6qKjgDaZfg9tmH9Lbh2Y15xJjTza3J0FSZQyXe7e8=;
        b=jf10z52I0P7e64y+D4UxudhUDHwIoE61Bt3VEVbuiCbRFc5XaqFxwv7QBa+h5LN1MO
         gI/eB7JZVUGjmkJMlPMONoNsySsJFMfKosO95eTLX1gzxPlTNmFpLv9rbU454535zICU
         /uC4g/w7lT0jsYaqt/AQsoOakDeLnfW45Ln48RnYeNwiXByyZyIhM3a6wsxJ48M6ey3O
         7OJsATAIHSz6RDf4dwHuQCrkeYwphg/3byN09lQ3cBgbopnphM9chnWVTyTQR5Bt1s6l
         yqRzfKTGJing+dF1PhLOCGutTtI0nnlLPsCCnKXCAWfLK22NrtWKMEtxG/jKpGwOzvlp
         oIEg==
X-Gm-Message-State: AOAM5326RrvpPH3fWiUmhKTSNXpts4W2x4bq57/+YRRYGSWWPyJzpeMI
        6txbOLelOoYbMUdkLzpJ6WPJ346i8ZFlL+3bAgHeSA==
X-Google-Smtp-Source: ABdhPJwUb8I/lvLDswXeoeVEnGbBA93DzVcPkMUHyw6Q+mT793xolcnIgTOrdmfsFpDsX8LgZL7vNHpLVmUoy41t7Mg=
X-Received: by 2002:a0c:b990:: with SMTP id v16mr18963995qvf.16.1612255036209;
 Tue, 02 Feb 2021 00:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20210201133421.408508-1-kyletso@google.com> <20210201133421.408508-2-kyletso@google.com>
 <20210201153542.GH2465@kuha.fi.intel.com>
In-Reply-To: <20210201153542.GH2465@kuha.fi.intel.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Tue, 2 Feb 2021 16:37:00 +0800
Message-ID: <CAGZ6i=0Csdfy0Z-608HsX1YLBPiAz7qindF5SdTXv0yoNu7DYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb: typec: Determine common SVDM Versions
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 1, 2021 at 11:35 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Feb 01, 2021 at 09:34:19PM +0800, Kyle Tso wrote:
> > PD Spec Revision 3.0 Version 2.0 + ECNs 2020-12-10
> >   6.4.4.2.3 Structured VDM Version
> >   "The Structured VDM Version field of the Discover Identity Command
> >   sent and received during VDM discovery Shall be used to determine the
> >   lowest common Structured VDM Version supported by the Port Partners or
> >   Cable Plug and Shall continue to operate using this Specification
> >   Revision until they are Detached."
> >
> > Also clear the fields newly defined in SVDM version 2.0 for
> > compatibilities. And fix some VDO definitions changed in the Spec.
> >
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> > ---
> > Changes since v2:
> > - rename the variable and the functions (remove the text "common")
> > - remove the macro
> >
> >  drivers/usb/typec/altmodes/displayport.c |   8 +-
> >  drivers/usb/typec/class.c                |  21 +-
> >  drivers/usb/typec/tcpm/tcpm.c            |  47 +++-
> >  drivers/usb/typec/ucsi/displayport.c     |  12 +-
> >  drivers/usb/typec/ucsi/ucsi.c            |   2 +
> >  include/linux/usb/pd_vdo.h               | 315 +++++++++++++++++------
> >  include/linux/usb/typec.h                |  10 +
> >  7 files changed, 326 insertions(+), 89 deletions(-)
>
> I think there is some room to split this one at least a little. The
> changes to the class (so drivers/usb/typec/class.c and
> include/linux/usb/typec.h) could be introduced separately at least.
>
> So I see there are two changes in this patch. You are modifying the
> class, and then there are the updated PD definitions. Both should be
> introduced in separate patches IMO. I think also each driver (so
> ucsi.c and tcpm.c) can handle the changes to the class in its own
> patch. The modifications to the PD definitions and updated VDO() and
> so on can be handled in a single patch I guess.
>
I will separate this patch to different ones.

thanks,
Kyle

>
> thanks,
>
> --
> heikki
