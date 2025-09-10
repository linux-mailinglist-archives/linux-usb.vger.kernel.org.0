Return-Path: <linux-usb+bounces-27852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49646B510F0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 10:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445591BC5240
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 08:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589C730CD9C;
	Wed, 10 Sep 2025 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUVLBMBB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338EC28D83D
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757492147; cv=none; b=iHM0eMyqpXSIiBkPjuI9SQCu7f1VBpGrMaXcC2U/qb0NJRnmp/BjK9kfGoMwZHdKgEPhv90rc5RpK2DlonMfZtqm9keJKQ/JzvKjH2pYEIcJCV0Us+h8xORzDKuWJKZhURP9YZbxc6MewRrbU4YolJpDReUosq7aNTyQZ9W3H0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757492147; c=relaxed/simple;
	bh=XQQxL/9Um9A8iI7kl22crszMScM2WmdaZEGIxFVY3EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwiUn5JWnq+w2u1hFIB+yzJfzw+ULJfdsi7zbDtdqEhTdZrnN1Rz1Dz0NZUtF6G4C5fbQZuTYf2IzvN3ADUv7lSKVrYVpeLffSyREot/UlMrSMgP5vcJWe5dcgQEbJxyUTFi1xV8lXdzJqsgfUwyMusQlea7oaY/+vLdmOOWaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUVLBMBB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so4047474e87.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757492144; x=1758096944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzysjhMCPVBupq2sohYzw2TvAvKtOXe9j45GT8Pl3Lk=;
        b=EUVLBMBB6+x9fhcvcvnWvlRei8S2utyVE6JOBC/qlYDSQ3vjNSSSpqbSrAYSzvK9RX
         Y+Ua7JM+jk4eeGFoQOEfQ2OYARbmnU6CuPRGrYTnKtvRgm1KNvDDBNiaIsyKyUkucrFE
         +OZnwd+Ys3sCfDOjtpBx7m+GT1ImJwY43KE/fIwa9il70y8ZO4s4/7z+m5SCJwj3Yjnb
         +zhH9dYaBkIXrz4hCBXHDvPasmJ6WRP7IOOuDiCxUdw0vZFxVDEzJTO1NvJ26n29QZqp
         W73657hgIuju1rlwu4RuC7XOGEf6t5LQEjCUvnNiN6BNWbonlif21EA8Ki6DGoExUe97
         QBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757492144; x=1758096944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzysjhMCPVBupq2sohYzw2TvAvKtOXe9j45GT8Pl3Lk=;
        b=NPssV5fr2ncGyfrAPU3nrnpvc3POao1al5mWN/tSYgbjzpVJt2jCz1YsNGaDY/wCLS
         013Y4uELW4MjjCoOlQordUl8CKC2FdjM5+8rS8tHruNz7IYQK3T/3Sq9AC17s+g+C2pD
         4IfZFUVp7u9v29uq8xkOGhUSzDoWIGj0LZMExBkGS4Lbd1kJwwh2vpLXRZwhPvGOI/bT
         caycmVVOvJetX7I0uRC/nI+ktKM/u71b5dVwJJjsg66Z/LxhlIvDgpVa5gc9jzptK5Tx
         pVKHMzP9D7NkuUEN1+qheWRjbNtJTBjTyxkzGzuRe0Xd42BqowGve2nffYBsGeuD+xbs
         Pchg==
X-Forwarded-Encrypted: i=1; AJvYcCXB/WLrZu0+0ANy4dS8PRR7oVuT36a5gvqc0ZqVEgGNiou+pGCZyDFB0t90v7Z7Kw3mO5Zkb6mDwA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj+YDPf0/3qyHlj25gICS5mXtDxMbPXPUZ2w6Hqv5B3NNh4LM4
	sGVkn00ZG04LPytGIJbv6gwyv3kOBI0O/iFajKYA3NrE8dOlPRmET59D/xEWng==
X-Gm-Gg: ASbGncsSWkUbMlVHbE3IVNfXN8KW3J32pc7b514PCAy6BWqX/Nsb7S0g9N+PZDaJ04a
	QmM/+jiibxh0gcuLzvmgG5SUOy447nA3BoCRYbBgVr2uk5mIEPYRawJI9FkvPiKqLAgdYghf2WB
	PLJDKVw1dI5ZGgyHUCipkuRQcWQrL3Dbnh0T9a+QYL3ZyOkD/fovqKot8NBX+WHxmaew4eDmXAJ
	huLVbT6ovxTqSWniF798WPMZ8UGJ64FNhiYNLsQ8IIJd9mKgVLRMDox5T4BAfIr4r7QGSb6Jvei
	clvn6rJ8SRCi3vBalizmKP2vxqSQYeCQ8lUyUiIU3mlCiVRlPe2oxRZtnjCCNIgtclEABQdeyFJ
	mgkFsLcThVuoVx2BxX5iq9GkjzamT272+cjo=
X-Google-Smtp-Source: AGHT+IEas6ZXS+CE2J0zDS5HW54bJSA4iG5MTyQcqR92ExMeP4gnJPgNVrxwCuZWNIDG0oLSyQSMug==
X-Received: by 2002:a05:6512:138a:b0:55e:990:fff3 with SMTP id 2adb3069b0e04-562648219famr4481302e87.53.1757492143908;
        Wed, 10 Sep 2025 01:15:43 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795da60sm1087381e87.90.2025.09.10.01.15.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 10 Sep 2025 01:15:43 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:15:39 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: xhci-dbgcap: correct DMA address handling
Message-ID: <20250910101539.2f65f797.michal.pecio@gmail.com>
In-Reply-To: <a905c139-c793-4715-8f48-38df4afde1ab@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-2-niklas.neronin@linux.intel.com>
	<20250909121313.13286b34.michal.pecio@gmail.com>
	<a905c139-c793-4715-8f48-38df4afde1ab@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Sep 2025 11:00:06 +0300, Neronin, Niklas wrote:
> dma_addr_t trb_dma	- is a DMA address
> u64        ep_trb	- is a 64-bit value, which, if correct, represents a DMA address.

Well, I guess that's true, but the inconsistency with the rest of the
driver looks odd.

And it is still a DMA space address, if it's any valid address at all.

