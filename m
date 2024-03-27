Return-Path: <linux-usb+bounces-8513-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A517F88F1F5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 23:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9F51F26A34
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 22:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8898115382D;
	Wed, 27 Mar 2024 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2OjER05"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF7C152DE5
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711579287; cv=none; b=sBZqPYrkVEPB2SproRnk6t8B6gSg3mVGcCQVYTh5Q/ot/0ySbSpau47M1NSAHE2XPh46GNmQUi7+zxFAYppBBN+Ouj6g96XTiI3CEy198/5aGJNBUyKYDbdUx5fLaEPrY64kTnLb068xMWKU6uljmwvzQl1dlwQ/saAZEZYG1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711579287; c=relaxed/simple;
	bh=5ThBrSQJKBnrNYoKklFaEy0vcISKtZg0KHuySC8oZ0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjVt1Co/fbq9ZRkerfPj2/oI1n1efJFkfqE5QaSHpp8u0Seq23C7C7SUuSQlOYcWLesh9tCTPVUoNBXIva7l+WF/2lhtdY7Bbs3hCupSiFofWglBVdj67CqbL7yydK+mVUXhnlEjK3xmtMPsfAw8rbvbDY2HAxF0GZz6QXpIj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M2OjER05; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7e05d6871ddso50753241.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711579284; x=1712184084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ThBrSQJKBnrNYoKklFaEy0vcISKtZg0KHuySC8oZ0c=;
        b=M2OjER05vDZL5JKglAA8Zmvu7orL/ZMDJoTehMHHNCNbFGVpVUx/eLED8nTSz6PVHH
         MUitC4HWN6uKpJg6MEcNdm60t111nkL6yLeWYW4M1ZSq/Bt++XvXgG32cP9zPzExG3IP
         z3m1D3G2ELxtzNr76ibZc0cw6okpRiskwVGzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711579284; x=1712184084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ThBrSQJKBnrNYoKklFaEy0vcISKtZg0KHuySC8oZ0c=;
        b=FAFNw5zVWzW/i+RRlGAErX6Dm7FqhUCVnIe2g2v4wEAkXyBYGU/rmfjIBn73j0+aMI
         rRBRBHMncbGguFE809lAsdPClB2c6D7IZc/oAjQlHo5k+KRzZb6lxCXsQGxcQFmCzhbN
         GVXMoGWst2WfIB2SWh+VnI1FAHhJ2Xq3eHtLkPhujsCT0187+zc9YTxniMTXcVH7m/vo
         EDBMBAQUGn5dz5S89uMgGqZlGZv6zJePIq7oRmp7gah93TCy/0QDepjDDrGxrhO0V+l7
         PPhFIL54Yc2fjao9vq1Q+XaX8CM4icVHXrMswdrQ/RGXtehqRGhwXQ/n+U8WRQ9s+Gss
         5dXw==
X-Forwarded-Encrypted: i=1; AJvYcCXDAw/vmlSiJ8pgv70MdUZLh6NaBkyqR2Tng4BgMBd0/D6Z/gOndQ2yWfyvvDaV6owsARlQrfcN0JIz2oQZp2+czop+LjJNrsvt
X-Gm-Message-State: AOJu0YydPnp8Vp+FFbeW7A31zmFEcYaC5dDzfrGSYXDYxM7aNZPhT6eZ
	5QuP6tN/1TUOzw1M/FbE3Cb/hIO2YPomI+OFHD0DjWu9HMWbZNzVZjT5urPUl/IJv8ZzdmO0t8U
	efyf5atc0xvgH65BeOciqDywibATmiplf6RJL
X-Google-Smtp-Source: AGHT+IHNjjYQGq2X8tle/LZvZCaDTr/ZB2zjC3mCynbSiO5UyriTzUT7hxsMKWXYIiTf3AnTUZQ8LoJQK77rfY27NGw=
X-Received: by 2002:a67:f242:0:b0:478:2f66:f641 with SMTP id
 y2-20020a67f242000000b004782f66f641mr1446935vsm.34.1711579284703; Wed, 27 Mar
 2024 15:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-2-a6d716968bb1@chromium.org> <ZgQBXFzuZLJcmH4h@kuha.fi.intel.com>
In-Reply-To: <ZgQBXFzuZLJcmH4h@kuha.fi.intel.com>
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 27 Mar 2024 15:40:48 -0700
Message-ID: <CAB2FV=7OnNt_-fTzUV1Rrg342jPuh5haUmy=EogVNwyGWyAy0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: Import interface for UCSI transport
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 4:22=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> I'm pretty sure somebody already told you to merge this into 1/3, so
> why haven't you done that?

v2 was uploaded a few minutes after v1, and only added a few
maintainers of drivers/platform/chrome to the email chain. I was asked
to merge commits after uploading the last version (v2). In hindsight,
I could have waited for a review on v1, or added new email recipients
in a reply to v1.

I am working on some comments from an internal review for commit 3/3,
after which I will upload v3.

Thanks,
Pavan

