Return-Path: <linux-usb+bounces-13532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4995445B
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 10:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5A44B252B1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 08:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5690712E1CA;
	Fri, 16 Aug 2024 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="G3/zQf1l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171225622
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797109; cv=none; b=TgfMmwMNyiwVMUcP9It11J/0VdZmqiIIS8bbzVW5c2yFi2RbEp+jm+5xiHQOl256JxGkY0O8LdKJMwlUIsWmVbs9H9yKMWZPpbdLaxazABGzszJirJ85tUpMqJiJC+mWA4iy7b9UM8N549sDeeUxK62YcyHW3qs9csvviflUTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797109; c=relaxed/simple;
	bh=bXufV9Xq8VRmofxrsCXZeIbBO/S5/ycSostBk2CJwQI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRHtfutFxba7YuadI8flPc/wDGhqQF03v1ufCd/cTpS00ivavizKw35BSMxz4S1GTktccDIiGsZh1g+hrLaUq39/43NanI5SBFa/8iYNf0KYC9NQNN1xPNp+WEtcYIhqEd19mCa+mjuVmq15YY4D0GP57QbsZhKyBUPO7jTF5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=G3/zQf1l; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723797105; x=1724056305;
	bh=bXufV9Xq8VRmofxrsCXZeIbBO/S5/ycSostBk2CJwQI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=G3/zQf1llIqFike9a45mHN4bnu+ZZb5xIOUqEeqnGZ77buJ/k240F9QPioaHcbAsj
	 b0ulL4wTBj5+7Wd5IOH/AVCFrkRW9/c0f0DEKUqekBHlL7lzWCi1K7tl5P/kLot1Gb
	 jR+Smnsin3wiY+Ygdph7gnkgv0uDvA6TeiV4rYI7I4H8EEqPowZag1TNknhNd6ITiB
	 +sCTlYwbWRhmJmJ/BKhq+oDsrrw7v8qE2wJvkj8/BoF9YYURpj6brp4h3pr8RehNPM
	 c7yiGv4X8tqtPaoZppr+vxAkjD2u+Lf/g5KDAS7betqQffYMdjYqhPR8fl0H49nNIW
	 YhTmbcoHjaL/Q==
Date: Fri, 16 Aug 2024 08:31:40 +0000
To: krzk@kernel.org
From: omasanori@proton.me
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, mogino@acm.org
Subject: Re: [PATCH] Documentation: msm-hsusb.txt: remove
Message-ID: <20240816083136.76079-1-omasanori@proton.me>
In-Reply-To: <a6e566fb-b695-4711-94ca-04447dfb8937@kernel.org>
References: <20240815111107.10561-1-omasanori@proton.me> <a6e566fb-b695-4711-94ca-04447dfb8937@kernel.org>
Feedback-ID: 82490182:user:proton
X-Pm-Message-ID: 1db0cca7cdea50f6ab8d49d6ba9038c0a2d852f4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for your guidance, I will do for sure and sorry for my
laziness.

Best,
Masanori


