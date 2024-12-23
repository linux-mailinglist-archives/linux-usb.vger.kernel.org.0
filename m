Return-Path: <linux-usb+bounces-18731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA89FAABE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 07:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B7D162531
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 06:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D5615E5A6;
	Mon, 23 Dec 2024 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDjznOGO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692826AFC
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734936680; cv=none; b=Z56alJJEUMu3+AjFhsjB4NIH3EcnEcFsx823cQqHuWx/i5Uq6ZeQCKhlEfykoC8KjFughQB5n2hlfHx4x21u0qvinhvCHqvkv3h2RtPtkyRk1VGgvWxkCV1Y1UUWCpwUvckArDyNaL1DI9zkgm1jee40q0Bv/84Gvryrsx1FUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734936680; c=relaxed/simple;
	bh=94i8KslI8aeZKLYfNFgGgE1M6Yy0Uvg61pidEufkasg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HRVyU/UKIxYlBHKyjtOQbaZBxpEdlTkROUDVyFfu9GfQk4nrwnkwcdIE7rK/MiB+L8E3SDsDbc9SOVAJnj+robwNaJAzHhfGH53++arRSNYVuQKx58ctqFo93Lnak/02RRla8dZqBbZtSg2aA83Jy8OpQpPGabvHpYT7Q5+SXgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDjznOGO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso23339155e9.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 22:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734936677; x=1735541477; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94i8KslI8aeZKLYfNFgGgE1M6Yy0Uvg61pidEufkasg=;
        b=fDjznOGOoSBA7COCxNcXGA3pjkugoh0budfRA7rFNLz0VMv1wC4kGH5LulRw/27aOQ
         xk51H+UfmejsNqtLGtDnSd6OmKhtfF00PNbzzrijxm8g5tVtMPswBw3sfYr0qyuy43rr
         /me++/ERfARaJZniC8UsaUHp90DcPmM5EDMnZsezquMLstdtP/WgLq/7NvO2FfgMsQMf
         PJsO8qVOuoj5dZbl6L1d6RrAg2v68xlCcj1SNyDfvynfZecc3+JnIR5b9dx6apijZ6d6
         l9MH/W0vFzpOywcjMWZXXww6onWd1tPWd7ojCusPuYrPgK7UHJEQE0qziyeMTumfBMKY
         arVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734936677; x=1735541477;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94i8KslI8aeZKLYfNFgGgE1M6Yy0Uvg61pidEufkasg=;
        b=C3Mj9gjzkS5p+h3g3MwIxumhyAtMpz+oMZ7+cjyQXbf5dVJzzB5mqry8LW5GumyWdK
         btEzNVBRGaTCQm4OyFvFxACMasZa1pf+dtweCjHZZrsR9+5KgPMbOQbN5dAygfBHB/wV
         0OLFh9Vg+F6teM2EAozCd/cjNxeuVE5l2y3RInX3qsR140W9fjGHCyIw6o5HMMulZvdl
         OQmNQVpfUTWxwFTAFMKIjPQHzz6DKJJ8AkTICZbYvhT7MkA9odB75caFbBjBl6J9+FpN
         KqE+aeLQVpu+LQ7dbRn6WA5gX1urTkcao2oR2F8ILuaDsGWW8tV3EDpadD8Yu56Eg01O
         zk2A==
X-Forwarded-Encrypted: i=1; AJvYcCVycAsPegWRURQc1JoRJYXbhIez1F3xO8RA+N+aJCpyyLBcfZ2O5Mm1dNBfYmwufK4jY5QcL2t5kOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMMb985Kk4Db3OePud9+ZfHHgtMWsv0eiyEZ3XqiG6CzYDMso
	xJ9XMrQlnlG0sQihLOVP6EtQI2W1WrcecHtk5yiSX8C8DzNf469PNe6lFHZ/zuI=
X-Gm-Gg: ASbGncuPmOY+1K01Ck1zka+e/NNdCmg4T0G81Mn0YuZjDMfTrVUkL+w4QHze6EAMB41
	qrfR/SlAdKI8UCnI1wFcj7GwgDZEOeBd8bJHPh6hWTvqIIsovvDUGITxH9o7HgxPlDY+rcwskGF
	ieI9zO9ecd2U92z+yxoaSdcbw7Sst9UDokEfLPiBXgWjhwviR57op4qoGM+f1k8ghtkmF9Kc89N
	WTU7gptZ47AlyGSOpfi+oui4tDdhVm7Uv5hf54qHephejI+47c0eWuu/iWr6Q==
X-Google-Smtp-Source: AGHT+IE13LdaAP2755/xgEGMuzrqta7sgVdxQtIcT3qYeIdk/H0kVEWtm6wQRpY6hkB3BXnsbwQ8Ug==
X-Received: by 2002:a05:600c:3b8c:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-436699ff9famr94807705e9.8.1734936676782;
        Sun, 22 Dec 2024 22:51:16 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2a4sm159529915e9.27.2024.12.22.22.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 22:51:16 -0800 (PST)
Message-ID: <f06eb1fb7fa12880b04310d702e1b06af5b25276.camel@linaro.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Fix incorrect UDC state after
 manual deconfiguration
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>, Thinh.Nguyen@synopsys.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: badhri@google.com, peter.griffin@linaro.org
Date: Mon, 23 Dec 2024 06:51:15 +0000
In-Reply-To: <20241223042536.1465299-1-royluo@google.com>
References: <20241223042536.1465299-1-royluo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-12-23 at 04:25 +0000, Roy Luo wrote:
> The UDC state in sysfs (/sys/class/udc/<udc>/state) should accurately
> reflect the current state of the USB Device Controller.
>=20
> Currently, the UDC state is not handled consistently during gadget
> disconnection. While the disconnect interrupt path correctly sets the
> state to "not-attached", manual deconfiguration leaves the state in
> "configured", misrepresenting the actual situation.
>=20
> This commit ensures consistent UDC state handling by setting the state to
> "not-attached" after manual deconfiguration. This accurately reflects the
> UDC's state and provides a consistent behavior regardless of the
> disconnection method.
>=20
> Signed-off-by: Roy Luo <royluo@google.com>
> ---

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


