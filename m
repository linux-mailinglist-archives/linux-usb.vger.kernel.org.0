Return-Path: <linux-usb+bounces-23942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF12AB679C
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 11:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1C01B65A08
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45BB229B0D;
	Wed, 14 May 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LvE6IK2R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C21F91D6
	for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215266; cv=none; b=eeBqVmt/p+io66lU3jKgMbHHrQYfhnN6+eN3SmuTIysQ2yaAI8LOqAgM7HeSqn5J11rc4JvFZZLhga6P2Tn7AuKTu8ONQ5MPPYLeCYAZhU6swE7dvNJ11i1Y42xqhP+UmsSA7FNRs6m/qT5dVBL/o/poGAGY+pueIuB5ok4MTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215266; c=relaxed/simple;
	bh=/6nGC5BjccxoMp2RpNx9KKztyfvcmY9G/pI4GwtOFzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqyqqdGAU3SWw0/IrYoz0iAVgmD3QTh6ny14l0m4xev6bzkMKq9+8XYnln2YC5Uv0v+p2RmwGZqox0pJy9CJJX/GRgcdzc4YEo1d4g/0BNvuv1KaiAcYsV0fhRj8RUvri0/vdnP42vVPuHKegCxjNlr+as6i7RzR91PcHz/FsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LvE6IK2R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso60592485e9.1
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747215262; x=1747820062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkOm0GV86xe5XfURWCDnGvFTrA8iPthriDTjd8Ct5Pk=;
        b=LvE6IK2Rae9teU2CahXBRRxRTvLyxbiN2aDRbERmRR+cOyddBF4cgecS4IUayMtJyj
         Jp3FwvTgME3rolh4HplO1dkfdm3/tvPDy23wu5vxvQ02wRYsRRC02pOsNtas26E2ZzGk
         LBqCipBidmvIHcILIPIjg5guXu11gl6kvYuHmfmRSDhgZ99dlb4P9oDgINKkGftLQvHI
         RPjd9pT7uJzspKaFwaBg69/e8f1QbhspoFBsSY+xwj9CGrOXfvTcMb18bjtKYswI7HB1
         NQOsaBjg2l0suRu37x1JZBmaQW4Tu9N4LJZP8FGVI8XCytRYoDBfLY41Nzo5po9XkklQ
         EDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747215262; x=1747820062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkOm0GV86xe5XfURWCDnGvFTrA8iPthriDTjd8Ct5Pk=;
        b=iWPErr7C0BSbcdYdzcdRMy2tpVm4K8bfqfbtbINrhgD1oga2JL8io8jmIky4CWDokh
         r6CCNaHcK2ePMtqDGr0nc8i4itB8Dvw6bwRYnBU7lpuwQH4gD3f2qaX7Jb99nDkmH/IZ
         ZlfXtSQBxUQkKIZ9scArvehgPohWiPh/pKS8y9uOUeCdWJ+0mk9//+kbbyzeo1oDxiFu
         C8x8TXHf5vPA6tND0XY5aP34D8p/5TGMEaemHIRkOViNzFLlhpWGgM69JTcgqspMtGqi
         beCvyE6iVQrzHjgIHZmIsHHfoX6N5RiauYxwSDSJCCoaSxqKeksKGkKO71UTALu2HEH+
         MHvg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Xg8nJusoJCMOy4cA7DEM1xBGgE9tAKi8WUPcp9hHf9Ksxgt/Qk9E2vZLS3xwUIOpkvkGwUct1/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDexxilDG4ygtz9ZlMHivJLcBhirO7z4Y55jGQUcNnrapDjTDc
	9/t7ndXf89lRKOWI3GRG8onEXqbdJOyrMrN+SoXVvapLjdme5TShOsWYojwR6Wc=
X-Gm-Gg: ASbGncvB4p4GoO9SJf61+/IUScDJm/c9KTixCJYaiLPnW+hAZ8gQtcL3Ccv9riWj/MI
	fwIh3GsGGN39buySv9sUaRBbUN1eVlmnHeZi5fE9bLY2kIcOF1j8iTsfdKkKb6oeg3bpV5KwNdH
	ZEPscqRRmQroFsD/1Gmv5TwXfj7ZPxIr/EakR/kLo1ChCQU0COF0a4ZLQqXBukAaIsfQettDD/5
	oDLAJ5XKbPJMgeBbTDjiMjhQDYLRF8I34L47B/gQS1L3x/qAxFIO+e/tBpXYYBKIsGlvjxchqpC
	Oc7GiNxZiwvxzcx1RnTSa8/Q3JVzrpum3WiNneIvmXs+iqq4rg+GMP1V3IpNkNG4DUm0gcE0pf0
	9M3TOU6Uu/KU+Z45DqA==
X-Google-Smtp-Source: AGHT+IErPByvJLeshashjjG1N09s4DzUxeDwok3Mn1Gx1IYAEmLVhz4feJdw3gZO4FDj/ParQ9zrqg==
X-Received: by 2002:a05:600c:1986:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-442f4735b79mr15076405e9.8.1747215262532;
        Wed, 14 May 2025 02:34:22 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e8545sm23038825e9.31.2025.05.14.02.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 02:34:22 -0700 (PDT)
Message-ID: <d00a5238-90e7-4651-aaae-2919848be33b@suse.com>
Date: Wed, 14 May 2025 11:34:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: Greg KH <gregkh@linuxfoundation.org>, David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250513113817.11962-1-00107082@163.com>
 <20250514064455.5488-1-00107082@163.com>
 <2025051405-glare-crazily-a9fa@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025051405-glare-crazily-a9fa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.25 09:29, Greg KH wrote:
  
> No, this isn't necessarily true at all.  Allocations are fast, and if we
> free/allocate things quickly, it's even faster.  USB is limited by the
> hardware throughput, which is _very_ slow compared to memory accesses of
> the allocator.

If and only if we do not trigger disk IO. If you really want to give this patch
a good performance testing you'd have to do it under memory pressure.

	Regards
		Oliver


