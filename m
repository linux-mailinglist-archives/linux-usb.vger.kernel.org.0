Return-Path: <linux-usb+bounces-25886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA1B07AE7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 18:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69BB27A51A8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 16:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1782F546C;
	Wed, 16 Jul 2025 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RSSbQdYM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DED2F5330
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752682645; cv=none; b=oPtyIQFIlej1IxWPJ7JRcc6AZ+3BhlMllG9xRV/POFDEF/2C8j6sH1PJ9YUrbi7aJrPfij/OwynyXLsH8kJlonPT3MvXhIljrrQNVrSlccoIhC8Sf1Hsif+IBOPz2ZBmMvAlfzTbdq14LpgULg8eIbkhQjHPh3y8i8s1m+8Xl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752682645; c=relaxed/simple;
	bh=2S29ztdoZu+lSUgDZARUDIlqmdD/4e2XN6yo3Ko0Ql0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9kXfx6eDzzVkJeU4JhU6bny5PtF/lG2j90cK3fLgUXW7LY+13hY0JtDUKI2aOhC/MtY919p8xEn6vh2+WhEVxPSXmW8jpHa8bJyRVxpW93Kzds0WcUO0hJEOZwbWrBGTgI96SFmWsl4sPby7kivD77DZKYw/oe3NHorYyRTdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RSSbQdYM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so11375793a12.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752682642; x=1753287442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QjOQCdqS8qm4/VhAwfJZCG868dIz30V0TAdtgEhaExw=;
        b=RSSbQdYMO/iI6veaXAFcYRmlv8/RkBru6JY25ZHVxGVRhffTsPhMYQJwyjOSIb2+pV
         NZHz/T6J4zgS/Xfa/jqIUH3Rtr+vHS2rfhOOxqmC4Xza2Y2X52s+2ljRrrY2gUuVTxv8
         VjQs74SX4kdnZxdnIN/0tJPghctpGHHIhY10+4WG3/h/DwJsZDG7N1GzeJEx+xyNER8W
         96+RsuqpS9pJlZA+qWEaD/PCWuhrZjjXwsNI6ZL2RvGaKPfplpnUGsgEsqOzkcfmQPv9
         /7lNecwafYQnQyBhPm+Sz4mWTIUVshZtqftNyLujcYOaWMdoNskc+/QGp5zPerMcSQGf
         JWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752682642; x=1753287442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjOQCdqS8qm4/VhAwfJZCG868dIz30V0TAdtgEhaExw=;
        b=E8lnc/YXNej8VIlTixeYxrHl1xpzuiDNnxtb7FdV0PM5fp9HvQJauZMJi2cVBBXCRy
         uKfC1iq8Ym+IspWwYdaxDZTWqokQkfllQLwqePaIQxX0M83EzfunZdfMMUVqVi2zCVyK
         DMC1kTGkF99Me2/HRD997HtK1GAYnRtKWR7CgzYBSyIaS4Wqe7E6GDVoSxOJPwwyz0bH
         FtCfUNthViYHg9BpWsTejF+zSKys1gXPHRMKdD4nzR9KNnQELQDanTq4QcL/hvnYTB+9
         IO41QOwkwnfkUsHJRRCdwneXJv1Pv/XL2eqSBC9WNNdLx/2UVNDIXgbVg+nGA2Q+9kGF
         busQ==
X-Gm-Message-State: AOJu0YxbHi0vOjPYL73zUnwDE+rCTLndBzXgYukoCGCyJnOheB3Y04Kg
	1JuaFUhUaNCbAT2EnWOKSRuHpoDFt/q7f9AGJYLx7xLQnmqvh9G/jtb3d6AjMOROMhw=
X-Gm-Gg: ASbGncuTCuBIQLVJaX8i0FZL4kYhPPzzryLThW8gtM2rwB68oZhxk2vlxqrJ6mOkt3U
	NOTg5aVG1WGIesObsXfFIaxQR7jP3fB8gVy9aZDVBKJMFhLTp9gw+5rGN1MFakv5qCbv67PEE4e
	is1/EUnrPVaraVP/JcmzCvJWuhOjgaQtko6jzJC4SxnvoUk+NZiSHPXivJMopnxI9OUfQRR+eI7
	pW1Jm3an48Po8XjcqRucbj1NqQ7BQGbenrUef6qqsbStEtbPS5Wi2vgD9LSAbtGS829qmHYlwbh
	jGmA7PP+tHwdR9Mvn6aMx4ELXrrpeBbloVr6uKHO766iMiZQMi+l/rnwa8gowg9s1x5jQuGO8D8
	4Kc/nRrZE5kxwKphx2DcuAdF6apicYuIQVKdAeX2D/jqmwFPv+ps+sSM23z3O4hNGItM=
X-Google-Smtp-Source: AGHT+IF5iXIUmrdCM8FhNB0jGX3DsNw6jrLVe+lQO/cwacf3GaTVn0cynfyX1i5HLYqqcIiwQr7RfA==
X-Received: by 2002:a17:906:f114:b0:ae0:da16:f550 with SMTP id a640c23a62f3a-ae9ce167b10mr288616566b.49.1752682641624;
        Wed, 16 Jul 2025 09:17:21 -0700 (PDT)
Received: from ?IPV6:2001:a61:133f:9e01:3f5f:8464:37ea:5571? ([2001:a61:133f:9e01:3f5f:8464:37ea:5571])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91c81sm1224581066b.37.2025.07.16.09.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 09:17:21 -0700 (PDT)
Message-ID: <2c807a7e-d55d-4670-9a86-e3fcaa3e52ba@suse.com>
Date: Wed, 16 Jul 2025 18:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB cdc-acm driver: break and command
To: "H. Peter Anvin" <hpa@zytor.com>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org
References: <ce54ae11-72bb-4ac7-980b-c1cbc798a209@zytor.com>
 <fa20ab91-5ebf-427d-b938-31ea6fb945cf@suse.com>
 <83B89F79-D28B-4F2C-87EA-F5078BD7ED17@zytor.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <83B89F79-D28B-4F2C-87EA-F5078BD7ED17@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.07.25 17:06, H. Peter Anvin wrote:

> SEND_ENCAPSULATED_COMMAND at least takes a command string – it was intended, I believe, to be able to send AT commands to a modem while online without using the +++ escape code and all the potential race conditions (and security issues, since it is trivial for a user to generate) associated with that.

Understood. It still seems dirty to me. If you want to send strings to a device
the proper way is to use a device node and write().
  
> As far as BREAK is concerned, there is also the option of locking out a second BREAK for the delay time; however, this probably should belong in the tty core.  What do other drivers supporting TTY_DRIVER_HARDWARE_BREAK do?

I know of no driver but n_gsm which uses it. That driver needs to use it,
because it cannot switch off a break.

If you really wanted to use that API as it is right now, you'd
have breaks racing with each other and, worse, with open()
and close().
Are you sure POSIX says nothing about how to handle such cases?

You'd probably have to start a timer in the driver in send_break().
That timer would need to be properly handled in disconnect(),
pre/post_reset() and suspend()
That API is really not nice to use.

	Regards
		Oliver



