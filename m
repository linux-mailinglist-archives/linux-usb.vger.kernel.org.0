Return-Path: <linux-usb+bounces-5213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A3831832
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 12:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE401C247A3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 11:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BB9241E8;
	Thu, 18 Jan 2024 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml0rd57D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506AC127
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576259; cv=none; b=NoRthGgg5Cixyf/UgyBWcENcmZzivXXlV4K4lCAb62fJYxnVQ5KgDrwIGbYtjuvZsQ9EpKCPqwmNRYciqHbSEBCyjvgBDv3XvYhncV0BgeoFjHQdKeBZILl8OTjRYo0K0lw3r2T2AOsD/inKJY/gallwK06/+5Z+KUAZihfwiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576259; c=relaxed/simple;
	bh=f7l7UQQM8mKXC8TmMPPNsrAJxUHtGUaon9PkC8aOMWw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=Vb+bVE8eECU9sSC64iA5/PUU6jMaFItzBRVVAl74i6dW2jMPog8bGK+iG0bECXFTiGVeQxojKiF7dhQDQQrC7l1RJlQ1GlElkOaZuNsrrRAR98HJmHzb9mMfZ8IHHfB8eh+AfNOzKZmvEcErtpfB98zJaRMD1Bp5YNtdHt3XHwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml0rd57D; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5571e662b93so10081982a12.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705576256; x=1706181056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7l7UQQM8mKXC8TmMPPNsrAJxUHtGUaon9PkC8aOMWw=;
        b=ml0rd57Dh9kxMLqQZoz/9vnBCPDQnLCe2S8xLrlbKYLevPdVQ5cfdEWXFyJ/zdMebE
         WO4dPrBY/ZBJwQOHZS9iJMNLG+zWRnIfRmUTWCGSvVNaAT8Llrb3gDetaHVv3gjXA5Nd
         0OqNQQveCC5p6n/ayHh4agMM0Dvh04S+zHlV3wtO187FQ0TVLh4pv05ieVsXsDThr/Ll
         UaAnYxE4U87oXpijGMENOP4RmUo8MMo1Iss1plvn1a7pxlAAHV6mDcfufGlA9m2+n+7Y
         ZES0VU5rxCqEKNgLxSdDCjF2yrneJVlDo0KhyYGue/NikH4gNmkZjCbTyU9g7Pl1tW5+
         7QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576256; x=1706181056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7l7UQQM8mKXC8TmMPPNsrAJxUHtGUaon9PkC8aOMWw=;
        b=JfD6laqa4i4qbXBhy4+bBGewpOp9K6Ocl92FyZAVO4q5DIrLPutTpCuUOqlLUU8fAt
         J76i0+70afSdPrHvrNdKE9S+ZhJwIgQC4zq6gwnV7/4DSArEhBgKotT+RmgGL2Q+Szgo
         Yt3Bg2R2pOncIQfOmep9/tP/JZQCLcfhW629dYfDDeehENcJZcuSzO8YmMEHExNpVN1u
         0eJMJjQaOBkPrcPQT4b+pmQOsW8NaMo8oYGEpLdoDDukgdPhkfJP/x83HA5UO3nSGN3a
         jEHU7/frxyNJ6VpcijtwoVAnHH7UmOypK8RBZTXWVfxOSnO9rKWzGoPqiOzU7SyUsJ1U
         BHJg==
X-Gm-Message-State: AOJu0YzR75gNSuyEljRKrwHhZsDkTOiOt3+rOGRFM84zecXf9HGexmVZ
	qTm++kGaUTGb3CcsIe1IKwFZem8ImIQjkrD1bB5jOv4mG1tpxkMk
X-Google-Smtp-Source: AGHT+IGIj8EQFDRJzzeB8FdZt63TGObMmfsMzPCiJm9DJ6qiznTROR/+MxLL/HJyLyeihG84ZObKdw==
X-Received: by 2002:a17:906:f6d0:b0:a2c:6c2:35b7 with SMTP id jo16-20020a170906f6d000b00a2c06c235b7mr428983ejb.38.1705576256633;
        Thu, 18 Jan 2024 03:10:56 -0800 (PST)
Received: from foxbook (bfg166.neoplus.adsl.tpnet.pl. [83.28.44.166])
        by smtp.gmail.com with ESMTPSA id cx6-20020a170907168600b00a2d5ef80043sm6206698ejd.129.2024.01.18.03.10.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2024 03:10:56 -0800 (PST)
Date: Thu, 18 Jan 2024 12:10:52 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Isochronous error handling bug on VIA VL805
Message-ID: <20240118121052.64e19a78@foxbook>
In-Reply-To: <20240118120027.5bc498b5@foxbook>
References: <20240115172709.0b6f2bba@foxbook>
	<20240116153618.2527463-1-mathias.nyman@linux.intel.com>
	<20240116232045.76da750b@foxbook>
	<f6542354-d6d1-be22-82ed-5dfa57aa8337@linux.intel.com>
	<20240117184905.1800b1cc@foxbook>
	<20240118120027.5bc498b5@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> 2. Are there any errors that may need error_mid_td treatment on NEC?
> 3. Are there any errors that may need "not success" treatment on VIA?

Sorry, I meant to write "any other errors", of course.
For VIA, the likely answer is "all errors" or "almost all".


And I forgot to add that while NEC seems to violate the spec, VIA
follows 4.9.1 exactly and other hosts are likely to do the same.

