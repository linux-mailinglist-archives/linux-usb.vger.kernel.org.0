Return-Path: <linux-usb+bounces-9518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F898ABD18
	for <lists+linux-usb@lfdr.de>; Sat, 20 Apr 2024 22:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DF7C1F211C5
	for <lists+linux-usb@lfdr.de>; Sat, 20 Apr 2024 20:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44BE481CD;
	Sat, 20 Apr 2024 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6bC9itG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D5205E01
	for <linux-usb@vger.kernel.org>; Sat, 20 Apr 2024 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713646060; cv=none; b=rAAL4h+co9aFLpCKNTV0wVOR1LSKJY4nbj5SPSfNpRXd6XvTPEsEKRqB7sgb5R2Q5Sdep449pv/HX6L8jvg/VkgUwks9RxsYCpgNgIwa7l5lV1PPNlnKEe7fxatoFNBTzYd64gp60WTDBwpNPU6mCYeApp6rs+yFmzO1Xb76d6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713646060; c=relaxed/simple;
	bh=nAX4qtsNUWhy1uiAgeSRQF1UqmwuPnkAS2XUGJmyi4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mw9T5EDDGVfHIzDbsn+HL81JCChJMNVOuIdUpoS0l98uFqUw18U20+5P3XRW7g1japDSwpxecBQE4V5snFgX8t4vlXEuKxf88Z5OsTG7OJ+5MezjdlxbJJ9+w+O9vbVck07ChQ0PESmfL9VtBZVAs0Z0K0opDkLA9qNLxnACJeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6bC9itG; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6eb77e56b20so1946657a34.3
        for <linux-usb@vger.kernel.org>; Sat, 20 Apr 2024 13:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713646057; x=1714250857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kb/bevCZdlKe2zh21irqMcJQYjEy0O/ZCeu3ucaLGIQ=;
        b=M6bC9itGHIEIvgg7Rk3e+m6FR7UADyUUOfdwnC0xT+8EOzQ3SvhnFWkkP7nT1DaZn+
         XV/SQyjAxoGFW2rCpz8YDR9cu48+95zgTe1ZOLBy7/HG+gCwQAOca7Cs+4sJwjHesSX5
         4ASExXETyu/4/7UEgAzuTC0BhrIIeFKdbm+8fClUJEoL56j89Az2CiQWZchxeCftJ+9h
         dAq12ID49Ev9AZGeNIHSjZMEKVYHobBu/66ZYDNWExFaBKBULlToK9Rc5mFWdG4Z5vlo
         UK5Ep2D0R0vvc7b8tznICiJY6UIHwXFYRQx8DQwvRRj4cHIMA/YVI0DLz3sR+RQhxXkN
         imhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713646057; x=1714250857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb/bevCZdlKe2zh21irqMcJQYjEy0O/ZCeu3ucaLGIQ=;
        b=ucYCOtxf/b3wTD9fQmocKBWHEnG2ADYecUSY7+5THclu7aTbPyybluiiDVWLaPjUiz
         bGZr7RUbW3uJDqUXR5trBgp0tDLcGtvFYpBSHjeQrciPhTBLlRnTutOsmcvZ6sUV1CDC
         Hd1X8pGy3cjXGRUXqZKt8PMp/V4MtW7h60yT4/DpjGv1IPxrtYPZEM45mnJWgPEDT9aL
         WrQIsKXL7t/vhvVUbnmoDO4N/pqsJVswabaOGB7MKq1bIiYfqmQZPu0T738cdn1YWZQi
         aYe/kGzLcP+KPZudVGXqZlvcwiyiZOR9Sdi/Ysr8yEUoL90H/zN8QvYfCp0VUBDZM1Z8
         UISg==
X-Forwarded-Encrypted: i=1; AJvYcCX00qmXEVG6tcu084imSfAtVBmFIUPB/KXGwkFK5zhvhe32TgyR7Vc1Dw7exZLBPL+GtrqPLd3TrOM4pLe3GN34eBOJgJWfPwJc
X-Gm-Message-State: AOJu0YwlIsmdmvqY65eJZ2E75gdaTbDY9kndkz4LnXAI7fXWxpgk75RI
	48aY/4hWOO8D/n/mDYbeWw6lVAdIzk2k1vTXbz2R4EdZoaL6JcCi7cQwAb3SPlV1UgoizolzI8p
	LC7ycFd2VH92kY0OtjVYaDCoGsQjcYlSy/B8IdQ==
X-Google-Smtp-Source: AGHT+IG262rt420pNwzY8AZsDmczVXNlMCTF70H6EVqdZNolfSDASIpwbTO50b8BEaku8NlH8ubL3mViPrkfZfXmm38=
X-Received: by 2002:a05:6808:10ca:b0:3c6:be9:f4f9 with SMTP id
 s10-20020a05680810ca00b003c60be9f4f9mr8118471ois.28.1713646056797; Sat, 20
 Apr 2024 13:47:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240420164927.15290-1-prosunofficial@gmail.com>
In-Reply-To: <20240420164927.15290-1-prosunofficial@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 23:47:25 +0300
Message-ID: <CAA8EJpqnZPVG6swW6T3YjG-ekinyYeif6SqardH0O_0puJn8Xg@mail.gmail.com>
Subject: Re: [PATCH v2] remove indentation for common path [linux-next]
To: sundar <prosunofficial@gmail.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, u.kleine-koenig@pengutronix.de, 
	christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Apr 2024 at 19:49, sundar <prosunofficial@gmail.com> wrote:
>
> Added check if pointer is null and removed indentation for common path
>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: sundar <prosunofficial@gmail.com>
> ---
>
> Fixed nitpicks in code according to comments received on other patch.
>
> https://lore.kernel.org/all/2024041103-doornail-professor-7c1e@gregkh/
>
> goal is to get rid of of_node_put,but sending this patch first to do one
> thing at a time.
>
> Changes since v1 - fixed the typo error for spell from identation to
> indentation
>
> v1 patch link - https://lore.kernel.org/all/20240420145522.15018-1-prosunofficial@gmail.com/
>
>  drivers/usb/typec/mux/nb7vpq904m.c | 49 +++++++++++++++---------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index b17826713753..fe0257840dd5 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -321,35 +321,37 @@ static int nb7vpq904m_parse_data_lanes_mapping(struct nb7vpq904m *nb7)
>
>         ep = of_graph_get_endpoint_by_regs(nb7->client->dev.of_node, 1, 0);
>
> -       if (ep) {
> -               ret = of_property_count_u32_elems(ep, "data-lanes");
> -               if (ret == -EINVAL)
> -                       /* Property isn't here, consider default mapping */
> -                       goto out_done;
> -               if (ret < 0)
> -                       goto out_error;
> -
> -               if (ret != DATA_LANES_COUNT) {
> -                       dev_err(&nb7->client->dev, "expected 4 data lanes\n");
> -                       ret = -EINVAL;
> -                       goto out_error;
> -               }
> +       if (!ep)
> +               return 0;
>
> -               ret = of_property_read_u32_array(ep, "data-lanes", data_lanes, DATA_LANES_COUNT);
> -               if (ret)
> -                       goto out_error;
> +       ret = of_property_count_u32_elems(ep, "data-lanes");
> +       if (ret == -EINVAL)
> +               /* Property isn't here, consider default mapping */
> +               goto out_done;
> +       if (ret < 0)
> +               goto out_error;
> +
> +       if (ret != DATA_LANES_COUNT) {
> +               dev_err(&nb7->client->dev, "expected 4 data lanes\n");
> +               ret = -EINVAL;
> +               goto out_error;
> +       }
>
> -               for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> -                       for (j = 0; j < DATA_LANES_COUNT; j++) {
> -                               if (data_lanes[j] != supported_data_lane_mapping[i][j])
> -                                       break;
> -                       }
> +       ret = of_property_read_u32_array(ep, "data-lanes", data_lanes, DATA_LANES_COUNT);
> +       if (ret)
> +               goto out_error;
>
> -                       if (j == DATA_LANES_COUNT)
> +       for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> +               for (j = 0; j < DATA_LANES_COUNT; j++) {
> +                       if (data_lanes[j] != supported_data_lane_mapping[i][j])
>                                 break;
>                 }
>
> -               switch (i) {
> +               if (j == DATA_LANES_COUNT)
> +                       break;
> +       }
> +
> +       switch (i) {
>                 case NORMAL_LANE_MAPPING:

switch-cases should also be shifted one level to the left, see
Documentation/process/coding-style.rst

>                         break;
>                 case INVERT_LANE_MAPPING:
> @@ -360,7 +362,6 @@ static int nb7vpq904m_parse_data_lanes_mapping(struct nb7vpq904m *nb7)
>                         dev_err(&nb7->client->dev, "invalid data lanes mapping\n");
>                         ret = -EINVAL;
>                         goto out_error;
> -               }
>         }
>
>  out_done:
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

