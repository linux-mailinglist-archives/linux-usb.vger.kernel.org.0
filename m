Return-Path: <linux-usb+bounces-17837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD19D87E6
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 15:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4C9168601
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 14:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C03A1B0F1B;
	Mon, 25 Nov 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VRPloq9M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C71AF0CA
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544856; cv=none; b=JaQUCTury//CoLZoFjhuj/DdXshSII9NCQ08YOoS1OKzbuF4V7l+CFdG5sAkTWuoXubwOpihr/I5MRS1bcPdckdD5WQ+pkU7gkekyuDKy74mE3+bOzCFtmd2dgCLVFtn80osW8ceh0j9B/Yha34u8cMJDCsfvQHmJu9SZSyP8k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544856; c=relaxed/simple;
	bh=U7o1D57jtLh59OsO10ECFtaACJakljAhHoDMoWgTwTk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=N/TFY8gfBgj6MMkw/6BElR9IIwfqpXZmVYu581zgvcnlu4QZXqoYJnMV1P6glzGwBRV13NaDdpPm8mpKfcgm5jj46yw3CjDIJZPZbO3r15TjxhTmiOCvFM7TNXP4ibktmsrahYKon2uD+f/IErCUftjhIpMjnTFJMPgQJnz1jsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VRPloq9M; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa54adcb894so161127766b.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544852; x=1733149652; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/ahLoTkOQbUNPLddwR8ZxbuZmpOwlJuFObCG9r4Ks0=;
        b=VRPloq9MfDUX9YWH/ZTbcLKHfTH+RH1IyFwzvIQQ7XJFhbgW2xKN22HB1RGsHqYtM1
         b/BppOySOW3r5nRi9/052TMv2XE1pcks8qjJCdHf8DLy2BFI62kN+wGiRHmG6yOz1Yyv
         b+VmMZEcOnnVZP8LFOXe1jwLDan/UNgLlN3/J4aFq3QTLOdqeHO/IPgTlR7yHERerKaL
         IfVw4rZs27sKRi8OCGgBop8p4FiyqE6844hVAEWuCtlj1a0Bd2r9ULEs3Gt1fhmb+MMr
         6WMKl7+akeSlt1DaxPkQsMxfC59ALozdNnLIqLVuxv5GOfTme5Hl0jfVG6wmDgAZdY7w
         FDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544852; x=1733149652;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y/ahLoTkOQbUNPLddwR8ZxbuZmpOwlJuFObCG9r4Ks0=;
        b=uslBCsHQmekO6LvViC6g/APrMHoD1BbQT8qhEB+CGFeXjJNOjQenHqqZDgQvd9hMzE
         rys2SvUZxZ1q4/MM9JmjnedMGr4VtJlqRt2ZbVhiz8pOCcKDemSRB7t8znHdYlFkiJzK
         YpNCCLnf7cNS6a8sCKFiFaOAVhskNqz65zI5PhpJ9ezJRhN+9fSTJBSd8vqiRao5EN/E
         MNZSG6PH3F1xn541DvRLiWlSMZ34vnlQ/m7wIzfCYDVdDYk864OZzUwX29LO+EP3nElV
         dInNJaAS+aYA0VtVpjVOC4HYuMJlie8X+g9Ab8wNfYKzN0Jnd3/GCQCJmyypmoDUz+O5
         nHSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxElUrjujDkM1zxMTv8du7b3pxRnBb5XQrOnx34DN+UVi7FqjLt0/HkckYF231oFyVdqmnSMtk3rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZCCvmFFKl2B00A+KS1TBEY22amifo6dJIZN/lwmoy2eOb/do
	bk39beEh5yRmSjmapHOEyFhdVqGsv27t/QSZlfTawdaeW/8jmBHq5S+ekp0tHVM=
X-Gm-Gg: ASbGncuQi7nqf6cxrJu0Gme38NYKAU//NSUj7eA21+IPdRzmZDqUsLPRnxlng8Xh4DB
	eRJjnPLwuN+cthw9UBsJfaVy+2gEa10kt3b98cABU5I4KBRmx5yM+rD5PZbqdGc8a31LGPX6Jid
	cBHpFZaN0JtJ0UBBrTpZXy5694chuMjkkW7xHUjPAd9DEDfSlimph/ul3OqYSlr9MUpySTvIU2V
	jPls2qxI22NNECWgCaWxHCHEO560RotMXJ1fcxVgcCiDf8ch5OTTPwJ7IfbPnE5sFMzJeuzsQOK
	6Flj+M7CerNxwMI=
X-Google-Smtp-Source: AGHT+IFgbHxmjImxNV3kZB80V8ydJqDA7TNH+whiROTVRZ0/HcdPVatBu2UqWg0PqhvwrOKRhKe/uQ==
X-Received: by 2002:a17:906:4c2:b0:aa5:da4:3c0a with SMTP id a640c23a62f3a-aa50da43c96mr847236066b.59.1732544852161;
        Mon, 25 Nov 2024 06:27:32 -0800 (PST)
Received: from ?IPV6:2001:a61:13d6:901:7eb2:25b5:1313:4c48? ([2001:a61:13d6:901:7eb2:25b5:1313:4c48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5bdffesm466680866b.204.2024.11.25.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:27:31 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------28AC3v0ghe0AXOY8l22zAvJY"
Message-ID: <21c2fc3f-e55a-47bb-a51b-b53e5cab1e67@suse.com>
Date: Mon, 25 Nov 2024 15:27:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
To: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
 syzkaller-bugs@googlegroups.com
References: <673f740d.050a0220.3c9d61.0176.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <673f740d.050a0220.3c9d61.0176.GAE@google.com>

This is a multi-part message in MIME format.
--------------28AC3v0ghe0AXOY8l22zAvJY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21.11.24 18:55, syzbot wrote:

> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
#syz test:  https://github.com/google/kasan.git 43fb83c17ba2

--------------28AC3v0ghe0AXOY8l22zAvJY
Content-Type: text/x-patch; charset=UTF-8; name="iguana.patch"
Content-Disposition: attachment; filename="iguana.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcmMvaWd1YW5haXIuYyBiL2RyaXZlcnMvbWVk
aWEvcmMvaWd1YW5haXIuYwppbmRleCAyNzZiZjNjOGE4Y2IuLjhhZjk0MjQ2ZTU5MSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9yYy9pZ3VhbmFpci5jCisrKyBiL2RyaXZlcnMvbWVk
aWEvcmMvaWd1YW5haXIuYwpAQCAtMTk0LDggKzE5NCwxMCBAQCBzdGF0aWMgaW50IGlndWFu
YWlyX3NlbmQoc3RydWN0IGlndWFuYWlyICppciwgdW5zaWduZWQgc2l6ZSkKIAlpZiAocmMp
CiAJCXJldHVybiByYzsKIAotCWlmICh3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmly
LT5jb21wbGV0aW9uLCBUSU1FT1VUKSA9PSAwKQorCWlmICh3YWl0X2Zvcl9jb21wbGV0aW9u
X3RpbWVvdXQoJmlyLT5jb21wbGV0aW9uLCBUSU1FT1VUKSA9PSAwKSB7CisJCXVzYl9raWxs
X3VyYihpci0+dXJiX291dCk7CiAJCXJldHVybiAtRVRJTUVET1VUOworCX0KIAogCXJldHVy
biByYzsKIH0K

--------------28AC3v0ghe0AXOY8l22zAvJY--

