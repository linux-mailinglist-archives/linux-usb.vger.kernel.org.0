Return-Path: <linux-usb+bounces-1999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A805D7D1405
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 18:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5C91F23107
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 16:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EC81E538;
	Fri, 20 Oct 2023 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2KhNMeg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCEC1EA9A
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 16:33:41 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D813FB0
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:33:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso1531775a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697819616; x=1698424416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97Ne1RJP4pw4GszjpVk51BTUsCG1MALd+JeCrnEPXbI=;
        b=l2KhNMegIqui1Q9Q9L7v5o3BcqyKLhNKhnK74qyY6Zf2Ux84ehgF/QzffZmPpWOA4R
         0iuwKvKLR59vY+tN7lpqPtvlMtMvdWXu9dtLpyr/QBBPQSgO8z9/wflJZ0aZEmCR4A4E
         jFEKQ6bgDDQG9VMzPNyKQtLU1T31iwJWLxi4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819616; x=1698424416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97Ne1RJP4pw4GszjpVk51BTUsCG1MALd+JeCrnEPXbI=;
        b=VvSahVkTJhB3w8z8EEJ2prklYdUY+D7SUTBF5HZY2qQuLLvln8FrkgCydOLhHFXYXa
         rrp3KTD3HP5t4yGmPNZMsUOxNlTTJO27H36TQxdPJAM36F5oSfIFmshhDTKuQymt2OAl
         629/UroFQNLT2M1W7a3fWRqSCUhXheyfqNivMRg+12o6bENwinywmW7j0DhAMPxMBomD
         osZt1hmTjTZTMv2QpprvnfzV4IhE2D5P/KagEtznU5mOhIwp8AVtII9lQxYoQPUCu1yg
         HW7Id19tgXNNVpGsF4mooktrq5+hafG6O+JqRw5qdb3vCwOtQS9yIlgSQp1uwgICVsj2
         4rxw==
X-Gm-Message-State: AOJu0YxbxbL80xV5GiA4EYXieP4ZEGPD2HH+RdCS/pHWh9iwPB2lUMA+
	UjS4wdbImCactGKpdaXDXFEbqrA5BR/jMEVD4c3RuVb/
X-Google-Smtp-Source: AGHT+IHxrlqr5D/zpBTr94rrDRL8IoqHeQO4kIvOPbSU7rZ9cxhLMzL2T07tU/CU5CFtc6fEtn45jA==
X-Received: by 2002:a50:9fcc:0:b0:53e:1f06:9676 with SMTP id c70-20020a509fcc000000b0053e1f069676mr1923565edf.37.1697819616106;
        Fri, 20 Oct 2023 09:33:36 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id cb9-20020a0564020b6900b0053ebf32da31sm1743728edb.57.2023.10.20.09.33.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 09:33:36 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40837124e1cso125e9.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:33:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3488:b0:400:c6de:6a20 with SMTP id
 a8-20020a05600c348800b00400c6de6a20mr118680wmq.3.1697819284470; Fri, 20 Oct
 2023 09:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020083125.1.I3e5f7abcbf6f08d392e31a5826b7f234df662276@changeid>
 <60a358c9-b44b-4d25-9a20-aa9e00c65ab6@rowland.harvard.edu>
 <CAD=FV=VQ22p7iDdzK-CXOBEqpu0b3J=LKRZuPcajQWFUmr=1cA@mail.gmail.com> <2b6352b1-e192-47d6-bdce-b63216ab674b@rowland.harvard.edu>
In-Reply-To: <2b6352b1-e192-47d6-bdce-b63216ab674b@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Oct 2023 09:27:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vv+xiJu0MwEgF9VpdzcQVmmCE+m2Msa09QXB_gh4U=Hg@mail.gmail.com>
Message-ID: <CAD=FV=Vv+xiJu0MwEgF9VpdzcQVmmCE+m2Msa09QXB_gh4U=Hg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: Prevent infinite loops when usb_reset_device() unbinds/binds
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Grant Grundler <grundler@chromium.org>, Hayes Wang <hayeswang@realtek.com>, 
	Bastien Nocera <hadess@hadess.net>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Flavio Suligoi <f.suligoi@asem.it>, Hans de Goede <hdegoede@redhat.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Ray Chi <raychi@google.com>, 
	=?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
	Rob Herring <robh@kernel.org>, Roy Luo <royluo@google.com>, 
	Stanley Chang <stanley_chang@realtek.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 20, 2023 at 9:23=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Oct 20, 2023 at 08:59:42AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Oct 20, 2023 at 8:46=E2=80=AFAM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Fri, Oct 20, 2023 at 08:31:38AM -0700, Douglas Anderson wrote:
> > > > When we call usb_reset_device() and a driver doesn't implement
> > > > pre_reset() and post_reset() methods then the USB core will attempt=
 to
> > > > unbind and rebind the driver in order to make reset work. This is a
> > > > great general solution, but it has the potential to loop forever.
> > > > Specifically, if the USB device is in a state that the USB device
> > > > driver issues another usb_reset_device() after each rebind then we'=
ll
> > > > just continually unbind and rebind with no end.
> > > >
> > > > It's difficult to address this condition in a USB device driver
> > > > because it's hard for the driver to keep state across each
> > > > unbind/bind.
> > >
> > > How about just adding appropriate pre_reset() and post_reset() method=
s?
> > > This is precisely what they are meant for.  Then the the unbind/rebin=
d
> > > loop wouldn't ever get started.
> >
> > Right, and we have pre_reset() and post_reset() in the r1852 driver.
> > The issue is that we are seeing occasional control transfer errors
> > while the r8152 driver is still running its probe() routine and we
> > want to reset in response to those. It is relatively difficult to have
> > the pre_reset() and post_reset() methods work properly if failures
> > happen and probe() hasn't finished yet.
>
> Why is that?
>
> >  The current proposal I have
> > for the r8152 driver is to have the pre_reset() routine return -EIO if
> > we saw errors during probe, which tells the USB core to unbind/rebind
> > us. This gets us to a known good state.
>
> Don't you also get to a known good state if pre_reset() and post_reset()
> both return 0?  Then there's no unbinding, so the driver can just jump
> back to the start of its probe() routine.  Or fail the probe, if there
> have been too many errors.
>
> >  If we need to do a reset later
> > on (after probe finished successfully) then pre_reset() and
> > post_reset() can avoid the unbind/bind.
> >
> > The worry was that this could cause an infinite loop. Hence this patch.=
 ;-)
>
> With no unbinding/rebinding, any loops that occur will be entirely under
> the driver's control.  Then it should easily be able to avoid looping
> forever.

Hmmm, OK. Let's see. I guess the most annoying thing would be dealing
with anything "devm". I guess in the case of the r8152 driver, though,
there is no use of devm. Thus I should be able to do this. Let me give
it a shot and see how it looks.

-Doug

