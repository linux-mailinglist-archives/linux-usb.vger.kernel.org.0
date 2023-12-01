Return-Path: <linux-usb+bounces-3581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E248012D3
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41B828220D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19095102D;
	Fri,  1 Dec 2023 18:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ectx/Jbm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAEAC1
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 10:33:13 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1a496a73ceso114427866b.2
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701455590; x=1702060390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=738HwGeAiA3Mv3rj5fZwSn1NgklwgVqxq6lPPHVus6g=;
        b=Ectx/JbmuY4a8WcA5t3oblh5ZxTI7RbGr8mSRFYJ2yi7u2g8kAP3CfcewcuRLnqcTv
         bS3YoFZuBltwTzcgEsBjj763f4KBdcrjeotCv74ou3QRmfOOk397t9icbRpvY4pcEMZS
         ZOZPr2iawiGgXBDvH4hykHPoUCDZTPv1vPNPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455590; x=1702060390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=738HwGeAiA3Mv3rj5fZwSn1NgklwgVqxq6lPPHVus6g=;
        b=mbJ8CPRLf564TQ0Kq4rYlDJi8E8Iyac7RLxBA4KwtZwZySW10WC1Th7crGQtzknfE6
         z/RyFqP3aadPUbXdMBNx9VIgt1+94rOXt9iPZ2YtbpMOg9zh/c4PzUlX43rb3WKB+EII
         y4+/4mtK7BdGMziZ3AqoI7zoqgk3Uc32yUIP59L+ihTbnTIz/VnZtb/MHwQFzHrXZ4kO
         s+gGGYrLamEwH+e8fwvJyp06YYid1sS1BDciT2ZoeDNuFoPnx+p8LZjhI3ftcKTt158G
         EmLfe+kxzZczKfmwFyDt5fGiJsq0U9S+CIQI1oAbbeNkppMz8t6axuJbO8xjWiA120Ym
         qNQw==
X-Gm-Message-State: AOJu0YyK1EyyRJqzBQOBId9Em5BM51x3wvXX+AzMrqZsUrqZB0Cqx/X8
	COUauT6+ffNjRDbGB6DR5xn/0FpmEnTnZZ23Y89t444J
X-Google-Smtp-Source: AGHT+IGwmBdUV5202V+nJiBKbrnEISuqH1KKTQ5IC4AW6VxSiwmRRY2YozyUKCLizAEKNIHjeZeuLg==
X-Received: by 2002:a17:906:c2d6:b0:a04:7d85:2a7c with SMTP id ch22-20020a170906c2d600b00a047d852a7cmr1032410ejb.59.1701455590371;
        Fri, 01 Dec 2023 10:33:10 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id ay22-20020a170906d29600b009efe6fdf615sm2161626ejb.150.2023.12.01.10.33.09
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 10:33:10 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so3505e9.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 10:33:09 -0800 (PST)
X-Received: by 2002:a05:600c:35d2:b0:40a:4c7d:f300 with SMTP id
 r18-20020a05600c35d200b0040a4c7df300mr234494wmq.6.1701455589264; Fri, 01 Dec
 2023 10:33:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130154337.1.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid>
 <62b7467f-f142-459d-aa23-8bfd70bbe733@rowland.harvard.edu>
In-Reply-To: <62b7467f-f142-459d-aa23-8bfd70bbe733@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 10:32:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMZGaNdSKAL8o6jtXwmik0aKgO6DdOpe9OvHth9TZf9Q@mail.gmail.com>
Message-ID: <CAD=FV=VMZGaNdSKAL8o6jtXwmik0aKgO6DdOpe9OvHth9TZf9Q@mail.gmail.com>
Subject: Re: [PATCH] usb: core: Save the config when a device is deauthorized+authorized
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Simon Horman <horms@kernel.org>, Grant Grundler <grundler@chromium.org>, 
	Hayes Wang <hayeswang@realtek.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Brian Geffon <bgeffon@google.com>, 
	Bastien Nocera <hadess@hadess.net>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Flavio Suligoi <f.suligoi@asem.it>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	=?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
	Rob Herring <robh@kernel.org>, Roy Luo <royluo@google.com>, 
	Stanley Chang <stanley_chang@realtek.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 1, 2023 at 7:59=E2=80=AFAM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Thu, Nov 30, 2023 at 03:43:47PM -0800, Douglas Anderson wrote:
> > Right now, when a USB device is deauthorized (by writing 0 to the
> > "authorized" field in sysfs) and then reauthorized (by writing a 1) it
> > loses any configuration it might have had. This is because
> > usb_deauthorize_device() calls:
> >   usb_set_configuration(usb_dev, -1);
> > ...and then usb_authorize_device() calls:
> >   usb_choose_configuration(udev);
> > ...to choose the "best" configuration.
> >
> > This generally works OK and it looks like the above design was chosen
> > on purpose. In commit 93993a0a3e52 ("usb: introduce
> > usb_authorize/deauthorize()") we can see some discussion about keeping
> > the old config but it was decided not to bother since we can't save it
> > for wireless USB anyway. It can be noted that as of commit
> > 1e4c574225cc ("USB: Remove remnants of Wireless USB and UWB") wireless
> > USB is removed anyway, so there's really not a good reason not to keep
> > the old config.
> >
> > Unfortunately, throwing away the old config breaks when something has
> > decided to choose a config other than the normal "best" config.
> > Specifically, it can be noted that as of commit ec51fbd1b8a2 ("r8152:
> > add USB device driver for config selection") that the r8152 driver
> > subclasses the generic USB driver and selects a config other than the
> > one that would have been selected by usb_choose_configuration(). This
> > logic isn't re-run after a deauthorize + authorize and results in the
> > r8152 driver not being re-bound.
> >
> > Let's change things to save the old config when we deauthorize and
> > then restore it when we re-authorize. We'll disable this logic for
> > wireless USB where we re-fetch the descriptor after authorization.
>
> Would it be better to make the r8152 driver override
> usb_choose_configuration()?  This is the sort of thing that subclassing
> is intended for.

Yes, this is a nice solution. Posted.

https://lore.kernel.org/r/20231201183113.343256-1-dianders@chromium.org

