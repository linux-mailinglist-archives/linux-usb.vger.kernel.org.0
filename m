Return-Path: <linux-usb+bounces-5155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE4830068
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 08:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A7B1C23A92
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 07:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFCC9465;
	Wed, 17 Jan 2024 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3wGXtpC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728348C1B
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705475905; cv=none; b=p54Q8x6iz2/MMrycg/PDdinzPoFE+3JQp3SpS/iUBRNXwbG7ve1zGMdfrhI7a+CpW7yAl50QNWIwCv2AdRR8Gbtv+rb2pMBFA4igKE0Q9i5k1yzgZ710BFvzg1dblz1jYtgn2lUouSZoMb5vA16A3JuQ6+QBw7P6lNbqdDm226k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705475905; c=relaxed/simple;
	bh=C7GeLNiGP5bRjIx6Fc77DzlLph77+xnFMKo5ep5RaK8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=E7xuxRiMoiB67xlcsdfgRDaJElW0XxpLboo5jw/9qnDwEfb8U7QzgJrOAdPDvvOk4hXvo4Hpm5lVAmwEAcRJmgxDLLUZ0sSoz85Uwxf1JynYpVft/ljEwYf4U5ZeAvZ6fQppaDn7mwUa+HqRMFxkS7EZanaltcvH9nq9tPjkbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3wGXtpC; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-429d2ebdf05so198681cf.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 23:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705475903; x=1706080703; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3EQRRw7jZs+7rhvm0pp3ec3+dkHb+ZBu+iZ5gNOr0Ic=;
        b=T3wGXtpCGfOVD18PsxQ0gk2eF85fKmp+c0MSpCMlWUkC4j/pR4mili5lzfmtEOJ0NU
         v+ryiAM2RNshko4x0LABuVCSOYezRiA7bS64PtNe38BkHk45Mh0XbqJOVunPmKzr/Np+
         k3U7JuYvDMY9dBV2+3EV5hzkrUKiAXnn0xbHOkc+jCtlAPWGeON9OXshEEDf0a4bP/xH
         XycK0sTLb67DPCrQt3dyiN1+kHmySpa2H47D00/EkqL5uz3qJ0mHaaTijTYOUNV9hep/
         lWKbWwtfmWswqeRBSIMVyQ0LOHxWDUAo/NXygaXFfL+9jX+jqA2XCQMkDflYi38Cp/uR
         7xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705475903; x=1706080703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EQRRw7jZs+7rhvm0pp3ec3+dkHb+ZBu+iZ5gNOr0Ic=;
        b=X753U/aDhOe4J8DpogwXxFzfjB8d4/0iNd2a5SpV80G2OHMy397P6oGcNwFkDjBRRh
         jqHKY3CrBynUk4VJZuzG6yHp0GtlVoWBwMxPdZp/1Et/ACdDzuDMVC+QscTptc76Zpy6
         ADdiykWhcpaaFMoTdxv7uHOjw2Lhi1dzzhBf+1m4uDZuwsXMpMNbvM8HtkkBArSi73ov
         ufQG9fjDvYXa+J4VWxOo5Ed8sb7aMKx5hUaVnuqWvWSawExJzJrAuG9arY/YruFiYQ54
         fFXjSfabzYNyu+lAKbfosSEfz1ar3/T6P36rGhp9DBFYKWI6O6zGPxuHy/fdNp1gGDuu
         qDnA==
X-Gm-Message-State: AOJu0YwgLENvOcs4JIUEVCquapxEfxcY5hYbsxahn3jhwAk13p+yQEPd
	I35MwaIed4VFgVEm+J947btE9SlDjHLlg8yKXJzHKJKjBDfNZOsCw3uVMYijzZk6kfmzKD9hgO0
	Hsay1TQwAr2kE6L9aWqJESBZwGxeP+7aQ7iz0ksG8xWY0BXcozZHCveo=
X-Google-Smtp-Source: AGHT+IHisHbbrW+bz2ZL8LW/3fp6Ge8sVTfhJBl8oWT0mBFwMPn6v8LATZsuXbACVPhDN7t1DQkN6aInw8vCPgmVgk0=
X-Received: by 2002:ac8:6f11:0:b0:42a:220:82f3 with SMTP id
 bs17-20020ac86f11000000b0042a022082f3mr87321qtb.21.1705475903265; Tue, 16 Jan
 2024 23:18:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110095532.4776-1-quic_uaggarwa@quicinc.com>
In-Reply-To: <20240110095532.4776-1-quic_uaggarwa@quicinc.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 17 Jan 2024 15:17:55 +0800
Message-ID: <CAKzKK0qJOz_+pNAVAD8Ub6TZ9uhFOzuDC_bws9MVzxNa7RqYhA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
To: Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>         ret = dwc3_gadget_soft_disconnect(dwc);
>         if (ret)
>                 goto err;

For improved readability, we can remove the goto statement and move
the error handling logic here.

Thanks,
Kuen-Han

