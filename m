Return-Path: <linux-usb+bounces-1762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 106867CCADB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 20:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 423011C20AF5
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087FE4121E;
	Tue, 17 Oct 2023 18:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+8ibS9H"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9F2D035
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 18:37:57 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8437590
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 11:37:55 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9936b3d0286so975454366b.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697567871; x=1698172671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0ndmeFAnooDYJrLwBWEykUK1jnu79vBWHr+CSspHeI=;
        b=d+8ibS9HVj8ISXpJ7WsVfmRuCtpTJPJPrPhrzcFH6WvzoucV+mYpFWL++9pCdsTnlE
         Z/QexG9mCbX+Uk7ybfQ2w01NZ1WKZxL4evA2Zqew1tTqL0nMNYCFBEevT+pH8EJAbznm
         fzQjTSP7UE+Pxl5mj8+/ou2Ny3X60du7RnElQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697567871; x=1698172671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0ndmeFAnooDYJrLwBWEykUK1jnu79vBWHr+CSspHeI=;
        b=Ts6Q5foIAaSLIXRD4nUxjmTkpSxJUHlGg9t08RiA4wX22UmFe4NEo2SIqur1rkEgV3
         GeMODvg3V88lObt545j9T2pSOE+Uyt+I1NbI81Y3Xt+sr+z6pelqgf7rxTSI/2ObmuDG
         LX9lmmtnlCY+jdXmSjF9fUqNjjCMuFiTtYX/Xs7UlBGx1oZ3xDkbIs6BVkWvZPX2pS6X
         Uat/9cZtlPN5N10hlH46cNLptQChm6EfK3TFTtoSTvisO4a8OfzTgmIr0OqhZuTw8mqx
         crF9LLX7Cah8zYbLELx1c8HykwT8tBlYOf0aBoMaHBuEedfQPROkJd9ZCcBcJqZGcvuF
         qKNQ==
X-Gm-Message-State: AOJu0YwMyU4L3tsV7PZpqY777P6A0PxstH6Xiy3WVrafxkcUAKnuFSQF
	9h0JB3H6oqxOeKsI9+tBz70EUv3Jh5v+bkw+kwqxcDKl
X-Google-Smtp-Source: AGHT+IH/VwJCW2Ni5x3/M3U1yo8MwipoEcjmkGgk02OIlmLVaApqQOeTQIvMkPPuVc4fTthlVcQIPw==
X-Received: by 2002:a17:907:80b:b0:9c3:d356:ad0c with SMTP id wv11-20020a170907080b00b009c3d356ad0cmr2248545ejb.24.1697567871084;
        Tue, 17 Oct 2023 11:37:51 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id k6-20020a170906a38600b009a2235ed496sm243132ejz.141.2023.10.17.11.37.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 11:37:50 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40837124e1cso13395e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 11:37:50 -0700 (PDT)
X-Received: by 2002:a05:600c:11cf:b0:400:c6de:6a20 with SMTP id
 b15-20020a05600c11cf00b00400c6de6a20mr16564wmi.3.1697567869494; Tue, 17 Oct
 2023 11:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012192552.3900360-1-dianders@chromium.org>
 <20231012122458.v3.5.Ib2affdbfdc2527aaeef9b46d4f23f7c04147faeb@changeid>
 <29f9a2ff1979406489213909b940184f@realtek.com> <CAD=FV=U4rGozXHoK8+ejPgRtyoACy1971ftoatQivqzk2tk5ng@mail.gmail.com>
 <052401da00fa$dacccd90$906668b0$@realtek.com> <CAD=FV=XQswgKZh-JQ6PuKGRmrDMfDmZwM+MUpAcOk1=7Ppjyiw@mail.gmail.com>
In-Reply-To: <CAD=FV=XQswgKZh-JQ6PuKGRmrDMfDmZwM+MUpAcOk1=7Ppjyiw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Oct 2023 11:37:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vp_KE_hjWy7bKJbvmqwCQ67jhzfFoV368vB5ZGge=Yzw@mail.gmail.com>
Message-ID: <CAD=FV=Vp_KE_hjWy7bKJbvmqwCQ67jhzfFoV368vB5ZGge=Yzw@mail.gmail.com>
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Tue, Oct 17, 2023 at 7:17=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 17, 2023 at 6:07=E2=80=AFAM Hayes Wang <hayeswang@realtek.com=
> wrote:
> >
> > Doug Anderson <dianders@chromium.org>
> > > Sent: Tuesday, October 17, 2023 12:47 AM
> > [...
> > > > >  static int generic_ocp_read(struct r8152 *tp, u16 index, u16 siz=
e,
> > > > > @@ -8265,6 +8353,19 @@ static int rtl8152_pre_reset(struct
> > > usb_interface
> > > > > *intf)
> > > > >         if (!tp)
> > > > >                 return 0;
> > > > >
> > > > > +       /* We can only use the optimized reset if we made it to t=
he end of
> > > > > +        * probe without any register access fails, which sets
> > > > > +        * `PROBED_WITH_NO_ERRORS` to true. If we didn't have tha=
t then return
> > > > > +        * an error here which tells the USB framework to fully u=
nbind/rebind
> > > > > +        * our driver.
> > > >
> > > > Would you stay in a loop of unbind and rebind,
> > > > if the control transfers in the probe() are not always successful?
> > > > I just think about the worst case that at least one control always =
fails in probe().
> > >
> > > We won't! :-) One of the first things that rtl8152_probe() does is to
> > > call rtl8152_get_version(). That goes through to
> > > rtl8152_get_version(). That function _doesn't_ queue up a reset if
> > > there are communication problems, but it does do 3 retries of the
> > > read. So if all 3 reads fail then we will permanently fail probe,
> > > which I think is the correct thing to do.
> >
> > The probe() contains control transfers in
> >         1. rtl8152_get_version()
> >         2. tp->rtl_ops.init()
> >
> > If one of the 3 control transfers in 1) is successful AND
> > any control transfer in 2) fails,
> > you would queue a usb reset which would unbind/rebind the driver.
> > Then, the loop starts.
> > The loop would be broken, if and only if
> >         a) all control transfers in 1) fail, OR
> >         b) all control transfers in 2) succeed.
> >
> > That is, the loop would be broken when the fail rate of the control tra=
nsfer is high or low enough.
> > Otherwise, you would queue a usb reset again and again.
> > For example, if the fail rate of the control transfer is 10% ~ 60%,
> > I think you have high probability to keep the loop continually.
> > Would it never happen?
>
> Actually, even with a failure rate of 10% I don't think you'll end up
> with a fully continuous loop, right? All you need is to get 3 failures
> in a row in rtl8152_get_version() to get out of the loop. So with a
> 10% failure rate you'd unbind/bind 1000 times (on average) and then
> (finally) give up. With a 50% failure rate I think you'd only
> unbind/bind 8 times on average, right? Of course, I guess 1000 loops
> is pretty close to infinite.
>
> In any case, we haven't actually seen hardware that fails like this.
> We've seen failure rates that are much much lower and we can imagine
> failure rates that are 100% if we're got really broken hardware. Do
> you think cases where failure rates are middle-of-the-road are likely?
>
> I would also say that nothing we can do can perfectly handle faulty
> hardware. If we're imagining theoretical hardware, we could imagine
> theoretical hardware that de-enumerated itself and re-enumerated
> itself every half second because the firmware on the device crashed or
> some regulator kept dropping. This faulty hardware would also cause an
> infinite loop of de-enumeration and re-enumeration, right?
>
> Presumably if we get into either case, the user will realize that the
> hardware isn't working and will unplug it from the system. While the
> system is doing the loop of trying to enumerate the hardware, it will
> be taking up a bunch of extra CPU cycles but (I believe) it won't be
> fully locked up or anything. The machine will still function and be
> able to do non-Ethernet activities, right? I would say that the worst
> thing about this state would be that it would stress corner cases in
> the reset of the USB subsystem, possibly ticking bugs.
>
> So I guess I would summarize all the above as:
>
> If hardware is broken in just the right way then this patch could
> cause a nearly infinite unbinding/rebinding of the r8152 driver.
> However:
>
> 1. It doesn't seem terribly likely for hardware to be broken in just this=
 way.
>
> 2. We haven't seen hardware broken in just this way.
>
> 3. Hardware broken in a slightly different way could cause infinite
> unbinding/rebinding even without this patch.
>
> 4. Infinite unbinding/rebinding of a USB adapter isn't great, but not
> the absolute worst thing.
>
>
> That all being said, if we wanted to address this we could try two
> different ways:
>
> a) We could add a global in the r8152 driver and limit the number of
> times we reset. This gets a little ugly because if we have multiple
> r8152 adapters plugged in then the same global would be used for both,
> but maybe it's OK?
>
> b) We could improve the USB core to somehow prevent usb_reset_device()
> from running too much on a given device?
>
>
> ...though I would re-emphasize that I don't think this is something we
> need to address now. If later we actually see a problem we can always
> address it then.

One other idea occurred to me that we could do, if we cared to solve
this hypothetical failure case. We could change the code to always
read the version 4 times on every probe. If one of the transfers fails
then we could consider that OK. If 2 or more transfers fails then we
could consider that to be an error. You still might get a _few_
unbind/bind in this hypothetical failure mode, but I think it would
catch the problem more quickly.

My probability theory is rusty and I'm sure there's a better way, but
I think we can just add up all the cases. Assuming a 10% failures and
90% success of any transfer:

# Chance of 2 failures:
.10 * .10 * .90 * .90 +
.10 * .90 * .10 * .90 +
.10 * .90 * .90 * .10 +
.90 * .10 * .90 * .10 +
.90 * .90 * .10 * .10

# Chance of 3 failures:
.10 * .10 * .10 * .90 +
.10 * .10 * .90 * .10 +
.10 * .90 * .10 * .10 +
.90 * .10 * .10 * .10

# Chance of 4 failures:
.10 * .10 * .10 * .10

If I add that up I get about a 4.4% chance of 2 or more failures in 4
reads. That means if we got into an unbind/bind cycle we'd get out of
it (on average) in ~23 probes because we'd see enough failures. We
could likely reduce this further by reading the version 5 or 6 times.

I will note that my measurements showed that a normal probe is ~200
transfers and also includes a bunch of delays, so reading the version
a few times wouldn't be a huge deal.


In any case, I'm still of the opinion that we don't need to handle this.

-Doug

