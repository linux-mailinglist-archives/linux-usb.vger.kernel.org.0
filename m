Return-Path: <linux-usb+bounces-29250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B212BD64CC
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50B41888365
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5442EF65C;
	Mon, 13 Oct 2025 20:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L3rf3i6I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B77243969
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389020; cv=none; b=qAatcsgCw901HSqdsa2lOBJuX1DBu+a/Tz8qeRP/ynjA/3U5vuPODr6nERwtlo4kr6m4GkK/OAsoKtfkH7gD3SGCZalvsEgrEIOgaKbiEIG4VQzKcFqZ+uR8Sk9C03OyqRKJF5hy66aRyGdIZPopqEl++f4L3vO1s5EIHNDenqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389020; c=relaxed/simple;
	bh=OyHiH88dCYxYwp7WHWkEWZwQO/x9OpCs5mZ4bjKgNEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/cYArmcZXgpx8Q+saMRuKXgRdxaT5tWBIe5lPs7hDDenNy34hOCnov/XJ5N48K4YQ/jiMvSE+fD9GbVdZwZJVUT+oTjwGkqj4+L1H4lM3hI9wN40dh3Iy0VhorOAkzuMIq+269tufO6jD9ITgOqZr7IHMv/Kna4ZI80mNsDRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L3rf3i6I; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a604fecb4so6055948e87.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760389017; x=1760993817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OyHiH88dCYxYwp7WHWkEWZwQO/x9OpCs5mZ4bjKgNEU=;
        b=L3rf3i6I5l+ZQdWbOB85da8qGu01faVP4jmsdhHA1clYPKqIKMiS53LzDjtBOi5Qoy
         nkgpmu95OoEb1qrSI/ro+/QTnPYvU/WLx4jyJSTgnSrXzNj87246ekfqoNR317SXSddr
         +WG6rKn9csIKg2Avdk/4eGYo4w3zVHUXIkFYGTAa3UsZ+AvMhbYw5hbptxPGFnxsxDJC
         9XBpiQWOArfacWwtzAKGZuYty5wbc62JHEapXN5FcqSn/dxaW7t4msm/NAM1TeSOXS7w
         TrsEOogCDtF7gQS/NlkKIT8IgKqlP1aE8ao09qCJxi7XJQ5+43RKpcSXMLGM0hoGFVQd
         A/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760389017; x=1760993817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyHiH88dCYxYwp7WHWkEWZwQO/x9OpCs5mZ4bjKgNEU=;
        b=m38MkUMcd0Qd5u15PvBqRhYVgBcdRoXVuzZlRuG9PpiOPrLupxZPdhV5FXtvhCYk3Q
         lc1jhqTs7qm6fT8GRh0zGNNQ7868AZzGwaQbNwE4aBnldIWD7xoTpsBzy4e6vQEn+HgM
         CpCP40ztnQFFbfzTlFcyu36IMVqD1pau+362ZoZKrV2m78BJ5AACh05GDkff2ZUh3jv0
         kd1lxXeAeEWK207ZJs17OogVXB5IfO0qeH9yLYIdnK4QQiyTMqmmtCWwene4f1ERKDuw
         Hob97BC6w2vsF3SlzpyYaFsOX67QZADZAu5bc+u/gIgW2wMJJVQ4M9IM/D1L+9B4U08V
         jZvA==
X-Gm-Message-State: AOJu0YwaK+D4JrmHKKrLn+6N8pyGNuoyHXLyOD+3z+fPplLZtBeo74sr
	HZeso7CFcOEBwfvaDSuRKJR4CsmYjk4G58Q3r51AMdltePrT/bUw/0XYJeZN37kmZohUuilSpC6
	ZayKlquKw9x/avYqAlhRZdsCo4SCWVaxFuWX+gXgR
X-Gm-Gg: ASbGncuhrjhQNyoKdlB/gENhip96GxjRLosfZNCtRkepWh5JCWaKthqvDiovEpyRpaQ
	ELZ5QKfMhuEOePMaRPeuDWalPT1LtNv3sxfxeslFwuJkz4s/JyuG1E9XNuJmmmerC/rQx4I1Bhj
	oU9fZqPUxeSwIt+fAWToqA8huyn8OA6O0jbxxIA8xQ9HRDxy7EveiV9sSDKk0T4HY1rFaMHTX7D
	m0eXW5xaK1ZmcZaFI8LlCkaXNGaanCStij7P12vJPl8nV5CiDlXq/WR6d80yRo=
X-Google-Smtp-Source: AGHT+IGmVV5lrs8Ti+xvSM/oKnjUH0scqx7Ugbmdv684Hq14+QRlFYGp9dldJN7qQ6cXZcuxuKZ/UbiBuXuT8Q9PGmk=
X-Received: by 2002:a05:6512:114a:b0:57a:640a:11b4 with SMTP id
 2adb3069b0e04-5906dae5760mr6285581e87.39.1760389016204; Mon, 13 Oct 2025
 13:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com> <20251007000007.3724229-7-jthies@google.com>
 <aOZiuxDfwYql6ZUu@kuha.fi.intel.com>
In-Reply-To: <aOZiuxDfwYql6ZUu@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 13:56:42 -0700
X-Gm-Features: AS18NWDnCuURsI5Lz8cXhrSTClImN9qgumfpqgNkVL2-0TdBQW_-2CRK892lf2M
Message-ID: <CAMFSARd8U1RN10pgRXJwn4y64cNetK7isNWHgqrY6HJQn+LLtA@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb: typec: ucsi: pr_swap should check connector_status
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Couldn't you use the helper ucsi_get_connector_status() ?

That work, I'll switch to using the helper here.

> Maybe this could be send separately? It does not seem to be directly
> ucsi psy related.

Sounds good to me. The same issue can happen with DR swaps, so I'll
also update the patch to refresh connector status after sending
SET_UOR.

