Return-Path: <linux-usb+bounces-29248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6610DBD63F4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A12484F86E7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4885C309F0A;
	Mon, 13 Oct 2025 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wSA9v8dQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448C3093CF
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388279; cv=none; b=oP8dVHYNnjpyGOfvxSt2JcTdW1BhU45eaOxdOoUd38w7i6inURbARBqRnc1abGgoB+FuVNfzV3tq1zm5ko60dag2kFVvN0hSAzHKFQS2tD8j+Q4CKKnfDqt8nhw6LFtIYJdtG79T7xHXC3oV46dHObs/5Eg4PwH2kJkdZuQBkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388279; c=relaxed/simple;
	bh=9hay/0JIfknGgWYAyMDi+RRa32y7nL7hZHKUlG5JnX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syHy0Ef3UPw6g0KpgRD3zQ6EVjK1blMs41eiTlTN7HNMD+cQ2fKOGUEibd/Yf2PcW3QA9QV4E5NReC2uzUu+6zFd3PiNpZxODjK/kaa95wSY5q57DO4VGcBUNgfgiTnPbPA6Eqx3zHERXNlX27bc0ySW9PaSy/oW6PZNGzB/CWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wSA9v8dQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ece1102998so2767113f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760388276; x=1760993076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9hay/0JIfknGgWYAyMDi+RRa32y7nL7hZHKUlG5JnX4=;
        b=wSA9v8dQf6O1yYRyuKW3CRU1veMgj6HQEXi1tSKruyHFiieY4baFGRW+QIDkkbxeGr
         mqbNENk94Ch7ocGYsurhvv12j4GXhYCMCJs/WTfSzDMha1voTLKRiSdob+7zYsS1D7Y5
         ond+/0INdY1a9Orwg07aL7Xc7Bs02t3eS5qOsLS9zBmibWZsDh6iTQkmYWFSXY+gz0Is
         CI96hIbLbS3nNoocslWRpS8SYODK2wFXq0uZLbM5GyVRAX3+MgTr9vzACiXszjQ+s9GJ
         hGzIsLrHJx317X+w0ifB2z1On/iGZNbWfCs/snllZfZMHt81boM9oI1NrnJJgCuAMTc3
         gYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388276; x=1760993076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hay/0JIfknGgWYAyMDi+RRa32y7nL7hZHKUlG5JnX4=;
        b=P4aMtSPSucosJHKA2fzqt+uwTtmgEsoWk6Z1H3qYJPO9VMs53L22nzsDE7HLYLnpus
         VVGYzF12EwHY2LXnOaih2McXrW1VIG8Dv5OCsbJkTMxQ49cv+/G9I64sQQit0/nEvnz2
         szrmIwosn5rFiWgU/1ZP85jidBqiXiVYL9TfU2zK3O/oWGNpIeXKTA77kwtFxlKLVmsW
         KCCkXBHnHkzrmUMJxZnAvy22Bb0OfmDNVz+90BbhkoLSbaoAZVm5Kog61X2qkd25K5+m
         dWZLWi+W5CqhgMzlPzoQvgkJkEd9W++LVDWy1edcjcOr2XFBa326O2wzwboXejRiawhk
         MD3Q==
X-Gm-Message-State: AOJu0YysLRITQ5aRYepyle88dyqJEs0zVjLqrGVrUVdgD8arDUvgOaq9
	+QTdCCh1WuimoDuOwTK/fTrfb3zFRICKXej1DEfPVOAJ2oJ1SUvRA5UKu7grT2XJXoPYn3wZpGi
	sZe+2opX7uDuPFrhi6tuQUKF4/+ZUDca15AThQGXu
X-Gm-Gg: ASbGnct79vg1XeGkA5pkQIP+G6VPXkWgEuT5KzDuVwinqpd890bDXVSEBwHYZhTJFQt
	csoNewXWd5HZbAQo6REjwV6fP11XVenf3FeiwFg/9oDhTUwYaNZjsPtP1FO+3QOjzzOPllvDLOl
	Uf4Mcuwdt7XL7IwiCVULLG5qoxhCpxj7+qN1jzHW/46E8+WhYlbyfmpW9DCayv8GLeqUebCiIES
	uu4H96QBFC15v8v1zuimgKA6bCGBwpR+T6U6YbRVs6pSvFcDRQAwXvLeDVez0JGbGVV/l65/g==
X-Google-Smtp-Source: AGHT+IH1jaLuUviRfQbDoA6NkOlm+qkv87OVo2UlFWcQ+L0Qmlm8gTytxE7e1laTJS5cXlaHj5g++60FMQSaieI/SWQ=
X-Received: by 2002:a05:6000:430b:b0:3f0:4365:1d36 with SMTP id
 ffacd0b85a97d-42666ac9d80mr14319200f8f.16.1760388276152; Mon, 13 Oct 2025
 13:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com> <20251007000007.3724229-3-jthies@google.com>
 <aOZgy-ngtrilVQ5N@kuha.fi.intel.com>
In-Reply-To: <aOZgy-ngtrilVQ5N@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 13:44:24 -0700
X-Gm-Features: AS18NWCU9ewVmTl79PE142H5oFVAZ-jo9n41HkuLJQx9P7yXDul6gDppIar6RSw
Message-ID: <CAMFSARf+PMOJHc5FtnSB0hCyGVnguNrTada9RuAba4Zy4XCm+A@mail.gmail.com>
Subject: Re: [PATCH 2/6] usb: typec: ucsi: psy: Add support for DRP USB type
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Benson

> Do you really need to iterate through the whole list of pdos to find this?
>
> The DRP bit is guaranteed to be always in the 5V PDO, which is guaranteed to
> be the 0th one.

Thanks for taking a look. This sounds like a good optimization, I'll
apply it to the v2 series.

