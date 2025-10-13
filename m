Return-Path: <linux-usb+bounces-29212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C07BD24B2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 11:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37822189961F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBB52FD7B9;
	Mon, 13 Oct 2025 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yo/ixuw4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7C1FDA89
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347744; cv=none; b=aHJNgzcOukwuINAeS8wN+bdNcagd/R2DFwJK0f/xVxgnAtljZJJxiS4iZVyB4XlDtebF42SrUoOZykBI4tDsOSBiYnYbRtqT3VFTOVVet5ATou4m9/APkZ9K7+vo/MB0bX9FUPrMcZdB4+QWkF+dCds2OehEjTUcPF08Y4e1vUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347744; c=relaxed/simple;
	bh=hxYeeHAgOwT16EhGWVRADSfTpgjj2G+23RJhB4cA7jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQPQAGfp2ylUpTAbGodpGGA4LRYaNru3QbuRzhSDnpfYFZQDzk3K0sXuC4ntPOVnSzRLBWw41608G+ie2YkX7p9OKHn6ZgHFPbsejR8M+en8wskX8mqtpUmYJHNJghQo4Hi7PPJWNhC+Ow/z6E3EfXBBSLZ0KKP0K+oD3k5DFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yo/ixuw4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so23217775e9.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760347741; x=1760952541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQATE3g55nwvdwbk0kkLPP9bQnxFpv+32D34hu/JtA0=;
        b=Yo/ixuw4yeUxpG+fiRTJv0sdm8isnusKu/sfbQ5kBkLgiUSVLBmyeGiGGqAFJSJ6Ug
         LcG4i+Ty3+0QLyIOxKfjz+Xb6+RMaVVDHV+3JmWSKNPhDY8JLkt56mIIX6xj7VZinCDw
         pvNjYTZzWFFrTvoPJrVEzlCiVK8ReWj1mg6bpcHf7kUBdrxQ49EMsZPr6rh5ldDkheZT
         oXT71JexCt/h3NuDrdRCfb/QrxpBVOhzUnZKPlp4+k+OE6llfPFV576vrRq4jRpoTzPI
         vw1U7A6IEVNSCdan1yqU+9hdB5nNWpBMOChrQZvUE6V0KotpYA+EDlfdca0KmwfuqQ/a
         hlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347741; x=1760952541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQATE3g55nwvdwbk0kkLPP9bQnxFpv+32D34hu/JtA0=;
        b=owhOwYs+4/kg4WUh5601bBPDXqJERHOrqnqZN4/5w6PvHRhHW8H4z21xFTPLGWesFz
         boFcMEnuQXIFW6CBGon2kZ8kxaiZi/ot/6I67a6vpzVAo0L9EK5PXiE8oD5/sLAEjVLB
         jBNSDwozhI/eBpC9VpABCKpcoLUfKte2Fie3GCuBsKAh/JFHz+aybQcFZXhak6Fh6MDv
         zpySCMBs1pCvXKkFAEaMTuTmooEXOw48V6CP9uUeY93gqBSHD9RIA9X4QHnPolS8+s7w
         W9uu0SfMMAUIvc6Kt9OSEwM1HvMDUEZEG68aW5zxg1z7PO1yoTWgoblaBnremk6jUtmk
         yQwA==
X-Gm-Message-State: AOJu0YwZ1JceDxvRUcUITiz+XxiNyDD2ICntpH4HXlrKo19NorotYOoP
	NMhhZdJTiz5YWKbqp10a4qopKqxtwCNx1HJYxuZ2vzd2RpSQ2APJj9VMvoDTx59a1I8=
X-Gm-Gg: ASbGncs0BKIG0E1vdp9PuyQxnBlKC5EEoyiTKA8C0XvA9EnjfQ6N7cup0hzLVx0ncQN
	CdvHJBHNrMTKBg1+M1/F5ezv45N52poTZ0tZI0f+UUsjhwDfExoLACZEbCTMuLQc6A9XO2LFy+T
	WEXTEBOycVWl9yA6qmFPjBvpHcNec51AQrFWhKPc7K+uzF7h6DUg0ne5EMjVkNpMkqqMYxnK70D
	IcWUiJ3U6XkPvuhki7u2zw3WMdrczoP0jQGyIWT88DzGARWpYHs1QyADDGOYrl7KP0IoLWAklBw
	n115qF8bcY5Wr/g0QsB7c4otmz0GxQHZUztROoaDvAfXV81OqHxvHr1d5T86mrPTdpaClVElnoz
	Yg01tOunjviNR59y5VIhzS1rKlCbBQo4XoOkgPwjuaX85UYlhkSLqVA7S5axiJL9Q8dp5+v33Fw
	z+L3cb/wkaP6b64rqVUx9S
X-Google-Smtp-Source: AGHT+IGDkVJHlc35NANz0tpcOZh3iVWEQb14l/f4Xle6JF1+xHbbGyVYPt0a0aTcEJUvWLgvUS0uFA==
X-Received: by 2002:a05:600c:4f08:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-46fa9a98ecfmr132816165e9.16.1760347740723;
        Mon, 13 Oct 2025 02:29:00 -0700 (PDT)
Received: from ?IPV6:2001:a61:131b:7001:9072:e882:13e9:40fa? ([2001:a61:131b:7001:9072:e882:13e9:40fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583316sm17384481f8f.20.2025.10.13.02.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:29:00 -0700 (PDT)
Message-ID: <194258bf-e78c-46b8-8229-3b019f2b8ab0@suse.com>
Date: Mon, 13 Oct 2025 11:28:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ttyACM versus ttyUSB
To: Alex Henrie <alexhenrie24@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 vojtech@suse.cz
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh>
 <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh>
 <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.10.25 21:01, Alex Henrie wrote:

> I did notice that the ACM protocol has no way to set the baud rate or
> read the CTS line and I wondered if those limitations were the reason
> for keeping its driver separate. Today there are ttyUSB drivers that
> likewise have limitations on the baud rate and the flow control lines
> (some are even based on ACM), but they weren't around in 1999, so I
> can see how the difference in capabilities would have been another
> motivation for the difference in naming conventions.

You could argue that ACM is intended to be a driver for a _modem_ ,
not a serial line. In principle we are trying to propagate a layering
violation that is so old that we no longer see it as a violation.

	Regards
		Oliver


