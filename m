Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463022423EC
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 04:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgHLCBs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 22:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgHLCBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 22:01:48 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D93C061787
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:01:47 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 1so336500vsl.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFY4085plBY8G7tVD9MczcUSssYpeVWGX8Ah9xVqPOk=;
        b=HDA4NFi9vQjtl12+Zmrjq+C3UnJr0mMBKrILh7t3fkK5hS5cNExIGL1+L1hIEprKFY
         x+UHshB2qPRa7PC01fywLSFvj2iZvBI8hqCmFZw2kEf5oRNClRsIUrxtAvAsblH+J5zZ
         2KMfqb4HX6ghLCBOoOUwyb66NWWlO71PVYBlukNa+PtZj04JAm3WukGJSpHHvXU83i97
         KUshbPtCx7M+J8xGBUa0sZoKfukD3msvsdQJcyaAg0xhTazKRsXmH+VmGbgjrZRXESAv
         00+tkEfI9xA9WQ2GwGdVUiB0Ui+CpKMCkIYXGEm/0rRQeSLupTNG+OkHlGJelIW/hVeP
         B8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFY4085plBY8G7tVD9MczcUSssYpeVWGX8Ah9xVqPOk=;
        b=jDsVoQbaCylMYblTHQMPwFQu1NlFz0iZXklnH70TaoPe00EFNl77Pfr8dj6TmUiBSe
         25ZWdfDKE6InPokzWKgKYODG7W+bwqdwhTqalAcDLbn7gxoE54zklx3gihxlij2qqTrM
         EsigENF5a1cK13YWGJCwSBnldyTwldWJJg/bjncSSn1Q6nHBOZGPaQ4z8YZWV17V3zrb
         ze5IJJQ5sq77RZy55EWyfQ9mZfe6IUwSUymcWAys3Yhi+qVFjeD6qjPLJ0Pomhhck+Fu
         dVHsWKKsWmccldvt5/LdUbo8bF7RMwPdf39ueHci9HuPew07jLAxidBK7qeOPGZd3ypa
         eYXg==
X-Gm-Message-State: AOAM530tU7Z0/H6VUlvux86FSOpXkaUW4q6rrcFBrrR7h+1BSRm1M8DQ
        JV1pZBtH4sz6RYfAUy34rPjlSXEgHDCTH9FOQcwTQA==
X-Google-Smtp-Source: ABdhPJw1XndaA/OYA/SoNpImfbiqj/XJo4rws0tFRMOxmiIgBDNA1xisgCnGslix67SfdNKWCiSpD/Z3IVj+nBpG8Rs=
X-Received: by 2002:a67:f1c7:: with SMTP id v7mr10241022vsm.50.1597197706596;
 Tue, 11 Aug 2020 19:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200812001439.545655-1-badhri@google.com> <20200812014319.GA116801@roeck-us.net>
In-Reply-To: <20200812014319.GA116801@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 11 Aug 2020 19:01:10 -0700
Message-ID: <CAPTae5Jw3ZysWnYj=s7cjU1Hnr3ib7vfCHsgV=1Qq_2EWcUNvg@mail.gmail.com>
Subject: Re: [PATCH v2] tcpm: During PR_SWAP, source caps should be sent only
 after tSwapSourceStart
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 6:43 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Aug 11, 2020 at 05:14:39PM -0700, Badhri Jagan Sridharan wrote:
> > From the spec:
> > "6.6.8.1 SwapSourceStartTimer
> > The SwapSourceStartTimer Shall be used by the new Source, after a Power
> > Role Swap or Fast Role Swap, to ensure that it does not send
> > Source_Capabilities Message before the new Sink is ready to receive the
> > Source_Capabilities Message. The new Source Shall Not send the
> > Source_Capabilities Message earlier than tSwapSourceStart after the
> > last bit of the EOP of GoodCRC Message sent in response to the PS_RDY
> > Message sent by the new Source indicating that its power supply is
> > ready."
> >
> > This fixes TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 failures
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>
> Nit below, otherwise
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Note that I wasn't copied on this patch and only noticed it accidentally.

Apologies Guenter ! Error on my side while performing the git
send-email command.
Will make sure that I double check next time.

>
> Guenter
>
> > ---
> > Changes since V1:
> > - Comment on the permissible values of tSwapSourceStart
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 2 +-
> >  include/linux/usb/pd.h        | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 3ef37202ee37..d38347bd3335 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3555,7 +3555,7 @@ static void run_state_machine(struct tcpm_port *port)
> >                */
> >               tcpm_set_pwr_role(port, TYPEC_SOURCE);
> >               tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
> > -             tcpm_set_state(port, SRC_STARTUP, 0);
> > +             tcpm_set_state(port, SRC_STARTUP, PD_T_SWAP_SRC_START);
> >               break;
> >
> >       case VCONN_SWAP_ACCEPT:
> > diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> > index b6c233e79bd4..ed5eed73ccf8 100644
> > --- a/include/linux/usb/pd.h
> > +++ b/include/linux/usb/pd.h
> > @@ -473,6 +473,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
> >  #define PD_T_ERROR_RECOVERY  100     /* minimum 25 is insufficient */
> >  #define PD_T_SRCSWAPSTDBY      625     /* Maximum of 650ms */
> >  #define PD_T_NEWSRC            250     /* Maximum of 275ms */
> > +#define PD_T_SWAP_SRC_START  20     /* Minimum of 20ms */
>
> Odd alignment. Same as with the previous two lines which don't use tabs
> either.
>
> >
> >  #define PD_T_DRP_TRY         100     /* 75 - 150 ms */
> >  #define PD_T_DRP_TRYWAIT     600     /* 400 - 800 ms */
