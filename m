Return-Path: <linux-usb+bounces-8439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4C288D2C3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 00:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3FBF1F3DAF1
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 23:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F2313DDCF;
	Tue, 26 Mar 2024 23:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nHi+9s4f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A46FE35
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 23:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711495194; cv=none; b=RtEgoGmJbZXdLRiINxgVP4nRlOZac3t4XcMirUyMsN3+DparDjdMzHUymzEelO8mzbX0W0WICOGZWznCDikqgc6anTxQMdsOyqF9FC5Bh1Hu/ihfkndT1wMWalDilfVVAMF5UL1hHMiTS5CzNPYv5i70GOElLCr3oz7T4dMa4u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711495194; c=relaxed/simple;
	bh=UvWP6b18kN8mm8jE4MtS1uYsAsJWVUOJQTXrlWh4/Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NytfoNdYdPgLg1Ew01hg522y1H4ZbE7lS1CfBqb0VCQCDuI/ip6BImHVO7LmJ6138Z4C6ZTnZwqcukaD/BpF3+4KH9yw/QX+R9GCtVJzjT9i6tH24KJ7vDDqIIUxmOV1XBWsXItLCP7Wasv1GNW8s3HL2GiujPdxb10b4NJDS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nHi+9s4f; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56bde8ea904so4032a12.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711495191; x=1712099991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UvWP6b18kN8mm8jE4MtS1uYsAsJWVUOJQTXrlWh4/Ww=;
        b=nHi+9s4fjgUhzmzjL5pNYUo/1/mqTXL1Zx12yzAM/khDBJJXHuqhi3LyLkkIAeWo0a
         z+koTPXaIg1U/sBBPhBJKs1mzopqlbOaFWYd9pDo10eGFdPEHyL/BazF1OAJWzvu3m6H
         jd0t6lmlQrvz7IEqn9S73gypbDeJmUNOZwxqvNZy1Z3wHjtfP/KWc0l/OtV3o08VSflt
         Q4cYMttsixEqx6cLlVhviFbzPBYLbuHL3COzt/LpX5Gss0DWUWTkntTu6nNXSnVX/AFF
         nf9UABeE3/LYij3wpLe6EPSAKzhuI0t7RrpMl7qG1IVjyyjiP7FvhUBZO1zTnoqbW0KX
         lLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711495191; x=1712099991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvWP6b18kN8mm8jE4MtS1uYsAsJWVUOJQTXrlWh4/Ww=;
        b=G1K7w8y4MXZJ53SvBVJNQh6c9ZqAKZha8Z/9Om/DEJ9yxJreZCw/rtcy1nh6w7+dzl
         aGptt7taHH6MHtq2ptURSMOgGhL4z2VkYw5IzVVhVWk8zTkC+CR3oRXU8Te+gR0+BGSe
         4rNwCms5HCzrcMPCUCnBkVhIPY0V+zIoZiBPkoIveSAh5SbTgI2lDJ6SXcfw8hkPfKGI
         alQ46COanXgnUxUFg9kGro+/PLW3BZ0RvoStfn0/W9OWpEkLz5YtMyI1XVuweKxhwV/o
         Kd1lKer9PCniZwfV8FSJO1a6tq6yyMbeXiHI2PGZQM+SVSHfZD/h3oy5mwrdWzLG6BKN
         tgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbz6wqg8Q0TwsbE2TLsy1fmUERZgNgKVDpmhh0YnjIST2KOsPpaVjYDbKhHF6YA9XCSdnSVaJCxotgH0zN/E6b6ObiQoAsSKwh
X-Gm-Message-State: AOJu0Yxwycfyvidty2U4ImeKRUq7x44xWhUA21pC6HTFJRElqDXHeAew
	YH4m7uL7HgX6kPL+40lBfwfgPR1XmkbtgUyKFO9QMA/+klLnWJGcP6w6GdwSjWOM6/v8LnLVhyk
	Ss5mLK5xPZg4MLUOX0ZiD6xev6boT6LOjlquZ
X-Google-Smtp-Source: AGHT+IGZWut7iYxsRXsNc34sf0qz5fmBiwVI3r+NknfdcTh9appFJDXacDvZoJGMK/rXWQcZT5jiuuBFscfiEQScH5M=
X-Received: by 2002:aa7:d910:0:b0:56c:c20:6b40 with SMTP id
 a16-20020aa7d910000000b0056c0c206b40mr19214edr.0.1711495191346; Tue, 26 Mar
 2024 16:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305025804.1290919-1-jthies@google.com> <20240305025804.1290919-3-jthies@google.com>
 <44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org> <20240326220919.GA2136359@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240326220919.GA2136359@hu-bjorande-lv.qualcomm.com>
From: Jameson Thies <jthies@google.com>
Date: Tue, 26 Mar 2024 16:19:38 -0700
Message-ID: <CAMFSAReKmon7xAXWq4kJvN4Ge-tKkhUaaDZFP5EZA-=WU5oL1g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,
posted at https://lore.kernel.org/lkml/20240315171836.343830-2-jthies@google.com/

Thanks,
Jameson

