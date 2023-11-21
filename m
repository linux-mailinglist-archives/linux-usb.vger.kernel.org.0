Return-Path: <linux-usb+bounces-3126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B298B7F3561
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 18:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69AEA281179
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6435B215;
	Tue, 21 Nov 2023 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O72JOhAM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F14712A
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:56:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso8086536a12.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700589360; x=1701194160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA4AVc9wusU+6rRUqfOFOnbQWEj+co4/T/ukMhfmlOA=;
        b=O72JOhAMYHNP51q6iZdBjpc3Os0yN2Ka6WCpkneJFhM3AVDpfBnpaFMi3EdteZ+Ar5
         qy3YBZBtTXTU9gTBsEJgo6ARRYpS4v5h7baNnztzjZut6mvIZwUZEwjsPMGOffWPakNm
         EyBkS1jcX06G6gkl3FgZna6qFd4JmYVqTOvdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589360; x=1701194160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA4AVc9wusU+6rRUqfOFOnbQWEj+co4/T/ukMhfmlOA=;
        b=VJZnci1/QN3CLBwSDnjf44NUpliCvPmyNiz+wFIfRJkxZk0ZfKOjnpIsgO2wG2rJjU
         embwNI0Ugt6hKGghWNZmJE9Waytma6dys6sDjLBjay2bZ5eOJDbco0rVd/Uiw/SgtzQ+
         TVB6mpUTgCmceXHdirQBf+3zbC1iKQJjaYR+s1Hfx3sEU7TZnZ0DsEJluNpXYAjM6bh0
         UrbeTNJ1R0xi3hM8gWOJ0P/jFI9U6R+Ba6z+rGeZ2ZE4y1DLqvOi1sIzF86/ps0cPIrW
         FiXD6GeKk/5GNba2IqofEjhDheI3/m24Fwc3bUoIWpvej822TvxEcv5SvC2zPM2r6ygR
         xZXg==
X-Gm-Message-State: AOJu0YwMa5jXuDsksRIipZ98e6k2oS7bY0xPvyXl1QvIdQLf3x5u3etA
	Ztnn7/tDHkn2e46jrJl16oeeGnqkDxGZ+6+QA7kR0j6l
X-Google-Smtp-Source: AGHT+IHF5Gcrx5PsnM/uuIetdnxkxanTfQvxUIjUzF/H/1B+HCND8fc46F5gbtvqszxbGuszzacAtQ==
X-Received: by 2002:a17:906:3284:b0:9e0:2319:16f0 with SMTP id 4-20020a170906328400b009e0231916f0mr7849110ejw.65.1700589359979;
        Tue, 21 Nov 2023 09:55:59 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id ci24-20020a170906c35800b009fdaab907fbsm3006009ejb.188.2023.11.21.09.55.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:55:59 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40837124e1cso3285e9.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:55:59 -0800 (PST)
X-Received: by 2002:a05:600c:1c1f:b0:40b:2ec6:2a87 with SMTP id
 j31-20020a05600c1c1f00b0040b2ec62a87mr1361wms.5.1700589359277; Tue, 21 Nov
 2023 09:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117130836.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
 <20231117130836.2.I79c8a6c8cafd89979af5407d77a6eda589833dca@changeid> <4fa33b0938031d7339dbc89a415864b6d041d0c3.camel@redhat.com>
In-Reply-To: <4fa33b0938031d7339dbc89a415864b6d041d0c3.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Nov 2023 09:55:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VALvcLr+HbdvEen109qT3Z5EL0u4tiefTs3AH8EHXFnA@mail.gmail.com>
Message-ID: <CAD=FV=VALvcLr+HbdvEen109qT3Z5EL0u4tiefTs3AH8EHXFnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] r8152: Add RTL8152_INACCESSIBLE checks to more loops
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>, 
	"David S . Miller" <davem@davemloft.net>, Grant Grundler <grundler@chromium.org>, 
	Simon Horman <horms@kernel.org>, Edward Hill <ecgh@chromium.org>, linux-usb@vger.kernel.org, 
	Laura Nao <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2023 at 2:28=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Fri, 2023-11-17 at 13:08 -0800, Douglas Anderson wrote:
> > Previous commits added checks for RTL8152_INACCESSIBLE in the loops in
> > the driver. There are still a few more that keep tripping the driver
> > up in error cases and make things take longer than they should. Add
> > those in.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> I think this deserves a 'Fixes' tag. Please add it.

Sure, I can add it. It didn't feel worth it to me since there's no
real functional issue--just that it takes a little longer for these
loops to exit out, but it shouldn't hurt. I guess that means breaking
this commit into several depending on when the offending loop was
added.


> Additionally please insert the target tree in the subj prefix when re-
> postin (in this case 'net')

Funny, I just followed the tags for other commits to this file and the
"net:" prefix isn't common. I guess this should be "net: usb: r8152".
I can add it when I post v2.

