Return-Path: <linux-usb+bounces-9225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC689FE0B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 19:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723131C21E1B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 17:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBD917B4FD;
	Wed, 10 Apr 2024 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ly86b8vz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4015B0E4
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712769219; cv=none; b=HScTmhpNvk5w9cKSUt5LE7mfp0+6xyszbo1TdheLY52HxxG/co4Hgdrzx2vo5f19gnEGR9myp+I6j8QPD1xxEqmnby0qcewPJkTG3vTnu1/fUyj9bXJXFzhEtKgD2osIG5kN6lPNJOsmCr4jZz3fa++gokhTzE+gnb3zjN6ou4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712769219; c=relaxed/simple;
	bh=2dxA21IicR5QXRGdbat2ecJe4iRi/T+diYzMzktSDfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pE+XABoZPLmuUQr9KVXoVmdlmdLratBzTwzCJIwkkC6q2Q4gse+m8UG++VsGc3DC9Kwu+LJ+UQOxhziapejLnrhZytCGHxxE5Q1XB59kwlN8YFPi/c4Ek0SdkGLmr62pFb95uA/cE4zvuj9aOMuqX7HymPWq76L2anS9K11LH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ly86b8vz; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de0f9a501d6so3447920276.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712769216; x=1713374016; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LoiFbRr56FQyHTjxgBjvyL+ztMVJn3XIX4iUKlBJvfw=;
        b=Ly86b8vzCFj6XvXBkkYWYfsl14l28eGPNk2fUi/5/0d+4xYEOKI795UdEpb26KSZvK
         ybbvtumBoSgbuqxyAMbp7xhEtwExbj2l1qtkGjH8mg7Ug2AcN2/09LD/jSk/V/+yBA+O
         Hngui93ao6gjV9s/41tmENQ5IyaxHU5qU83iM0vBIN+Pnf3rvv0kUCeDdLSXDbNCNhpB
         iXOH9CRyvK+zP6mUAxJLMPsq7+6n8swD74mWicjiIQtV//ZmvCmSSRCfhkPXdUU3JZr+
         m4ohIHjWNkdd7hMc0ta5LCWYYGpMCdILvm9hGGxLxh/XiE/C9sTJpoFNbcrN5aL6X9ZC
         NuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712769216; x=1713374016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoiFbRr56FQyHTjxgBjvyL+ztMVJn3XIX4iUKlBJvfw=;
        b=eZGIViq7ZcySEXxciT0pzvDK3JaT9Rr27pE4qDZgQN+p5Oz4JKSA5N8nwnCvefhlWK
         6/9S7dztH1kqoF2XHhybJKXmWRYNqCLZaTic6Gt1FE1CaeGBc5IrR+B/jNx4/+1irxw8
         c8bW8sft+FxyDn4Z3vxLf2EMn7ZhkbLUXfAtRu+rQvMlJeEeDAQPSnNnaBs9hS5xmw+d
         pmGyy61dASGYRov2VakEIPgERg9R3TbnQd1S1nqQKbFAEPuTCM1emVs4tNUFGWLQp9+d
         LZ1ehaZW6hxQiYnBWns6bQ2EEpFnND5ZsK5pdOtjAwd5mmH7ODqQdJ6sXgmAZnDZmoIj
         RGlw==
X-Forwarded-Encrypted: i=1; AJvYcCWZM9SQxLDFA88O0oOHBvFcJm6ileQxNwOubFB9Ya9x6ODj2UfJ82F7Ib6mm268QDDOSczx+EG0wSm7FY3zmMJfN270azN8Img4
X-Gm-Message-State: AOJu0YzSfjfhnd6+x+M4N1xJ+/lvEthzKnOJf93B/U361XuqsO1m0wgX
	9J9qOJmu2WEvOTOhftl/jCiePqXcoSqw+RKOLsXg7ngE2Sy76aNIzXHWw4D6QjqNrLOVx+us3tn
	u323uXRUFP4+cIQnwD9UFSdq4kyc1Pm8xwCbrnQ==
X-Google-Smtp-Source: AGHT+IHU6fdcr8xJ013lQ/5yyMWN8QKmw/hU/MbiTWMn4p5uKfhrV5W/9HZhKNADjx3rhTTgmrbpEIWru1PRyoEyi54=
X-Received: by 2002:a25:bc4d:0:b0:dcd:1854:9f43 with SMTP id
 d13-20020a25bc4d000000b00dcd18549f43mr3076283ybk.3.1712769215940; Wed, 10 Apr
 2024 10:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410165222.5192-1-prosunofficial@gmail.com>
In-Reply-To: <20240410165222.5192-1-prosunofficial@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 20:13:24 +0300
Message-ID: <CAA8EJppfzXEzzrQ_11O94MVn2dhcF2kGd9RR8ctJ1GmK=6C+ZQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: mux: replace of_node_put() with __free [linux-next]
To: R SUNDAR <prosunofficial@gmail.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, christophe.jaillet@wanadoo.fr, 
	u.kleine-koenig@pengutronix.de, skhan@linuxfoundation.org, 
	javier.carrasco.cruz@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 19:52, R SUNDAR <prosunofficial@gmail.com> wrote:
>
> use the new cleanup magic to replace of_node_put() with
> __free(device_node) marking to auto release and to simplify the error
> paths.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index b17826713753..72ec9ef3ac58 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -315,29 +315,27 @@ static const int supported_data_lane_mapping[][DATA_LANES_COUNT] = {
>
>  static int nb7vpq904m_parse_data_lanes_mapping(struct nb7vpq904m *nb7)
>  {
> -       struct device_node *ep;
>         u32 data_lanes[4];
>         int ret, i, j;
> -
> -       ep = of_graph_get_endpoint_by_regs(nb7->client->dev.of_node, 1, 0);
> +       struct device_node *ep __free(device_node) =
> +               of_graph_get_endpoint_by_regs(nb7->client->dev.of_node, 1, 0);

Please stick this to the top of the function. Otherwise LGTM.

>
>         if (ep) {
>                 ret = of_property_count_u32_elems(ep, "data-lanes");
>                 if (ret == -EINVAL)
>                         /* Property isn't here, consider default mapping */
> -                       goto out_done;
> +                       return 0;
>                 if (ret < 0)
> -                       goto out_error;
> +                       return ret;
>
>                 if (ret != DATA_LANES_COUNT) {
>                         dev_err(&nb7->client->dev, "expected 4 data lanes\n");
> -                       ret = -EINVAL;
> -                       goto out_error;
> +                       return -EINVAL;
>                 }
>
>                 ret = of_property_read_u32_array(ep, "data-lanes", data_lanes, DATA_LANES_COUNT);
>                 if (ret)
> -                       goto out_error;
> +                       return ret;
>
>                 for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
>                         for (j = 0; j < DATA_LANES_COUNT; j++) {
> @@ -358,18 +356,11 @@ static int nb7vpq904m_parse_data_lanes_mapping(struct nb7vpq904m *nb7)
>                         break;
>                 default:
>                         dev_err(&nb7->client->dev, "invalid data lanes mapping\n");
> -                       ret = -EINVAL;
> -                       goto out_error;
> +                       return -EINVAL;
>                 }
>         }
>
> -out_done:
> -       ret = 0;
> -
> -out_error:
> -       of_node_put(ep);
> -
> -       return ret;
> +       return 0;
>  }
>
>  static int nb7vpq904m_probe(struct i2c_client *client)
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

