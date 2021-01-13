Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334BD2F4DE5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 15:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbhAMOxZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 09:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727648AbhAMOwI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 09:52:08 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3979AC06134D
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 06:50:49 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 186so1817147qkj.3
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 06:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+m95i6hLyIdh7BIpWVUijpi7aowpeDuSUEcNUhIUflw=;
        b=PMGyBtAHyyDHUjfhdPgvopoExP/J3PoqrqaM88SKXXr7XFW0Qn/1R9K9aFqLo76mhY
         IMz92xsd+GFA+UC8inMJvluF1vs5pmHzOLAcPGhswXKnRjYt5KHLONhlIshK6NBC756N
         oQY9WPA9ONgWH9SN3girCOAy8r4wJkZF1GVzpVDChAFusACBTd0LPUHG0jjDDhSjL6R9
         iGZFL5sJVXxnTSSMhV2xdkRar4NsjvAGdoTGqP7NVKdY9WjWLmqJxAr300iNVirYKuDf
         wMD7O2UCSmXyjmyCdrXBX9rTWO+S42Cy/XxQbN9I6D4A35pJh9tBA5HAQPSJeIIiBiRX
         5XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+m95i6hLyIdh7BIpWVUijpi7aowpeDuSUEcNUhIUflw=;
        b=jqDWd+UoiNgAzj8wKORwN17p0rqmWL9HnKO+O8YmHlQpex1yphibbTzth3jFmn8l7F
         J9qoo98vYIm302d1Sa3my1KOSLBNIkQ44JleDxzj+DorIENzIfRfBfI9JxIvw2eBcGEB
         eWcdREZfM1YVSpyO4xBF/OZFaTNFWnsDkJ9kFTNLKhwYQbdQN0/a3i7ayMwpXG/70x/I
         fiVejsfy9jMiONiowcB36fzneioGuoa8BjRl39Fhm+yhDm8hZafuvEyaRVs1Auzk1xS9
         74/ds6MfYS+vmdVFxEQ9t7o8uyc3X52SDTLxFnX0Xs7yRUm23Jg6/nvztk5+nXJY1eHr
         a6aA==
X-Gm-Message-State: AOAM530+SUF1WP3x5sbFRMV2v9Pdoh6RN2c8Bcb0qbG7ahFuL1RP5Ic7
        ss1JyXBN4dZilY4yrpNqhc2hCx88ZwM4+h3l5+Apgg==
X-Google-Smtp-Source: ABdhPJw0aDL0SlptH/xSZW1JeFrZkaqZa0ExXeLrBSAiEzPluUHEpYdmVycmPRo4/GkV6qtosMfv87tf3navpNWAK/0=
X-Received: by 2002:a37:a747:: with SMTP id q68mr2426420qke.352.1610549448103;
 Wed, 13 Jan 2021 06:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20210105163927.1376770-1-kyletso@google.com> <20210105163927.1376770-3-kyletso@google.com>
 <20210112135636.GD2020859@kuha.fi.intel.com>
In-Reply-To: <20210112135636.GD2020859@kuha.fi.intel.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Wed, 13 Jan 2021 22:50:32 +0800
Message-ID: <CAGZ6i=3PN3trcwqbNL41KPf4CRRRzDtBSaqytTEE-mKKZHW-Lw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: typec: tcpm: Protocol Error handling
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 12, 2021 at 9:56 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Jan 06, 2021 at 12:39:26AM +0800, Kyle Tso wrote:
> > PD3.0 Spec 6.8.1 describes how to handle Protocol Error. There are
> > general rules defined in Table 6-61 which regulate incoming Message
> > handling. If the incoming Message is unexpected, unsupported, or
> > unrecognized, Protocol Error occurs. Follow the rules to handle these
> > situations. Also consider PD2.0 connection (PD2.0 Spec Table 6-36) for
> > backward compatibilities.
> >
> > To know the types of AMS in all the recipient's states, identify those
> > AMS who are initiated by the port partner but not yet recorded in the
> > current code.
> >
> > Besides, introduce a new state CHUNK_NOT_SUPP to delay the NOT_SUPPORTED
> > message after receiving a chunked message.
>
> Looks good to me. I put a few style related nitpicks below, but
> nothing major.
>

> >
> > +             if (port->pwr_role == TYPEC_SOURCE) {
> > +                     if (port->ams == GET_SOURCE_CAPABILITIES)
> > +                             tcpm_pd_handle_state(port, SRC_READY, NONE_AMS,
> > +                                                  0);
> > +                     /* Unexpected Source Capabilities */
> > +                     else
> > +                             tcpm_pd_handle_msg(port,
> > +                                        port->negotiated_rev < PD_REV30 ?
> > +                                        PD_MSG_CTRL_REJECT :
> > +                                        PD_MSG_CTRL_NOT_SUPP,
> > +                                        NONE_AMS);
>
> You can align that properly:
>
>                                 tcpm_pd_handle_msg(port,
>                                                    port->negotiated_rev < PD_REV30 ?
>                                                    PD_MSG_CTRL_REJECT :
>                                                    PD_MSG_CTRL_NOT_SUPP,
>                                                    NONE_AMS);
>
Yes it looks better. will fix it.


> >               case PD_MSG_DATA_SINK_CAP:
> > -                     tcpm_pd_send_sink_caps(port);
> > +                     ret = tcpm_pd_send_sink_caps(port);
> > +                     if (ret < 0) {
> > +                             tcpm_log(port,
> > +                                      "Unable to send snk caps, ret=%d",
> > +                                      ret);
>
> One line is enough:
>
>                                 tcpm_log(port, "Unable to send snk caps, ret=%d", ret);
>
will fix it in the next version.

thanks,
Kyle
