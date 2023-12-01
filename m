Return-Path: <linux-usb+bounces-3583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7980138A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 20:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4806B211C3
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9D251006;
	Fri,  1 Dec 2023 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lHRHCLPS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7866F10DA
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 11:27:04 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7b373b0e9b7so75785039f.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 11:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701458824; x=1702063624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zxbnoQx/nMO3csvBWjNwC5Mq4pYrHDkgnOkoncy/UY4=;
        b=lHRHCLPSmYaiU8p368t0Ka164t1LUb+61Ai6O52icUAHLjO8QR8m/T7T3gvztHMOVg
         ceYo02T8+pxrp9Cuo2ZqE3//ta1sezFtHzejeAWjjIH+D6WjMfszFtF2Lpb+Kcjl3zql
         IR96Y7MGxafgk0/yXmkwh5wRZJMbc1qE1Y6qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701458824; x=1702063624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxbnoQx/nMO3csvBWjNwC5Mq4pYrHDkgnOkoncy/UY4=;
        b=NCW6BlCHRI/ouTlgk8R4rILA3f8moayRYCfLCEPMwwTprQmP3ihLZ3SNE9cjB1H/Vj
         MVuARm392dE6tU1ihwH+UeTFnl8402UAR4ekcTNuHeISlLSaRFSY8K7PLg21BEjiLrfm
         Snf9JyGiBoDnk294Ah1DL1DF3Z8bdcdTm5EwMrAI3bKeYDP0keELO6+a/qDhvKhYl48i
         ftSje6/YMPrq5s/WW0KfgPYUL42GJJlWpOLap2VCyhPpY3L+aS7y0M+jbKwgREhvoxUN
         q5kxqS5rdJ2V46/8hyqU5YIXExRSO6iDEUPGSGbysvITgvkWt7AQdllMJdILcwW2On1p
         FkEw==
X-Gm-Message-State: AOJu0YwrRgTJV5dtpgRBryIg1TnPt2UjDDR/e0eUCgiyGDRB1owN959D
	vYFStpdMUOCt5VeYc9FUPPIdrg==
X-Google-Smtp-Source: AGHT+IFSCQgVGHQSoNZmAPFpaHlv8EMYdYDp05jfBi12SoTDVOlnXB4T3ElwkoFlb2dY2c3okoIEIg==
X-Received: by 2002:a05:6602:2241:b0:7b3:9612:e37b with SMTP id o1-20020a056602224100b007b39612e37bmr19850ioo.14.1701458822447;
        Fri, 01 Dec 2023 11:27:02 -0800 (PST)
Received: from localhost (74.120.171.34.bc.googleusercontent.com. [34.171.120.74])
        by smtp.gmail.com with UTF8SMTPSA id do36-20020a0566384ca400b00466788701e8sm997722jab.122.2023.12.01.11.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 11:27:01 -0800 (PST)
Date: Fri, 1 Dec 2023 19:27:00 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [RESEND PATCH v2 1/3] usb: misc: onboard_usb_hub: Print symbolic
 error names
Message-ID: <ZWozhDkH1C5hlYIv@google.com>
References: <20231127112234.109073-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231127112234.109073-1-frieder@fris.de>

On Mon, Nov 27, 2023 at 12:22:24PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Instead of printing the decimal error codes, let's use the more
> human-readable symbolic error names provided by the %pe printk
> format specifier.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

