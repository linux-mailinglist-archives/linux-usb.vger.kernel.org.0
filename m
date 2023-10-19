Return-Path: <linux-usb+bounces-1924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031FD7CFE6F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 17:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51149B214B8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 15:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2E732180;
	Thu, 19 Oct 2023 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SW8eiUvt"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD83158B
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 15:42:30 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD9BD4E
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 08:41:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso8079255a12.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697730116; x=1698334916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk5bEq+X+FTECApYbrlsW2qodFro6QNK8c1z/2N3JMM=;
        b=SW8eiUvtXPRStjUnqOkw8cd1UDsdmk97uYzhLcfR3JIn+GtYnaVWT8GMQzT+6V8kVp
         58ooYRTnGd1AfUjJoSguLyIUdEssOtqmRr78/KkOohYaCkA2bIxafp9jk0x5iO8wsLRB
         ZCrm9YtiI6oiBOUbYHuLVkG+vF6PMpPGDvBUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697730116; x=1698334916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk5bEq+X+FTECApYbrlsW2qodFro6QNK8c1z/2N3JMM=;
        b=Wo8iUG4ETuyC/KzVoiw2oEZVbktYmpkmpO7G/dp5zT4g41rRqIxUqC5TFbHioAiTue
         f844BAxpKTXwSZ66Z8I3lFyOUC2d2ab/Sq8syE7VQkvgngHqUGnff0u6W4+PELjrJBLc
         e4Uxqik/+4zBSTocbqMIx9tBQ1xaiA6FMc/9/ZosRdXNQQqmWYfQ76j75qQO/E47pLFQ
         2wEt7c1Stzf840NCHNhIM/VoWedhs8t+pA7fLHcfMR0vRAMxSLRB5SlaPP6Sg+7qhuxt
         aU4voy6ktCJxyxmpF+88jUUffCmp2CGLAsAu9dWwm+DCQPKC51FONSbdhRBTHuUyd+JZ
         h0eQ==
X-Gm-Message-State: AOJu0Yyu0eapV5QLKvR08ZCtDNgLYzS7e0ZcejBj/T7EZ/doPQS3/arM
	Xfszv01DO/VuWemuAwzFdYf0itniK0eKIV7IEFQdgw==
X-Google-Smtp-Source: AGHT+IEBrcNSGOdt8CpTn8Nwon45wsrxNEPShLPTSN5To5p7xCVVdai5ehKIMSMoLusfB81ge6qo6g==
X-Received: by 2002:a05:6402:3493:b0:53e:1df7:d290 with SMTP id v19-20020a056402349300b0053e1df7d290mr1929774edc.28.1697730116039;
        Thu, 19 Oct 2023 08:41:56 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id v23-20020a056402175700b0053dd8898f75sm4599781edx.81.2023.10.19.08.41.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 08:41:55 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40662119cd0so81205e9.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 08:41:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c88:b0:407:7f21:878e with SMTP id
 fj8-20020a05600c0c8800b004077f21878emr110200wmb.1.1697730114684; Thu, 19 Oct
 2023 08:41:54 -0700 (PDT)
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
 <34d7d7c7b5914674b55a6dc21ced1190@realtek.com>
In-Reply-To: <34d7d7c7b5914674b55a6dc21ced1190@realtek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Oct 2023 08:41:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9qMDtv7VTj=Vg7sx5Hqcu_WAexaaVtPOxnBTjizxPmg@mail.gmail.com>
Message-ID: <CAD=FV=X9qMDtv7VTj=Vg7sx5Hqcu_WAexaaVtPOxnBTjizxPmg@mail.gmail.com>
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

Hi,

On Wed, Oct 18, 2023 at 4:41=E2=80=AFAM Hayes Wang <hayeswang@realtek.com> =
wrote:
>
> > In any case, we haven't actually seen hardware that fails like this.
> > We've seen failure rates that are much much lower and we can imagine
> > failure rates that are 100% if we're got really broken hardware. Do
> > you think cases where failure rates are middle-of-the-road are likely?
>
> That is my question, too.
> I don't know if something would cause the situation, either.
> This is out of my knowledge.
> I am waiting for the professional answers, too.
>
> A lot of reasons may cause the fail of the control transfer.
> I don't have all of the real situation to analyze them.
> Therefore, what I could do is to assume different situations.
> You could say my hypotheses are unreasonable.
> However, I have to tell you what I worry.

Of course! ...and I appreciate your thoughts on the topic. The more
eyes on a patch the more problems that are caught. Unless someone
disagrees, I think we at least have ideas for how this could be
addressed if it comes up. Also unless someone disagrees, I think that
if this does come up in some situation it won't be a catastrophe.

Given how things look now, I'm going to plan to send a new version of
the patch later today. Though the commit message is long, I'll add a
little more to talk about this case and point to ideas for how it
could be solved if it comes up.


> > I would also say that nothing we can do can perfectly handle faulty
> > hardware. If we're imagining theoretical hardware, we could imagine
> > theoretical hardware that de-enumerated itself and re-enumerated
> > itself every half second because the firmware on the device crashed or
> > some regulator kept dropping. This faulty hardware would also cause an
> > infinite loop of de-enumeration and re-enumeration, right?
> >
> > Presumably if we get into either case, the user will realize that the
> > hardware isn't working and will unplug it from the system. While the
>
> Some of our devices are onboard. That is, they couldn't be unplugged.
> That is why I have to consider a lot of situations.

Good point! I think even with onboard devices we could already have
preexisting conditions that could cause an unbind/rebind loop. This
would be a new condition, of course.


-Doug

