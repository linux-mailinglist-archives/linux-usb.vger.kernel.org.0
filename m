Return-Path: <linux-usb+bounces-17688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8D9D0E05
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 11:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2907B292BF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2ED193428;
	Mon, 18 Nov 2024 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4noGX3k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCDD192D95
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924775; cv=none; b=d+Qptvg3p47us/kAFDoe7ui/D3gSOKewid/9TSloC24uWOYerr8sUWTgkgOxdAErytxHzLr8AY2MKSpa1dEpwxloEPt83lLrpJn9OZ5roYtlvBK9isMpF+qUwnvEyM8j+DrstoE3Qgl22Y+CY0N7edKk2ocmllOi6Aj/G8IUY/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924775; c=relaxed/simple;
	bh=Z7m1/bx2XWgczsdkfVN/oo1Lh19kiLa/SWjmZrMNdBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XB3eTA/KmQFLsisoBZL7mOFXddo5EoDXhlv1RkKlj1IGtB+1JqEFWJ/bnmP1CD7fli+tnfoXp6LHTdLbZ6ffRNJfyTYLVWJRihW1BLr5dH9o1le0hvRexKxEjKg0tppoBjMwTiJIk370BmIEsMqyBl0EiCnT13ycLJ/bTQ0esqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D4noGX3k; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso2781269e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 02:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731924771; x=1732529571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7xLm61FDHK5h8G4Fa84tFI0U4ziv9T+kSyJudn7tic=;
        b=D4noGX3k7X4cn+bDz3Xm7RMyz/63yEdmpQ90qrHN9PVdRu6m69z5B0IrM9ti3x3Gq8
         TByrR8p+wLzWy2UswfJd1y5p8lABf22rGjzemqo35pkH4bKUMMmbvX4oHcsbGU/Yn/yV
         8r8vNQ3jxjILBLKOwzeDQtfo2U1nvgBQ0120Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924771; x=1732529571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7xLm61FDHK5h8G4Fa84tFI0U4ziv9T+kSyJudn7tic=;
        b=hIY6UurLH0SFtzAOZzZL6YZfG/R07QqbnyzIGGht9EZKLbVJJXulfHEb/iL51OJIhe
         g8HlH+xvLS3K6c7GPvO3YQb/bD9ggDjLxEq7XzJmc2fxX11zlUMp/TrVf+qS1hnWxqL7
         UAY5rCJYuVBdSjNQgQcAY3cFX3yRshy6Q4U5eNhFf31ym/FnVyNgsR7I1xeG9W4lyQ3l
         JuNdbkTPkWBEFPe964pJKqVCsAEn06BOPdkSBofB39El5bBEoQvuOab7ZIuIfSr7AJam
         cSwGTj33isgW6agRTRStFIZ4m1pkRIr8OWS0OawINTCi5OVAB2mAqizOxrlmbncxuxXw
         479Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAK7XCSMnuWSdmNwLt0cTMS7Ky95dx4YlfXZZ/Hhnm0/quqGooGhdKZ0zcnR9IeXRWYaD+Kiwl/oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP0I8OeSXjUSJXKJyZjhjBFLFqwexgGp+eDjMLNKo+/8I5oExY
	Dh6eN/ol1Zijj3RKseaRStD7H2WFkZpgZXzJbOGInQHsHJEIzQBNPyPLCM3iJXpY5vgLad8HOjX
	xNpJzYqi8EwbeSiTn9tk3yVdTztzZk5DpNo4=
X-Google-Smtp-Source: AGHT+IFAbDpEPszG9w7z7at9t7rD47jqj7cWtWXgASiH+i18zL9EwcJja2gshu9D861K/FbtBgtPbitSYXzF0NLj9SI=
X-Received: by 2002:ac2:4c4d:0:b0:53a:d8b:95c0 with SMTP id
 2adb3069b0e04-53dab2a92e7mr4252988e87.30.1731924771472; Mon, 18 Nov 2024
 02:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104154252.1463188-1-ukaszb@chromium.org>
In-Reply-To: <20241104154252.1463188-1-ukaszb@chromium.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 18 Nov 2024 11:12:40 +0100
Message-ID: <CALwA+NY0khkOAdZ2bfGJpx937rtJ+HKt4FBVYo8TE63YafEuyw@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: Fix completion notifications
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 4:43=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@chromiu=
m.org> wrote:
>
> OPM                         PPM                         LPM
>  |        1.send cmd         |                           |
>  |-------------------------->|                           |
>  |                           |--                         |
>  |                           |  | 2.set busy bit in CCI  |
>  |                           |<-                         |
>  |      3.notify the OPM     |                           |
>  |<--------------------------|                           |
>  |                           | 4.send cmd to be executed |
>  |                           |-------------------------->|
>  |                           |                           |
>  |                           |      5.cmd completed      |
>  |                           |<--------------------------|
>  |                           |                           |
>  |                           |--                         |
>  |                           |  | 6.set cmd completed    |
>  |                           |<-       bit in CCI        |
>  |                           |                           |
>  |   7.handle notification   |                           |
>  |   from point 3, read CCI  |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>  |     8.notify the OPM      |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>
> When the PPM receives command from the OPM (p.1) it sets the busy bit
> in the CCI (p.2), sends notification to the OPM (p.3) and forwards the
> command to be executed by the LPM (p.4). When the PPM receives command
> completion from the LPM (p.5) it sets command completion bit in the CCI
> (p.6) and sends notification to the OPM (p.8). If command execution by
> the LPM is fast enough then when the OPM starts handling the notification
> from p.3 in p.7 and reads the CCI value it will see command completion bi=
t
> and will call complete(). Then complete() might be called again when the
> OPM handles notification from p.8.
>
> This fix replaces test_bit() with test_and_clear_bit()
> in ucsi_notify_common() in order to call complete() only
> once per request.
>
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command h=
andling")
> Cc: stable@vger.kernel.org
> Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index e0f3925e401b..7a9b987ea80c 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -46,11 +46,11 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>                 ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
>
>         if (cci & UCSI_CCI_ACK_COMPLETE &&
> -           test_bit(ACK_PENDING, &ucsi->flags))
> +           test_and_clear_bit(ACK_PENDING, &ucsi->flags))
>                 complete(&ucsi->complete);
>
>         if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> -           test_bit(COMMAND_PENDING, &ucsi->flags))
> +           test_and_clear_bit(COMMAND_PENDING, &ucsi->flags))
>                 complete(&ucsi->complete);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_notify_common);

Guys,

Any thoughts on this change ?

Thank you,
Lukasz

> --
> 2.47.0.199.ga7371fff76-goog
>

