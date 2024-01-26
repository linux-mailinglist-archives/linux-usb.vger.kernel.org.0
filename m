Return-Path: <linux-usb+bounces-5547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83383E33C
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 21:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57CCB1F26F35
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 20:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3E122F00;
	Fri, 26 Jan 2024 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RrPOJ0Qg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377CB22EF4
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706300361; cv=none; b=PkM8OZ3UJ+DfuC2oSQM4HljdZ9XlF/bWVD8mgOpvFAqXRy4DLtXXrLCpGPCU1ssnT590UUQ43ZBhouEpwljo9PgjJclynnIq89gJPFgVDGcFRGDvTOmFKa9CP7rFptd3+yTfa9ILdzZsF9Sr9sMCA3/dHqJv9oltu4CV4GcaDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706300361; c=relaxed/simple;
	bh=AveOdH/2OoQNEsucWyIJ+OME7OtrwMk18a5xqllqfxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdIUgsWdrlfAE8BZNjljenGO96K2ZuPc5V06xTR/34k3veh+UcpCD7DcThram2vtE3vK7kFv3KubiYEVc0jZXDQWgykXBVg69qEWrBYroCjJIUELpi8XqMC/Yzw8APkSgBytFrjpbvK3WwiF7hCM7IkZ7mL/yDSiEMSEVlAprtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RrPOJ0Qg; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-783e22a16d4so2555785a.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 12:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706300359; x=1706905159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AveOdH/2OoQNEsucWyIJ+OME7OtrwMk18a5xqllqfxc=;
        b=RrPOJ0Qg2qZ0/GMv/akJWVSTbIeNvyMait0BMb0Nw3BpJ6TmAiUSsOMdDnMGJnuBJT
         AAzEzlcbfr1Fyl+IXXkKsdsSwTjb19ovu0X0F0tcbBTfELY/6aslkoTYhBCOWZ53tZsQ
         rxhEpmp1meVA5aJ7b5SmJAiyPn4uxRETjzfo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706300359; x=1706905159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AveOdH/2OoQNEsucWyIJ+OME7OtrwMk18a5xqllqfxc=;
        b=uL8s+TdGbzOgia8Hj3FHab2ze3LUiCZpbYThTf6jOYcv0pOHvkjzYBhjBG5V57u03L
         AyA5g2NkPNdSs3qMpFnNw3XT3GyuFrN1C3qMFESEdvLMpGHNf+ihdfZbXqemCS/59f/w
         tgCTG6wsSAcIQiqg/BTvnvitl4omN83pVkDAW4OoXXiWhPpy7QlNqaLGtyO/T/NRSSKS
         6gL06gGGzP4EB/gaGnvCF91EsiXX4vwwmGDvPPQprq5SHYuONY2wjXqsUe7agbwm51Fs
         0BQr9HnGAu4oE1oqciGJ67y9aZzT04fmMvXftKAMjtTsUt7lPFhJuiby0pA2xxp2r8KU
         Phtg==
X-Gm-Message-State: AOJu0Yzm9OWj7T9EIiyhVS43UnHBovH+hK+atdEkSeft0mq9XRuNPCQe
	6iIiVAp2LL8fb+Q6h5YrJki8DLMyjMbOYDSUPhtKeVu+aJs6TNjRX6sAlWqC8d1gMDOxErln8k9
	U6EV3gA/L+hHFo9FBEeOP1cLUG3b8f3ENl8KU
X-Google-Smtp-Source: AGHT+IE6kufSJQsRyqNQemNAhb7CnZLNSDSuYgnGuGGQVgwdz3tGQ2/seVVUOU+NAbGqhSZQQooN96AW2K6r3nUs5tg=
X-Received: by 2002:a05:620a:3623:b0:781:b188:c7ec with SMTP id
 da35-20020a05620a362300b00781b188c7ecmr2083538qkb.74.1706300359078; Fri, 26
 Jan 2024 12:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126183930.1170845-1-abhishekpandit@chromium.org> <20240126103859.v3.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
In-Reply-To: <20240126103859.v3.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 26 Jan 2024 12:19:07 -0800
Message-ID: <CACeCKadGF2=LytNbit_uyHm8jQ72K+1s3NbO=n5tJNjdtBg9aw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: typec: ucsi: Update connector cap and status
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abhishek,

On Fri, Jan 26, 2024 at 10:39=E2=80=AFAM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> Update the data structures for ucsi_connector_capability and
> ucsi_connector_status to UCSIv3.
>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Same comment as Patch 2/3: Please collect review tags that you've
received on previous
versions, unless the patchset is significantly different (which it
isn't in this case).
Or, if you're choosing to drop the tags, please explain why in the changelo=
g.

Reviewed-by: Prashant Malani <pmalani@chromium.org>

