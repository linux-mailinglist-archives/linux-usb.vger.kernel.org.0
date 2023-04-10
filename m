Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD2C6DC42E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 10:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjDJIJf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 04:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjDJIJe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 04:09:34 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58BB40D9
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 01:09:32 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 184so12221877pga.12
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681114172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yI0LD2umo9G5Mj18v1Bg92+Ka77jnUXEaVGbSB697NY=;
        b=DMVVll/s+XFS2HNxQsagfKXjeEOentDPixLCO9wIYWfko4qNzXYHlKKQTY958mGIBL
         pjZVni2AX2NRyo29XZgkgm5MJq1jCw1a3P83+W02zDsflc7xKOPwCoA9+C8sVzETsrVW
         eoHegWibPTPjlXXUYU2wocn9I3Np0aONHXJj9ZLoNzrwXN8R5rCMFeNHrMBXa0wBGcjL
         HnPzSIeFm7R0q/adaH6SuhPs/f9NL9RBrXx6DhI5pm66bYIRX832fjsiB77quV0NKY2p
         4MlJy6EvvTfgboJn6gmWjK5P/7DVbmUUBMpwOjWpGrD6dkJCL873NBIUU2CIOc7V63jP
         iH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yI0LD2umo9G5Mj18v1Bg92+Ka77jnUXEaVGbSB697NY=;
        b=FyD/0+c9vmAXHKItwi3IqWeDTWmDHDq0bpBGKb4XcL0T86NowTDdKj8ije3CplK63J
         29Rk8aFW9p+pA+Fe2o92g+JT943YW0To5e6q9UStsYTBp48ngWOZTuCyvGMUtOJyA6pZ
         0TQBb3EQuLwwHScCZ10HzykXaMgsulM/pc0RDOYFRssbAtgYel+1+2iRD+2InA15N2V1
         UkiJTlsjOsHEtFPfGUn6xB6V7GtOz8Zn8KLmtR9zVABUmFmojERjEUyGDiTyLOmss3Y5
         iW/GZD7gr1zsvuCM1gTyPTfvDM9vMadQzWOqwM2R6d8DJHQb/Hj4gipHJ8EOHLm6rXTV
         E6qQ==
X-Gm-Message-State: AAQBX9fW/3SPU7gmm8gSwVZSAq1nNiaKlQimxOc64h9xQcLTyGadgzGX
        R+LqO7mPmKClruurKMcx8q9MG5McTqX5EW0h9yKB/Q==
X-Google-Smtp-Source: AKy350biAiFjQ7sPWIe2hVDPFqFCKEFvmj9fAPFj4/4WpJmc6r4MBOqYxTFwa23PMKzpjMr1g0f6riqRACvunNypu3w=
X-Received: by 2002:a63:d352:0:b0:518:4378:e548 with SMTP id
 u18-20020a63d352000000b005184378e548mr1348623pgi.8.1681114171989; Mon, 10 Apr
 2023 01:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230410073134.488762-1-badhri@google.com> <2023041028-irritate-starless-a42f@gregkh>
In-Reply-To: <2023041028-irritate-starless-a42f@gregkh>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 10 Apr 2023 01:08:55 -0700
Message-ID: <CAPTae5KZ0zkaCWrtPYzyX8oTyvDhBhc-hvxyHn9VHZ32UOqJ3g@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: Add kernel config to wrap around
 tcpm logs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 10, 2023 at 12:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Apr 10, 2023 at 07:31:34AM +0000, Badhri Jagan Sridharan wrote:
> > This change adds CONFIG_TCPM_LOG_WRAPAROUND which when set allows the
> > logs to be wrapped around. Additionally, when set, does not clear
> > the TCPM logs when dumped.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/Kconfig | 6 ++++++
> >  drivers/usb/typec/tcpm/tcpm.c  | 9 +++++++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kc=
onfig
> > index e6b88ca4a4b9..4dd2b594dfc9 100644
> > --- a/drivers/usb/typec/tcpm/Kconfig
> > +++ b/drivers/usb/typec/tcpm/Kconfig
> > @@ -18,6 +18,12 @@ config TYPEC_TCPCI
> >       help
> >         Type-C Port Controller driver for TCPCI-compliant controller.
> >
> > +config TCPM_LOG_WRAPAROUND
> > +     bool "Enable TCPM log wraparound"
> > +     help
> > +       When set, wraps around TCPM logs and does not clear the logs wh=
en dumped. TCPM logs by
> > +       default gets cleared when dumped and does not wraparound when f=
ull.
>
> Kconfig help text needs to be wrapped at the properly width.

I assumed that the width is 100 characters, but it looks like it is
80. Will fix it in the next version.
>
> And you do not provide any hint here as to why this is not the default
> option, or why someone would want this.

"TCPM logs by default gets cleared when dumped and does not wraparound
when full." was intended
to convey why someone would want to set this. Perhaps it's not effective.

Does the below look better:
"TCPM logs by default gets cleared when dumped and does not wraparound
when full. This can be overridden by setting this config.
When the config is set, TCPM wraps around logs and does not clear the
logs when dumped."

Also, I could make this default if that's OK with Guenter.

>
> So, why is this not just the default operation anyway?  Why would you
> ever want the logs cleared?

I remember Guenter mentioning that he was finding it useful to not
wrap around the logs to fix problems
during tcpm_register_port (init sequence). IMHO wrapping around the
logs helps to triage interoperability
issues uncovered during testing. So both approaches have their own advantag=
es.

Thanks for taking the time to review !
- Badhri

>
> thanks,
>
> greg k-h
