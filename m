Return-Path: <linux-usb+bounces-8635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF589136F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CAF7B22DB9
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 05:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A0D3D388;
	Fri, 29 Mar 2024 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sylAsleB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DEA3B1AB
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711691777; cv=none; b=hmeb4Udlli1+ZQOIWDSHQrxGPUz9XQL9LaGpfqXSvfMM4PuTkTtwpqh2+nNp02E+/N0ri/Dn+LJT1YxQzOinS/7lrz1KXgvqGmfQQqbrI1sGTNp4d8wUpHsd17+Egri3lOtHkFFyuQ7dmeEba0kBn3VomVBEP+5oE65BDR1dTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711691777; c=relaxed/simple;
	bh=I6gb3mouBEmAFWwdt7bCZ0uEsJC1XXBgedFnEv3UMV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0/Acl7oogzx0lOROkDIK+jbIWJ9S4mp9FXh+MtWKhg8CAuidethSjwR/u2u7UjIHivpTaib9UrLBHQL/oHQ2AGqOqzLNxCQ9cSuto4FEKbPF6oRkag8Ojvam+rRE39Y15DIHtx0M3okzWTH9Qc6ZoWY8M4YvHtqWPqpJy1KWK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sylAsleB; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61444fb1d2bso1873367b3.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 22:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711691775; x=1712296575; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2dkJ/eB3NE7gH7tgLxZzt30oH7th5QfRjoRtkA4jvFo=;
        b=sylAsleBhCd7XU52STkKnCfojR5GokLfwMmmNU/nOCnePdSp5kpaZlHnDvvoz/ZzTB
         f30qGEM8naNXu6/aV1JSNY0z+YtpQObZ++tcRJGXgLX7odn7CLRpT28u/GEQTKLG0hHY
         ZJaSCRL9+BPblab3UCEjXLjf9oaRLIkQkgkBZw2MIQNS3ilFE6OHcXIfk+jxc6PVJxCN
         lHBIMgmETZu3nRcSSuL+efnMVakwznhpYyUfsyzetXVyUHRqQbYnqgZ0eNg9TQjPNWEt
         aBEAhPchjrnW/bQD+ao6LOAG+osNZuHVGp3mYUTgtIlRCPuZjFiZ0Bd4XTdEk+yoh9W5
         h5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711691775; x=1712296575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dkJ/eB3NE7gH7tgLxZzt30oH7th5QfRjoRtkA4jvFo=;
        b=qrZpj+4/GxYHDA9Y6iQ3J05p+llqaLdVOjkNJdS5I+y/U1NWQYtckcmiCcKYgMTwyX
         1awYw0NDbA5GaEQghOS7YzjJOhgzurQIjdPqu+V1zkRr8lkUgJcuu8p1Rm4pTiHoTsuI
         P1/vudXgFqfjZ7E77rJjI6D55jQ12FpTaAeVYnRlou19YCsk4DHsHTb0rT2faqMs9yrS
         favemw+ws7DWFwl9pBLjoTli7A3WrYhpQEj04ERLN/O45RDRn46aHKvoxBUqbVoHhW9S
         6QwbAc83KxT+GYSxQht2OCVaQYA1ZkU7T8B26RFZABzZc6IZTWlZM3jyMyqylLKnYpTL
         ppuw==
X-Forwarded-Encrypted: i=1; AJvYcCUufVPT1OkITpDikAbRY162WC21b6YU4qhJciUL3XqgkBK+UHJ0bkOsL793CoxXfdt82DL46hNipPtBI2C6MMooxxoBHFYQluRq
X-Gm-Message-State: AOJu0YzE41kKWwFotDeujQR5/RfQWlIqx8H7838wDKuZ9w1J/qchad/H
	07+lURI9csV7Gp0t63cRmzL6zTi8Z+SXnE9IRve3pGRckq8OHLNnrgu+nrGERqR9S5BifcmpAdZ
	jCCvC1FKMy8jG1WOHPstjPIe42F6npF9pVOM3mw==
X-Google-Smtp-Source: AGHT+IHHPjLY3QHFoCuxDon1afxB+hpjMxW50BARoEUlh5RXsRY1+R/40uIOSlea3+3DGKzjg7tBBEkp0xqTH57xTwo=
X-Received: by 2002:a25:6f89:0:b0:dc7:465d:c06d with SMTP id
 k131-20020a256f89000000b00dc7465dc06dmr1354548ybc.28.1711691775003; Thu, 28
 Mar 2024 22:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327224554.1772525-1-lk@c--e.de>
In-Reply-To: <20240327224554.1772525-1-lk@c--e.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 07:56:03 +0200
Message-ID: <CAA8EJppvmaFN1Q5neVSU76gApxm55YfwmxRg=1Z85LcdDEW+og@mail.gmail.com>
Subject: Re: [PATCH 0/3] usb: typec: ucsi: Ack connector change early
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Prashant Malani <pmalani@chromium.org>, 
	Jameson Thies <jthies@google.com>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	=?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 00:46, Christian A. Ehrhardt <lk@c--e.de> wrote:
>
> As briefly discussed here
>   https://lore.kernel.org/lkml/Zf1XUrG1UbVJWzoz@kuha.fi.intel.com/
> acknowledge connector change events along with the first command
> in ucsi_handle_connector_change(). The connector lock should be
> sufficient to protect the rest of the function and the partner
> tasks.
>
> This allows us to remove the Dell quirk in ucsi_acpi.c.
> Additionally, this reduces the number of commands that are sent
> with an un-acknowleged connector change event.
>
> Christian A. Ehrhardt (3):
>   usb: typec: ucsi: Stop abuse of bit definitions from ucsi.h
>   usb: typec: ucsi: Never send a lone connector change ack
>   usb: typec: ucsi_acpi: Remove Dell quirk
>
>  drivers/usb/typec/ucsi/ucsi.c         | 48 ++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi.h         |  2 -
>  drivers/usb/typec/ucsi/ucsi_acpi.c    | 56 ++-------------------------
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c |  1 +
>  4 files changed, 25 insertions(+), 82 deletions(-)

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #
SM8450-HDK, sc8180x-primus


-- 
With best wishes
Dmitry

