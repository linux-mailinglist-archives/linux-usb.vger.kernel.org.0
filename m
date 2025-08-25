Return-Path: <linux-usb+bounces-27249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91456B33BC1
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 11:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622E61B27113
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 09:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FB42D191C;
	Mon, 25 Aug 2025 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ELnT3n4W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEBD2D0611
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115415; cv=none; b=ez+OloE89NdpM6XWSwzfdLNN3qxP5PDWdsb7ZSPBs/XgylISd2Qpl9Sp3kVFsIM3FbRSuJf1XsNNGWjATvniQyjOEhqVDDpoUHbtBH4H6aCuZgFUrCiVLQP5P+H14yGVbyMPSzEs6lKmf4nJ/4opZDtI67GxCt55Ql8+92biGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115415; c=relaxed/simple;
	bh=rSPLVwVRYtoEX3tE394IBz28Fa6At/geG9f9uhQEfGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3YMuUHIF578WmWKSRtLvwsnY97w+EjxtUkEoz/3osxWqLwOFNZNmXCc+DS3NcB3R6+cAopSNuE1fpSzII7IbltVpoVLpDZImdlErLvioyorqsMiH7+acCrtaX9m/SRIor8HXYLNOBw87jnYbpdlNAK8NGAmUxrmO0tGmG4vC7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ELnT3n4W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c6412336d4so1479184f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756115411; x=1756720211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLFcwxK6aQsMYN2cUvNdkLnGkPTkP4FcbXf+axT32gs=;
        b=ELnT3n4WmmL8Asqw+godCgRK3SZ+1EYHKcmT/szp/63YdG35Yoid1jnvkityhxsbX3
         rdO5Jn1+7UiH2LtLMjIlb1XfObsvzP04TWx93kLpB4+ln3Y0zM5nWjHduEHfQApCmu0f
         HBlVsHUQ7o6pSriYDYPLwxL+ARi/OijjmB+3rGq6SPhuIyBcGu4HlhCkg5/PsU1vq0j0
         skMvUz+dRfLMlxiT+HmoQQhgtIK3nR8wrbWYjPSP2IyogZq0CprXM6vi8tiLy0EFp1rd
         BqjMVfo6J0C5cNnadT58JTNzGZHutjO349nk0To+f9I3up5D6gf3bad/3yUlLYZUFJyu
         7JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115411; x=1756720211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLFcwxK6aQsMYN2cUvNdkLnGkPTkP4FcbXf+axT32gs=;
        b=XjI6bdlzw+kzVyLgrji62chkhHPB60WbV0FS7eNYeyCIpKNlOMUr0zO+9/CFfKszD5
         BbL60IYbGeMbnuCJ3TYi4B7yPJjxxEwaN30UQdG74he6oWs8p4VHjVLH7XbdUIMC5LSW
         5k6emLNYkvIXmv0y8Ay789mIIFzhnAxylC+ucfeWKfOJhM1ud4xTgGxFcRqGLqFiFOvJ
         ikjixclEM8ENXj/1cqFRGsojcQc3LgTVjbFrsu6/cc2wWvUGyTV9ooFNYN4SynC54YEy
         FqJU0+UA/DHbUDRwaAsG+idi4MVXhXNEmeQcxsVzQYP2wPobrTbYm+KnzuIZzMfImJxB
         FhTg==
X-Forwarded-Encrypted: i=1; AJvYcCXG+/WtTqyBTUL0q50Yl0v00Wj6E2wp56GahnPUZ8CfuOoDUva7mBdgebQn77BDI67NkmyVL/4FGLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1g0pEwSdwY28QI5iFRMtMCgg7fuCjsk5N5DQHBUY6XfUdZ71
	Rhlkrz1kQAcQdGKAwwuxLDmPPHH+htL6fM3W4MeIunmLnb0ZYKcoSe3QwdxZBDDceRs=
X-Gm-Gg: ASbGncvpq8R+uByR1OcwI6J2/Jp2Y5L7L7/oykqZcDmWOTe3RgzNWqXGfSzkPDxfi2k
	BDG+jcMl7Vrs5oo4ghdtXabT05kRcXUat3tjyrWe7zBZN+PJl7p7iAtbDuYnFev/dGBTgDDsVs/
	xxjwarODn/fgDyJK1vu92Lkz1SP3D8E5jFECpZJluFlPKblPT61zBhSZesgMn+RVEG2cT5FFnU0
	D10+uxHEo2bKe1q/NmrCZ1dHORyTa8JM0EMaUkAbP9TGoRSyJNKZnxsWE5CfAkq+tDNweUt2uG+
	W6FN/TEl4xABthen03cEFDonuBL2p8wqZ+8eNpQejHKVUGXgQxUSNYh8weXkTpNz5a88ZgJ/fY1
	bygcnZCJZ8RADjJ9GhE1QIBDiFbOiS/QRWNq2+3bLGG+8DoD/VlEBr6O/6KDMWgsNTg==
X-Google-Smtp-Source: AGHT+IHlxZp4SUR36fEEfULy2tEt0dEYaJ3MZR49/fCkVKT3p8d/IQhSLfHWvxm3MBd0y6+YlTgYKw==
X-Received: by 2002:a05:6000:2907:b0:3c8:a4f6:c8e4 with SMTP id ffacd0b85a97d-3c8a4f6cb41mr2738295f8f.52.1756115411215;
        Mon, 25 Aug 2025 02:50:11 -0700 (PDT)
Received: from ?IPV6:2001:a61:1382:1301:13e6:2b3f:f0bc:1e1c? ([2001:a61:1382:1301:13e6:2b3f:f0bc:1e1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ca6240b4e1sm1088151f8f.21.2025.08.25.02.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 02:50:10 -0700 (PDT)
Message-ID: <d3ee7c98-c987-48db-b68c-645b38ae51a2@suse.com>
Date: Mon, 25 Aug 2025 11:50:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: usbfs: Add reset_resume callback to usbfs.
To: =?UTF-8?B?6Ieq5bex?= <ccc194101@163.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, jannh@google.com, rex.nie@jaguarmicro.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenchangcheng <chenchangcheng@kylinos.cn>
References: <20250822024602.42894-1-ccc194101@163.com>
 <f159e37f-3b27-4977-9712-345e8902eb48@rowland.harvard.edu>
 <4cdaecd1.131d.198dedeefe2.Coremail.ccc194101@163.com>
 <379c80f7-aa01-4575-aa0b-d64ef01c1346@rowland.harvard.edu>
 <23f1c6c2.2011.198df066c15.Coremail.ccc194101@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <23f1c6c2.2011.198df066c15.Coremail.ccc194101@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/25 04:19, 自己 wrote:

> According to the current experimental findings, when userspace encounters
> an error while using the previous file descriptor (fd), it does not proceed to unbind
> and rebind automatically. Therefore, the two uevents were added in the kernel to explicitly
> notify userspace to unbind and rebind.

Sure, but that means that user space has a bug.
That race is present in every case. Even if the kernel
were to notify user space by additional channels,
user space could already be in the process of calling
into the kernel.
There is no way of avoiding the need for user space
to handle this error return correctly.

	Regards
		Oliver


