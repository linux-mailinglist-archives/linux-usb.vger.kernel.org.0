Return-Path: <linux-usb+bounces-31269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F9CAC97E
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 550DE300ADB4
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C04330FC1C;
	Mon,  8 Dec 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fyppZwoY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2930FC05
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765184340; cv=none; b=OfFitIVXj5nuhp4+0baLQQ5oMehniKZj+zTK42nZCa2rNkJxkgpYklPTFpMboGmCJoxvHci5tJ/2MTZPiakhtChzrjGM2dgWGnxInfHQGk2WLc1E9+Zc8VexnfFfCINDkwZd1SCnWI1rbYUCSuiQAD0WpLQBLESYFZC1rxpsRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765184340; c=relaxed/simple;
	bh=+HCd19kmKM+dvoytCo1ItoD2IvVEnm7jt2ElXE4u8iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCAXF48xHv2q19REfaFm8EchFXtL3c7y5VV6mb0kG4FrBKOmBnGde4/QW0kUPaRptQG9xlgDFMDtZVfrNIw010sLX6kLKpgi5IFnO7/C05yyn1v1mgCT0kntscUwPrgSQ6vXq1zXPL6DsG7kSoVqf83O8XMBWLLw02oWDGGZ9ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fyppZwoY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47790b080e4so25241985e9.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765184337; x=1765789137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9E6/hiLvEI6ymzIr5fmB1dsMQ30n5V+sXx8f2M0IP4=;
        b=fyppZwoYKjbyPTGptHMTqbzAHW+J5HUKr77jKH/OP+rpkuq1IJ5+JQRWiY4hHRcKRI
         WQtk3U6iY467QpbF8JjOJxn5Dj4gj2DzHAOw6efY2rx344hybpWhDqq2yYwf5kGV4ZU0
         dbpTk56ZZbd7y6d4ouiXXzDkA9B6fija5AFUEsIdye3t9y44Z938o/akp6v0tx/zNJFN
         P8XIdtbs7QysM0GQbDti1nECNyI+mj7RhytAwfCYxNN07DwqP8UyJ3DZPDXuQ2/7Jzkv
         3LyKztU+Nz6ffjs7DCRRiO/LZiQFHghnvbbCwXeQa0tGAVnDqbOjN2qazyYT/n1KfnkT
         IwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765184337; x=1765789137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9E6/hiLvEI6ymzIr5fmB1dsMQ30n5V+sXx8f2M0IP4=;
        b=ecbIkY+PQj8QFTM4JDLwy03siLic54RTnPLuCfV30QrPliOtvMoyOT9sv9AOwkehuQ
         dZPfGZI7lzP5rdKdPM9pcvwuXYE0apCHDVeWpgLO7vhRu0cdCgMfW2ztdJWEJ7pi5uOZ
         Jw54L5uzz9vEH2V8RWRv0ma9NUNP1ezJQDkAJQFmPwflnQWesSQ7mMML4LScL3I6Sv8U
         gIVM/DF27RdwonKSClIrOldjiGYmKz+T5vRUJouJZPlBwSKFpUoQCLWEGk7Ywwp+Mjgp
         B4/m2XvGmDQojbujXvKgJeJ0zC4u4ttXPfyE7kK+vA+wAuFXVfXcUZu5Cofez1mlL10w
         MPIA==
X-Forwarded-Encrypted: i=1; AJvYcCXh9NmAEz6e25mklJnFxgvx0aOnjL02hw2jIAEAE8fdTpvxvm1Dj9nD33R/txxRtX+6WdyoIzdcV7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ZxQTMuAjo7yJcl/9MTStCHvZ++1P74qNs3gjY/XBq7BZVReU
	w6/IOiYOBO/+2en1uKSlLwxK1omM5XPJEZFRi9cQf3N8pgXziilE3AnTJ52xrry6k58=
X-Gm-Gg: ASbGncvuW8k7i8b+2DQTDz4QfJ07dy2RvLUGmu9eFIKA3kJW0+QhP3AZ6Up0k1g5TsV
	miaKPQzZqjDvm2SwMwpVgVW6KrmZlZnJnDA2fWUchMTkA5GcJ1ocrZBf3hQjexhe6FEoSF4Jh5A
	zuX/3Z7s1axCaIc/wRHNHtgMeSJGmhmvHkxWPK2T+nhuO5cO3bv4HuPHgPEs7lzkxbGQAhZrQyw
	Iegza9QGqhQpiyKOMnmjGd166PeSQ9sbA+2VVF7c90G9m3jhfePVkXt7Z576TMKbdDwSfUloxY5
	yxdkVWHPdqp/EAkL/1Zyi74cM1dueiAw/bBGJIhiqZT/h9XWrhQy+Fbzev1pgDsw2cLGIouUP50
	GN/fR2/2cxAhCw/DGeqm8GXtEhONNPE2RRVyyGi4fL0ujGBA5DwtIec/g9B2SW8AbT6Xlyp89n0
	Q7Rtdva5h5pu2pUk/r99detaZWPiDyjjvkl0Qvo1voMnasjfkABmuuc5M=
X-Google-Smtp-Source: AGHT+IEKS1LLYr4f5OMgUDI2no3rKyZ4xfKcI1wdmoJ/Mbn6p25M0I6kll1M5E4Jw6Q5ypt+fUx03Q==
X-Received: by 2002:a05:6000:2211:b0:42f:8816:a507 with SMTP id ffacd0b85a97d-42f89f639fbmr7230788f8f.60.1765184336636;
        Mon, 08 Dec 2025 00:58:56 -0800 (PST)
Received: from ?IPV6:2001:a61:132e:c901:6c83:1b24:c0d1:ed94? ([2001:a61:132e:c901:6c83:1b24:c0d1:ed94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cc090bdsm23994759f8f.19.2025.12.08.00.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:58:56 -0800 (PST)
Message-ID: <dacafa36-10dc-4f2a-95fd-10ff785e4670@suse.com>
Date: Mon, 8 Dec 2025 09:58:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
To: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Johannes_Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <2025120708-header-startling-ffaf@gregkh>
 <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com>
 <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com>
 <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
 <2025120748-extras-retrain-16eb@gregkh>
 <2025120846-nearby-breath-e5fe@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025120846-nearby-breath-e5fe@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.12.25 22:12, Greg KH wrote:
  
> Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
> descriptor if no one needs/asks for it.  I can play with that later and
> see if that helps as I'm sure this isn't going to be the only device
> that can't handle the BOS descriptor if Windows isn't querying for it,
> so we don't want to make a huge quirk table if we don't have to.

1. That means we'd let lsusb crash devices. Not a good idea.
2. It is, unfortunately, possible that firmware authors simply
script a detection sequence. That means devices would crash
if you request a descriptor at a time when Windows would not
request it, not just in general.
I am afraid I need to point you at the horrible example
of HID_ALWAYS_POLL

	Regards
		Oliver


