Return-Path: <linux-usb+bounces-4141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 410668126AD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 05:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D36B31F21AC3
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 04:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816F65381;
	Thu, 14 Dec 2023 04:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxqQrAS3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97F5D0
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 20:50:08 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so96934531fa.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 20:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702529407; x=1703134207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPXgaklAtqnMBfWDwYCSUQdvrrOi+pPvXu/eQF6+hVM=;
        b=UxqQrAS3pH/PRWfC+8rRgpz/+dIk2TiEvhtzpO6brsYxJf2yLGBlItFWDrhOrZkXZN
         0u5nTihrzrDm3aA5KDeWc+5XlMuvZKyB48hmd+QbduNbqrkNPFJ7kUD5kgyFlF0vSKB6
         OpQ0KqtYCjdsbrx0o/FmNtVyd5/GZflRgI97RwMyQ1X9hNikhvjQHYm/ChvYw4USXMQK
         s1A4TqXHqWR6xE7wcfriwsmhYGJr6QSjwRvmVzhxpW9pYEiNbEhuuETqlu95aM+oDy80
         6fW4nheDP4fQUO0+LT20016VFjPrnC371q62EbI+kOdcwpDNnT7aIoL1IPVfOQQHJD7S
         nmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702529407; x=1703134207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPXgaklAtqnMBfWDwYCSUQdvrrOi+pPvXu/eQF6+hVM=;
        b=fGs0aUX95JOS4ncd0TArpxq1D56tz9nq01EANUx1HwwGI0g3sqhgNu2BY22WqF50Dg
         K3Kijpttbn11z4XZ/1VwHTgVWMkC6+KXKGerZCHjQLgkaVTpGGWXrIkFbECtL1hDU2rg
         sArfz4IoU/gmrZhGtklZ1g5pbAz3RKONJjZgwsZPKXzFY/+Yr8b2L4HeD5iYOYFZD7eF
         /UjQaKYyNjKAxekzkBFOs+NhqKQsihmeg1uk99kuMKI8m3D8LZpo40vFtGvthqbWLEwD
         Z2GqK/YaAEruyCOX7auXITKiU6xmGqxG+dMCYiQJ+EpdgPGtTLqhjPi6vga1eRTS7Fit
         SjNA==
X-Gm-Message-State: AOJu0YzejNiFST9jrbuq32cJcl7nozZxLn/fjFSFwVC5hmRH2SfJ3pBV
	lUJcJvF0LRDVb4pcL+FjfwLi5IMI2VMjdHmJPAXSk5U6e8U=
X-Google-Smtp-Source: AGHT+IGqx0lOjYkfCwl8MWHCYRsQsHKOw1rKWK/eBtpQ6CIHyYSig16jBtJ1HcjO4XBmG2rtYgpxSQXa6Fo7w+HxLqQ=
X-Received: by 2002:a2e:22c2:0:b0:2cb:28ce:3d46 with SMTP id
 i185-20020a2e22c2000000b002cb28ce3d46mr2672094lji.4.1702529406561; Wed, 13
 Dec 2023 20:50:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213191649.GA28331@cmadams.net>
In-Reply-To: <20231213191649.GA28331@cmadams.net>
From: Rajaram R <rajaram.officemail@gmail.com>
Date: Thu, 14 Dec 2023 10:19:54 +0530
Message-ID: <CAOiXhaLQB45XzQLjbew50t-brA2aCYTQ5mMG=J4yW-qO=cMiZA@mail.gmail.com>
Subject: Re: See USB-C charger info?
To: Chris Adams <linux@cmadams.net>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 12:48=E2=80=AFAM Chris Adams <linux@cmadams.net> wr=
ote:
>
> I accidentally plugged my notebook into a 15W phone charger instead of
> the 65W computer charger... but got no notice under Linux about it.  I
> happened to reboot for updates and got a message from the BIOS about it
> (this is a Thinkpad T14s AMD gen 4).  So I started looking to see if
> there's a way to tell that from within Linux, but I couldn't find
> anything.
>
> Am I missing a way to tell?  Would this even fall under the USB stack
> (if not, any suggestions for where might I ask)?  I know USB-C is a
> "complicated" port.

Please have a look at
https://github.com/Rajaram-Regupathy/libtypec/wiki/typecstatus---Gauge-your=
-USB-C-port-for-better-UX

>
> --
> Chris Adams <linux@cmadams.net>
>

