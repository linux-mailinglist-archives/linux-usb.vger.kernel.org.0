Return-Path: <linux-usb+bounces-3385-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 095EA7FAD35
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 23:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5331C20CED
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 22:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F5648CC7;
	Mon, 27 Nov 2023 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GI26j6SD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D076B26B3
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 14:16:06 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1fa3828b66fso438319fac.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 14:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701123366; x=1701728166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOtiHhCXcTs7U7N8iXM/fTHfmUjP1auJELJxitQ/CYY=;
        b=GI26j6SDuj17y1bcbf9dUKpW5rObBS5AQ1RQ1rA+SeMdivOJglptSaw2harbdPy0mX
         WkUnyyAvsOn3SnkY5HJ6WV7ZKjziPGf8YVp1obS6mV9hmqdVDquCTlcVhEhzapJG63D8
         Z6zV+mS32Mggz8ePnRLMnpmV+IIhFHpQuEbNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701123366; x=1701728166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOtiHhCXcTs7U7N8iXM/fTHfmUjP1auJELJxitQ/CYY=;
        b=VPEiJn2kd7yi8W7hBxQZD58irq0HJB4ondSpnMJjRxo/k7QS7D2/cNhkYgiOodcFbF
         15QN4aDDfY0w/KhEEsNZlGXxkIlLI5BYkGE5WmIri6kZByopyk1e2+2Nlwl+ATfhXjU0
         tQWsfdZAiG1YkiUD8BdwoQFOB0qJi5PwPAwLtjxM6uR4P3K0ltG0j6GFa3fR5lWdzuCO
         HSiTpZsVYDrt6UdippTU607BYMapJDYZBoCHg7PaAPI99XmORTEdBFARvNuwOnKvGxp+
         WqZ0eg1WVyvjHya6gWSyAGtO6hIZEPV7+wpcjerOKTWFLdp+3ql+CoFOnD9+eifiR0tF
         M3kQ==
X-Gm-Message-State: AOJu0YzrgFyqWT/fAS4ryjYgN8jwaVhD6aa4FkDl5HnTdz/1oj+S14eg
	eiDDh4L2BQ9QqtP5U6FSr3i3Eg==
X-Google-Smtp-Source: AGHT+IHcYWuhBqbWWINw7ql+l95FDuxpiFZKblBR6VSUVqnwT28MUHtJGGplWNnVycy41sgg43uDgg==
X-Received: by 2002:a05:6870:f78f:b0:1e9:9440:fe4a with SMTP id fs15-20020a056870f78f00b001e99440fe4amr18433816oab.3.1701123366057;
        Mon, 27 Nov 2023 14:16:06 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id n6-20020a0568301e8600b006b9848f8aa7sm1508051otr.45.2023.11.27.14.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 14:16:05 -0800 (PST)
Message-ID: <919ae87a-b906-44ba-8d6e-cca58664afa8@linuxfoundation.org>
Date: Mon, 27 Nov 2023 15:16:04 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: usbip: vudc: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel@pengutronix.de, Shuah Khan <skhan@linuxfoundation.org>
References: <20231103171428.3636570-2-u.kleine-koenig@pengutronix.de>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231103171428.3636570-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/23 11:14, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Looks good to me. I thought responded to this patch. Getting to
this now.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


