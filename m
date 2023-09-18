Return-Path: <linux-usb+bounces-308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87B7A452B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 10:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A648F1C209FB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 08:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787F014AB8;
	Mon, 18 Sep 2023 08:53:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B5723B9
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 08:53:08 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33558D8
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 01:53:07 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41513d2cca7so432261cf.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695027186; x=1695631986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogW3H0R96ZMdosi7AtyKIErZk/fjmm07cRXWvBwHGak=;
        b=C21TsutBfma9IFapdSiTxUCteJGK+4aSUMP/MaEUlrJFMPJ/1MAvh1h7vye6ffb1HP
         GOVOhQ2GKOQXOjmGG7rb+v2s+5QPZ6J6+7aMXEoEMs3Mkvft8Vj2UsB5Bc6APRTF0gN0
         THwLTB3T7ATk+Qhz73IThXK/SGWWyRbbrnftahihrlokHMltrHrvFh6KHguT7LG9MmVn
         P7bkjhTA5Xc4KHGS9dh/A+173XdR1Nv7GXqUvYMQGbuBJ0iUuR+kypgrm+iuw0WE5XKB
         uLMsqlYgv8D/1I3PRSGjg26i87K8o9OBeKtEuFJkyu0ddL3trgIjAQ2ovGeRv7hiRy0V
         vAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695027186; x=1695631986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogW3H0R96ZMdosi7AtyKIErZk/fjmm07cRXWvBwHGak=;
        b=AK43JpjAVmR3rBBsw2Xh2MrvFIB0Y7w7StE+Q0lamRtRzRVk8eCRrosvvv+TCVj50d
         U5kGz4I/2GbH3LGniW9DKdAWLo0Qy/+m+8wJomICWgakl+r14UAtH9oltTjBa2FGXSk0
         X73gIWdjOr3asDHj6Xie/bwTObzYvUb0aCFGQDjxIzRnfea+V+ajORUxZeX/Atma6hfI
         zDNL6c1Uvw0MmNXp0ei9zg6qQc2kX34zQKcx1Ol31WsSqI2ijslvmlgUtjndpFbIMj49
         2zMbjnhCfZ9Uym+WIj3Fhi+RyUchFgYNFLqvD9BSU00HYlgtJ+5c9dmbuwIQiv6qpZrF
         mc3A==
X-Gm-Message-State: AOJu0YxpyyH3XcMIY/aIUGNPEaqxh4IRqLZTTRw8KYu8KXFkb+VJAayn
	SyBwRtVePYg8yozopV59UOJMDa4TazQm/EceL1sTrw==
X-Google-Smtp-Source: AGHT+IFT2iJsDrJ4oiAR0RgbZAYxO+7uW4xmH3x3Y2KCHkidrWH5VW869m/ySGLy2taFVEC9Lj2oDqs0L5e8Sp41s30=
X-Received: by 2002:ac8:5845:0:b0:40f:ec54:973 with SMTP id
 h5-20020ac85845000000b0040fec540973mr447970qth.22.1695027186029; Mon, 18 Sep
 2023 01:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230918074202.2461-426-nic_swsd@realtek.com> <20230918074202.2461-427-nic_swsd@realtek.com>
 <CANn89iJmdkyn8_hU4esycRG-XvPa_Djsp6PyaOX5cYP1Obdr4g@mail.gmail.com> <7235821eb09242adaa651172729f76aa@realtek.com>
In-Reply-To: <7235821eb09242adaa651172729f76aa@realtek.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 18 Sep 2023 10:52:54 +0200
Message-ID: <CANn89i+Tou=YwteEd5ceaHP54sZpkRotwcV6YWAs4jAUq=ocJg@mail.gmail.com>
Subject: Re: [PATCH net-next resend 1/2] r8152: remove queuing rx packets in driver
To: Hayes Wang <hayeswang@realtek.com>
Cc: "kuba@kernel.org" <kuba@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, nic_swsd <nic_swsd@realtek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "bjorn@mork.no" <bjorn@mork.no>, 
	"pabeni@redhat.com" <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 18, 2023 at 10:39=E2=80=AFAM Hayes Wang <hayeswang@realtek.com>=
 wrote:
>
> Eric Dumazet <edumazet@google.com>
> > Sent: Monday, September 18, 2023 3:55 PM
> [...]
> > >                         urb->actual_length =3D 0;
> > >                         list_add_tail(&agg->list, next);
> > >                 }
> > > +
> > > +               /* Break if budget is exhausted. */
> >
> > [1] More conventional way to to put this condition at the beginning of
> > the while () loop,
> > because the budget could be zero.
>
> If the budget is zero, the function wouldn't be called.
> a7b8d60b3723 ("r8152: check budget for r8152_poll") avoids it.

Yes, and we could revert  this patch :/

Moving the test at the front of the loop like most other drivers would
have avoided this issue,
and avoided this discussion.

>
> > > +               if (work_done >=3D budget)
> > > +                       break;
> > >         }
> > >
> > > +       /* Splice the remained list back to rx_done */
> > >         if (!list_empty(&rx_queue)) {
> > >                 spin_lock_irqsave(&tp->rx_lock, flags);
> > > -               list_splice_tail(&rx_queue, &tp->rx_done);
> > > +               list_splice(&rx_queue, &tp->rx_done);
> > >                 spin_unlock_irqrestore(&tp->rx_lock, flags);
> > >         }
> > >
> > >  out1:
> > > -       return work_done;
> > > +       if (work_done > budget)
> >
> > This (work_done >budget) condition would never be true if point [1] is
> > addressed.
>
> A bulk transfer may contain many packets, so the work_done may be more th=
an budget.
> That is why I queue the packets in the driver before this patch.
> For example, if a bulk transfer contains 70 packet and budget is 64,
> napi_gro_receive would be called for the first 64 packets and 6 packets w=
ould
> be queued in driver for next schedule. After this patch, napi_gro_receive=
() would
> be called for the 70 packets, even the budget is 64. And the remained bul=
k transfers
> would be handled for next schedule.

A comment would be nice. NAPI logic should look the same in all drivers.

If a driver has some peculiarities, comments would help to maintain
the code in the long run.

>
> > > +               return budget;
> > > +       else
> > > +               return work_done;
> > >  }
>
> Best Regards,
> Hayes
>

