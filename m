Return-Path: <linux-usb+bounces-28981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB49BC2BAD
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 23:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA4B3C8198
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 21:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06EF241691;
	Tue,  7 Oct 2025 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7Ydpnua"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DE1D7E41
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759871838; cv=none; b=nVhLeNs0zOtL+pfPCTIy1dOMeM53KiPS4EZbOojjdVgIQPUG2FXTLF6SdhZucX3HtGLfJoyC4cFZBZMqcKpoo87Phd0FOkqR8uVvwGdp7/NOmOyIP/ya/f8/+HyxUhdiudRSMcd/X5Wf5Gx6DQeSw0BOJvakZK9y8Ps27rj/lLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759871838; c=relaxed/simple;
	bh=6OEC8K8vBkTxj/pwmLqJTDbV2xpO8P+Eh4ng1eLGKV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXyb/XbDHSzU2b0hZjx3XJxEDuV4sVeyLcZivyrY+xMZahccCn1ZcRIQO5FN8tOJMnMRcpHrxLHXa6vIogMWNyQn6ENn5L+ytuIdhIbBNrSoniPGEJpstleixnikqh1zMJNuNGkX1sbXDnM61nyxaGyrhX1WOLmGI41wSc8z3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7Ydpnua; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so316710e87.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759871835; x=1760476635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXvgk3EFH4zPgHJiqeQ5/xOhjI3xnjXcjT4Fjjb1NDA=;
        b=b7YdpnuaxCRu++TSoul9lGqxgbcgTht3hKj19eH3Sz80JruZ2+APlS24AnC/g6DYYy
         700UR4wnUrCZHeaoA3iNThIO5dWlPvIAV9Li/N/NaWM2nLW73EpXHmze/T+pvOQhXDIx
         j+y8klj+gosLw0mHKLP/HuASb/+nF+L8W+v/+aHI7RCU2sYKN/7u0SR/Z9CB1H2U2Ryx
         YMIN5I399FYbTOXuyQ65j8svns1z6P5ohtSRBXEWeLnH0C0MIcd1URISEv6TxWthaV2g
         UYZNfAzvv3g3jrJ2chFKdkxopy4ez40UyU4gCYEexIaTxVO5mmLkFamgYKcQN3ADGrNG
         riAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759871835; x=1760476635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXvgk3EFH4zPgHJiqeQ5/xOhjI3xnjXcjT4Fjjb1NDA=;
        b=bN0eSKd0nGQL81O+T2e2G6qjX2lneM/te+P8KZXW3zrbjdB9iLbxq3RlGolpDoIQ3E
         bo79ZlbBRD9IjmmXq5BL610XLMEAlGAqZMsYlC/uz5Q6dWwFAdriZZFyyLocBBUQzBta
         7ftwHIkQ1cXsuThGOrjI/ihlpEpAlFT4vF7rcG1dnO/4FFYcOztvv0RYVjNr3BS6ED1s
         mwV1R74ePzePL2A4ci3OTjG1Whm+8A+LJV6g3n7t/aoVIcEvxuaHRWHGhmyA7nAaJEF+
         iUGx6O7CEfLHdlV/16pGOESaBFuXO7Q0YdLMVypBhD24CFSOeewj7zrB/SHC2W5BHokE
         GFxQ==
X-Gm-Message-State: AOJu0YxDWVNNdapz7zSmvp+zLiAarV0vK9KZn34MXbpmWXwB2LzqvW4q
	GqgsCOqpi4vZnyY+W2vhKyDdzpalaBgXpnYKt+o45zHc2ey/hm4swqeI
X-Gm-Gg: ASbGncsCFbM7SfGjGXtUc44hDH3X0gb/6MyulSF+5FljDbHhhs/ySJfkmeDqUaRKp/2
	zRU/lAIe/m9GMD00fA7w2/BCLACpcVAvtM292Rnbw+0J/HrY2H9c2Wmj4chyA7f8jTuzWlBUYX2
	Mui6PJhnw5aevxEGON6CK/iuFelEwk0mASnqZ2yLizwPYMJ6480fdoVLSwZJm2IO4gP0Ujt2oEZ
	DoRcKxM/Uov8CH9RR8pMMTx/i0AMOt880VI/SyZtAX1otUswLgx10a/ek6VwGA41f5tTSoo1rZI
	+cZcyB1xw+yg8sv1ahNW4/iNWCh5TwoEZmrp4AGF7rV4qcoOnKqAYNWO7/STrVKY9cXm7WM6nb4
	IsKSr2yyVOw39YuQJwVixA+mUwQF64GZ2/L5ZCf5BiMWZk+wsUyZUjiCRfk4=
X-Google-Smtp-Source: AGHT+IHSfZ92DSurpArjWelyOt0hggrL5iPZMbzEXpm7qYOD9uzNCC28p/y2m9dAuAtVHmhwLnJvKw==
X-Received: by 2002:a05:6512:4028:b0:583:9860:1414 with SMTP id 2adb3069b0e04-5906f2d0108mr218824e87.1.1759871834692;
        Tue, 07 Oct 2025 14:17:14 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113fdc0sm6462580e87.54.2025.10.07.14.17.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 07 Oct 2025 14:17:13 -0700 (PDT)
Date: Tue, 7 Oct 2025 23:17:09 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251007231709.6c16802e.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> Hello,
> 
> this is my first time here, so I hope I am doing everything correctly,
> if not - help would be appreciated.
> 
> I found regression in the linux-mainline aka linuses branch, more
> specifically in the recent USB merge (commit
> c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> 
> All my USB-C client -> USB-A host aka computer(probably all USB-A
> devices but I don't have more to test) - devices are not detected when
> I boot with this patch, I have to replug the device for it to even
> show up in dmesg logs.
> One device is mice and another one is audio DAC that also shows up as
> hub in the dmesg normally.
> 
> I reverted the USB merge and everything is fine again.

Hi,

Can you bisect the merged USB development branch?

It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
and e40b984b6c4c is the merged commit, should be bad.

Regards,
Michal

