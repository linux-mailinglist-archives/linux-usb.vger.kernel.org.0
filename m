Return-Path: <linux-usb+bounces-9229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A118A00FF
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 22:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A0851F252A8
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 20:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AC1181B92;
	Wed, 10 Apr 2024 20:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H+nFoONE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE818132B
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 20:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712779448; cv=none; b=OXWcLLCMkoJGuqFFALjLn1FDnwf5iXwdKhCNTQIxkFZGytmid5G/hfJbjBcP4pFnzcamLQ01MH+9+R/gJAJdW/Cxsv1KoN1x1KhhzmLQgEiuyZkQnHGDRTRWgKCD9kKjXcjteKyoUfsTHZuHRhSuVtzfhoWmdLEaNkS4/PbfoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712779448; c=relaxed/simple;
	bh=RZshPJ6evqYPkO91n0qG1ZKJ8RGp2bdBh4YZkwXC3PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcm6hCDT4qdmjOIKJlIAfWtu41Xx5YKWya/ZiNSk9JUOzLyLSYJYp43dW95c7CUJoaf7OTuOIxumLsnhtOF/QJSztbiySJRvpOg88auauXXb5boo1QEXOnj67f/3HJqNVccJPr+TiDM+1uKbKNBSVgvDyuLH/zg7EPSls50eA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H+nFoONE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d8129797fcso96294861fa.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712779444; x=1713384244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOy1Hh42V6F+x4DZzoEYVEJBh1SLMWDE6uG8Hc9Pe74=;
        b=H+nFoONEiy5j+0CJr2MSs2DFzk3IIX2y27nod7elKM1lRvzQ3/qHckGqGptHonG8n3
         0mxxBC6px568BlgASv1hlEGRfiGrLXNDqhTdtGeQ2/nrh8cfg/7rOM8BV1ezEKdP7F9J
         RyB2Mn6SBchtmyMQBs1g7LwnAR1h+05GLVIeAYWLPLLIrMZf+1AYBLBejse1ORg9eOb9
         Utn/IjhpAQb1XD2zGEQqbAC293el6LOVKV/+bQ7OST0rBIrOslUie23vptanzeF9wtGX
         PV+JLDkGnmvNP0JPVKA+bJlK/G9a90g/7Wui1Xi98u+8QrX448lRFPOeRSwJq50+8baL
         XX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712779444; x=1713384244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOy1Hh42V6F+x4DZzoEYVEJBh1SLMWDE6uG8Hc9Pe74=;
        b=EseUOI5bfKu6hyT9xOTukvcCvdXnmUk+mxI8wJ1hk9KIzS7NO0HWy7l8KJjrHEatgI
         aek9oWJty4SNye63v+nP2COvwvzSlCqx+xWVZspmSWJYhAlc43K0P97iRWfxmbec4oOz
         IwGJgW/n1snI50FAFAZOzwDJYYVpJniCg+KrYYPgAOSQuQEuocG8CI0SVsAHi2+6TS2B
         ldFa5kX65SEhTkHwsyLZ/mf2r0IYK8iR6a9mNV+mMt5HUlf4k6X4DyLkFUq+qHVw4DiF
         kp1rR5D9gOO96jGcop9T4zxXeQga1BeuxuCQwQsrCJF6Guvi0uCB7EnimwMGGgIHaHgM
         QcAA==
X-Forwarded-Encrypted: i=1; AJvYcCU10JLN3aiSImPgC5f1t75u77QcWWcNAPwgXPDlguRRocUdTbNqclnPBN379nhgoQcSoollDQCjqzagwKrKsLlZtcywsKGvIh0R
X-Gm-Message-State: AOJu0Yw2h5493F5UL1p1sCvd4tZUkcEsncUhHdoEYbvPY+3ABK3WnPUB
	QZEAi5Rh0k8TPx3akhKbSniGHFrHVn5OPWRUH5wNapsGeKMekVKXMYduqksjIeo=
X-Google-Smtp-Source: AGHT+IE6X3VsixG8zRLBc3bdURfKZPiwsNvMqMH/dzpXGqsGAi9oB18dUGWcQ10ZEEZG0UGeRha6UQ==
X-Received: by 2002:a2e:3e1a:0:b0:2d7:b78:4109 with SMTP id l26-20020a2e3e1a000000b002d70b784109mr2369795lja.53.1712779443865;
        Wed, 10 Apr 2024 13:04:03 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id v13-20020a05600c470d00b00416b06656ecsm96419wmo.9.2024.04.10.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 13:04:03 -0700 (PDT)
Date: Wed, 10 Apr 2024 22:04:01 +0200
From: Corentin LABBE <clabbe@baylibre.com>
To: David Heidelberg <david@ixit.cz>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	gregkh@linuxfoundation.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 0/2] usb: serial: add support for CH348
Message-ID: <ZhbwsQn7MZI-b006@Red>
References: <20230628133834.1527941-1-clabbe@baylibre.com>
 <2595072.9XhBIDAVAK@archbook>
 <ZVtRNZmCMImCT9sN@Red>
 <a969570c-8cd0-4217-8281-46b879040e0b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a969570c-8cd0-4217-8281-46b879040e0b@ixit.cz>

Le Wed, Apr 03, 2024 at 03:27:25PM +0200, David Heidelberg a �crit :
> Hello Corentin,
> 
> is there chance you find some time to upstream this?
> In the worst case I would try to find some time to look into this, so it 
> would have chance to get merged.
> 

Hello

Martin Blumenstingl worked a lot on fixing issues
You can see it at https://github.com/xdarklight/ch348/commits/main/

Currently I finish to test it to be able to do a v7.

We have an IRC channel to speak about it libera:#ch348

Regards

