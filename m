Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B771B26C027
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgIPJHx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgIPJHu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 05:07:50 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA76AC061788
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 02:07:49 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id m8so1553159vka.6
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q4r8z2DNA77eUQHVzRjFbJ3LOcRgftrC1p6vw+sY5MM=;
        b=r2wZSVgTpTIjCX7J6zkfe/XQqJ4ATsO9zHrhdghilbnGuPqtVPTSU09a05oCW18win
         02BfUg39TeZiW2Ykgwb8ndzrj4LXNYQ3bFXZS1QL5lWZz1AmZbkmmR+A7/z/jVvb4jWs
         hlJzHriHTlmOcOqHZUlGzH25IDx5pC1rD3xUjXS7b9RtzDp/eCu8eVQdZISOrEiUxpIr
         MHS5ESdq7mfISouayzeGKv5nK1MmgB2+1TomF4huWg1x28NOC0cPKesE6GAMnWtIXhsi
         FCQU4N3k80cxgQyqiNRJqq/HNj6CLLLId2iRlkcrrgHb43aCXHV8wg2nI8fPYk+2Bb+H
         gClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q4r8z2DNA77eUQHVzRjFbJ3LOcRgftrC1p6vw+sY5MM=;
        b=oPmMM1o3gbCvCT7MHqhgk3tX0qXRtnsn6UR0d9dBsJU7Xt03Vu+ZgjAJ9vwi5rVR36
         8447HlTH4BH7bqA1IUcldpv/5eUNJ4/VaCVSNh3trfm55fmYY9UfopRCWprmzQdi4Ha7
         gYYYDBAB9VNTQhK7epFzM01GH8CYX9UFvXFqZ54rpH6BnrRzG/WQx6QVEohgr73vR9YK
         JR1fTA8KTV0pr6+UAhUWmNEewTxvm0AVoq7ESqzC48J1LlB3zqu01tQbnp2VrSqGHGpq
         njvJ/koL7QTIokknuamFW0tBDjmXvFxGvLxk39/4onGLOCSRZo13PGEcPhF5Aph+Z6HA
         UabQ==
X-Gm-Message-State: AOAM531jB37HHcuIPlVyM6BfIQLBvXDfBWvX+mkD8mv1PFurjmCEgZB5
        cmubjJS0SbGIPe6g6BV6T56C5T0XKzvkhvbmr8QXgA==
X-Google-Smtp-Source: ABdhPJwjWjm88THEJ435D/nSKR/NOhOOQiMM6Hv9fTFq2uko6M82KzY0gFNft4toQotzVi4SpIjH2HM48Slu4Sn5woQ=
X-Received: by 2002:a1f:a7c8:: with SMTP id q191mr4053035vke.18.1600247267933;
 Wed, 16 Sep 2020 02:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com> <20200901025927.3596190-6-badhri@google.com>
 <20200915122225.GF1139641@kuha.fi.intel.com>
In-Reply-To: <20200915122225.GF1139641@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed, 16 Sep 2020 02:07:11 -0700
Message-ID: <CAPTae5J3UbR0C8DCi2pT7SDtTRkOe4nVEoviTgrbpTDu1FrOhw@mail.gmail.com>
Subject: Re: [PATCH v6 05/14] usb: typec: tcpci: Add set_vbus tcpci callback
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 5:22 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 31, 2020 at 07:59:18PM -0700, Badhri Jagan Sridharan wrote:
> > set_vbus callback allows TCPC which are TCPCI based, however,
> > does not support turning on sink and source mode through
> > Command.SinkVbus and Command.SourceVbusDefaultVoltage.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> > Changes since v1:
> > - Changing patch version to v6 to fix version number confusion.
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 7 +++++++
> >  drivers/usb/typec/tcpm/tcpci.h | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index b960fe5a0f28..d6a6fac82d48 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -328,6 +328,13 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
> >       struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> >       int ret;
> >
> > +     if (tcpci->data->set_vbus) {
> > +             ret = tcpci->data->set_vbus(tcpci, tcpci->data, source, sink);
> > +             /* Bypass when ret > 0 */
> > +             if (ret != 0)
> > +                     return ret < 0 ? ret : 0;
>
> Can it return positive value? What does positive value mean?

When a positive value is returned, tcpci->data->set_vbus is indicating
the tcpci.c code to bypass
other commands here. i.e. tcpci->data->set_vbus completely handles
sinking/sourcing vbus and
does not want tcpc.c to execute any other TCPC_CMD_* command.
Open to suggestions if you are not happy with this. All I want is to
make tcpci code pass on the call
from TCPM to chip level TCPC driver (i.e.  tcpci_maxim.c in this case)
and not do anything else.

>
> > +     }
> > +
> >       /* Disable both source and sink first before enabling anything */
> >
> >       if (!source) {
> > diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> > index 04c49a0b0368..4d441bdf24d5 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.h
> > +++ b/drivers/usb/typec/tcpm/tcpci.h
> > @@ -144,6 +144,7 @@ struct tcpci_data {
> >                        bool enable);
> >       int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
> >                                 enum typec_cc_status cc);
> > +     int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
> >  };
> >
> >  struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
> > --
> > 2.28.0.402.g5ffc5be6b7-goog
>
> --
> heikki
