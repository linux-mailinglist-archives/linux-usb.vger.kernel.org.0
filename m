Return-Path: <linux-usb+bounces-30311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C1C4B2AA
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 03:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906713A5FAB
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 02:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27AC307AD2;
	Tue, 11 Nov 2025 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcLXkrN9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911CA305976
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762826413; cv=none; b=SIYUSSr/lld+wYB5KquGh0lirdH4S4rlIiKc37fH9+XuJ2PDn6QG/7SP9020+5vaf55IWuacEv6FO3gQ8xyjzCV1xXj66DrDa0hj7ADQn0DbsxGEAXGMI3CMCXtzhSijA7Q9r2nFW2kJYj3Qv8y3vsNnBIasAHlVJO241QK0QUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762826413; c=relaxed/simple;
	bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMXLU/SdZ0FNZ/Uvc3SuQS9VMLXa8mlX0bQ97P6xLUUA0EFjBpsyS/u9d1EaF8m+H49pqwQviE/y5keQggaEZomZb6KEZn9x8aNsZE6jEucRkPRpCcB9ICt8ep2A4GGYSdGIwX/X2MDZVdfjYXIq9UvrwpD33go+3t7UMEpM53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcLXkrN9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b312a089fso1283290f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 18:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762826410; x=1763431210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
        b=lcLXkrN9XAhA0FcMneCG/VerjdhmK6GmOxJIOiM74om3unhsGaJUS3Dl9RwzePUPaE
         ev994qA3BS/0djCoYSv1RfmFq2P8muiHQkXlbVChY/MnWKWGgpyBxbnyE4yQVrEuFyS2
         GTGHGxdjIP7zLYj8nPRp6Wofc4AMXF7uz0bkAnVAymUZnMjeheOrNwp9H8EPqXztdF9z
         g/vQi47tcQR2RzXOxMqr5Huxr60OfbQr0bXtepIx5RdzPNaBPFzTiJJD187iGjLB372U
         xg6Lh7u+XtsAHkQ3hwue9JDlL5VfzKL1MaR82yE8ryILRwamln/7G/576xNxX44sAhbj
         gKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762826410; x=1763431210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
        b=er9KToRmHs6MV451MSkBs5VKCfG8ycqSloLR4QMDcXLEOWlj3HXnt9Zj1J/SdXvY3m
         aomzrjJ6OXkMRSeM3qm/nzlmzYTndpMAEDrOi7ekRj322u2SNm3sQYKJmAyhnEOgikmY
         chPa1hA8nRS9kfX7F7YtJNd4nC+IB+X+0tXZSE1gE9eVPo1LKTD8Oqswgon/J74i78TY
         xLw0sX9/oxoS7DRGrFFAq1TA4SGxj4pVLpteqTyZKZzWEMor4CupN8hhpfPct8xgLOP5
         UI02O0cyUM9DBYm0lHNFHM7rHyMa+Nz6X6CqBX7ONQI769X7pOJJ3NF2dk+pMKPKQYNe
         5odg==
X-Forwarded-Encrypted: i=1; AJvYcCWRqugsjikZ7Zvg5sI9+grJyDnB7HJbij2Udcdo3ysA0SeLKWLzgmbCXC14S0pBsRn7JEd+Y1LxoG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwtCHDFvQiw+xOHE62xvhclG/GklyCcu+9A92QPekYoDlKgGn
	ACJZCczqZMR/ofzm4tyr3+UDtXI6Tb7KmH8ilQapeKYJWuRtrPnSdZWOhNP7iYd74TsWgqg8rcW
	J+2IUBREem7k7kr5mwIGN1XNHFqocvtE=
X-Gm-Gg: ASbGncsu+PWpudrWU4CfB4vmuFNxi8HnpuF9+1AvPgh6U8FouKFMfGQe4DlOVyWmeCb
	/N57oomJ/ZHwcj06Z28jpt/FvW8d1RWRN9I4WXSNd7Ep4BT8pU7/wt8n8XBRirknaKyD5zR7rXE
	ssimAjgBjeOZoFWipcvZAAIWAy33U1NYw7vUHoPqQu3Z+jP/p40yfB2ykw094rcQR9QKmENZXti
	MTerODze4G0IwyESs2uc8JhkMpIZzQMis5cEnAowFeOKyt7ui4nBGqDI+BchK4eCRsJRBWp15TZ
	IqjkQ0xjb/wEnG33MzCLqoiPYdoHDGSLxlHnLMDmH/lfpFGpzfX65X6EZfbASVVsXjtvNeADbas
	=
X-Google-Smtp-Source: AGHT+IHdzeUCRfRm2M3JLVLCfmUpbNDJkdXF6cBlJJVtOjdev9N9wpa7IojmZlK6ySR3xDYbcIQXtAMXqpgvL0kJ748=
X-Received: by 2002:a05:6000:310c:b0:427:8c85:a4ac with SMTP id
 ffacd0b85a97d-42b2dc39158mr8864208f8f.47.1762826409780; Mon, 10 Nov 2025
 18:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu> <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Mon, 10 Nov 2025 22:59:57 -0300
X-Gm-Features: AWmQ_bmkQVFF_-Ouaj7ZbqnDQSjb9J11j_X9uoX0YCihiAVIePZwZDN4iEmTHEc
Message-ID: <CALvgqECiTae_zUmrJ8-i9Gd-XENBYFpkpxCo_6DxL+Ct7GUEvw@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> If, I mean it's a very big IF. I wanted to have this device with
> hardware volume control working with alsa/pipewire/wireplumber/etc.
> What would be needed?

I realized that I also needed a way to query the volume whenever was
needed to implement it in a sane way.

And I found it: 2eaaec66 0000fc00 00000000 00000000 00000000 00000000
00000000 00000000

Query volume:
`echo \
 "2eaaec660000fc00000000000000000000000000000000000000000000000000" \
| xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`


And the it works perfectly:

Quering with full volume:
ffff8d49fef1ccc0 1029983421 S Io:3:005:4 -115:1 64 = 2eaaec66 0000fc00
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d49fef1ccc0 1029984020 C Io:3:005:4 0:1 64 >
ffff8d49512cb680 1029985012 C Ii:3:005:4 0:1 64 = 2fbbec66 00021010
2f000000 00000000 00000000 00000000 00000000 00000000
ffff8d49512cb680 1029985015 S Ii:3:005:4 -115:1 64 <

Quering with a volume 2:
ffff8d4af3d70780 1130255084 S Io:3:005:4 -115:1 64 = 2eaaec66 0000fc00
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d4af3d70780 1130255438 C Io:3:005:4 0:1 64 >
ffff8d49512cb680 1130256427 C Ii:3:005:4 0:1 64 = 2fbbec66 00021003
22000000 00000000 00000000 00000000 00000000 00000000
ffff8d49512cb680 1130256429 S Ii:3:005:4 -115:1 64 <

Now I have sufficient data for: query volume, set mute, set volume 0-15.

