Return-Path: <linux-usb+bounces-9918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE988B5F22
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 18:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE4101C20DCD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E5A85C6C;
	Mon, 29 Apr 2024 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFFWZzQG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C078592B
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714408558; cv=none; b=PBBlaSfivw4wjnvRrPS7bZgLoR3059ImjH0DWpWZ+1NpWbkpup4cBd4gdMGZFNOTOYAN2PZRUEhe8nQkqDGg4BIL52hJtZrrEwdBrK57k/fMrZ7Hzb1mlUGwljDj5ABcK6viOSPfap79PCta6a4gCCVFn2dcPUGEG/evLttA7FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714408558; c=relaxed/simple;
	bh=RrdAgFpxvfICpslsME+uAzTz5L+5aHCg8asgXZuWRvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1KsOL44/fAJFgyoJSJ3GWutG9LAf32Uda9MPVg/De1nof/TWIKf1+2BWSUxZeiQNL12VEcTZeVa100Jn4BP/w1tluijgzv9MPNNzcYjVTRbcrLymZxozEXDo1DH8LtE8gddA/1g37DAQTe8gmqIQxByPjz0tYTdD/flCOhlET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFFWZzQG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso12052981fa.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714408554; x=1715013354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=adQzda6pc9co5++PgQWHY34hjE2pAbP51bI2S0NH5CU=;
        b=MFFWZzQGvMB3sZPd7XGWhailnvzkrtm3LS/5aEEtyLszFr305CoNZzQwetIzKdG7/v
         ppNVrhDPBsItfOIPyWvor6oT11Jjk6mVGchfxMhRjuDCjbkVL/DmfhNLgbIltuT2fgeM
         pGNTnWeB5O81XQ4n32AOYx+kQkSPsx3rHm/jgC5eq21ZqeL2Sd2isEwjKL7oYrLqSiDO
         IOKBfV20JxAKY1Zjv0EV+HJqLauTtUdig6HO8cXmw3ERzbt0qQsHtgyLappOse6OVJ5h
         wApSzD29UhSl+x7i0a5pzqXhu6uB6cYRG3KuhVDJw6j4tpMkbtbwVzqoia2uzwzValg8
         OOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714408554; x=1715013354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adQzda6pc9co5++PgQWHY34hjE2pAbP51bI2S0NH5CU=;
        b=TaUiLEklxJvLhFSy9c/TvhGJrTJVr5XLpBvYwHjYiz1bjC0eHT9JJZ6i/AEOn4qI2u
         6/9KxnCaaQ48NxbuwK4z6f7nlJlL+BE3gby/D3hehJKR62dLc6NoVDd14GcPwSq4VSq+
         92dceaHLnr0LDCdXPUtXMr+zJH8QIRxr+5RSgpxdOsKPyOMuQiRVRNFqW02s1O5ayX9b
         DtbZUNnnv0WdT77QtrHCgHtidtr2rSmB4RrODC0Gj0/+6Mh65HOpnFU5xmx4Mq37MfNJ
         aq4H+4La7qBIjHRf3B8gD04IV/sM88xuwf9Z1TdT09JqS3LkeZKDCK999aMaNHgXwboj
         +5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXom+U3gJBogXdV+1A7DPxj7D/kNyLgna+M0R9b/blz6/kwqpgEbcOSMsJViZOP2OTfbrxZFZE/ZLvzJXErDUORQG2CA7MyAgDZ
X-Gm-Message-State: AOJu0YzQYqa9AEu+ORd7QDK261ZKylv6cMaaQuwujiooqQfW6JwTSjPk
	RtOvW9CS9Z6DWZ22hJy5prmMVv0Sh6+DzfZ6jOxIckoZIbUuJHZijsKyLFe2nSk=
X-Google-Smtp-Source: AGHT+IGDTwVSx+nyBEEqecLTAG5SWZdeSLzhvyNBENyKS37lohDmf4DELco9ZuvEF8Rv1oK17n9Kaw==
X-Received: by 2002:a2e:7c0f:0:b0:2e0:aaaa:e550 with SMTP id x15-20020a2e7c0f000000b002e0aaaae550mr1329798ljc.23.1714408554585;
        Mon, 29 Apr 2024 09:35:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id l9-20020a05651c10c900b002de553e0a7esm1874471ljn.102.2024.04.29.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 09:35:54 -0700 (PDT)
Date: Mon, 29 Apr 2024 19:35:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abdel Alkuor <abdelalkuor@geotab.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] usb: typec: tipd: rely on i2c_get_match_data()
Message-ID: <3xo5l7b5ushwkpq7tfmic7eurg624sd6f47v7fobmawtq4ai4w@qnbrumzv5nha>
References: <20240429-tps6598x_fix_event_handling-v3-0-4e8e58dce489@wolfvision.net>
 <20240429-tps6598x_fix_event_handling-v3-3-4e8e58dce489@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429-tps6598x_fix_event_handling-v3-3-4e8e58dce489@wolfvision.net>

On Mon, Apr 29, 2024 at 03:35:59PM +0200, Javier Carrasco wrote:
> The first thing i2c_get_match_data() does is calling
> device_get_match_data(), which already checks if there is a fwnode.
> 
> Remove explicit usage of device_get_match_data() as it is already
> included in i2c_get_match_data().
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/typec/tipd/core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

