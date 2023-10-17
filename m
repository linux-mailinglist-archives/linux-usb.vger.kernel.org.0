Return-Path: <linux-usb+bounces-1745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8257CC5C0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8937F1C20C99
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E8343AB3;
	Tue, 17 Oct 2023 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wa2XdJlp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EB243AA2
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 14:17:25 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE89102
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 07:17:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5079fa1bbf8so4927798e87.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697552241; x=1698157041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhfkjFsxmGF82cD1/zPvd0Z9FpQNYOUYA0aagsJzr4o=;
        b=Wa2XdJlpa2WrADa42UyRAP0CIaiwAMdAmCoDww0WbJg+ymnin6+tpSfBnxSbZr2MxH
         GyD8r3LTd9PDsjLDDKkcZlFlvFx2q1FCkY66aBkUJT03860pIluGa3BPASgXID/jWTLF
         5pKFMov7zyA0Ne5jQc0IaRh0WDKh8luJN//OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552241; x=1698157041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhfkjFsxmGF82cD1/zPvd0Z9FpQNYOUYA0aagsJzr4o=;
        b=KqHH/3DSxoZLEBEzjKt2aukqrMO6xWNDa3Xo4VDfTcykKLU4ODICxP0NpqXV5LdXAD
         UTFCF9FMqQ+013V/J8iDMvUtZ8Ooxejb8Ro6stAu4isyYFl1dJfX9bBtx9OmjcvbwxYR
         zrfwx4XiHwYtVb16rmrwX8sMPAWxkoUL4zubBqsC6bS57P5q+U2KEzWHbj060XYSJG1q
         +MAQKncO6CQA6OpuR95pBK5cEoyLreFmhJ+ILhBT9aL6roA93n0QbimLjDNAAX7F7pZK
         A4D0LQksYSG0kQGwN28Fp29pZHdkcmbITxFIN5zxFbnfDNHtmCV1L4OjIQBKacrDjPul
         0kwA==
X-Gm-Message-State: AOJu0YxY8i8RzL1Amml3torzmwCJ0ypK8bGIlPqjz9nOenMdrr14EQAZ
	LcNXhFYNpZUkIE7KLe00KtidpFmYAgdxlDXXp+CA2w/v
X-Google-Smtp-Source: AGHT+IGTnGuGN6Y7PwqPfm/O18rFOv8XhydecCMul2BpmfnrGV439TBb+UsPfg/+2qMIKVhbAr85yQ==
X-Received: by 2002:ac2:5a59:0:b0:503:264b:efc9 with SMTP id r25-20020ac25a59000000b00503264befc9mr1782560lfn.18.1697552241101;
        Tue, 17 Oct 2023 07:17:21 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id bd15-20020a056402206f00b0053e15aefb0fsm1275213edb.85.2023.10.17.07.17.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 07:17:20 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4063bfc6c03so78045e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 07:17:20 -0700 (PDT)
X-Received: by 2002:a05:600c:214d:b0:408:2b:5956 with SMTP id
 v13-20020a05600c214d00b00408002b5956mr2161wml.6.1697552239873; Tue, 17 Oct
 2023 07:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012192552.3900360-1-dianders@chromium.org>
 <20231012122458.v3.5.Ib2affdbfdc2527aaeef9b46d4f23f7c04147faeb@changeid>
 <29f9a2ff1979406489213909b940184f@realtek.com> <CAD=FV=U4rGozXHoK8+ejPgRtyoACy1971ftoatQivqzk2tk5ng@mail.gmail.com>
 <052401da00fa$dacccd90$906668b0$@realtek.com>
In-Reply-To: <052401da00fa$dacccd90$906668b0$@realtek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Oct 2023 07:17:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQswgKZh-JQ6PuKGRmrDMfDmZwM+MUpAcOk1=7Ppjyiw@mail.gmail.com>
Message-ID: <CAD=FV=XQswgKZh-JQ6PuKGRmrDMfDmZwM+MUpAcOk1=7Ppjyiw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] r8152: Block future register access if register
 access fails
To: Hayes Wang <hayeswang@realtek.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Alan Stern <stern@rowland.harvard.edu>, Simon Horman <horms@kernel.org>, 
	Edward Hill <ecgh@chromium.org>, Laura Nao <laura.nao@collabora.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Tue, Oct 17, 2023 at 6:07=E2=80=AFAM Hayes Wang <hayeswang@realtek.com> =
wrote:
>
> Doug Anderson <dianders@chromium.org>
> > Sent: Tuesday, October 17, 2023 12:47 AM
> [...
> > > >  static int generic_ocp_read(struct r8152 *tp, u16 index, u16 size,
> > > > @@ -8265,6 +8353,19 @@ static int rtl8152_pre_reset(struct
> > usb_interface
> > > > *intf)
> > > >         if (!tp)
> > > >                 return 0;
> > > >
> > > > +       /* We can only use the optimized reset if we made it to the=
 end of
> > > > +        * probe without any register access fails, which sets
> > > > +        * `PROBED_WITH_NO_ERRORS` to true. If we didn't have that =
then return
> > > > +        * an error here which tells the USB framework to fully unb=
ind/rebind
> > > > +        * our driver.
> > >
> > > Would you stay in a loop of unbind and rebind,
> > > if the control transfers in the probe() are not always successful?
> > > I just think about the worst case that at least one control always fa=
ils in probe().
> >
> > We won't! :-) One of the first things that rtl8152_probe() does is to
> > call rtl8152_get_version(). That goes through to
> > rtl8152_get_version(). That function _doesn't_ queue up a reset if
> > there are communication problems, but it does do 3 retries of the
> > read. So if all 3 reads fail then we will permanently fail probe,
> > which I think is the correct thing to do.
>
> The probe() contains control transfers in
>         1. rtl8152_get_version()
>         2. tp->rtl_ops.init()
>
> If one of the 3 control transfers in 1) is successful AND
> any control transfer in 2) fails,
> you would queue a usb reset which would unbind/rebind the driver.
> Then, the loop starts.
> The loop would be broken, if and only if
>         a) all control transfers in 1) fail, OR
>         b) all control transfers in 2) succeed.
>
> That is, the loop would be broken when the fail rate of the control trans=
fer is high or low enough.
> Otherwise, you would queue a usb reset again and again.
> For example, if the fail rate of the control transfer is 10% ~ 60%,
> I think you have high probability to keep the loop continually.
> Would it never happen?

Actually, even with a failure rate of 10% I don't think you'll end up
with a fully continuous loop, right? All you need is to get 3 failures
in a row in rtl8152_get_version() to get out of the loop. So with a
10% failure rate you'd unbind/bind 1000 times (on average) and then
(finally) give up. With a 50% failure rate I think you'd only
unbind/bind 8 times on average, right? Of course, I guess 1000 loops
is pretty close to infinite.

In any case, we haven't actually seen hardware that fails like this.
We've seen failure rates that are much much lower and we can imagine
failure rates that are 100% if we're got really broken hardware. Do
you think cases where failure rates are middle-of-the-road are likely?

I would also say that nothing we can do can perfectly handle faulty
hardware. If we're imagining theoretical hardware, we could imagine
theoretical hardware that de-enumerated itself and re-enumerated
itself every half second because the firmware on the device crashed or
some regulator kept dropping. This faulty hardware would also cause an
infinite loop of de-enumeration and re-enumeration, right?

Presumably if we get into either case, the user will realize that the
hardware isn't working and will unplug it from the system. While the
system is doing the loop of trying to enumerate the hardware, it will
be taking up a bunch of extra CPU cycles but (I believe) it won't be
fully locked up or anything. The machine will still function and be
able to do non-Ethernet activities, right? I would say that the worst
thing about this state would be that it would stress corner cases in
the reset of the USB subsystem, possibly ticking bugs.

So I guess I would summarize all the above as:

If hardware is broken in just the right way then this patch could
cause a nearly infinite unbinding/rebinding of the r8152 driver.
However:

1. It doesn't seem terribly likely for hardware to be broken in just this w=
ay.

2. We haven't seen hardware broken in just this way.

3. Hardware broken in a slightly different way could cause infinite
unbinding/rebinding even without this patch.

4. Infinite unbinding/rebinding of a USB adapter isn't great, but not
the absolute worst thing.


That all being said, if we wanted to address this we could try two
different ways:

a) We could add a global in the r8152 driver and limit the number of
times we reset. This gets a little ugly because if we have multiple
r8152 adapters plugged in then the same global would be used for both,
but maybe it's OK?

b) We could improve the USB core to somehow prevent usb_reset_device()
from running too much on a given device?


...though I would re-emphasize that I don't think this is something we
need to address now. If later we actually see a problem we can always
address it then.


-Doug

