Return-Path: <linux-usb+bounces-28912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C66BBEDAC
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 19:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C35C84EA947
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 17:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FFB28A3EF;
	Mon,  6 Oct 2025 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwRbNZJh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7602442C
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773280; cv=none; b=aqlQ8zQu3s1hcHxp4oF4K1SNhJWGbPWwe/StL8zphaihh9hmbyIBmOJb158xMPlJBax7IbR1v6pezXKpLb5TiJo/5uN8OnCcSx4vn3aSK201g2sm6SrlOrmPQ9jAQOTBCBOg74Gny+exab01lZw4jUZ3mJABB2TTm0sxUjHxhu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773280; c=relaxed/simple;
	bh=SaOJ+bWZKtnYSvf8DZSFyMYB3L1UYISDcDX/6cb7FRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkcYY7Fh+NSLVP27hR0U/o3LzSIng6jDu7gcdsPUNbo6X82l8QR+Y6W16vdSiuZVPvt3FZNQHi0sOIc0YyyRSxkBzoDaNy0XTQyeoKg9Ju0m/ScW7La0WPgSOMEKdQzlIuNSGzgJsVnRCcNmRElTaUzJQaKg9bIx+J6a2QS0LwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwRbNZJh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso12116711a12.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759773277; x=1760378077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaOJ+bWZKtnYSvf8DZSFyMYB3L1UYISDcDX/6cb7FRI=;
        b=UwRbNZJh/pf0ial9f2mem0+riQWMM2FytktZwwn7aF8HwSlaSc4xM929GRGxqgHnAm
         6qmgWJKxoZPjiedBTNkh6i4ZCVvfGdfHxkRVgzZvl3Q53kCnNGOBe9bXGzpcgW+knQ9T
         EFchVaHUCjGIdorwSG6fZ2lovSCJQmtrbNcKOcb2jtUrBmMAD/JPtsIB5mXn6esOX2Uw
         gaCIAVOX4ftSslC3g9csgaBiUS3rR2UBvcO64AqIrd8P/Fn9zi88hxikFKlm3wt10m8q
         awGPgS6Lhcp0fiHdjIsA9k5UqTDZ5R0TQ4HjG7JWQ6acBST30gBr3eiKr3n9ypRd1now
         p+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773277; x=1760378077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaOJ+bWZKtnYSvf8DZSFyMYB3L1UYISDcDX/6cb7FRI=;
        b=iCPq/gS0tLBsFqF/tJmgCxCjl2P6c04HKOHr6b6cWZRPfldthG4je6M062KTimCYQm
         IdU/2s+5Rs9EFmbtjooPRrNJzw+LyXGnlqakvoJsuFBrACnvOlauWl6uS7Hdl9xF6jWn
         QTiOpRldKigRJKi8lwVSygSR/JfZoyarx8K+RAms0jxPXiUrCWi8bfekK7hzFDt5VfA1
         CmbHF2k5xUV40q7ifwsKs3mzPk7sReYJ8Az8kPd3IFfWBS6a3bV15VuXW3IP41eQXfm7
         z7lPX0o3bwLxgfM4GkqI2VMDV2Uz37Zeu25yBoRk24T8sCVRW0tIm6V2qvf+gZR/CMCE
         rmcA==
X-Forwarded-Encrypted: i=1; AJvYcCWHEc7TZuuaErlKhdc6Fa8aYH8os/Tzg72yoWj2LNYXjTspiYu62anirefs+PLkJjreNdeunl1VFVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3zEbLwqgqQv6K0v1DZ+UZWaVccJULXyvhHGpsdYPD4xdnP/6
	Gr+w9HN5SN3GD4x7YTrFHqV6gLjBGg3wofxLRk0sMH9Bm8Cf9mfnfaYDGJxo85900Y3VFAYNwhE
	lZWEAlSsu7Ddqduj3lzTHyVgWrzBMsqk=
X-Gm-Gg: ASbGncvY/J3/XnEAsLRCSj0jlXmUtX5xOwUYpt5Wg+aBLj89juLkZUpz6sHCbc1WwT3
	8SVycVDD9TO4UA8XeiTjqBSm4nXuhJxoBBMn6/TAc3SUwhVi6kb6ImKWN+KuwZ+2/KWp0vEkcK2
	YUsH8SdryNbvZJy8pfOUH68WK9uP1ajvAfu2+Cn9WipTihIbDueN9PFvoTJb9MZcGYAVw7KQXjK
	DZM9IYZiLE7SqUgGm3n28AkTaTx+79XHJXreS7MowmfYNLQQxgcFWyASTvOTlgKBLIOD+P2epU=
X-Google-Smtp-Source: AGHT+IHJ/Vo1fUDIbL1nQls8Cr4SC1cob3Zyk1meplN6YxuRUzmZSznvUBX82xUYSZ0V+jqCXqlYjvtl8U3EdawMybk=
X-Received: by 2002:aa7:d785:0:b0:633:14bb:dcb1 with SMTP id
 4fb4d7f45d1cf-639bb13500dmr436309a12.11.1759773276820; Mon, 06 Oct 2025
 10:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251004065618.70151-1-vivekyadav1207731111@gmail.com> <aOOyNpNL3YCrLIgq@hovoldconsulting.com>
In-Reply-To: <aOOyNpNL3YCrLIgq@hovoldconsulting.com>
From: vivek yadav <vivekyadav1207731111@gmail.com>
Date: Mon, 6 Oct 2025 23:24:24 +0530
X-Gm-Features: AS18NWCJ1A4gEHjkk_EONI5344ds4mNs5A4ME7lLehyqnImXo5EA8_39H-V9_iI
Message-ID: <CABPSWR4W5Eyz8=NPvysT7XhFY=bjCO_WqqOOMWeZGen9e2fhqQ@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: fix: space prohibited before comma separator
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,
Thanks for giving time for the review of my patch.
I understand your point and will avoid such kind of practice.


~~Vivek

On Mon, Oct 6, 2025 at 5:42=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Sat, Oct 04, 2025 at 12:26:18PM +0530, vivekyadav1207731111@gmail.com =
wrote:
> > From: Vivek Yadav <vivekyadav1207731111@gmail.com>
> >
> > Run `checkpatch.pl` script on path `drivers/usb/serial/*`.
>
> Yeah, don't do that, that is, don't run checkpatch on code that's
> already in the tree. Use it on your on patches before submitting them to
> catch potential issues, but always use your own judgement when
> considering its output.
>
> If you just want to practise sending patches, changes like these are
> accepted for drivers/staging for that purpose.
>
> Johan

