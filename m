Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3929F12F391
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 04:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgACDf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 22:35:58 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39937 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgACDf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 22:35:58 -0500
Received: by mail-qk1-f196.google.com with SMTP id c17so32885089qkg.7
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 19:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MJwycnhREsJfbVIVuYDvQOrzNMSv0nef4o4ri7/3xCk=;
        b=Ii4EgNxhOYcZNJBSZJFp+S05VQ5tn3Fr7tXyJ9oCcsXbTDMZxYvNInCiizAAEJjmQG
         5SVvQwfAnTmFRYMZ0sevHsV5kqFVhJbQM4dvK4gR1lMEdDei6Uw1VEQw8RnAQRFjv2Vb
         f0LlTJRD6dZMtmWObYtBrou9NOxoqi8C8M5/S0oGe99R1ulA72op5sAw9kPSO8MonF4A
         Fjoc/dlmvrTrdDcD6p8Wu7PXeCk03PwSwqqGMEOtjs22KRBI+x2JQw0k9ycMp7OA8dVd
         2xvDuyLEFXA+XLtMmtaf7RUGUu9koBfvHEkKw1u7VJVMWIchrLNVDz3rp0YJdzm4vrcu
         JOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MJwycnhREsJfbVIVuYDvQOrzNMSv0nef4o4ri7/3xCk=;
        b=EyE6D5flTPFfSsyYIMZpZxXrJ68pvIsEU6TJclqmuCsaivkBhjZrje49hbwhOIjDkZ
         TUwuNj6IaVGurcZtB76LP5V5ON+bG1EOqKX91ZUopQ9mRNr0nj5kPIDhH2LL49D5mznp
         vjIktAkk2MFxTld8kkCwytDl8SzF8DyVdfYGc4Zvf1VJt6Mz8btj7iS2KKUa6g5o9Dq8
         Tqaoe9yFr1I6/yJ76jrcbM2lndxq7Z64TT3lJPRBXj+g+Ds7FoB5jLWOgEgRz5mieIFv
         bDqAzSMueIJLoQv74UPgAIKQ1gQBsL4Guit3+Q3J40/Tm2E90gl/XxAjhivL/sb9Xmhb
         jGvQ==
X-Gm-Message-State: APjAAAUDeys84y5kEvKJh018FyDPnAlFJCdo8Idw9roM4ZvolpYug9Nk
        pRy9I0tyqo1ES3/+fwwIYEW/QfK9vSLUa3U10p8Es1oOXpc=
X-Google-Smtp-Source: APXvYqygqVmX96N/ilMC+hGTO5iAOaRuc4GgTxs6fL0Tr7nFJiR5qIIiaSN8mrVQA21GjlB88f5ye6W8Xt0iHahyRn8=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr68169207qki.170.1578022557175;
 Thu, 02 Jan 2020 19:35:57 -0800 (PST)
MIME-Version: 1.0
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
 <878smqksjo.fsf@kernel.org> <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CADBw62roaEi6UWV3X2NtqQ55w_SONactEn=JxrPShMV7oj98vQ@mail.gmail.com> <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Fri, 3 Jan 2020 11:35:45 +0800
Message-ID: <CADBw62p_vLUusBH64312LDJAZQCd=7UqDonHVotYges0JA0cNw@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Fri, Jan 3, 2020 at 11:20 AM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> > > Hi Felipe,
> > >
> > > How to make sure it works? Except for enabling CONFIG_COMPLIE_TEST,
> > > what else I need to do? Thanks.
> >
> > Felipe's suggestion is you should change your config dependency as:
> > depends on ARCH_MXC || COMPILE_TEST
> >
> > Then user can compile your driver to find warning or something else though the
> > ARCH_MXC config is not enabled.
>
> Hi Baolin,
>
> I know that, I have already changed that,  unset ARCH_MXC and enable
> CONFIG_COMPILE_TEST.

OK. I think this is enough if you can compile successfully.

> What else I could do to make sure it could compile OK
> at every architecture?

I think Felipe's meaning is we should not only compile drivers under
the specific ARCH limitation, we can add COMPILE_TEST dependency to
allow drivers to be complied in any ARCHs. And you've done that, so I
think nothing else need to do here.
