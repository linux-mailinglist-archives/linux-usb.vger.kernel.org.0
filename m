Return-Path: <linux-usb+bounces-15172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438997AEBC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 12:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403421C20D5A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6094116132F;
	Tue, 17 Sep 2024 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXR2YQtP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE315B54F
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726568964; cv=none; b=R65wZ8XObNiJAc4I4DS4meWARtUq+/V8X13WngXQGjyRT/yG9Sl9REUlTzA2tWcgkaZgXFvJqrcP91bVDS/hnM1Zj++3+pyYJ0AKYrzQYphkZcARm5Yx3j23k6FQhg4fHbRTyEaL5Qbdj8aEI4ZARkq05xs2AbD8SZT/mLYB+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726568964; c=relaxed/simple;
	bh=K4A/URG0Bgya2ZhqoVL8PyDSAVlEW0DTH9TG5gP6KKM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DtJvYIwGQcy5l4ApnFsehACTFFWZ1Jm7h05+mb2qYikKYQy7Eo2mPvtBjQ1nZLxkRXMeJGTtrgZVVlvQZT7ol0GQk55xd26XEAu8cfOZkxuhI3IOUz+SGmwFFrWurnW5WensK4faI7RT0osyZWGf+Q1lisQENi5LrZTE0KxMsck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXR2YQtP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso12171630a12.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726568962; x=1727173762; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K4A/URG0Bgya2ZhqoVL8PyDSAVlEW0DTH9TG5gP6KKM=;
        b=JXR2YQtP+Gz1+TFhomAvzlt4Gg+jnYtlhfreyZO23s7jjCjBNYjZlbcWt37WKqkqZV
         EhcuHiVFokctlG6afuaXforAs1azo1bTzPJP7hkxh4XEVaxzeZKBWsFFQXlkpnSSyq3q
         81qZ0uom1fow9jDjor09mNp/rSMIuGDcbOXBMP6BrmS2Y8Wlr1DTGIs10GZPz6Dgdae7
         fcym6erqqmPvqVTHC9R2q+XLpN0S7Wb6Kbwip3mZyAh3s6XCqBrn5//KACynVpoPIJcu
         fil+Gh5Iopn/7EEkC5dlUVPPCC3Ts8hIeBF854DDErVyVIG6VEFsXxmLFErunZO64Gy3
         v7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726568962; x=1727173762;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4A/URG0Bgya2ZhqoVL8PyDSAVlEW0DTH9TG5gP6KKM=;
        b=RAbAmME8CR3I+bh+7iaYDdoRR9k/IH5w8EoBiq882TMAY22DQHRMoOdA3GKPwo4ZCn
         6eNu4w2hWV2mpK56Wdgh1+WLi18VAyTT3gQJTe2GdH5fGX+0ftEqQIFv+lKQj4AG8q3+
         l7t7+DOJqvgsbpOhFH1Dt6OtLI4ZZ/JfWgsWLexGe1PknxLyS5iEWuTkRGx/hLnQaWmR
         Tsx4LAK+fTSpS4BCb3StfqrVqAsAeQM/0o4oGTHtDk5I7kCO60RghFITc/4BOsKqHuAw
         gtZ9D60wA/Kl/n9TKOonzAVECHJeYgIoWjXiKpxGN6lgSjPpJL34EDrFQyt9IFqLDk5E
         1wHg==
X-Gm-Message-State: AOJu0YwHMuM1sjAQQ8MkE4Q0GQ76jOlRfyoovCkQ+wqvZ3mJb/zBjpAR
	0EdgbkAPv/o/MmbT3qbE2q5YQ3WPRN9aYsASIh5uW3Amf9f7Pm2vfO81/A==
X-Google-Smtp-Source: AGHT+IGkY/zHwHE0B+ETShrUdCTCMK/O4NDUiJkQU/PPNEE4OP9avXjHVBdikFSw+ltZ/5Racs8yrg==
X-Received: by 2002:a17:906:6a01:b0:a8d:43c5:9a16 with SMTP id a640c23a62f3a-a902a3d6986mr2069196566b.6.1726568961409;
        Tue, 17 Sep 2024 03:29:21 -0700 (PDT)
Received: from [192.168.216.101] (public-gprs228163.centertel.pl. [31.60.38.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3833sm428113366b.128.2024.09.17.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:29:21 -0700 (PDT)
Message-ID: <cf50c26f89b38a4b0cba7fc2329a9040ac5f5b67.camel@gmail.com>
Subject: Re: [PATCH] usb: gadget: u_ether: Use __netif_rx() in rx_callback()
From: Hubert =?UTF-8?Q?Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Date: Tue, 17 Sep 2024 12:29:20 +0200
In-Reply-To: <2024091116-wound-golf-9f03@gregkh>
References: <7d86b2ed20418cab986708e327adb4432f7078c2.camel@gmail.com>
	 <2024091116-wound-golf-9f03@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-09-11 at 15:28 +0200, Greg KH wrote:
> On Fri, Sep 06, 2024 at 08:57:25PM +0200, Hubert Wi=C5=9Bniewski wrote:
> > netif_rx() now disables bottom halves, which causes the USB gadget to b=
e
> > unable to receive frames if the interface is not brought up quickly eno=
ugh
> > after being created by the driver (a bug confirmed on AM3352 SoC).
> >=20
> > Replacing netif_rx() with __netif_rx() restores the old behavior and fi=
xes
> > the bug. This can be done since rx_callback() is called from the interr=
upt
> > context.
> >=20
> > Signed-off-by: Hubert Wi=C5=9Bniewski <wiih@viessmann.com>
>=20
> Doesn't match the "From:" line, so we can't take this :(

Sorry, my mistake. I will fix that.

> What commit id does this fix?

This fixes baebdf48c360 ("net: dev: Makes sure netif_rx() can be invoked in
any context."). I will add an appropriate Fixes tag in v2.

Thank you for your feedback.

Hubert Wi=C5=9Bniewski



