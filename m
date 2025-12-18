Return-Path: <linux-usb+bounces-31592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C5CCC8A9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DC233051323
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600333F37B;
	Thu, 18 Dec 2025 15:34:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7775E32E142
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072048; cv=none; b=a5AOBAfrJTpuXmQ81bO3PtdQsFfAiq38F6DGWR/gJzkoZLKpQDuTw9Mr8/+tQ9VHVcut4wbnH3fBC8unjnk4tZKHyrxzIdJSW9eXw17vP0jIkOySbzAvbEJTIyXKSCKbwjOEeVzzuFub8cN4TQCHzFnoASiAkWsWah3FHkhoLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072048; c=relaxed/simple;
	bh=azzl09Wx7rt0wPbIl6zF794mRt/KoBI4Cg5cx5Yj+oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imQ29eZm6gkQXAfh/HvAp3hbYtFX2evG7F3stbrZq2u1+ufcZhcrhBSkHBkw0CXrHv1BX+W/ygCXjsi/Rarsbjj9DaQHj4470TdP4VnU9ETi1lQk3NlEtKo6etxYqYm5HhvjgqFu6axIAAIrkTkPwhHp6jojh7ww3lOeIo/kHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88888c41a13so9499616d6.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072045; x=1766676845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXHlTDVJTF5vvWPU3rkwyK6a19VuMS7dqDcJr9Xe7V4=;
        b=LnzWItmgMVT30cTJ3wkXOyjF6XuyoUmIDzt6+rhVML0PCGHDOvHgu3AtI9YwZwu+U3
         GIi0qE5fMRX8D4TQ2ZaojCFvI7CGrjBMYoDQXh6/U2c6+gyJKb4tYEu9kLxgiVumgQGF
         k1Omajc/Fr/ZMBJ1/ME+0UWKgskLIU82bUxQBv53vI/QBKtgC07pT5+8Ze+1bWu3/Vmc
         CULCcXyXfgWajPkzHD21Iyve7Vjn8WoyOxza0z1cpSrfFOxxThkwaLeQ8Q7N+5CV6Z6u
         smKZPfn9Fcnnquq191sy1gAiDf6mKTaUat4OosC7z/s5B6i0CewIyE2X8GyTBAXNHGZg
         VW5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqABcfWgNHxo3lSAnyzklqToMuu8Fs84EB7Gbt4oz/wHFsAN18lbmBwJIcRVwB43RjfVTSLhfwDhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqzo6VV5YcZyzqLIYbMp4KJdojF53XrDsyA7zxJ0F+hOD3agGW
	qeF8n+Jpk8K2qtkZHLdzO64rC1Gpq56EqBKnnHjQJa6NtOdw1BLPL9OkoPeGSuIQ
X-Gm-Gg: AY/fxX52sWhcKNSk68SoDR9jUtq+iXfS7RFSRoGNgumBwVc9spqHUxivUqXpFx+3kw0
	aRmWZ9IfBzR/h5BprMxbBJ/ZSCeWc04HfbZmIgWtJqpRBRLB/4Vcii3NhluLDSOAQmwFK3Y0sCc
	sglXKh1bpfkIJqEnz1+4bJxhoE3/cJK/9KquVrJyl2Bdq/EYAK5hMzCl1AXNnBUK6Gx+JQJxlfE
	/1y4mkM1hI8A8apUOOXNv3EA9i9hIg6qm7rNPS2Mn2v+4RDIHo/pNz3WyXzjXW8KiatI/FyR0CS
	kjVNn1I9pT+Zas+nU59k6vjR3u295B/pCc6+E6ofWe3NOay/bAM/0CyqWzzFebWYHh0bf6tHG/V
	F2srdxb5VP/n43/+4DcNQKEnHZm+xqYSXfdq0Us8t1x/hO/hzVlld79PhGTjZu3jWqeVM5xKfz7
	P+4jk4Z7FP0J7F4FRvY7Hu5LpTvQi3zvFcpBsUA+MDMJQvIVLa
X-Google-Smtp-Source: AGHT+IGf38/Qmg8aq8qZKTvPTdDkoyEEfZyibQhejLzTJfD7tndBdS8HISPi35odGvpajoLdNPlSPA==
X-Received: by 2002:a0c:f807:0:b0:880:501f:608 with SMTP id 6a1803df08f44-88d83983b64mr189376d6.46.1766072045091;
        Thu, 18 Dec 2025 07:34:05 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88c61372861sm19142986d6.47.2025.12.18.07.34.04
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:34:04 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so5335846d6.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:34:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtMCIDqTIT1pbMILtT4YJYmwrUbX43UNx5aIpZSdbf1MK9r+y5nMFMiy57dTAgHJP+rlkbd3QJUKk=@vger.kernel.org
X-Received: by 2002:a05:6102:14a1:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5e827854ca8mr8511390137.38.1766071730637; Thu, 18 Dec 2025
 07:28:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:28:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
X-Gm-Features: AQt7F2qLc82Kbfmr6BXfh2mc72SoQ2IFZ770WV9-Gsf5ezj4RJc3ZYutw9_Yvk4
Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Support TQMa8QM
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
> 1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
> as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
> property on the parent clock.

Hmm, clock consumers should have no business with the names used by
clock providers, even less so whether those names are specified in DT
or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

