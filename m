Return-Path: <linux-usb+bounces-3827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C680851E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 805761F2268E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D042935291;
	Thu,  7 Dec 2023 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3plNxo4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F74128
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 02:04:15 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d96efd26f8so4528707b3.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 02:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701943455; x=1702548255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/P/LnDCLJCGUZSUj0E5k/5JKqu7ZeMJ9LgG+CDwpC/I=;
        b=P3plNxo41ciD1SjXqWEaKhLJt5aKvZ8LldNR0AUNN5PmIzYkQFPpHx63YJGukdRDSx
         ZMNmKFHX01rwYBsyQrd3JPEt8oFgd5KfQsSBOQOURLWkTr3tThphj6i+uSynjlrFbTGe
         MbasiIFy2DpQdWDneds7LEuPt2TzU6CLxPZIMpCrr10fS0JLMayxwH/Y+zMJwuPsbbn0
         6q0eYR8OdC+R4tBqg4pll6q2tSgzdE224onJdkLW/vVkiv3Nvd24/sRIkVsB6+AO9V9q
         UtQYdtQgZ4TAUeE6uZiZbn9abduihpmz+SEG3uL99G887PWX0K6DQN9LWC7jE7jtyXq6
         ZCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943455; x=1702548255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/P/LnDCLJCGUZSUj0E5k/5JKqu7ZeMJ9LgG+CDwpC/I=;
        b=M/yPlUr62Vbk6q281P1ouwJR14OxAkNDT07Rdxuwql1/dLdFryswhef8jDOjrv/32J
         yJEPW98GJqiXw9fzjEhSrr//NUM14kCcZOR/QGUayhWxS0//H6Mly/4fbdX6ikP0bZga
         2yHVMgyrviNnBJtgxRLsh8h4Kic1nVPbWarkkYUqsbjgvBQokmV1XLGuYuH7VlXQat2s
         k1/Qo92eE3VT0hvH2/LrYWN6QgZNV5Ewkc1w23BYljIjdF9oENB+OrXd2NltyYfDXyLd
         EDxTcZo/Xq2TkK56uYncpD09IXp/rjeH1JvEfJZsdfKmsRCOMezw07vgSscN6DvUQ2Te
         LEww==
X-Gm-Message-State: AOJu0Yzo5169u8S9tmC0hZei6kidxczZ5f+NFUm3PBVu8mglWOrLTlmR
	b95tfLjJk36nQk455STgQ0jeEvKLQugtSvg/YFBloRFSxai4seuo
X-Google-Smtp-Source: AGHT+IGXHER31GZ5DBXl+dF2Z1Tp8RH+vUF4osbPZJbtpjBkpIg84PoV3m06c+i0TgyMrha1nkDE716Qd6LpK/ZJzUc=
X-Received: by 2002:a81:af61:0:b0:5d8:96c:690d with SMTP id
 x33-20020a81af61000000b005d8096c690dmr1961759ywj.7.1701943455151; Thu, 07 Dec
 2023 02:04:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206181335.27540-1-rdunlap@infradead.org>
In-Reply-To: <20231206181335.27540-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 11:04:26 +0100
Message-ID: <CACRpkdZBuYtgsS_W9kRuvVXVdORvbA5AGDVr0SkWaR_h8AN9Hg@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210-udc: fix function kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 7:13=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:

> Correct kernel-doc comments to prevent warnings from
> scripts/kernel-doc.
>
> fotg210-udc.c:1103: warning: Function parameter or member 'g' not describ=
ed in 'fotg210_vbus_session'
> fotg210-udc.c:1103: warning: Excess function parameter '_gadget' descript=
ion in 'fotg210_vbus_session'
> fotg210-udc.c:1103: warning: No description found for return value of 'fo=
tg210_vbus_session'
> fotg210-udc.c:1129: warning: No description found for return value of 'fo=
tg210_phy_event'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this Randy!

Yours,
Linus Walleij

