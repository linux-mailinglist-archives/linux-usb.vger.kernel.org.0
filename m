Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CB62D6F70
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 05:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395405AbgLKEsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 23:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732545AbgLKEsW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 23:48:22 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A885C0613D3
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 20:47:42 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id z16so4153248vsp.5
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 20:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCX++NcovFvmuiZAkYM9TG027ENLPf2SyX4C3UG/YXE=;
        b=UT8xK2wkBb30KnXY24s4al02jyc+2CbeUlsT5ixozhRHyoYvz3HB9+HXc3oL8dAEsQ
         FWIYNimr7jZMgzI/AIjks8hb17xxQI8WSv+7RmI/j08inNNwZyPka8WnqrhR+HrOG/sM
         2pUAXovJaHfIJJzX9W9cRCMFxmZH8HDRNlIhc8iG/KUKr9FFmUtJ7hH0VSbj+zICsMW+
         flO95g9tZWKWKBDGIiXy65M81Eio2IwQJi1vOaLf3MTIOmPN7vAr5MPv8VoNp7iQCbtg
         ATxuWG8aaAaJl6zuvqByRtJ9Zxd8ibzem6SLjP3c/w+JqD+YWfbJ3DxB7Hfk+sMHTdHY
         OGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCX++NcovFvmuiZAkYM9TG027ENLPf2SyX4C3UG/YXE=;
        b=YZQ+89Bsh/xMfoWy2/bUmqrx/olD9gkCLdqzRPO3ZPZHFA2OFm12b3IxJHP0cdive1
         ppzuqHn+JcDMqIC+7eNtCrnbjiFf24SBJmbVSxN77HEwzZWJWr/VjB0WDq1a/XB7HcmD
         Ql+k7gTntRtltCv6/GuhaLbIvbuigSDNmLkweQAo2EUvOR8Yg/f8Bo5neirXW5HIekfp
         roRo1FZgq28uJ7LHmVVhgk1vxRDH/+7/Y+jAR9XeGHdZT5FJSQv8i5/D3IWK6e/NOS+e
         aE1rRqIsJ2wq7Ug1ZXJ8a+lPlu/DaDqyKoMTOjqp/u7SK6uvfQt91XgWbDj9xxBl1W2W
         1FyQ==
X-Gm-Message-State: AOAM532H1vb5Gz73Y7Mre3M5Wox7L8gypRh5iocLY1SO1mIsK6/3p21x
        MKtnLsLduxlq2f/9yCKREUAswc6+bx+Eo6KKeVC81Q==
X-Google-Smtp-Source: ABdhPJzfHH8iZuSy9IeM1QrBIrayI7MyRNM25MoLU8Lvcqnk22ZpJgt/nAsJc3SS58d4qVgH0ggK1geWx2PP7maNhiY=
X-Received: by 2002:a67:6b46:: with SMTP id g67mr30004vsc.60.1607662061190;
 Thu, 10 Dec 2020 20:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20201210160521.3417426-1-gregkh@linuxfoundation.org>
 <20201210160521.3417426-6-gregkh@linuxfoundation.org> <20201210174548.GF107395@roeck-us.net>
 <CAPTae5JBj1PgZw7=00ZPuT8OZP7=SNSAcPBtaiQ_LyxZm7UhNw@mail.gmail.com>
In-Reply-To: <CAPTae5JBj1PgZw7=00ZPuT8OZP7=SNSAcPBtaiQ_LyxZm7UhNw@mail.gmail.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 10 Dec 2020 20:47:04 -0800
Message-ID: <CAPTae5J2ex_0h==a23PvKA2Xfnze0K6w9v8dpiSF_DEpRf8BSw@mail.gmail.com>
Subject: Re: [PATCH 5/5] USB: typec: tcpci: Add Bleed discharge to
 POWER_CONTROL definition
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>,
        Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

I have a patch ready to enable BLEED_DISCHARGE in tcpci code.
I will send that in once you merge this patch to usb-next.

Thanks,
Badhri

On Thu, Dec 10, 2020 at 10:56 AM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> Hi Guenter,
>
> Yes I will send a follow up patch to update tcpci_maxim.c.
>
> Thanks,
> Badhri
>
>
> On Thu, Dec 10, 2020 at 9:45 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Thu, Dec 10, 2020 at 05:05:21PM +0100, Greg Kroah-Hartman wrote:
> > > From: Badhri Jagan Sridharan <badhri@google.com>
> > >
> > > "Table 4-19. POWER_CONTROL Register Definition" from tcpci spec
> > > defines BIT(3) as the control bit for bleed discharge.
> > >
> > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Cc: Kyle Tso <kyletso@google.com>
> > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > Just wondering - is that going to be used in a follow-up commit ?
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Guenter
> >
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> > > index 116a69c85e38..c3c7d07d9b4e 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci.h
> > > +++ b/drivers/usb/typec/tcpm/tcpci.h
> > > @@ -72,6 +72,7 @@
> > >
> > >  #define TCPC_POWER_CTRL                      0x1c
> > >  #define TCPC_POWER_CTRL_VCONN_ENABLE BIT(0)
> > > +#define TCPC_POWER_CTRL_BLEED_DISCHARGE      BIT(3)
> > >  #define TCPC_POWER_CTRL_AUTO_DISCHARGE       BIT(4)
> > >  #define TCPC_FAST_ROLE_SWAP_EN               BIT(7)
> > >
> > > --
> > > 2.29.2
> > >
