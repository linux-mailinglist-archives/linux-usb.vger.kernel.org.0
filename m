Return-Path: <linux-usb+bounces-12337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A702939638
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 00:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034041F21808
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 22:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A605045BEC;
	Mon, 22 Jul 2024 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I4JG2gHX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEB1849
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685810; cv=none; b=jV8Vq1C4Y/aULlGcWwAehycyIBGyYRYqPAdy8tAK/0drbIa0lthfvZTBaGi6nPeVtQpwwclv/KcGyQejPT/hFmA0ebvaoXbDU3jF+9Vgwvdhm931owHnPHVMsa4cK7iz2nPHKaCKlEr9ZpLs7lmiIoEnL/8yjkpLpFX485wQ+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685810; c=relaxed/simple;
	bh=TLmaKxK1q1dvssIKBeAt7tgDCgXAkDCtqoajL1zPUtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDukYWv5qay8rO/ZOdvL9Dej62r3s9a3QcFtJhInyP2toaSJi4XDmO8Q2lXumm0TIxFF4KoeQI7D3KgDI1t4HFhNDK0tqvhgwoaVzpdrQEUHy8sMyr+5EQZHBtrSudyus+VROxsngSK1mJG5TA9rRF1oQ+sfZlP67Xt1X3jihrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I4JG2gHX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so2613a12.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721685807; x=1722290607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TLmaKxK1q1dvssIKBeAt7tgDCgXAkDCtqoajL1zPUtE=;
        b=I4JG2gHXQ9aDnuTaFhEG3nf4YLyQ6qYWaLWCgFgg1oZqRb0NxkCNI4sF/TNJewa9+O
         zom7yStSO22vNiIC8ew3EdoVZKuYTy0Rlt7kUxNoAc2oUO6WJ2/0HuZWYu1fs8o4b9Wn
         2kQZ8iSUorwce0b2MX6GcrpIpNR30x5vM1EsRjTn+UAPHDG3YhQnowH+GxG/5k5lvlHn
         pXNRl50FYoC98ChWPNhsUT7V+G4EVvub4ES56U3kr2rCjHF7nuTqywBKEibD3o7GL3zN
         gmmG4ocoTTVTRRSgonH8qmCbpHbrOboBi9+9oNf6vPlvTe+OXw+EXsuce5FXzIrniWCR
         8Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685807; x=1722290607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLmaKxK1q1dvssIKBeAt7tgDCgXAkDCtqoajL1zPUtE=;
        b=nypwy8eo5u9aOQG5vJe7AfpoEiDmWS5Ee7jacz7RJljaAMKp2ZF4ll3eAyVpHRhLWS
         ouGfGinrNzjBPshWdYURV7DNfVp9T7RGZ81ThSYxn5PMBoRlERP9XFrfYCle2WRti6Yg
         58sf7zgmqpoll+pzr45PROqQPmBenTViRMZMaWnveKEEqiCz/IAzbChxglNL2wDO7D0f
         W1578TAdIcXNLCZhd9G7Bv54u97MOUd5OxbUxCi5F2b8yACnJ4l11YHVGxgZUp6TXVM/
         +5HxWing9Hm8JN9Htm+iHude8yrM85twTpiuX49O07UbfKLQCPzng+ouGz4a030lhdXD
         m/zg==
X-Forwarded-Encrypted: i=1; AJvYcCWBtfkRF56uYFve7cq7O0fZrxC5geridjLgwJztG0jt+Tm8FYs7vgIyuCSPa7GAQ3iwlpp0CCRUyAR3+Ho+4nkp/qgUUsmi5Zyv
X-Gm-Message-State: AOJu0Yzvkstmj+gl9c0rxC4IAIE+Th3hMULHmgnBsdfu1NZz1wzZfoZU
	2cIw7bKChJY3vCfQLP8c9mxm401McDaogBUAyZ4pQF5KERBuDePMqD6HW6iwMyIfcfaL2H45ypM
	9sZj05cupXAFlDENMFshCF5NxJwhquUqKem6o
X-Google-Smtp-Source: AGHT+IGOi4wAzK3wXn9I+luRrl8f5AMAGnohSrNJL+QVLJfQPO30ucHv24x4sReIL4wOznViBg1JIvJy1pfINoEE+Mc=
X-Received: by 2002:a05:6402:5246:b0:5a0:d4ce:59a6 with SMTP id
 4fb4d7f45d1cf-5a4538c2a40mr425945a12.2.1721685806687; Mon, 22 Jul 2024
 15:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717004949.3638557-1-jthies@google.com> <20240717004949.3638557-4-jthies@google.com>
In-Reply-To: <20240717004949.3638557-4-jthies@google.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 22 Jul 2024 15:03:12 -0700
Message-ID: <CAMFSARfEEPcrQ5bkrQpg3=wLWPR0uc0+fkHyvS3jy1hXtyZRnA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] usb: typec: ucsi: Set power role based on UCSI
 charge control
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone.
After some internal discussion on this patch, I'm going to update it
to send SET_SINK_PATH when handling a charge_control_limit_max write.
The intention here is to use this for selecting a charge port and
calling "pr_set" alone won't always work. I'll upload a v2 series with
this change shortly, let me know if you have any questions.

Thanks,
Jameson

