Return-Path: <linux-usb+bounces-3380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07D7FAA92
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 20:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599D01F20F12
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 19:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847E245956;
	Mon, 27 Nov 2023 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="csqgR1ik"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175F81B6
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 11:49:21 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-331733acbacso3161161f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 11:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701114559; x=1701719359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I197fyVzxg29ertOxEaJbhT/xEN2HsvYHrrXr5fJpSA=;
        b=csqgR1ikMNJAfEshrrBTDayc96NVIke5ErsJoUHo8ajqkW7yrYPEnWNmwwccr0h0Y3
         m6pp8bLBkiC/cT2Vy1mwgeWoai293PvO8d3dBbz2hJiA5MroOBKD4Vh6JOxGjYvIjWDT
         z9N5Vs5gvCwYtPBxoXVrT1U9KWTiTrA9Ttxcmbpdt8cRenFAR/n0AWd8aeTKp+zhRWLL
         xwlZpl0Hphwmn5vNf3z9yzheCrSsLiBxsA2lnfQvdoaQXWzBVHG6fFKHXxtkpeCFvM65
         e2jitNNeyaaFBc1aBdJ25mn84JC63dckJiDiZIlIccojcLNQh42E1ceqX6UWzuzau09B
         KkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114559; x=1701719359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I197fyVzxg29ertOxEaJbhT/xEN2HsvYHrrXr5fJpSA=;
        b=IwvUgjTPBrevvQSsEX6RJIkjDeAeJpxSQuRfDEbjL0rrc4v12j7J1UusicvYKds0fk
         aTcmMhYcSYcD+GV7iBgdwh3X1QfXeOIlTqLlyoxHJF5tqXWXMHmAV0g3D9G3dftWf1A1
         +pOWUmk2uVpx7YYxgl3MgKmo5HzmVlg2SCagUgnCmWcai22DthZXiyuEvcu8solmWypQ
         4k9OaEVsOD2EtB8CNUX7CFrassSFNHldXZmXOs09yLBbCNjxxTTlYcc8CV9nlSVMxLH0
         vMonktURsor3TgKZbB/xgSpj2yoJn6MVJYvm0DEvjYNw9IMjLG7yNwIl4TJN1knB5RHa
         4OXg==
X-Gm-Message-State: AOJu0YwOdS80bzHzmz8hFa7PqBf9Hz0/UrlzvN1YXiKm6SwIYHqDZcpr
	xUGnKD6zIpyKPIV7KUKjElhkquPwMpUwAG+62yzkSA==
X-Google-Smtp-Source: AGHT+IGRkofSu9LCd/I1nOg2NDDUsV1JjpsW/RQKJWRvvwf+XtkSl9MpzoYftVYV5/RGBvmqBCiN5iD9W/O8vx7yBP0=
X-Received: by 2002:a05:6000:b85:b0:332:e592:bd19 with SMTP id
 dl5-20020a0560000b8500b00332e592bd19mr8917825wrb.67.1701114559343; Mon, 27
 Nov 2023 11:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122220001.539770-1-royluo@google.com> <2023112253-fresh-blazing-baae@gregkh>
 <CA+zupgzWqhOhAR0_ybxTQVL928dgAqbm5eqJ6gd-0qrNK7VZng@mail.gmail.com> <2023112339-deeply-curve-034f@gregkh>
In-Reply-To: <2023112339-deeply-curve-034f@gregkh>
From: Roy Luo <royluo@google.com>
Date: Mon, 27 Nov 2023 11:48:42 -0800
Message-ID: <CA+zupgyr3P6C_3NwWgXyXh+RfO0JRPS5JzH3E4HNxV1JRRcrFw@mail.gmail.com>
Subject: Re: [PATCH v1] USB: gadget: core: adjust uevent timing on gadget unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com, 
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com, 
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 12:52=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?

Thanks for the tips and your patience, I hope I get the format correct
this time.

> On Wed, Nov 22, 2023 at 03:13:20PM -0800, Roy Luo wrote:
> > The logic is there since day 1 of udc in Commit
> > 2ccea03a8f7ec93641791f2760d7cdc6cab6205f (usb: gadget: introduce UDC
> > Class). Do you still want me to put on a fix tag?
>
> Yes please, and do you want this backported to all older stable kernels?

Ok I will add a fix tag in v2.
As for backporting to stable kernels, I don't see a strong need that
satisfies https://www.kernel.org/doc/html/latest/process/stable-kernel-rule=
s.html
Please let me know if you think otherwise.

Thanks,
Roy

