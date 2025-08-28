Return-Path: <linux-usb+bounces-27339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC9B39214
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 05:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856B01BA7DBD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 03:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793E62609D9;
	Thu, 28 Aug 2025 03:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ORH8CR5s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811B26057F
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 03:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756350351; cv=none; b=XuocmP3VMDtSON6XUcJQrcFKFgh5UF6+FNNzo2hBW2yD92glPUAz2yXAEKjOFqqLLgPCena84EnevC1RG07/SUdAgETb319Pj9Un8lVAkiYG+q+Rsct63ijoGfxfKkxGI+oklhMUJnzv+Z3YfPWh9TeuW4bkZZYz+oZIAQ2Hhb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756350351; c=relaxed/simple;
	bh=CidSD1n9rlERIzk9DkKyrAwnCi69XYWnZbq6R3cCO4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoCwkKaPvIMkS0V/4YcjyKHYsiUry/hBRKMMJFUXNr8MUXAPUMUxplCnCh249V6EhgtQX/GOTo1L02Deg21GjXfkqhriGY3Qus+wJsZVzBcKvy74qP6CdvkVpAhjGgiwdQg1Cb9q0Cjr7zZjtfimca5y3MgaCawc6cA9Z7PIkzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ORH8CR5s; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-323266cdf64so417590a91.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756350349; x=1756955149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnSBEhSr/X/xb8bRg4tAGhyIlVt7y4Lpl82rzeetB8A=;
        b=ORH8CR5sf+y6OSU7pNj4rkSvvQ0VSBVsU3v/rRTBfPhMONPNwQkzu5c3l/LuCG/ii9
         eIJGoxP2UmHS7qxhHuMOLJiy2YUE/WrNvjfPD4ruCrFkfJA6RRRffLV0TeOm7NObn1Kl
         ESJHLORBBGdIoqCKNNoUzkP+Hy/9sppmbpKgHNkn+dFHPZ/+W5g3RhlIfA9/FwUZsaH0
         1v6j/HdvDUZd3X0moc5d8uuG5rNDeSBfJo7I8n3HJnVmWcaJXKlJiRxkOBBwMa4gSqoj
         Va8PLUPNA7dEvQHlA8T0Mh+iMxZIXNfFb+5XzY7b2PAPXFs1qUZY67FKbTbRF30A6Zlb
         XxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756350349; x=1756955149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnSBEhSr/X/xb8bRg4tAGhyIlVt7y4Lpl82rzeetB8A=;
        b=fUL3ZajJOSA1sUCtfdjKysCAwljVB17PFwTZpcEBXmtp9f0MrT6RfRlLmy864tqvhD
         xE1l6l91mtDoWQdtHAOrQRUZiatKg84fK+Web5g4+yXsSHQaY0kapLkphqr6tAvPmct9
         DwYgrA6bQuV6CLESjSwHiNANlhZF2CTtXCkDao3aNoR3AXC99F5m+p6RfiCyq3OL7w2b
         KI2ObZNS1IGuz8HfBz3tdMFGm2nRBeoAq9iRl1LIk9xfMErAqUV+BsvwX5b6E3R9g6cQ
         wStWhPTpB2ktnn9pvTJG/RFGxFimc0DXYeSpYxfaKH4EL2TU9dvGif623zxl3/zLvXYe
         PLgw==
X-Forwarded-Encrypted: i=1; AJvYcCUNm4vvCWALFDjbYAVOkt2MlKtffg+mLXIUqUxm/+Keka9gEDLC910atf27kp1qXU96Co3ybWBsTng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjbRtD7wqFdtEZCc1cKmlavTriChWOZ4HFLVMqMKpPWsQieGl
	pJiFTjE38TLgJq7IB3NdBZvHJF/RUpLfQvwHC2LoUV8/OoLxeYnJmSbyTTYUuMJEnY9T8U+b2xH
	wuTKD8Vb/TbBFRsh8iHm6du0MtE6S/qEhNDEvO5za
X-Gm-Gg: ASbGncuWjUQUygRI4qIIz1VwR8JxwlzHm2KV2hqEUVEAPoL5LGVQw5WFZ6XP89eNaO/
	sypect7HSujx7/cgxzZpgqJToZ/ibK8EmMy9HX58OpLwzjniqBHXYa1hsGOBsYtyAKQKEVfYCO3
	BZl22uNW7PGl15jB9mDUDzfGScsX5+itRzmL3eVylhLSHGghkd4da1hH1SWjvie3itgFRpCRxjD
	ZpmILq3GUR2E97GDqYAX2GUw+N6So/xVvxOJ0IhEvx6lZ0LyHX+9q9Cow/ntPTWusmD2pTjn3LS
	Ps7GSKm12qJCAQ==
X-Google-Smtp-Source: AGHT+IHSGFxIBDgJh3c2Z2bWu/Rbr63RbZilO9FwNnrGztx4tdK7grXntwVYLujsiRnkLWfr8RIu5BTbiy3va2w4Mtw=
X-Received: by 2002:a17:90b:5443:b0:311:f99e:7f57 with SMTP id
 98e67ed59e1d1-3251774b90fmr28750696a91.23.1756350348714; Wed, 27 Aug 2025
 20:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827233108.3768855-1-kuniyu@google.com> <87ace089-0d1b-474b-aa9d-aed1e83062bc@lunn.ch>
In-Reply-To: <87ace089-0d1b-474b-aa9d-aed1e83062bc@lunn.ch>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 27 Aug 2025 20:05:37 -0700
X-Gm-Features: Ac12FXymkiM1Yfm2E-kYoLAi6XgPXlscnU5RuIhFMyNd9WTo_8Ps9WQJQsz-D-o
Message-ID: <CAAVpQUB4VOZLkF1QE3nN7Rp3dRai_VXpVZU4X9nMNU+rcJLOeg@mail.gmail.com>
Subject: Re: [PATCH v1 net] net: usb: rtl8150: Fix uninit-value access in set_carrier().
To: Andrew Lunn <andrew@lunn.ch>
Cc: Petko Manolov <petkan@nucleusys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzbot+b4d5d8faea6996fd55e3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 5:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Aug 27, 2025 at 11:31:02PM +0000, Kuniyuki Iwashima wrote:
> > syzbot reported set_carrier() accesses an uninitialised local var. [0]
> >
> > get_registers() is a wrapper of usb_control_msg_recv(), which copies
> > data to the passed buffer only when it returns 0.
> >
> > Let's check the retval before accessing tmp in set_carrier().
>
>         do {
>                 get_registers(dev, PHYCNT, 1, data);
>         } while ((data[0] & PHY_GO) && (i++ < MII_TIMEOUT));
>
>         if (i <=3D MII_TIMEOUT) {
>                 get_registers(dev, PHYDAT, 2, data);
>                 *reg =3D data[0] | (data[1] << 8);
>
>
>
>         /* Get the CR contents. */
>         get_registers(dev, CR, 1, &cr);
>         /* Set the WEPROM bit (eeprom write enable). */
>         cr |=3D 0x20;
>         set_registers(dev, CR, 1, &cr);
>
>
>         do {
>                 get_registers(dev, CR, 1, &data);
>         } while ((data & 0x10) && --i);
>
> Don't these also have the same problem?

Exactly, will fix other places.

Thanks!

