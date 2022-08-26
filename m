Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7B15A2DDD
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 19:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344731AbiHZRyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 13:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiHZRx7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 13:53:59 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87705E3409
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 10:53:57 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u22so2173185plq.12
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nX2JPWLNg8g07Eyvyni01XDSMQINqt5idsQvYLq9GJ0=;
        b=ahjIoQeQu/sysU09X1ff7niVG4OScMPuNSzFZh0IiclcHYyI7E3JjF/W1tlVIR+8nJ
         HmfvDW7wEuWNa+P5JztAoYGwySYpRIVtTJOF+HZwT4xy2qob2QZJuwh6+xViD68YfJXZ
         9HnYZQU5Els65L9STHqqR0mf78MX/E0EYlCTe1NYnLOfGo8HsbUz6K6z27hdGSbrgWFe
         CsFen9bUmStXqtoEsa6cNj2bGPjGb33GEgoxIoK44VAZkFnyFRpQnE0iqCsJ/BDTjv8p
         HxZBzHeZzNuVcERlchvOFcJDGW+3D+FqBONjJk8TBnRkSDi+162ug3duuqM1cL2+GR40
         Rr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nX2JPWLNg8g07Eyvyni01XDSMQINqt5idsQvYLq9GJ0=;
        b=kT5gdJrFpM4Ds7PYbEbblMli31HEn55JfHqDq5ooMVzCREwEaStR4BxkoLFAuoPzb2
         DBSOFjj18IKfMir6k4olT0xggo55niJhI5Y6mwxnbPFJb/bLpnhzmcq2o54t9LEo7tKt
         EXOcmLTFH8mneZ5tNHRgwgWtzNDoW7NW4shrHApSZE+iW5vh6DwClvN0c5egymUsxdBf
         kKMRzNm/I1mRnN2elN/37ji3xAd8CVsEG8VUp0BmjEM+zKq3fsRpmunYl8Yslx5ECbi+
         7pQM0XS5/+sUS8eRLd3jYFrAXzDqYBG2iwevABPEjfaOtlWexSnqK+xY2CRY2DNR/O+U
         Zr7Q==
X-Gm-Message-State: ACgBeo33nnIDp5EG8buEK4bV26hNKywCXhNmVq32zIAMBXmanv/8Uq9H
        EkSOgh3Asqma8xg8QlyOztFKqx3gUQBZPCZgxEekSg==
X-Google-Smtp-Source: AA6agR4V4wO68Vr4t7nHvZuJKsgtZM2QayId7p9w6JmZ1+ylWdh0kafoLQC/TO/R+0UoXmvaLa+RFsWnadxbtYAStYg=
X-Received: by 2002:a17:90b:2682:b0:1fb:119d:5acf with SMTP id
 pl2-20020a17090b268200b001fb119d5acfmr5557120pjb.237.1661536436826; Fri, 26
 Aug 2022 10:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220826075839.292615-1-raychi@google.com> <Ywje7UCqXridmRpw@rowland.harvard.edu>
In-Reply-To: <Ywje7UCqXridmRpw@rowland.harvard.edu>
From:   Ray Chi <raychi@google.com>
Date:   Sat, 27 Aug 2022 01:53:45 +0800
Message-ID: <CAPBYUsBBGTdLcBoRRup14hZDQYNbpRqu8Az7ZCVxP7WmctySBg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: stop USB enumeration if too many retries
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Albert Wang <albertccwang@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 26, 2022 at 10:55 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, Aug 26, 2022 at 03:58:39PM +0800, Ray Chi wrote:
> > If a broken accessory connected to a USB host, usbcore might
> > keep doing enumeration retries and it will take a long time to
> > cause system unstable.
> >
> > This patch provides a quirk to specific USB ports of the hub to
> > stop USB enumeration if needed.
>
> Why only to specific ports?

The specific port means it is connected to a broken accessory.

>
> > Signed-off-by: Ray Chi <raychi@google.com>
> > ---
> >  drivers/usb/core/hub.c | 33 +++++++++++++++++++++++++++++++++
> >  include/linux/usb.h    |  3 +++
> >  2 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 2633acde7ac1..0f4097440ffb 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -3081,6 +3081,28 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
> >       return status;
> >  }
> >
> > +/* Stop enumerate if the port met errors and quirk is set */
> > +static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
> > +{
> > +     struct usb_port *port_dev = hub->ports[port1 - 1];
> > +     struct usb_device *hdev = hub->hdev;
> > +
> > +     if (retries < (PORT_INIT_TRIES - 1) / 2)
> > +             return false;
> > +
> > +     /*
> > +      * Some USB hosts can't take a long time to keep doing enumeration
> > +      * retry. After doing half of the retries, we would turn off the port
> > +      * power to stop enumeration if the quirk is set.
> > +      */
> > +     if (port_dev->quirks & USB_PORT_QUIRK_STOP_ENUM) {
> > +             usb_hub_set_port_power(hdev, hub, port1, false);
>
> Why turn the port power off?  Aren't there better ways to stop the
> enumeration attempts?  When will the power ever get turned back on?
>

Because the broken accessory is still connected to the port. Even if we stop
the enumeration attempts, the port change event will issue a new port
initialization.

The implementation is used for dual-role devices, the port power could
be turned on
when the host mode restarts again.

> Why not use the initial_descriptor_timeout module parameter for this
> purpose?  That's the sort of thing it was meant for.
>

As I mentioned above, the usbcore driver will keep doing enumeration attempts if
the broken accessory is still connected. It never stops. This is why I
want to turn
off the port to stop enumeration.

> Alan Stern

Thanks,
Ray
