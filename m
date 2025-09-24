Return-Path: <linux-usb+bounces-28609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A797CB9B1EA
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 19:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A0B84E17B6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 17:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816673164DF;
	Wed, 24 Sep 2025 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgnCzGBT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349DF3164AA
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758736274; cv=none; b=BPI0pt0vLfdHG2G6ZAWLktF8ivwQ85SwXa5QoF7RhQ7aQlEFJXgRWjCBHHCvH7L/vpkrSiEWf5MokMqGTvh8A1m335BQNBhbUvUoTFB1jzww9oQjGvLcdBkCa4OMFWfZttEX1AmoLuLtk9gwbQyNDfFU55jEPI6n2VaMSLi10Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758736274; c=relaxed/simple;
	bh=irDF2NGT01tFVGcKv8Aw+yXSxcZKqrHPtgX88XxrmqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M64aB0NffVfaNpg4xKw4/BdL71bV6vUyGoX+FIPLXz72ekUEX0Ytf5x1c+cfDEoEbMFfU5xWR+k1FOq6ze+C5fmgrMdVzvstr3EsC8tEqSpfvOgrBT3Z03m/WZj4zeuEieEH5tai0ce/A6EyKMHR8Fh6ndKjBzqUUZfpH2CqCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgnCzGBT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-579c95a2be2so45344e87.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758736270; x=1759341070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pquafnPzR8S6cEVo4ZSJasnk4ic+4rsTQNuSE4g5qVk=;
        b=CgnCzGBTMYiRzSQuPlR/SAm+ecE/5DkRsGCNRhjv5VzXZMroiPF+xV8XhF9/Xt2utA
         Oy33mz36r66ywcpgpc/+fYQ8wNQV/8beQSDK7ahgsx8/GIMHSA0Xj7DRNMrC/jXiGGPq
         OOLmGeZW87uw9A20JrLRGU9yffNA3foBoe6AokC6okFGqoegv95dK0s09+oON5kD4nqT
         j3CxD2WEoDGNEV3dHaEDa9LwHxyVx0aA5+vX3vMGSeD5LnCsOT3gi6jOc3dCiVzzp4v8
         f1sH0GdTz//2gT7konbV3QrvIBOYmA+b5IS1a8NeZZOdwwn7mVqi/FE+V9OgWukIifkS
         miMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758736270; x=1759341070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pquafnPzR8S6cEVo4ZSJasnk4ic+4rsTQNuSE4g5qVk=;
        b=mZlUDhrNuTJXXIh5bPq+e39LabCfmRrmr/584/Rk8Cew2+kkewjIXfw7WVaKyQMk9J
         pi7y8Wp5iPW4hfk9+8e+4VVZzNJcUa7MtAvqgjYyWeGbWe+0KX9UgTOlnZioHHXfVLBF
         7OAzfnzp+4DMQNZIX52Sgv6sY29Eg/ycqUPLk+XinEeuMm5D17oZStcxi/LX0jIBWv6e
         TDgAZTI6N8oGan0cI3tCr7IWDqyq2ueBHklO5T9/iZrBlQw2SYXulhAQipT9teq4AAaF
         XFMymJzdX2dE0CsWCUUmpvUOCjUPvaj0omxZm3w/6XsYlXDaqrIAishi6U6TcUHOjgxy
         EZsA==
X-Forwarded-Encrypted: i=1; AJvYcCXiOyZxqMk1kca4OKeTvbPxQXbhjBmgl2OMwMWZchL6V2JPgEujvS7hzHLpKxdJMTKRkcsL7tRVp6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAaDng8lHCcq4SP835mdWNyDUZqlg3ZkeNt3JU6q/ER2Jdv/Y5
	aNL+bZTFVvqcDiH2plcPntN9REcZHMBKFIDxlmCB6nXF8UOV727Db6Ax
X-Gm-Gg: ASbGncsEhF+PO47/cYIZ9iQWuErX1I28ST97EG3IIUT/XDXsEww+An7OIOPu5Mpr9iX
	QwVEH6r2vKi6dmmDkOl9aCImMW72qRKEZD908IOMgY65gFVwyr8Fz/T1/oPq8PRv2nqM4nUpdZ5
	dkC0nFw4xMn3td6hnSqk1L3McbkdSnQRlDXI8YSKcS5OFamEjIEPRkY5gKwru0ccAtrWUyg4L2w
	vwniai+CHAcwV1L5gG0/IbTu/ItA0rT6aa6lPe8b/n0J3+DOGpkdhZnoiOV/iowGK+GIGr3pq2T
	XWf3jsH5HGzpTfcpNX+EvlXwYdPT8ZD6PQ9L9Qe4Li0DlzRkWbCyRRaf5a/2rS1vG9GZp4qMtGA
	ftAfz/OqUAXumQSVva6nt0oKILXVBOq6V69o=
X-Google-Smtp-Source: AGHT+IFHPEAgajKTiH7Ls3GaEiRPS2Tkaju+/hcYdJg8P1mtwrJiU+kcknlPPPv2gncoIiP6NgFWvg==
X-Received: by 2002:a05:6512:ac5:b0:55f:6d6e:1e97 with SMTP id 2adb3069b0e04-582d4257f20mr104190e87.52.1758736270018;
        Wed, 24 Sep 2025 10:51:10 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44740sm5227645e87.14.2025.09.24.10.51.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 24 Sep 2025 10:51:09 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:50:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>
Cc: I Viswanath <viswanathiyyappan@gmail.com>, kuba@kernel.org,
 edumazet@google.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 pabeni@redhat.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: Re: [PATCH net v3] net: usb: Remove disruptive netif_wake_queue in
 rtl8150_set_multicast
Message-ID: <20250924195055.15735499.michal.pecio@gmail.com>
In-Reply-To: <20250924135814.GC5387@cabron.k.g>
References: <20250924134350.264597-1-viswanathiyyappan@gmail.com>
	<20250924135814.GC5387@cabron.k.g>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Sep 2025 16:58:14 +0300, Petko Manolov wrote:
> netif_[stop|wake]_queue() should have been removed from rtl8150_set_multicast()
> long time ago, but somehow it has slipped under the radar.  As far as i can tell
> this is the only change needed.

Hi,

Glad to see that you are still around.

Do you happen to remember what was the reason for padding all TX frames
to at least 60 bytes?

This was apparently added in version "v0.5.0 (2002/03/28)".

I'm yet to test the exact effect of this hack (will the HW really send
frames with trailing garbage?) and what happens if it's removed (maybe
nothing bad? or was there a HW bug?), but this part caught my attention
because I think nowadays some people could consider it "information
leak" ;) And it looks like a waste of bandwidth at least.

Regards,
Michal

