Return-Path: <linux-usb+bounces-28962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED6BC0BA4
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 10:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFFB19A0BB2
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 08:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B75E2E3B0E;
	Tue,  7 Oct 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYJO9vu/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE02DBF7C
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826131; cv=none; b=t6VSxJJH355mVz0RJYBgVWQu0rJDEBUQN/drUZ5SD5oBFApil1/asldwmRRroYw6cHDYp1rJ9R4DbVFO5mU6L+/ClniujAIUsbwDwEglxCtUi30v73ehP5K+RGrm9epevTOcr53/vZhz+H0jDW0d1uNY2sZ3aNWwK1P1KhxrKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826131; c=relaxed/simple;
	bh=oolnhmzp0phxU0SJgt+ZTKmKtIqlWNaICASfkcDvAXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQnBXFkFcta1ENHmkNfReSzrs0nB9xQ7IIL/n7QuDReiI9tpioy4ZlDs7fUP+CmW9hN8LiUJb/s90DDnNkuDLhQ4hwNfVNmybHYaNwLa1dA2TGwD27pltfhDB7ivH/Oeqo9obxt1M4mx6YDjBSN2+d986N6xRdKHN+moCrB1758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYJO9vu/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso13693235a12.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826129; x=1760430929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oolnhmzp0phxU0SJgt+ZTKmKtIqlWNaICASfkcDvAXg=;
        b=JYJO9vu/5BfQtw/EHJ/7J8ZR5ce5NSgqACEHHixK5nAbfBkWiosi76+Zy2VlHLYwwl
         p1YzjoJz74ukxhhclhxWAbgm7M08T2X9tY6lzSNlo9LkXVCsEbW8i64m0+Kk4VcLu2Mw
         ZgcMBJjX37zgCLZbW8GdGspZkmDI8NTCQNDZPpgjpy0fRLFQltiDgyixSLihFbJnXE0S
         sOLfAMQg888fstIC1El6BZaRtTDMZlnj+PIKOsRHaUY+9uMRjFmGG7Egm/6vDEE1bdeL
         oLEwKEPVJRXrxxmK90ToG3mYM0sVWYnCVb9Ly2S6/x/ZywIKCjA7ZkWXk1tcESiQp9/x
         DLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826129; x=1760430929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oolnhmzp0phxU0SJgt+ZTKmKtIqlWNaICASfkcDvAXg=;
        b=FjylUkVv6kRPx+h4brUYExkmVkW4rouriDy3/4VEYUuxr5wEXok4AbJpX2aHuVkDKj
         9lW9oznCftehP+CZhJBJmXy3mNT1+N7lbDz8DtwGLVVp7EAFHdJBu6c6ZWqbRnveaF1O
         Cmgdx9Yvl3WkWqJNTIYuUTNYdQ6cBxKhlbFGS0hcmnXjGocy8i49l5Wr47n1DTayP3Xm
         snULxquDi/KFXDX8meq8MZqYctD4zfRaHeDthXbEH454NzF+nWTAqAnhnnPxH/eS0RjQ
         YHSYi72xKwJVeXxNviFU2QXjsOSiZgxJtRn4RiiFcCxtINGrmR39KcS1X84EMfANlyTZ
         Vksw==
X-Forwarded-Encrypted: i=1; AJvYcCX6jIJLtvpt4E49eyShXsJvnMBmLMNrcSFeENnA4dJDIgDXU7NwqYzXXslUWzuv2fP9juvygSi5WIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMWt/ybnXRCtdkR1t9sTFktEDZa37hs6VXhed8SMLyRM3SiVs
	3YkAZFjdJc5BC77K1UGHdChsrhS6FR9KjmsY5klcYUp4hlwznjw7+NK3WC/yV5qlzKq8ViAWgyD
	7lANxFI5DBazwirzvLkC5+hMSTYbwTk4=
X-Gm-Gg: ASbGncuqYbPbmLTjwn1Os5ZcmUxVJedSIT0y6WwAsdVftbnurU7qTs03P11Y5gWzcTF
	U0tot4ywc/q4r/27XYjhFrAde9oE8E+vZ8Nz7MPVUWwmC/fVM1kBlQtimWh8Dmn4yI/g8WUivC0
	B93d5yWGDpgsyrhBGkpEB1uMUePOFsw6S/ewlF+hOzUhIEwHycuVZin390BxTF4nSEWXpVzLKVC
	7tfm8/8DLFqF2+sw48Lx0QtcqD/VZlrKpFxwbUNOXT5PtXulkj9yQ73X4FKankKqArzYdhTGgdG
	cA==
X-Google-Smtp-Source: AGHT+IGGUtmjqlLFO7DiLm+f7ClYBfwyRmx5vn+CRzV63l76mmNZeJM8Zill3iy7if7XHgjFS3vA81VNOf3LznbQNyo=
X-Received: by 2002:a05:6402:4402:b0:634:a23e:df26 with SMTP id
 4fb4d7f45d1cf-639baf1c977mr3450695a12.6.1759826128502; Tue, 07 Oct 2025
 01:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001131409.155650-1-viswanathiyyappan@gmail.com> <4124e1a5-fcd9-4ce3-9d97-5ebe8018207e@gmail.com>
In-Reply-To: <4124e1a5-fcd9-4ce3-9d97-5ebe8018207e@gmail.com>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Tue, 7 Oct 2025 14:05:16 +0530
X-Gm-Features: AS18NWDAJv8Y2QJ0ase6hOWvYmv9Zfznp100Rlegb03D_vdoVYNFwHyKoTaLkY0
Message-ID: <CAPrAcgMny0eujytjZ9M+LZoQzzbFRtsDsYFQj8=i37wSLC+6NQ@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: lan78xx: fix use of improperly initialized
 dev->chipid in lan78xx_reset
To: David Hunter <david.hunter.linux@gmail.com>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 06:52, David Hunter <david.hunter.linux@gmail.com> wrote:
>
> Please describe the testing you performed.

I used the reproducer provided at
https://syzkaller.appspot.com/bug?extid=62ec8226f01cb4ca19d9 and QEMU
to verify my patch.

I applied the fix patch for the bug before my testing.

For testing, I set a hardware breakpoint at lan78xx_init_mac_address,
triggered the reproducer, and inspected the value of dev->chipid at
that point.

Without my patch, dev->chipid was always 0. With my patch, it matched
the upper 16 bits of the value read from the ID_REV register

Thanks
I Viswanath

