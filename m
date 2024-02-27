Return-Path: <linux-usb+bounces-7110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B215D86850F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 01:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9BB4B233C6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 00:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7561848;
	Tue, 27 Feb 2024 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UxEr2dFE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157281F
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708994348; cv=none; b=QxMUqfziqsL8QZ/He9yQ51NlqfuTqT0KekjEeUKRjDK1xFIvDt5BUMkczTW6xwPLwvxazC1oVM5wEIdQoHfglpwFh4+ti1zknFMphhLRI12BXgfx+hkEPvC8mZhT08Xcyc/kT5tYokdkV/V4b7y0Ey5le8iDSJ+9F65he5HlxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708994348; c=relaxed/simple;
	bh=AhrhA0X8avLtGyybofw8r1o+S07uog51OtbaDma0OpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bL4U1XPjr7DMBhkhp3JfW0vBqanJle3v3Z0fsZpe0IMD7kEmq7ENNVIbfA0erXe1hUmeFrw6jNNgwPc4EFcx3DUVeYQAmaU5UOaF4Vawyw402pnD50pBpopvlbQBj07tJLnS3HomODAQQOOtsYYgxPXGzyqfqhCXhPS/4sm+/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UxEr2dFE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412a2c2ce88so13345e9.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 16:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708994346; x=1709599146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhrhA0X8avLtGyybofw8r1o+S07uog51OtbaDma0OpA=;
        b=UxEr2dFEwcUavdUPR8MIesb1pyxx7G1tkQKMfQUrDoxs0C5+rAyCWK/HlXoX+AUryZ
         ZRcXlUMXuyus5SfvYo/9wlW9/NhMfebjUzMFYHICx9hYFGgTt5StAiYhM1UDpPHG1IW4
         V1HawqvwXp+gxx9Q8hYWcri+ST97kRKPImhLkrZTHRGKSYww6H2I0vcwKgqexdoOzDp1
         ztQNP7nX9uaPoHT7PqmtoWQrqMVlpw4aELlDyBaGf/OGMbov/SV/lZrxLqsNVASXreeS
         Y49KekUN7gZsX8hjrjLVZkE3vACciVRtxkbk1rS1JBamTZDx+25qlg0iN6bG4YmKSUWj
         WTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994346; x=1709599146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhrhA0X8avLtGyybofw8r1o+S07uog51OtbaDma0OpA=;
        b=HIH5Wo3EQeIjbtlk6ClkPylKlXAmV6DJSgnA4p/8CAb/og3kRNr7hpvZuQCvansLYp
         9h4joZGuVSlOGEN6tTfYGcjYkGzds745fR23pmEO7kLhBLMxgF9NUBv1uKsIL/2QCTI5
         vzecXx4G/8y6SH9Q5/LXe4MoBc1zkFKgpdcq/JAyDnPrqJwx0T8LUHEoO0bm0bWCIkjc
         eaRX7i/devtAbk/125KahN7x+XgMNoX6+IAYeawx/oYIJP4xSdYjcU0azm2EULpZ7pAA
         +yiC66Q/O2jB9TjoyPJ1qxwyNf48wEz/CTUVQzgLqR2RsqsrBtulbEGYQAvZkoikGsaG
         9eWg==
X-Forwarded-Encrypted: i=1; AJvYcCVTtesRLtP4oCXT2u9vsJXotOo0fujEia3LhA1Rln9kjZayXH59TXaqRfsnlx4K7gEYufj4dfMOAR4gNdZiMi7DzH7SD0Yqu4FD
X-Gm-Message-State: AOJu0YwxWVRKIaoWWjesnBWMraLeU2MYulzLI/A1crjpWpmOBuficc/e
	zN1yz+w5I91uaYKe7qANEuAZJTZHHUU+0NIlcauqP7bQPllLVbdpPSrquHhmQ+wa6f/p5Q4vrpI
	e4LethwAwk49V2jYygG5uTQyUkUCJcv25h0Q1
X-Google-Smtp-Source: AGHT+IEnyBDnhYmsBfNFkYuwY2a3M5LFXYnqw6HaS9U6td/mUiCJUzbjhRP86gOsUbFbHfGuNU8aNOrZNbdM0Ay62/M=
X-Received: by 2002:a05:600c:518d:b0:412:a390:3440 with SMTP id
 fa13-20020a05600c518d00b00412a3903440mr49520wmb.3.1708994345708; Mon, 26 Feb
 2024 16:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-4-jthies@google.com>
 <CACeCKacHYxdvdzaRxRMREeXWfbunhSy-3q+sSKHbJ+u9XXQukQ@mail.gmail.com>
In-Reply-To: <CACeCKacHYxdvdzaRxRMREeXWfbunhSy-3q+sSKHbJ+u9XXQukQ@mail.gmail.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 26 Feb 2024 16:38:53 -0800
Message-ID: <CAMFSARdAOTbPpiah=aqk6DFoNLWahdquSrPNXQmAiALKOCAxhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses
To: Prashant Malani <pmalani@chromium.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please consider using two commands to retrieve the data. This will
> allow you to support UCSI 1.x too.

> Nit: I'd probably call memset before setting con->cable to NULL.

> And the same here.

Thanks for your feedback. I'll apply these changes in a v2 version of
this series.

