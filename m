Return-Path: <linux-usb+bounces-30946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2641C88D25
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4099C352BCB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134D930E0D6;
	Wed, 26 Nov 2025 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cu4X4RRE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E43019C5
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147796; cv=none; b=fpZIjS4wd0UMYOdeP+SJhvF69HIHVwyd1ZXG3qyVNjyGkbnAgLv3NcrGdZgKvjTKFo9DaIR87W1PwL7RAjyWQrpKKn76Mmq6tJxo4tHTAZp0bBM3pJpywO8CUIbMmd52kvKMgjOi7+u4VBZJ7hVcH8n90Km9vKeJVRj+M/45iWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147796; c=relaxed/simple;
	bh=dVPy5XLBhOgZbZCzLapdCt0HVAjoYHpzjXjWKaS7PB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frtY2vyEw1vmHAffdIPIjY07styVzm40LfLj5pjjUN5piXUY/KBLVgYya9H901m2pug2Pgrxdpd30uPnuCWj1oRzvH/dSW+sG++vrTXZs9fhewPkBWidQYtSbTwDlw1rv2ui5DoZgu+MeUWlUt10KY2rz5h7VgxFM/fdl/roFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cu4X4RRE; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7633027cb2so1150162466b.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764147793; x=1764752593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4M00dH8JQgl9t4fxjB3zrnN5riQ3RKDpVhq4yoqpsk=;
        b=cu4X4RREi2tPPfOHy0sPj2H6ZetDxYBlN1a9k9yPI3vq/A5L+QZItATknpaOMY5Ijz
         LI2gnbbDlfDhm09jnRGYN+e42oChdegn433FAl4crpKkG3QWS4WAyjQC8o61veARNq1r
         xS5X/HG0h7oMHG267DI01vSUwqMHVoF6dHcNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147793; x=1764752593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k4M00dH8JQgl9t4fxjB3zrnN5riQ3RKDpVhq4yoqpsk=;
        b=gQRh5L7Yx+ESKlVvVsDYxAtPKNczPoTjT5SfwSNxY8nMXtmKH9hbmOygdUgWIvIS1R
         OsHHNvI0tBnHCl9TrdAISuQRlGIdIqdiWPw9nF2RF2tE+MAymTgA152CcMrg0pA7/SJ/
         Xql3CkuVrESXdhDaVuaKUZ/X69U9f6bCIc3z4Q/u3PO7RrGGEvLgzjCRIuZVCHDyDDpQ
         aHMKHSgkjBTwjRHgkuQ+09O9NznnV5GqvEQmgrpQWVYsdgyvQ27xbx3URcvuqvIxs/LS
         dmhhQj41tFc6Yd3LhR3ZlTr7YpFrn62JlfcwkWDwv6/aj4lBm2i/MAbDNIgnbVYX9E5Y
         Q2+A==
X-Forwarded-Encrypted: i=1; AJvYcCV8Jnl9PBClfWUIW+njs3ofSCgjQzNPXm+PVYDOpqjp68KFnau/fsMA+74T9Su91eyq8nVtk3152a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQcf1fYmQuiHukfcLEGzehNVPMyE8rPV6dd30C0angQ3zRUC2
	OAA8CMg2Tt9C0q83Gtu9DUsgU/dGG+jzp6aFDKTSReH2MoSG2RpcEErXQp9JcPVIldLOLyL3KcZ
	UJgU=
X-Gm-Gg: ASbGncuXaIeYJ+iE78fOfwtFQ9Wov4XA/cP3qfb2IVh1mbIz7WBcL2c4qg0oCA+PiOv
	7gykkYBGM/BEq0jhvlz7OoR0K1+0PfdJGyvqotaQjdwJmEZ3KRzUmBKLesWsjuEuqqdnKfMq5w7
	R3Mb5C+LONvrxpFK+QKzlns9AXv6SU5QprGlfDXZxDKJ2tfimywhP8tNC2l3+9I+Mr+Q9tgv3H6
	6AC58P9NAv8nQOMKOy9sYt0RWkm6NGuru0Jy05uQOXGOoNpJ8bjPBQ31Z9Td9CRNaQcIC1LDSGS
	FhLKBa16OgFsG4kl3ubaX6SkohZ3YTKiny/KhS1bXcymHeGq9Tjpo32+KRZt8i1WFnpVPF+srpv
	F1PRBfP0mAHk1ALradOfRKbF2V68Gtv00gT0zBOHiHZISwsjEmH7y1XWmqsk/UxAddpwfXy1eh2
	V3YMsBRcbpEsS3B7TGC//lMxwyUAKJSwyej70T321j0ErXMO3cz0tR9HFcZ0Y1dxA=
X-Google-Smtp-Source: AGHT+IHdhVJ60xf1WeWpFZU/0wPJRCpkc/KcK9Wa9/m2Ob62cawu5qlwq8+Rg5LPDyXG5I4GcjHKgw==
X-Received: by 2002:a17:906:d550:b0:b76:630d:fd27 with SMTP id a640c23a62f3a-b767153a62bmr2003961866b.5.1764147792841;
        Wed, 26 Nov 2025 01:03:12 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76e11458a6sm107004166b.6.2025.11.26.01.03.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:03:11 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-643165976dcso6697a12.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2o+RPQQxhMq4kCHuD16vII8Xo5JFCK1Xy+peBUInvHpxAYLi8JZnOthWjONYp2QUPwb3Psy/U3fo=@vger.kernel.org
X-Received: by 2002:a05:6402:110c:b0:63e:447d:6aee with SMTP id
 4fb4d7f45d1cf-645fef40259mr22275a12.0.1764147791018; Wed, 26 Nov 2025
 01:03:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-ucsi-v4-1-8c94568ddaa5@chromium.org> <2025112513-charting-napkin-120d@gregkh>
In-Reply-To: <2025112513-charting-napkin-120d@gregkh>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 26 Nov 2025 17:02:34 +0800
X-Gmail-Original-Message-ID: <CAHc4DNLvwkWOdzu7apPgKyx_+VRAHByi6AwCmzp7bd8ZHBmiKQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmrPjmlMC5Bcol_Og7qIwFqt3i3iR9M83NwbRJAkzfKouK0nvBmKzsISU0
Message-ID: <CAHc4DNLvwkWOdzu7apPgKyx_+VRAHByi6AwCmzp7bd8ZHBmiKQ@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: ucsi: Get connector status after enable notifications
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 7:46=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 25, 2025 at 05:31:24PM +0800, Hsin-Te Yuan wrote:
> > Originally, the notification for connector change will be enabled after
> > the first read of the connector status. Therefore, if the event happens
> > during this window, it will be missing and make the status unsynced.
> >
> > Get the connector status only after enabling the notification for
> > connector change to ensure the status is synced.
> >
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
>
> What commit id does this fix?  Does it need to go to older kernels?
>
> thanks,
>
> greg k-h

This logic appears to have been here since the very beginning. The
commit id is c1b0bc2dabfa ("usb: typec: Add support for UCSI
interface"). I will add the Fixes tag in the next version.

Regards,
Hsin-Te

