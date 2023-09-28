Return-Path: <linux-usb+bounces-707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9E7B1F0F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 15:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A335E282172
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 13:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120803C6B9;
	Thu, 28 Sep 2023 13:56:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F73C686
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 13:56:52 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E39519E
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 06:56:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5041335fb9cso20781981e87.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695909408; x=1696514208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxPZWQf1jw9MHdfo1JPytSk2yZsM3hoAykpf52V7Iz8=;
        b=GyK907qXLz1NgByW7qgeR7RYemU/+JYohjP1NOcWPJ5v+D+dGwhW5+7T7DeQncfCtD
         MmlGPwEwFEYZIleLCf41+SB6AASCoC97djn2V4PR7e5SSoVpTaxp523AK1rDn2Lr7sYm
         4wDgT2JiZS8j+p45UISUXpxhojpARYsQ342fWQ1cELXlJXOzs6BaRYzVPuWCaNaC/72b
         b6kVBgwiM1KaHAKrK6kOUu2qHK2C2KBW1BMZLFiGC8ODBPWozyHGwtpky06W5s5Ralw/
         8IED8GWph5OVHHGsf0NpM0iqUYF4IK8AlkEQUnPcmdocvhKJWu/f7KR3ARwrmTbx1Oi4
         UJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695909408; x=1696514208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxPZWQf1jw9MHdfo1JPytSk2yZsM3hoAykpf52V7Iz8=;
        b=nDIVrHoqN7g02pSzylU7GDDT6/1omuScEbNidAgWJsI9VAsr/aHW/RSx42t1pMXvfE
         K8yKqZTsSzh+DQTqc4TGZaZC08Ca8TktvrWzQSlNYoiJ2m02O6e67SPzIyRjUSckGGV7
         Y6tIGdzKe4gwYkbo5uwG2eO7j/lCLwkER7pCcfQkm+kT6CIknqx/C4vJ93Nq3UIx92+2
         H1kPj+wzODknHvM131h4uTNJ9J/JUU6U9qwBp/gb3qVYtk7BCDQZE4Aang0iDPWWdJnS
         6WxFu82C9D58Qwxi5r/4FI8VCUld2Q9nwrfi6fi2Z5xVY+diH2YRqzy3Rja51EAZ7PMk
         5ULQ==
X-Gm-Message-State: AOJu0YyrHZr2el+2vpqVq56+PGnWJROO9RzoC4Ow7r4RNiMGPZnzC3KD
	w92xGDVwYRGvYhRst7Ahe6zmG3PiWv4wgwvz4PDlkA==
X-Google-Smtp-Source: AGHT+IGWt/wwI1p/wZzGGCUfLvgGR5TCHpLokdh/WyYX4g0mNEhcbq32z+QYCub4QkTCL//rj90mIgcT2dEcBY4jYVc=
X-Received: by 2002:a19:e05a:0:b0:500:adbd:43e7 with SMTP id
 g26-20020a19e05a000000b00500adbd43e7mr1393633lfj.8.1695909408216; Thu, 28 Sep
 2023 06:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh> <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com> <ZRVxedVoCetvqGm3@ashyti-mobl2.lan>
In-Reply-To: <ZRVxedVoCetvqGm3@ashyti-mobl2.lan>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Sep 2023 15:56:35 +0200
Message-ID: <CAMRc=MfdvkHSvCv_RcQo3MoMWrWCQn_JfbpL7RdZrrQ_cqMteA@mail.gmail.com>
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Oliver Neukum <oneukum@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Wentong Wu <wentong.wu@intel.com>, arnd@arndb.de, 
	mka@chromium.org, lee@kernel.org, wsa@kernel.org, kfting@nuvoton.com, 
	broonie@kernel.org, linus.walleij@linaro.org, maz@kernel.org, 
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com, 
	sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org, 
	srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 28, 2023 at 2:29=E2=80=AFPM Andi Shyti <andi.shyti@linux.intel.=
com> wrote:
>
> Hi,
>
> On Thu, Sep 28, 2023 at 12:18:50PM +0200, Oliver Neukum wrote:
> > On 17.09.23 13:26, Hans de Goede wrote:
> > > Note I did not ask for a new version to be send right away, but
> > > I'm afraid there has been a bit of miscommunication and instead
> > > of rebasing the next version based on further review Wentong has
> > > send out a new rebased version immediately, sorry about that.
> >
> > Hi,
> >
> > what to do now? It's been ten days.
> > I am sure this driver has been very thoroughly reviewed by now.
> > We are dragging this out. Do we want the developer to do another releas=
e
> > or do we ask Greg to take it as is?
> > This is becoming almost comical, but that is not what we want driver
> > submission to be.
> >
> > As far as I am concerned on the USB side everything is fine now.
> > Hans? Greg?
>
> i2c is also good to go and the rest looks good, as well. I have
> some concerns on patch 4 that looks like a mixture of many random
> things.
>
> Andi

It's got a lot of coding style fixes ninja-packed in there that are
not mentioned by the commit message. But as it's been reviewed by
Linus, acked by Andy (and myself) and tested by Hans, I'm ready to let
it slide if that saves me from seeing ten additional versions of this
series in my inbox.

Bart

