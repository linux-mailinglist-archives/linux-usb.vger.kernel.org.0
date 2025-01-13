Return-Path: <linux-usb+bounces-19237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66623A0B46A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 11:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ECF9162336
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DF421ADBE;
	Mon, 13 Jan 2025 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="umkLT67T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F11FDA65
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763692; cv=none; b=Hy8BS7gM6bvrIA7BHGjSuW4su93Sb4fDsaz2mCtnMKrHc9Qx1X9K0DcJHCqDl8eIpEuvQce/PMBBIv3alKZD2Moz5hOzCsiyGze5BFw2W0QmXbkwRSzu8f1Dr+a9P/fqZr1ZtZmeR/XZ8IMwxDMnG0iaqCygo4z11lhwhLUeBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763692; c=relaxed/simple;
	bh=Z/rxdb+NjwEYC+bq3/J9wXE4Y+VpSgzqIWLaZ16Byso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DstSyKN1dp6IuEPIMs9xcFK5rQny3Oy0LFS3WJfnP+npJ+WCZe5qjbex8vPP01IHxrcQcZw0r2WxH3rvDu6AmDjZmBNPPVs9w7abI7rJa+hPVzzJJiJNCcLvprSD+aHZE/nZBWFH/gVOIHJ1H34JrkX9egqH/CQBbAUN7bdxMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=umkLT67T; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so3433972f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 02:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736763689; x=1737368489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z32xL7g5JZxcoXbf04GoKqTbYBEUyc5neQVBGR0GN4s=;
        b=umkLT67T4bSokt4WS515sFb/SuS1+NhrK07GzX4od2Q7r8qIsi2d+EqWvgINfy+FtE
         qPf7iPl8ON5dxSNKxWyxPPytdSZ9fYKvyAYgpCV8WmG6ULm8kaEqFW+wSDBcagb8uZwC
         4YHIHpORfhybpw0a9OPMEf8P+2oVgUe+BK9+0qvfi6w4tND64VZqkoAAmtEA4OhiUkHn
         PbvN9QdknJXo3zP4RTdTJHeIr9oTV/yKBOxmuA0o1649mnQIRnt8kRwsUl6i5yobQjQk
         HH1CemD2i+B4NngXp8jteCF27zPbCWVrg5ZrW8LZ6GlhbSQ4/2PDkVi+yZJrAYZuCerG
         +80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763689; x=1737368489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z32xL7g5JZxcoXbf04GoKqTbYBEUyc5neQVBGR0GN4s=;
        b=pTLgowiCraMxfESgkk99lrV52i8s/9/F2uZ+bhqvut7msBdgta1qh1gUmNz4J5cYjT
         4XomZHCfAH8/zqKg8qedg1YfCvW4VeyVDI7fmCuOKtaENWwgu3foJc1CoQ29NtI6DZ6D
         EEmq/PnYBXr/A3+BaJlIXV4Z25Jmss1PQSG9R7vAcm2lPYEn+GjljneZ4KINL4hNUeNa
         PeUzmCl+d8fOG/IRIXALs2BwFw9DWgyoevhxpwljP7hrn/iGykWBHQDk9EbSnHc9gkpj
         A2d1saqeCz/YkdkCcn78GuPSY5XeEp+CYms8EsqPvOSi37rYPddE99ZVZ80ICg0ehUEA
         Q8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtPqenpjwkB+GmhS3rh+G0DnX2x7C3DpgM33W0Sw9k3MGnw1WFXFetDJ87W6QImgexK0ljo/2RRB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdTmGPl6qaKzeuW8U9nMMAtubXnFaBlS06fVU3fnDTq1H7+dO
	c4QMib+kl+cMxsnUZ732zvpZ9kQmqqTE8T+i/qYyau2HVr1vi+wKHn+Ic9tsf+c=
X-Gm-Gg: ASbGncu0kVfQqt9r7cWqiJ7fpxOqSoMoxWwU4Ec5F3I1PgNB5hiu7xR1cxNCmCbM9fE
	CIYx2CWiYNL0UH3Hb/DCw5oykJerKtGctyfQ1h0JvMznITpP50skFYYQ12vKg48gyvUqmlS52d7
	03Caqc+EfZfJKY13gn8D9b2ZSehIHrVkUJzyN8EEWr2OWheUCO4e8iNQMVa2V7lbR8GIcOlMVI9
	YHPVc+v0QtXzrOuaubuduSd4KyRD03GT0D3iLdvJaNdx1/Dsw==
X-Google-Smtp-Source: AGHT+IHLFIYNh17IURmkqOdGUL7MCjxDqL2VAYJGlwUNcwkE3jGplOA1LC5EeooyvdiX2Nc83lStAg==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr20259832f8f.48.1736763688640;
        Mon, 13 Jan 2025 02:21:28 -0800 (PST)
Received: from Red ([2a01:cb1d:3d3:3500:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e37d012sm11745214f8f.8.2025.01.13.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 02:21:28 -0800 (PST)
Date: Mon, 13 Jan 2025 11:21:26 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: David Heidelberg <david@ixit.cz>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1 v7] usb: serial: add support for CH348
Message-ID: <Z4TpJpw5wuFBkOEC@Red>
References: <20240507131522.3546113-1-clabbe@baylibre.com>
 <20240507131522.3546113-2-clabbe@baylibre.com>
 <Zp5q5V_OnLAdvBrU@hovoldconsulting.com>
 <CAFBinCC9ftXxkyoiY=3ia6UubTeG-cHXa40ddd7WMNUhvVjr+g@mail.gmail.com>
 <Zp_WiocH4D14mEA7@hovoldconsulting.com>
 <CAFBinCATe+RXHz6Cy9cbo=vYL+qm_kz1qDTB8oL775xdgk=TYg@mail.gmail.com>
 <cf0f3894-3c62-40b4-af48-afac1c7d0379@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf0f3894-3c62-40b4-af48-afac1c7d0379@ixit.cz>

Le Fri, Nov 29, 2024 at 09:52:24PM -0500, David Heidelberg a écrit :
> Hello Martin,
> 
> are you planning sending v8 soon?
> 
> There seems to be general interest, if it makes working on it more joyful:
> https://www.reddit.com/r/raspberry_pi/comments/1gznt7p/has_anyone_used_this_board_usb_to_8channel_serial/
> 
> Thank you
> David
> 

Hello

v8 is delayed, my testsuite fail on linux-next only.
I bisected to a faulty commit "libfs: Use d_children list to iterate simple_offset directorie" but I dont understand ho it can cause proble on serial....

Regards

