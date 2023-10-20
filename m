Return-Path: <linux-usb+bounces-1996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8D77D1366
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 18:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B301A1C20EFA
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E921E528;
	Fri, 20 Oct 2023 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NTwiOEer"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1C1DA4C
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 16:00:06 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D45CB3
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:00:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-991c786369cso153979366b.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697817599; x=1698422399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/hb65rqGn/L+bqKuL2ueokcLD6OZN5u11ra2F8eMBc=;
        b=NTwiOEerUxv9Wkty3ZTjlqvkkhPlY0BzVmEI0Ku1gsbAYaZX6o1oe7HardzmYbocgr
         Hxmq4TyV7KDvzbV0pFFQtdm8nye+OcnQTe3NHRe8FmW/yP/KOKUrLxtx6D35aatIMWG+
         OcIVVoIAKz0pS1MuNuOXxnOt3BBjrV3zQxERk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817599; x=1698422399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/hb65rqGn/L+bqKuL2ueokcLD6OZN5u11ra2F8eMBc=;
        b=Z2aL7q/8Uns18838Pn8bkfPuzyVFPSPKUPeFIfbAJ6kKaB73IBGRvLAcyB8EGuxMkj
         Efhn6SGi776EBh4JYguNUwwOP5p/thEfxuAaz74hqH51Kg2jtA0aFxQV/KSqizxJ6RQv
         pGBzf7+JdqmZiOR+3yU/slScNdy2Qqafbe74+WEZZaOfMs3R++MDAbefrWRWLHs26eDt
         uIacboebnw6oySqkuUmELC5+fVeiT+HQkjCz2mqGE4M0iYG1YLfSe6GoZ7GdeSeyVPlF
         U7BDpLW1ZirwPxvCTFJYE66f45L1lHqhbSPZVbz7jfotx1b0s4VALUJfdilpQ6GRva/d
         bBtQ==
X-Gm-Message-State: AOJu0Yz/Cp+YXQglOZk81/XsB3h4uPDjJC93iiOFnhmzyofVDk9dvJDq
	D6v5lhRX9Z+R6Obgjm05Z62GiZiJQO9e0ubpvTEbDIbc
X-Google-Smtp-Source: AGHT+IG02ABTmoqXAbP7ZkKXNd8xcUgmtQiFnFnuOc/tpGdU+PQygXU2b5ztk0F1vh2ntt9uJtefYg==
X-Received: by 2002:a17:907:948e:b0:9bf:9c58:e91e with SMTP id dm14-20020a170907948e00b009bf9c58e91emr1513343ejc.56.1697817599410;
        Fri, 20 Oct 2023 08:59:59 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id w21-20020a170907271500b009ad81554c1bsm1721576ejk.55.2023.10.20.08.59.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 08:59:59 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso45025e9.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 08:59:58 -0700 (PDT)
X-Received: by 2002:a1c:6a1a:0:b0:405:320a:44f9 with SMTP id
 f26-20020a1c6a1a000000b00405320a44f9mr120847wmc.5.1697817598277; Fri, 20 Oct
 2023 08:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020083125.1.I3e5f7abcbf6f08d392e31a5826b7f234df662276@changeid>
 <60a358c9-b44b-4d25-9a20-aa9e00c65ab6@rowland.harvard.edu>
In-Reply-To: <60a358c9-b44b-4d25-9a20-aa9e00c65ab6@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Oct 2023 08:59:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQ22p7iDdzK-CXOBEqpu0b3J=LKRZuPcajQWFUmr=1cA@mail.gmail.com>
Message-ID: <CAD=FV=VQ22p7iDdzK-CXOBEqpu0b3J=LKRZuPcajQWFUmr=1cA@mail.gmail.com>
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

On Fri, Oct 20, 2023 at 8:46=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Oct 20, 2023 at 08:31:38AM -0700, Douglas Anderson wrote:
> > When we call usb_reset_device() and a driver doesn't implement
> > pre_reset() and post_reset() methods then the USB core will attempt to
> > unbind and rebind the driver in order to make reset work. This is a
> > great general solution, but it has the potential to loop forever.
> > Specifically, if the USB device is in a state that the USB device
> > driver issues another usb_reset_device() after each rebind then we'll
> > just continually unbind and rebind with no end.
> >
> > It's difficult to address this condition in a USB device driver
> > because it's hard for the driver to keep state across each
> > unbind/bind.
>
> How about just adding appropriate pre_reset() and post_reset() methods?
> This is precisely what they are meant for.  Then the the unbind/rebind
> loop wouldn't ever get started.

Right, and we have pre_reset() and post_reset() in the r1852 driver.
The issue is that we are seeing occasional control transfer errors
while the r8152 driver is still running its probe() routine and we
want to reset in response to those. It is relatively difficult to have
the pre_reset() and post_reset() methods work properly if failures
happen and probe() hasn't finished yet. The current proposal I have
for the r8152 driver is to have the pre_reset() routine return -EIO if
we saw errors during probe, which tells the USB core to unbind/rebind
us. This gets us to a known good state. If we need to do a reset later
on (after probe finished successfully) then pre_reset() and
post_reset() can avoid the unbind/bind.

The worry was that this could cause an infinite loop. Hence this patch. ;-)

-Doug

