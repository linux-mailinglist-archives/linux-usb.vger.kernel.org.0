Return-Path: <linux-usb+bounces-7900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C02FE87A0D2
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 02:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8202B1F2186D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 01:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24728DF67;
	Wed, 13 Mar 2024 01:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWyv0WDn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329CEBA5E
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293483; cv=none; b=fjk+S2oCJ6razjhwc3PLv5bZ2U+e9KMjGnnvYrSmuRNOxN/vNbzqUqMM7jFz8hARHYBJzvTyLGbksJQOV9UtIsncceBdTD9LJMQc5LoFayWSeH5mieIC7LtQipN40AihHu3JvCBa7sut4ZZSsWKtr7dPzkXVVwET4BxL+twNDw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293483; c=relaxed/simple;
	bh=u/i3Qag3IzRsqgOlW9yQf3Mcsv/P5wSXjtnzD43MZv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiQAXuE7CiSEEGxlbxe9bS4KuhRwAklz45jz+g5HCusPu97jc8zF4xK02vTcq6z63JLmujLtRcDkB5G2ygwUITwhiOAgQsAdqoTRTJFAI2+7BTuC8ns8ozXn1/JWcq09GkI6mspqGAMLafOq4yBmEwmkAUktk4Z6fQPEWydxgYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWyv0WDn; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso5710401276.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710293481; x=1710898281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/i3Qag3IzRsqgOlW9yQf3Mcsv/P5wSXjtnzD43MZv0=;
        b=mWyv0WDngEQhg+gjNtKvTuLTD7vYPwTWdMMpmrIWIQGmEZUzCDaCB/FMrj4AFwUdwg
         BBxY5mHMUwEKkgxMQqFqyKXlrKEtbNG1S7I7i9775ujWJtbsBPXts3m+upJqPyShEpx1
         CFuJyeEen1mvYt6QhkGjpiTaP046AGCGUMLkO/tfO+yEkC4kHm6bgmNo2Y3euYCqL/pZ
         0sb1fW5sBu650upBW5YPtknA6cKVoqUIgmus5y4uTCmGH/v3MNXLGsfCgMeAodqFaUTR
         8Ik7CLWMVQldq8irynqjY4TjB5ikUI2pacxZfLnHmKVkoNoUR+V+MFNsynaF0002cU0V
         W2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710293481; x=1710898281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/i3Qag3IzRsqgOlW9yQf3Mcsv/P5wSXjtnzD43MZv0=;
        b=Xa24sieNOElWp//mZEsIOrhyDMVcFOHiRnY8vn/1h/OgDmJxQh76RQ6Gl0sjppPKrX
         0BjZVLFngUm0Cse8FiCbbej4mCOJMlpY1Sz3lGKpG1VFPYBTxVE9g6Gk/oRk0KtYNzNX
         1s6iPH2WaRPsU4jrcDLoHU0+A1by+bTTY+s4DA/GuW2jazCUObOrK8X0c8V/zrOQNSrP
         ql202nxrAKHpeCbVHyz0lzp9Fng1iXFlMpwiUm4vqamj5kDojWyF9oOCSELBJXclS+ab
         DWIXdILljg6mQFssEf9uTq7w0M71zy2qaDgGoXYyhlGUXeE0XKfDFs1EvGLRoTb0CBP3
         3YNg==
X-Forwarded-Encrypted: i=1; AJvYcCVLmgwazfq4ZBq4Ivcyh4vRPGEg//Z9ttIiq6bTNAgfeDH2Iv2qofkJDcIfQxYoX1GArrFHfVHt/yEb/jC/+4nD+5mg6d9CQ/Zc
X-Gm-Message-State: AOJu0YzKbwsawJRge6WcCzNXQaOoqsff6dJgtfHOeABFHUbaQRCyh6ec
	9/e8ywOuyrMRKbig7iWkoAZma7WQkvOEkXjAJWmZHkuoiHHrqnImKCX9kUWxZOljQUJN1oTdisx
	ZCIAuqH3c5Dbn1uUZbUka0gyd7J8=
X-Google-Smtp-Source: AGHT+IEimgfzQ3pksiUja8FuH/vtMN1BZKmlRcOGsLuOnJvuYsoyEqWrBvxr27Sl27SIb/492nuzqqr5VIwIbHP6uuI=
X-Received: by 2002:a05:6902:2181:b0:dbd:8f9:a71 with SMTP id
 dl1-20020a056902218100b00dbd08f90a71mr1074720ybb.28.1710293481091; Tue, 12
 Mar 2024 18:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-2-alexhenrie24@gmail.com> <ZfAGpkMT-jaZGXmF@hovoldconsulting.com>
In-Reply-To: <ZfAGpkMT-jaZGXmF@hovoldconsulting.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 12 Mar 2024 19:30:48 -0600
Message-ID: <CAMMLpeQY29bsoDqbQbwwBDzMXhE=WQk1TPcbp9m8yWAUgRGGOA@mail.gmail.com>
Subject: Re: [PATCH 2/7] usb: serial: mos7720: don't advertise PARPORT_MODE_PCSPP
To: Johan Hovold <johan@kernel.org>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	sudipm.mukherjee@gmail.com, daniel@gimpelevich.san-francisco.ca.us, 
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 1:39=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Mar 11, 2024 at 11:50:27PM -0600, Alex Henrie wrote:
>
> This one and at least one of the later ones are also missing commit
> messages. Please fix in a v2.

Thanks for the feedback. I will send a v2 after the 6.9-rc1 release
and if we decide to keep the first three patches, I will add commit
messages to them.

-Alex

