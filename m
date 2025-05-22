Return-Path: <linux-usb+bounces-24236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2911AC10E9
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 18:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12C2A22F54
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B7629A31F;
	Thu, 22 May 2025 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="kjJRtSdx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96D286358
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930875; cv=none; b=sLiVHS7/AHef6cA+G1FyBPl7deF2+0KRCiRjZiO3b3yRjvVKgIoJp650bCGZOoOLmfLCVqyKqdQk6Z548wbyFdzjQChaln60mFRHA7VwwAub0hs7kzO2CTWF1vOIt7EAtlRA7Gpj2dnMfwrr5qy78EQZFMV7VlFgqj9gyeY6u4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930875; c=relaxed/simple;
	bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=d0SX3JWUFO5eRLigEAywJh0Rgqfg0F1z8tWbcBX2VplMwL0Ivaq5/q0g+GVWCbuLD4HzqUfNxrj8yp5vFp/TqlsGCLLWQnLkms99RS1/gqrg1lTo32ZFzLr8CwqTta4dmAI8c6WWp8onIiryBM89mITWxFEaJj0O7ywIJbleVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=kjJRtSdx reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3da74959554so28413245ab.2
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747930873; x=1748535673; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
        b=kjJRtSdxbbKx6m7257Q1Yf5MyDqQiy1gVp6Ghey6vSDA6bxJRB/Yf4rh1yDIOYmr3z
         quBh8qkb7oMSy5KKqNvva8I8kjRXOXwDaTMqLaAg/g0onePypucRj5qqapQI7jPO4eqM
         PTjh57Jw5JNMPsv4KCoqrFxEw1F7GWYSCRJJ41lgDpAub9+v/IN5TztiFp95o7SLLsNV
         gA6Zc6CdTT3IoGJ1Lvh4rYGbOwfnOiGxHshhwINqy3KmE+01nxw1MoMcj+jl4Xfoxud1
         EyEh6MQVuvCRYjB+uoINWEn295outnc+SUgy1jNdi8gqu9OKA3HZR1PUMxmaWmoVlfXA
         y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930873; x=1748535673;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
        b=qID0jmmJEpxBlyJ8eOvpFhtLihETYnm42D2l1ezdlkKjswDXB7c0db5z5k1VeYsCKp
         SDVEHbL+B7VIqlZ2vleTa2jYk3CpJ1xRiR1vGuk4cEw1qakHx8vn7wR0hvWzF5yIw9Ce
         7gIB/Y5YwrpcZHOuYbp1+zobtlVe0XooN58EDs8t4LQcXuFtaT8KI3S2Qd2Fa9edXPyr
         PZIHER9P2JK6UPyedWyxcoM1EMpv0yqXNLvPspoHEFrHo0YyhsRYp50UWz3590Z7w92z
         kPZPNFqQIm4S7ywBvR1A9OCj2TwOZvH/fWVJm0aaWAdFKchHu8SDmmTss2iegMrxbv9F
         7q7A==
X-Forwarded-Encrypted: i=1; AJvYcCUa72JlwDgRO0b843IiUZOD7HNak6V4nQYyuHDgBbSnMieIWkcEFUWLT5Si2j35ztctkECU8o4t7/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlN35GWN0I26a1QbxJs6Xfd1aDW0sptOv4QVLshiyV5fQGlDGm
	x4nEiaAGmOgoYTWKYlNJRQbNN3dx2/3OThOA724Cv24CsBwwYmWX/e6vNcRflxRcoEA=
X-Gm-Gg: ASbGncuRlM6fowGQvu3rxcuAYgFwQpgSjco+F35G57X9WfBkQh8V39gJlSCbjmfM+0T
	G2jNmHQXETwEp5ARX9LOOeBOcgtuobthOdAPXNg+FIdDWYcKaLggE8YIM0JbRo0PP6rEQJz+FTV
	R++3PvTWYTJ5XmkB2N/z+yX9tW4JBu5YHEy252gkQj3slViLfDEen99YFC8VZJZz/qRHMEGvpil
	mfy7838dwB+I6cu7WhJNNzFlH9a3fnetK1MHG8SRM8oumPOOvinhECq2ZBRwUUat+hCQWI4mGwD
	XQ1rGAfxlqNj+lsIyRY89GZFzbpuQwwlLDwIQAC6XtFdlWHK
X-Google-Smtp-Source: AGHT+IHOQ0SWVebfgDZDKmRx+6jWi05MfuX7gwZSb++7o+5qstcoX0pcP1SvRwbgMuT4PSBEfZtP+A==
X-Received: by 2002:a05:6e02:743:b0:3dc:8c4e:2b8b with SMTP id e9e14a558f8ab-3dc8c4e2c10mr39021205ab.8.1747930872568;
        Thu, 22 May 2025 09:21:12 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc89bfeee0sm6988515ab.70.2025.05.22.09.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 10:21:10 -0600
Message-Id: <DA2TS4HXZHLK.1WH4DSREYSAP4@brighamcampbell.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <heikki.krogerus@linux.intel.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
 <2025052234-brewing-recall-a7ed@gregkh>
In-Reply-To: <2025052234-brewing-recall-a7ed@gregkh>

On Thu May 22, 2025 at 2:30 AM MDT, Greg KH wrote:
>
> Too many characters for that sha1 value :)

I heard recently about concerns regarding the collision of 12-character
sha1 abbreviations [1] and had assumed that using 16 characters is
acceptable. Regrettably, I neglected to read Linus's response to the
email which rose those concerns. After reading his response, I'm
satisfied knowing that there is still very little risk of a collision
between the abbreviations of commit objects specifically.

I'll modify my git config to use 12 character abbrevs.

Thanks,
Brigham

[1]: https://lore.kernel.org/lkml/cover.1733421037.git.geert+renesas@glider=
.be/


