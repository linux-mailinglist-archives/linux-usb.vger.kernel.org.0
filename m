Return-Path: <linux-usb+bounces-31755-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE6CDC492
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 13:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB3F30A8176
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 12:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F018931AA81;
	Wed, 24 Dec 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji28P2Jm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907BF14A8B
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580700; cv=none; b=rWfsmF+xDYHIOU9C0c+ZSYvsDT+nV4qR0NlrJDOSY6dpS4fll3BMp8z8Q9bvBPHdMX5QBGDIrxfL14MFTLDwZjn/I4YtRw2KFCw8cuBcgNVAdQrDxboZL4HtOXT/ixYOe2tvLQHXQqiVzM3vx0BVyj/MW+WxpudaqtDgEH2ZORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580700; c=relaxed/simple;
	bh=2ybk9RZiF7aj4abQy5hEWStsqatE6NahqQQ0CBbm8fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYYpn53ZvrEdn4SYwm533tHL8CY8j5V4NmPHc4WlI90Y/5Z4i4QaDH3EyxLomLJmhk55p0Zd+qSftXrZZZmYWIYg0qoARWdw8/MDXH0nsATBORALEg4p/f1sUEermbaDW0KmyxZaHGTXVHMLlAMsu+rJ0RUj9HquA4WAaZa6j9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ji28P2Jm; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34c3259da34so5870713a91.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 04:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766580698; x=1767185498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dV66SIXpDIg4/Ui3geRDNO07GBnyy5tcQJqFlfn9fwg=;
        b=Ji28P2JmTzxD8Nnys9biY2bWTEAqUAdeTITQmWyjp32j7zXXW2luNkxh35PWQ+Hgqv
         zDpN+yUlQ/Cokx4z8q8ybtq58W+BWYxQAhk3OqTr6esPkUaBG11BM5Rj2tUi5o4/tlHR
         lMzyDq44TwUGPShboF85CemRg5mP5lE70ufKy0SN0hgGFCi+pXko6tGL5X1pbiL9nhNA
         f85IT0l4GE/SAM1x287yUVG6+r5deCHR88HIUzIsSv3RlK5VTiDwLym6tQHieeODiwuJ
         H/D+Dj48et2NBbcURueWZzXcKpVrH5mv/+eTnOBe2E1VyQK/G8tRv5f7PdUpyoJpBcdZ
         0/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580698; x=1767185498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV66SIXpDIg4/Ui3geRDNO07GBnyy5tcQJqFlfn9fwg=;
        b=QKCEhta5qKhnFHGm/fUTYdrXjJUITFbMWNu+Vn34B9EOs9dmRaEkDY3gkdatNLzL6A
         GNbOwxf2Coriq6GQXux5X5p9PsLBK2P+ThVcxJueskRQtmnAbMCjaBWYqtS4nkx3eHSj
         slJYRpUxxz+w18HfAFiCG/nVXZCZmeMgVOFl57AGn/R+eY5zT9wOw/PEmzxqJqTJPmqJ
         VVPuG++hCErNZlgqBQ4cr6g5Ucp5EAYek34XHSmH/pxtx2mcB9IohIfU9TeguQsGKhgQ
         8CSERyJz5TCgE3oaYgtLVznppaI5Rboi25Z4kmuKe3EbphndUQxZ0ff6xDCBt3ZmCdK3
         mXpQ==
X-Gm-Message-State: AOJu0Yz82NQzl33G0SN0vI5usrBjcMvrCi7JTLrfdAiYBTkH8+otOtSR
	pAMN+R1xBvqdWH90DBbwBdax0iJ05j3iVbMkZt/8C/W/o0xqQpUmDIdI
X-Gm-Gg: AY/fxX6FwlTRy7g7C09DhAc6MEL6hulWg016ypRjYI8bfQ4vnXurOxxyJI11Ykmxa1y
	1eJrWskZwYk10Qg76ID/7wzBizFNF6OH4xehZHR7RPINrFr/Zh8hxcjgh8uYZopPmmQJgp+s4cz
	mKCzivsPVQnISmserdyrFudTmQ3cKjK1dGuzEUupBC52D7jxjHDqiY19lY79DHn//H3baNMgTBB
	Y59Pui2wDuGT8Tuh7gE0jug/qRZO1zhMvw2EMWI92nD0XsiGj2g0GODppU85aOS6WxhcNVhXiwF
	FNO6qU2bct7DiittnqkDaOxGPPAjSA21946kC0gfs+OAGarz33FDIQ00ir+svsMrPBLp85GsXU4
	IN+ABdOrr9+n9Dhlb7zofJVfkNMjrp3FpYQdFf37QBNom95tKQqhNb5A1mur6zMrIaEHQwqQuEq
	bTRmLBoEQfi2AT3A==
X-Google-Smtp-Source: AGHT+IEQWXSM+zyayO8+pgUJLpHFcHmFCa3cC2wxNvN/+ZswNWGknjdqGDz3msroX1FFu+0vttdYrw==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id 98e67ed59e1d1-34e921f010bmr13774179a91.33.1766580697912;
        Wed, 24 Dec 2025 04:51:37 -0800 (PST)
Received: from e45ae8f13cb0 ([113.98.62.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm18729284a91.0.2025.12.24.04.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:51:37 -0800 (PST)
Date: Wed, 24 Dec 2025 20:51:28 +0800
From: Jason Sun <jason.sun689@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sunqian@senarytech.com, jason.sun689@gmail.com
Subject: Re: [PATCH v2] dwc2: Delay resume until device connection is stable
Message-ID: <20251224125128.dwiahkuwbpmfiugb@e45ae8f13cb0>
References: <20251215125317.85624-1-sunqian@senarytech.com>
 <20251224082013.87100-1-jason.sun689@gmail.com>
 <2025122444-handcraft-hammock-c020@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <2025122444-handcraft-hammock-c020@gregkh>

On Wed, Dec 24, 2025 at 09:40:03AM +0100, Greg KH wrote:
>On Wed, Dec 24, 2025 at 04:20:13PM +0800, Jason Sun wrote:
>> Tested on:
>>   - Kernel: v5.15.140
>
>That's a very old kernel version.  How about 6.18?
>
>thanks,
>
>greg k-h

Hi Greg,

Sorry for the formatting issues in my previous email.

Thanks for the feedback.

At the moment I only have access to this board on a 5.15-based BSP,
so I can only run-time test on v5.15.140. I don't currently have a
working mainline (v6.x) boot chain for this hardware.

The patch applies cleanly and builds on the current usb.git tree
(v6.15-based, build-tested only). The change is based on reviewing
the resume path around VBUS enable, which still proceeds after a fixed
usleep_range(3000, 5000) delay and can observe an unstable CONNSTS
window on our setup.

Please let me know if build-tested on usb.git is acceptable for now,
or if you'd prefer the change to be conditional (e.g. via DT or a
module parameter).

Thanks,
Jason Sun

