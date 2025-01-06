Return-Path: <linux-usb+bounces-19029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84DA02683
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 14:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8801882B73
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 13:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C86F1D9595;
	Mon,  6 Jan 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2lVSiJhg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D02BAEC
	for <linux-usb@vger.kernel.org>; Mon,  6 Jan 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169977; cv=none; b=scbefZSBYbrjYz9etzjWWSA2BqPCpsiPAkUbp0ASJJXk2hg9XXGNRCoP4tZQgxODjv1WkZWnuTZEo5/g4bDFTE/p1taftcRTSGPOqgx882SAYhQtL3w3wj+A1iFmgzJvTwMRjRb7bkz2NIumdhPQO5x9aSILvfAH0vBikd2uIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169977; c=relaxed/simple;
	bh=dLnvqXSp4jhIyMP6CngVOVeDZc/0nQ80lXrbkTxqtLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAuErEaPmFBJEEGRr+9oo1Z9c2/kssopULhjcnsWg4HFcypMQ6V1l9YK4+KCl1M6CvZBA1dxmb2Yg8qQcoHojshvWsa2WqkloNEGR/sXH/4TZy21AGBTV0qT3qEmaRc3/YF8ac8JaS/td9kEid2aS63r4ldbGku68F23Vz6MOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2lVSiJhg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43624b2d453so148593355e9.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2025 05:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736169974; x=1736774774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSVD334vQjxEi3SIisB3IZPBWrbLvFTdFffXXTRVcVU=;
        b=2lVSiJhglDpOCUg2BqIG6C8s3SLnGfIRGqIl9krud4L7NQ6ZTmIFx51LPnN6wLzduS
         X4cxj16iOdHdHe5NluWcu7GsMLSZuvPFB6xaqcG2DSdhUR7RWas0kMfS++tgpiYHLTNp
         9SUckeNND+zqYeA7IPXIzlrqpGSVpXZnBV+NeTexA20P3P7W/9GzEP/igK4Xy91zsuUn
         tRJNv2E26iYtAKPas2N2hJxYj3UIcWiaWNg66rOZk4GZAPSEFrHLurUAJEyM2Pj5YyxS
         myPqHQNiyDZ1wlyS2L80dJOSO3uTxVz6kI63LG1d9S41j1P83yDAoCe/b/pxVqYwKcjT
         M+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169974; x=1736774774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSVD334vQjxEi3SIisB3IZPBWrbLvFTdFffXXTRVcVU=;
        b=hsq7fsKnT9f3OtOuwts91xZNYLreZ6sJVO7f73Ku6/7kCiu8JAJp3aXdWAwxQK+L62
         BF7a9qnfjoOo3uL7g/5h6l3HrTzMP5aN3oJnxmGf2PsfPnYgdzhXivn6R5EqH+2yZ4Zp
         KS7UsRgYQJN6ucI6JUf42Pede5aX+q6Iq1d+UnUy4S+Ez+RjCuhQgTKiDxAT7pZgyBP0
         MlG+pFfOuFhTYhe7yUPUZWOft/d3QpK7zMQ4tbdceTYX7gRWochQLwCbOCIFvGUq6dsC
         gEel/d/rsoctmZYvkJPbmPn+Uv8QnDExBUxwLjePSkxZKpMCH5amjYEs0evehBYVUMvB
         Husg==
X-Forwarded-Encrypted: i=1; AJvYcCUvwANOpOZlQTgCGKdbKF7OcNzJD26jofkzlBRGhviZ8Yh9LtBMHo9hfFulgkCvNKOviOyGVGNWnHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxSI9imUCEVdSB6StSbYXSHPHG0ag9pkV1ivI65zo1J264Vjv
	hze+uhDWaHh/YARLOnV4LzcUCYMv6gkhLe4htBUQc/rgV9558ltyIhq5PaS2wsk=
X-Gm-Gg: ASbGnctmzxJNQqngdqanVsy2VR4Jhr7yhj2XJf5FQFancs7KqKNa3nnfm8ZQm0fhYxw
	cMrtPnVAyhws8nyPaXl6qwkwwv1kFzo2rR2EGlIXFeP22y8bLDzFAIFxvQdyjgQ60PQSL1wotn1
	a2NgV0+g3VqxHxFWnJi0bqRY/kipOZRvIl9ejOc1UU8CKfrGRK4A11omsdpp54vXYJd1CkTMJnt
	eCspJ8Y6lq9ngJFmG9yjDl1ysGMtknA1HkeNqXcgETBDdzpfw==
X-Google-Smtp-Source: AGHT+IEpkRppBB5hDzAcfCVxNDnC9iwuE4w6CDjJSqsleEK/IP99T6SJWAQmgztkfddQMMYMX+U8YA==
X-Received: by 2002:a05:600c:3b13:b0:436:488f:4f5 with SMTP id 5b1f17b1804b1-4366864420bmr499676405e9.19.1736169974382;
        Mon, 06 Jan 2025 05:26:14 -0800 (PST)
Received: from Red ([2a01:cb1d:3d3:3500:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611ea3d5sm573361785e9.5.2025.01.06.05.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:26:13 -0800 (PST)
Date: Mon, 6 Jan 2025 14:26:12 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: David Heidelberg <david@ixit.cz>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1 v7] usb: serial: add support for CH348
Message-ID: <Z3vZ9NVVPsCfqgWN@Red>
References: <20240507131522.3546113-1-clabbe@baylibre.com>
 <20240507131522.3546113-2-clabbe@baylibre.com>
 <Zp5q5V_OnLAdvBrU@hovoldconsulting.com>
 <CAFBinCC9ftXxkyoiY=3ia6UubTeG-cHXa40ddd7WMNUhvVjr+g@mail.gmail.com>
 <Zp_WiocH4D14mEA7@hovoldconsulting.com>
 <CAFBinCATe+RXHz6Cy9cbo=vYL+qm_kz1qDTB8oL775xdgk=TYg@mail.gmail.com>
 <cf0f3894-3c62-40b4-af48-afac1c7d0379@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf0f3894-3c62-40b4-af48-afac1c7d0379@ixit.cz>

Le Fri, Nov 29, 2024 at 09:52:24PM -0500, David Heidelberg a écrit :
> Hello Martin,
> 
> are you planning sending v8 soon?
> 
> There seems to be general interest, if it makes working on it more joyful:
> https://www.reddit.com/r/raspberry_pi/comments/1gznt7p/has_anyone_used_this_board_usb_to_8channel_serial/
> 
> Thank you
> David
> 

Hello

Holidays give me finaly the time to rebuild my testing setup.
V8 is tested and no obvious problem is found.

So I will send v8 early this week.

Regards

