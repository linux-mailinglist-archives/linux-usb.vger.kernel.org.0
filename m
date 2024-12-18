Return-Path: <linux-usb+bounces-18642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7CE9F642F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 11:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751A51895511
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBE919DF5F;
	Wed, 18 Dec 2024 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEUWUhZF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F619C54E
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519406; cv=none; b=gTTxuFbTK9sNbrX1OPsqN6AmUiaJwggsB5ye5Y75CAdPJehMvC2tPGg3IKG5HTpMqDkU00mSw1VsKhY2hB3AhblL7FV0RJ7vmhrbMsqAv8YQL+nd7sVXj14qpbhbL/8lifEp8Cwzz1rODNLsruy4rmNhvku9313yO94yTYw5RWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519406; c=relaxed/simple;
	bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISJSStrYCFEzeVkUFbP1IARW2eny+JlYRwiYVhDX7HzyZzbsJ/uDb6M94WfybEImAQEXeth7AC21vkiBmVrgSDR/KDD36FXvIiGun/HB8BSndV0m5HnQ08r9+F8uqhRdlONIFD4z2LGvV7fChEj6/SB8eqUYMUBk1k7lDMEISc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEUWUhZF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67ac42819so1015546866b.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 02:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734519403; x=1735124203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=sEUWUhZFVNzs0TERxmcZlIIG5VwfTODpa768BK5Yx7FdTcHzNcUVxanWrOTiI66YHV
         qjLuzkMAylTCH9b9x7krOo10VayY9PkrI8WfGln242W3es4ayI4zmSC/28s8CcLjhK4y
         LuxeGcnD+RpfSyc3RPkmVnePmKJSvPwA7/LsoiXQsVYU5Z0FfcP6MwB9SyOciQyEL+P8
         BBpY9VSLHhSHHfduA+869a9wKwuX2dQP/oa326czBMc09zRAc6Jl5rJut2Eosn+K7XGz
         HXldM41DNny5CDvgftTWCLiwzRvRnQ28xWsP/VLDrmiMmRqG8KAfdgYTRMcPIgPI6/a4
         W2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734519403; x=1735124203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=cUyzREzLPjyjpy5pqNFI/iwumIm5/Atr3emxAcxgPu289LGC0wHYz/CF1aP1D5A4Sg
         xplXh5S61fVxWsy2IhRjCnPSIwGMZIxxaAVgKYqfVUb57l1nlwPWYeI3bqpeRQ+IF/FS
         VjsviWL4cV0rji23kg9j6nI43RhP+Tr/N9bJJSPoWge24i8AOjzg19yJiAbnI9Lifa3z
         tSONoQK3rVGv6mlIoV5ioKzd4JckVMKafDOCLLCTWWmIcuoNRFyREKlvTjFb8QXMY4MV
         txAiNWehoYcNN5Mduix2iCqMfecaaLVJcvhvADXXR68oQyACOVg6Hdj4E0TkcwVvfRFm
         dg5A==
X-Forwarded-Encrypted: i=1; AJvYcCVOg8pFFdzneqJxkaZAZcVb0Fh/p+T8hTNtxMD09mM4RNrVkUGpc1yuM7kf4YCDfnws7Y/JL8DcP74=@vger.kernel.org
X-Gm-Message-State: AOJu0YynG9euvPrbxOidIoS1m+AVBq0anDU+2JCFxtREVuHe+1d/kGUa
	9VIEX68c2b9KgIUEh9dDyNzlwD+vhGdgoS6XqG6zGJ6pZoBzECGZdjO/OsE6/y8nC/1KQPMbeRX
	W
X-Gm-Gg: ASbGncsr3Tly8ozATSVSYLjSVcduzslIAcjoi2qQYXBuIjnlW+FUEI30VZgYRzOO9J5
	dK5sWjmuqvTuKflhZ+adrJ9OB+UFyFTK4FfIfvuHaeGkZf2F3wbgDaosPb+OPkYt/jNNC+eGWet
	DqEqkF0VSkyN/UbaVdeZSJJDmWJ7HxFph2PnKZzUjk8CenbMDVEwVGjVV4yLSG69KIx9NcXxYFs
	UCUQGW2Or/QkMB8oE2KWm8M+eTXMzar8eyBoXv7+XYK+ZlaeUl+nNYOt8dazA==
X-Google-Smtp-Source: AGHT+IE/DWSsh274zbrdOvo9gwMqTUpaPLUr/pgihNb/oqeoC9Ggo5slLMiTVrniiI/U8u/pkIWoVg==
X-Received: by 2002:a17:907:96a7:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aabf476eaedmr223466666b.18.1734519403047;
        Wed, 18 Dec 2024 02:56:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aabc8060de7sm299490266b.53.2024.12.18.02.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 02:56:42 -0800 (PST)
Date: Wed, 18 Dec 2024 13:56:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4] usb: typec: tcpci: fix NULL pointer issue on shared
 irq case
Message-ID: <1f50582e-1332-450b-9da9-08bb25d798cc@stanley.mountain>
References: <20241218095328.2604607-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218095328.2604607-1-xu.yang_2@nxp.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


