Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8D6649005
	for <lists+linux-usb@lfdr.de>; Sat, 10 Dec 2022 18:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLJRhJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Dec 2022 12:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiLJRhH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Dec 2022 12:37:07 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3366E18E00
        for <linux-usb@vger.kernel.org>; Sat, 10 Dec 2022 09:37:06 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id gt4so6279548pjb.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Dec 2022 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqUBKqwPdJHPULoATm27gxzC28eB4+7WQFwnd7nAT2U=;
        b=srm8uicQC7djemNooluTWqVQUSA5hVycoK3IsiTkwfs38lZEeungEgqaAqsyIy53hy
         TR31xNiSFwmxhnehxhezkxa2xiLykBXAKzo7qgRp1f2xaFGVBqF2Fq8E0MqVuhbtaZRv
         utJjVf8YoPGaccqeXanU7FwtcfeJM/OAJMoB+d9Chb4Cioql8PrR37Q0yEhrws2vYL64
         4xEtlD+zLWkstLF2spu/ism0ZusHJbm5xBlfPoNImf77JjUkW9TsgD1vu4kN8pxQoGK9
         wqgWtOzhOE2BZMl8EjzS3eMcioM5fa3/2neVRlk6C+56oyT+vValesM2gaoVwXRxTBzU
         GSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqUBKqwPdJHPULoATm27gxzC28eB4+7WQFwnd7nAT2U=;
        b=Xk55j2kTtbBIZgCITOp79oamOrUO9qkfZXeD3miTk3+4XG89aLeHZ/7MsJ3X3kdf0c
         S5pO7nbz5q3ptmkspc+phdNSITxtoCYQ2lE6AzExMsoPVoneM1wHS4FWv/1XznbG7PWC
         DaS9FxelxQnpFOJmF7reFQAbDOQnhwfX+YFbYnPEUZvxM+yprer8Csp9nr49M5Czcs0y
         wGKk0bSSYsvXQf73WNfrEcyX+bm9r0ZGY9tRl39non0mu1uLySTGT0IWxDvnJkSCY0pV
         +5cuKVvjK8or4GPnn6fsImBDPOYttfZaOR00p0cQWrfN4FyS8SWuco1prZhfcTNVAIFm
         ZVmA==
X-Gm-Message-State: ANoB5plxuV1vUxb7MvyiPt5GjqeILd7rZEopum6DHlovrb16uJ6gacyo
        NjzNigeHQ1IG1WXFgo4SaTWMFLNf9u4E2lWBmNynuQ==
X-Google-Smtp-Source: AA0mqf5n/NJnZRJCq74Kvxu0KgB0hENlHdC69qo+4DFmD/1rtdeQCWgcFlu7iLQlbUK7jVJJlGF5zic3gMY9kwqnk3k=
X-Received: by 2002:a17:902:c1ca:b0:189:e149:a1b2 with SMTP id
 c10-20020a170902c1ca00b00189e149a1b2mr15422691plc.17.1670693825032; Sat, 10
 Dec 2022 09:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20221210061626.948426-1-badhri@google.com> <20221210061626.948426-2-badhri@google.com>
 <52ed8d2f-813f-b9b6-238a-b7764f488924@roeck-us.net>
In-Reply-To: <52ed8d2f-813f-b9b6-238a-b7764f488924@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Sat, 10 Dec 2022 09:36:28 -0800
Message-ID: <CAPTae5LnoMR0t9v9r=oCZ14Ma1trOwJco4TjFGNPD2AiJ1UN8Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] usb: typec: tcpci: Add callback for evaluating
 contaminant presence
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 10, 2022 at 8:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/9/22 22:16, Badhri Jagan Sridharan wrote:
> > This change adds callback to evaluate presence of contaminant in
> > the TCPCI layer.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> > Changes since v7:
> > * None. Skipped versions by mistake.
> > Changes since v6:
> > * Removed is_potential_contaminant callback
> > Changes since v5:
> > * None
> > Changes since v4:
> > * None
> > Changes since v3:
> > * None
> > Changes since v2:
> > * Added tcpci_is_potential_contaminant to offload
> > * disconnect_while_debounce logic
> > ---
> >   drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
> >   include/linux/usb/tcpci.h      | 7 +++++++
> >   2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index fe781a38dc82..c8e78c13c9c4 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -403,6 +403,14 @@ static void tcpci_frs_sourcing_vbus(struct tcpc_dev *dev)
> >               tcpci->data->frs_sourcing_vbus(tcpci, tcpci->data);
> >   }
> >
> > +static void tcpci_check_contaminant(struct tcpc_dev *dev)
> > +{
> > +     struct tcpci *tcpci = tcpc_to_tcpci(dev);
> > +
> > +     if (tcpci->data->check_contaminant)
> > +             tcpci->data->check_contaminant(tcpci, tcpci->data);
> > +}
> > +
>
> With this callback to tcpm in place, how does tcpm ever leave the
> CHECK_CONTAMINANT state if the low level driver does not support
> the callback ?

Ah ! Good point.. I will fix it by installing the callback only when
the lower level driver implements check_contaminant.
Let me know if you think it wouldn't work.

--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -785,7 +785,9 @@ struct tcpci *tcpci_register_port(struct device
*dev, struct tcpci_data *data)
        tcpci->tcpc.enable_frs = tcpci_enable_frs;
        tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
        tcpci->tcpc.set_partner_usb_comm_capable =
tcpci_set_partner_usb_comm_capable;
-       tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
+
+       if (tcpci->data->check_contaminant)
+               tcpci->tcpc.check_contaminant = tcpci_check_contaminant;

Thanks,
Badhri

>
> Thanks,
> Guenter
>
>
> >   static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
> >   {
> >       struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > @@ -777,6 +785,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
> >       tcpci->tcpc.enable_frs = tcpci_enable_frs;
> >       tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
> >       tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
> > +     tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
> >
> >       if (tcpci->data->auto_discharge_disconnect) {
> >               tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
> > diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> > index 17657451c762..85e95a3251d3 100644
> > --- a/include/linux/usb/tcpci.h
> > +++ b/include/linux/usb/tcpci.h
> > @@ -188,6 +188,12 @@ struct tcpci;
> >    *          Optional; The USB Communications Capable bit indicates if port
> >    *          partner is capable of communication over the USB data lines
> >    *          (e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
> > + * @check_contaminant:
> > + *           Optional; The callback is invoked when chiplevel drivers indicated
> > + *           that the USB port needs to be checked for contaminant presence.
> > + *           Chip level drivers are expected to check for contaminant and call
> > + *           tcpm_clean_port when the port is clean to put the port back into
> > + *           toggling state.
> >    */
> >   struct tcpci_data {
> >       struct regmap *regmap;
> > @@ -204,6 +210,7 @@ struct tcpci_data {
> >       void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
> >       void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
> >                                            bool capable);
> > +     void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data);
> >   };
> >
> >   struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
>
