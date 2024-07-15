Return-Path: <linux-usb+bounces-12217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D893107C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 10:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80DDCB22973
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 08:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4B5185E63;
	Mon, 15 Jul 2024 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S5Bpm5kz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B9185097
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721032850; cv=none; b=ZKVk5MT2j1dnJtvpCnvWGK7R1QjG/+7sU+rXibF3A4ykKSxyztuPxvvtYDRkq1KntHzl041laCQtsl3Ch4tTKTnDrJvBMDw2MrhFP3SS6ohN9JTOJ7g2Pl7Lf5d/sFKGSq3GkX6rRc0IpVKWK4h+qQ2biEzqUnMVNt8qm3AeYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721032850; c=relaxed/simple;
	bh=6GvFMbwUATk1sUXZPl4JjNM3bArP2OemPHis6rIs1Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgYN8LR9y+Je2BK8aKouxeK+j3so7BGGpdohrNHIcnshUKGV86wvX8C65Oh2TjkPd2vMx7p9Nc39Qtz0EB1PNURqXAH6rNmgbN9rQ96kCj8BiQME8SFZAPNOkFpkJDsLSNBWJTOCNiPJ9Wbybl7UL0m85a9MfTbcnqpesg+AfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S5Bpm5kz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266fd39527so29166085e9.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721032846; x=1721637646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHmMsEVmf8JfSBcSjUAB0cZkcplmejuDCV0HeNhunZE=;
        b=S5Bpm5kztS/wQxSqEXxgUitFkdfMIFaoaefj1gFwhr0WZvh4H8Q0a8qtu1p4bGUwra
         K1Eqa5Tl9g2lb0Fw/Ya1t0t8DBsJfUB4R8bXv7StqUdKf+wiIfW/KF4fSyC0UmMwcd8a
         bTeHUpxZ6DEVD0MZZyDikR9HCsfUSEi4RYj3Um1NEoVuESM2YBJroVYGocjIpcBLUXIe
         oeNA512SQQ+xeYFx1Moan013s7CXXDJCY5zvJiTrGdIPUD9a8ysX5uxSz2in2dwrw38R
         TxkdBWW0SfwOMk/bWPS9toX3LhoAPCQ8q2aZR5fBNTlhNyitvbikEIPljTayRpftpZRW
         lEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721032846; x=1721637646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHmMsEVmf8JfSBcSjUAB0cZkcplmejuDCV0HeNhunZE=;
        b=ipT+Nihm5XY0KH9NjIi10jI66u6EW7CymQ0mxQctN0uep0Yu/Q2jWJMmxowHsI8l8U
         yiajyL8exLn3li3Uj/eSc6VOc4YrlrcRD4L54H2Lo+VsTuWwGMc57gHG+E7Yaxx9MHgO
         Wj1GirMrF98FSQso5fNBTZ7sGzz+hoOGcmxtBuJqwkoOQsaX1fRDZgTZs3zY0ZCbZG98
         LzQyb2ei0TlincW6G9RdQAjVB98OOPXSDZKSqgpiS/YIs8sMfv+JY+pKgDj8b776yhYI
         wVZbzBedENjmJztjVpAMPYQMH8AwOqIryYaBxRjcIwZY2rwZHDvQY9wrUyAsuzDms+VT
         DkFw==
X-Forwarded-Encrypted: i=1; AJvYcCV5MOeUO7cFwypmmyijhclGWtj17JJsPTDyVKRH2P5tERMXzNI1MqipTyVDxwRyC+Eg0IUt5F7HA9qCubgig0k0S7TBsr+J+pXf
X-Gm-Message-State: AOJu0YxOHWj+y6ionhfKF5J3GaVjhex/ISv28zalqFb5GHghH0smGFKH
	5h+JtkDEe89CiX6OOzEXoxS3USUkHB64K09R9XF2NOdeR/kXIUDdE9o25tAcmMw=
X-Google-Smtp-Source: AGHT+IEq9NHTu5d9NOH12PpLGxN0a5a7Quiyv4R9B8DpiRqNRjUD8dabhuJrMp+F5YO9PhasKO+KNw==
X-Received: by 2002:a05:600c:5125:b0:427:985b:178b with SMTP id 5b1f17b1804b1-427985b188emr84919855e9.16.1721032846220;
        Mon, 15 Jul 2024 01:40:46 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc2efsm113024225e9.36.2024.07.15.01.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:40:46 -0700 (PDT)
Message-ID: <4b7888b7-8848-4374-b532-f65cefd40e56@suse.com>
Date: Mon, 15 Jul 2024 10:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
To: Hongyu Xie <xy521521@gmail.com>, stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, brauner@kernel.org,
 jlayton@kernel.org, jack@suse.cz, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, xiehongyu1@kylinos.cn
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <a782c5bc-fc8b-43ad-9c6e-1e6799243364@kylinos.cn>
 <8a16e1c2-fd59-4279-8b36-806a214385b6@rowland.harvard.edu>
 <b15d0ba0-e133-4df7-8371-a701ec5005fb@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <b15d0ba0-e133-4df7-8371-a701ec5005fb@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.07.24 03:13, Hongyu Xie wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>

>>> When will "a reset user space has not requested" happen if there is a
>>> reset_resume in usbfs?

The literal answer to your question is: during resumption
of the device or when power was restored to it.
Before reset_resume() is called.

>> That's what a reset-resume is: a reset that occurs when the device is
>> resumed, rather than when the driver has requested a reset.
> Right now this reset_resume did nothing, it's just an empty function to prevent rebind after resume.
> Maybe I should filter out usbfs in usb_resume_interface when setting needs_binding to 1?

Strictly speaking this is true. But it overlooks that at that
point something has already been done to the device. Either it has
literally been reset by instructing the hub it is connected to
to reset a port or by interrupting the power supply.

The important point in terms of semantics is that the device state
has been lost. And it has been potentially lost within user space
knowing about it.
There is an inevitable race between a suspend/resume cycle and the
next usbfs operation. Therefore After a suspend()/reset_resume()
cycle the next usbfs operation must not be executed and an error
returned to user space.

At present that error is ENODEV.

	Regards
		Oliver

