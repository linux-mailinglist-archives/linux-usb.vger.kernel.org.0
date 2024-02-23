Return-Path: <linux-usb+bounces-6983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E409861BE6
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 19:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2EC91F29236
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 18:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5A8142636;
	Fri, 23 Feb 2024 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XOmS4F9K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0201EB52
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708713639; cv=none; b=rV6PuFi6dAHwKjHLundsHoqnsh6yH/5oOmZPqPopI5Yh+N5OG3ZxCAXK24Nsm7vUfGg1Gi8p6qswsLmO7zjfAOO3SYg+Hsk/672omeTJNxfmlGHjkgwFpnhSXRwQDCW7VlrkDtj4zflP6+j38LUrpzztu08adMXhlXxqq840gNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708713639; c=relaxed/simple;
	bh=TOB4I3kVL0paZ4hfkT3Qqt8no9Jsok7R6cPcghhOfE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAdOLPeJY0guNjaEK5UlkzNXs7+RWgQZuPFpRRnigBllvOy4H3KalMMBO1fS9pirMqupy0mENX5wDb5747Q/4FC8asA+sPFfG5lWXpJOamq4uZsfXhiK4lmRkqzRiFUbPFSHeHKbBZ9oZT8dR9c4nFJwumln5QJEW1LgPJIz0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XOmS4F9K; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d2940ad0e1so720278241.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 10:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708713635; x=1709318435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOB4I3kVL0paZ4hfkT3Qqt8no9Jsok7R6cPcghhOfE0=;
        b=XOmS4F9Kb73d3P312ms9v/Qn/budZvibIQeQTTa/244BQ/FnnrixG7MvsPSNsSWVdG
         e3s9Kqnvo3cYBvv8Vd5cqDi+3ThR/Ggc1MnomkTu7fyl5xnbQsSEbwpjLTPoazm9eSi8
         SdTABvvb6qVBBElHpEyzv/7TfGMVqkCJDuJg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708713635; x=1709318435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOB4I3kVL0paZ4hfkT3Qqt8no9Jsok7R6cPcghhOfE0=;
        b=voWeMbaZY6Ih7Y7D3BFT6LxaHqLDQhmys9A+eBo3ksks2a9YG3xdMiC8u+AzZC41RK
         j6pNPMqW5CuEee4Bg7v9Aqh6lTRS1/8xYqMnBjWmUSpSRnTTcvKzGQ+SrlLFhBq+gyOH
         dXNPuB7sE2yn9kZk1uprWqNwwrUdvyNcin9/pNJgjkoLd5C/njomVBJ65QYbr951u+Sp
         WJYQ6fFhElz1WGs++8jMqKy0zYxfF/96az5RHBdv3SjZwhVLOOWNILPgk+T0b8ar0bWv
         Le17yKxbYVSJJT9beq56/1aBhmU6S30H9lReeT+XJqS6ADSaXCFF35AmBCCKTQm0pdNy
         WGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz7IccAk0l0wgb3Vnp/49HHKh+fDhxCCOgC/qUpkeaAEsfTToXlVWF+bxt+O1hLpxWCrfgvZLwo9aUw/DobeedYbfUUZ6UoUGU
X-Gm-Message-State: AOJu0YzCrFpY9xMfg8HL81UWOo1yNAsokBoS7cZww7OrGfSBtVQvTSzg
	HhFOX2xrYvOcTBeStB6rW7KHU3hUJo7dQ1XG9ZkQ1pntQvfOURl/b+Mo0lLPjdzptlZQ4k5xRkQ
	5YR1Q2G/QbnA9G534oX/T1jdqXTclxhGsjllm
X-Google-Smtp-Source: AGHT+IHfzGOHuuHDBTmLDY0ie0fD0ekcRFPvHSKqTM3fPy/RGiI0EX+T3g0rSkrdu1RSl0uN3IWJAfZxO1wO1jUtPCo=
X-Received: by 2002:a1f:cac3:0:b0:4c9:f704:38c with SMTP id
 a186-20020a1fcac3000000b004c9f704038cmr784493vkg.11.1708713635554; Fri, 23
 Feb 2024 10:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-5-jthies@google.com>
In-Reply-To: <20240223010328.2826774-5-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 23 Feb 2024 10:40:24 -0800
Message-ID: <CACeCKadQL8hnoOOu8x5mcD=tHMAB9sEVEMY37X8S4vqhi3qK1g@mail.gmail.com>
Subject: Re: [PATCH 4/4] usb: typec: ucsi: Register SOP' alternate modes with
 cable plug
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:05=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> Register SOP' alternate modes with a Type-C Connector Class cable plug.
> Alternate modes are queried from the PPM using the GET_ALTERNATE_MODES
> command with recipient set to SOP'.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

