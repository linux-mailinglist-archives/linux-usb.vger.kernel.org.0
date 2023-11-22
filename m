Return-Path: <linux-usb+bounces-3218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D11E97F5459
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 00:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA851F20DD2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 23:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5141EB4E;
	Wed, 22 Nov 2023 23:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXoDABKJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984CC191
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 15:13:58 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b2b3da41eso1741025e9.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 15:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700694837; x=1701299637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYxuH70oHfA52gNLRhhX4vP0LV6BSVurLPFK41qssdc=;
        b=qXoDABKJPDvyFk8Y5rtY0iwUYcq0FuBuk73Mze7YE0P9UawC8+xeXOmQ11mSDezZjB
         IYxHI/wR1I+lK9FlnJrE1PucqjwBMCbgonFJYibWciHI0rzTZuwEh9OF5jGY6qlAkI8e
         DtNnlRiD0+Bq+nW7sbr8Rs9ytxLfS19gKPWZDRCLfoPQqW9QVDNxALHcKySA87/FYZqE
         u1gGZxN4IEZ63m0SyYjX5IQuGH1cngwoq5oEgAjtEQyKMAjprDCGHRSvrX0kP7d8yti/
         YtzWnBe3h/Qj1dDdc/v4nrdAa5NrCeRrFefBGOB03+UvtuodLi6eok1+w7nzgPCLaSKB
         dt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700694837; x=1701299637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYxuH70oHfA52gNLRhhX4vP0LV6BSVurLPFK41qssdc=;
        b=KNtequE6t23gRqzH0BignIHSGppwcxJ6gWBlJ914n41BXLQLbq47AaGHVeoQPSKD4B
         eT2tun22FTV9yuDdjCQa/Uy385r3HQrvtZPWMPnFl23bozi/xm970xkAfC4hAih0xk59
         UW0CgC7tBmQ4dMcZMKvtPt5350wbNurCUgJIx7bXUJW4FZDVTXU9u18u/xpJ1AYSvnLq
         VvXbZ8eO3UbstJZfT8yTylDuWg8IqnLYHym3UNfpo91sIz/TgtXgnPDRmq/gFtquVZGz
         uwysZBNcgT5rHXgYZhD7b/Rd7UXQZdhHIx8iNl55GJlJ56fs7YUtawr88YN67twXVCGU
         BEew==
X-Gm-Message-State: AOJu0YyQ4AtUlNLZUjuVHO4HItq1ua4XcDWxuHBbuff2SOgyUaj9y4O0
	QBuVt8jjxrq7+T/xtabfwOcWI2w3q9VjHAGw2PI7Tg==
X-Google-Smtp-Source: AGHT+IFYi3BMn47KFjWgU73vrNPlY6rfEO7NJN6Pofc8xagO7DFbxSOaj7+w9+p5tuiCSj5HFYsfXanKI/Bqc/lCa5s=
X-Received: by 2002:a5d:6d0d:0:b0:332:c5ff:1ba5 with SMTP id
 e13-20020a5d6d0d000000b00332c5ff1ba5mr3509274wrq.13.1700694836803; Wed, 22
 Nov 2023 15:13:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122220001.539770-1-royluo@google.com> <2023112253-fresh-blazing-baae@gregkh>
In-Reply-To: <2023112253-fresh-blazing-baae@gregkh>
From: Roy Luo <royluo@google.com>
Date: Wed, 22 Nov 2023 15:13:20 -0800
Message-ID: <CA+zupgzWqhOhAR0_ybxTQVL928dgAqbm5eqJ6gd-0qrNK7VZng@mail.gmail.com>
Subject: Re: [PATCH v1] USB: gadget: core: adjust uevent timing on gadget unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com, 
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com, 
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The logic is there since day 1 of udc in Commit
2ccea03a8f7ec93641791f2760d7cdc6cab6205f (usb: gadget: introduce UDC
Class). Do you still want me to put on a fix tag?

(Sorry for the spam, forgot to switch to plain text mode..)

On Wed, Nov 22, 2023 at 2:07=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Nov 22, 2023 at 10:00:01PM +0000, Roy Luo wrote:
> > The KOBJ_CHANGE uevent is sent before gadget unbind is actually
> > executed, resulting in inaccurate uevent emitted at incorrect timing
> > (the uevent would have USB_UDC_DRIVER variable set while it would
> > soon be removed).
> > Move the KOBJ_CHANGE uevent to the end of the unbind function so that
> > uevent is sent only after the change has been made.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/gadget/udc/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> What commit does this fix?
>
>

