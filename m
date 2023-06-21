Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2E25738304
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 14:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjFUMCd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 08:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbjFUMC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 08:02:26 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88EE170F
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 05:02:25 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-25e83a63143so4355445a91.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687348945; x=1689940945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhxmnBwA3kxFM1Khy1EXv4uS5Bs0rCsQz59EI6x6O38=;
        b=F/KGFrLg4zD/PMnwpqt+njNXxH5Rs94zpA07R9mKFtHQJG79P/UwYxEP8E448E4kod
         ujgEISipQqVYQb/8UsU6WJSKzTgNY7IwsGo74ryReNAfPQdJtk1h3p03MMhuITs7K+r4
         BXe7y7d2dah3gGHL8Gmm6qIDGh1FTuKO949HM6XX/LnCXScv8WkiSTqzXQyh0OlDD3wj
         FyBoXTUCKetNKgrv+dzwTspwpCeaXxHZkIBAwbY4inwnq2Ehx/BIFthlPeXFjyULT2Lb
         nBosdkgEGXJ/huQqsRElA5XBTBhZ1JsMAgYVDYFmRfk26YAtp7qD0IsFdGm4dhGvO9qB
         m4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687348945; x=1689940945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhxmnBwA3kxFM1Khy1EXv4uS5Bs0rCsQz59EI6x6O38=;
        b=YN9UulDcXzO/bCOQl2b28c2U92AECtR3eE5gGnzkRPKEzS8F6ohQ/ATdvNAkXRUJwm
         KDrLNbS5zTNksTGjDgGE9vYw8kibNUNz3YGWOmoehe5wz1Bzx5/F8CjS2Gs8qGR5C/AO
         NX7mvfzcmP7gyBxNHBp3oEPWXSlWq/0VeDgsVfy3N+SL/5TlT3AMH178hmlhQmHx7Yfz
         LsHxsoj4Q5iziulgEtqA4QSy/v7Hj6yRcKncItQvGIQlvbnG5maCtHhQLQcLDcyyA6jY
         nGxO9XDfhVuMbUYriCVW+SfuYD1f+B6HXuOKglG2yj7AUM3NJsvzgNdzcKJ/CBoWxFUs
         ZArg==
X-Gm-Message-State: AC+VfDyuC40Cwql40YkQgqvarF0LGL7PyXuN7cTCrRg/LJu7ufQohC4d
        InKDM+RDK1ClYvgwP9X9oDK9ft4AFLfVEGPgJDwniw==
X-Google-Smtp-Source: ACHHUZ5zFAeEYC/BiDisvvqJBTZap8sir1tOWv1nt/yk/At8UfskkIcU6yoJqTMS0MMTY6rXaqm3/YermK4VVVfrFds=
X-Received: by 2002:a17:90a:43e4:b0:25b:dc4b:611d with SMTP id
 r91-20020a17090a43e400b0025bdc4b611dmr15221652pjg.26.1687348945091; Wed, 21
 Jun 2023 05:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
 <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com> <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com> <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
 <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
 <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
In-Reply-To: <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
From:   Lei Yu <yulei.sh@bytedance.com>
Date:   Wed, 21 Jun 2023 20:02:14 +0800
Message-ID: <CAGm54UG2uD2jruRc33Xm4izepYpuFNBBcGe594as8_fx1uEWQg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Henry Tian <tianxiaofeng@bytedance.com>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 21, 2022 at 10:26=E2=80=AFAM Lei Yu <yulei.sh@bytedance.com> wr=
ote:
>
> On Wed, Dec 21, 2022 at 10:17 AM Neal Liu <neal_liu@aspeedtech.com> wrote=
:
> > > > > > > Using rndis is able to set MTU to 2000, and the issue can be
> > > reproduced.
> > >
> > > USB ecm is also tested and it is possible to set MTU to 2000, and cou=
ld
> > > reproduce the issue.
> > > So I think this patch is needed anyway.
> > >
> > > @Neal Liu Could you kindly help to verify the USB ECM case?
> >
> > How to set MTU to 2000 on USB ECM case? I remember last time I cannot s=
et by using "ifconfig ..."
> > Regardless ECM or RNDIS, I agree this patch is still needed.
>
> You were able to set MTU to 2000 for RNDIS but not for NCM.
> @Greg Kroah-Hartman indicated that RNDIS should not be used anymore.
> So I tested ECM and verified it could set MTU 2000 and the issue could
> be reproduced.

This patch fixes the kernel oops in the aspeed-vhub driver for both
USB ECM and RNDIS.
It now has an Acked-by from benh and Reviewed-by from neal_liu

Should we merge this patch?
