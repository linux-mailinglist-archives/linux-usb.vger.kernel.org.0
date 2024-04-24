Return-Path: <linux-usb+bounces-9674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD28AFD5D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 02:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1921B2318D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 00:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CF31FC4;
	Wed, 24 Apr 2024 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1iFiOUfD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF347FF
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 00:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713918590; cv=none; b=ccKZNdqRLjkAhfmmJddOpQCQ5yt3Kg0WXipRb2vNXART0GA5WMHHcFx9BQOVGksJf3m87t1JigQsjJ2k2chpo5IAOGjvWsatOwdgI3/oIs/YmV8BAJOE3+iVjCYTYZ/s7lJs5fT41tN8Dx/SVLjlqWTXlYSoFQknkh20MrCBcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713918590; c=relaxed/simple;
	bh=ZU2dyypC35hTtMaDNugRfvH+64b+VBcAIVyJtYe7dgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXPn1vuGrJWgBIA28qDqicxuSE6bQTUVJvPoeEv4LGmmAtiR7urpl1uH/th+4barSl+OI9FkRHbwJqXqMoFmcHHBbmGw5q7gjFNBK0JmO4O9L9C0WNnvTP8x5htmyazwANZ+tGEXc6gMmCnKAOn6pPDJ+Tv93jckkc2b2wvRuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1iFiOUfD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-571b5fba660so3295a12.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 17:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713918587; x=1714523387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU2dyypC35hTtMaDNugRfvH+64b+VBcAIVyJtYe7dgc=;
        b=1iFiOUfDqYlEmFiefm1hpNlf9brmTcOAwgcz3pRfxqvHZkS7H+eJ70NpFTWK/nXyL2
         VH6D7Dr2WRiFFnZlhwSqSw8YOvU8cxzo8xGTZXW5w48sr1y64c55kMlBx9wv5a8/ixEL
         SajEQgxydURJdufcZv1HU5DFVJ252C97SusSBJAQY01Rp/koka52u+1dm7w+Zy+FSEcc
         4GXe1IFNjTUBETEgGzoS9qgt6R0ar25+0MNdLpzWbWJN2Yxc+52g+XyzEgpUcrhVhOjr
         Xj9fhfHPfGBRDLSMt9Rmvz+1Yf5Q7Qa5JYapmSZccBlqIHDm+rFTuLX/yJ+Rh55NU17c
         Rs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713918587; x=1714523387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZU2dyypC35hTtMaDNugRfvH+64b+VBcAIVyJtYe7dgc=;
        b=Gc2GKQKqKRTi/UKOljqNqIQ/JtBDUJBSy8jUTN4AY5bbCXSCrnWivJbmH3dgmmzq+o
         H7FC3dP1CImY5Y/fvcjS2MJqT301f00VsUeeJg2KjkLYPJikp5RUt4UPBnxTu8hgPtgf
         2X/3QW9JcGeZhv74h53dH7QugpPt9M+FLrTt7Re4mKI1O5hS3VgdCMiYdcsuMT3QAkCB
         OUeRz6k6+AjAS/rlfnF9y3oGYHNuooBQrlgNcljfF7LdOH9dEB46HoqcIqmyO9DA73BM
         d5yA6XFGE8MRcouKG+fmgvKP3adEASEqVY8WAx7JoZvbEh46gXQ8t0R9xFpR4xOonfqE
         zUkg==
X-Forwarded-Encrypted: i=1; AJvYcCVXAjv0j3C1z5JJ90KdBzl+M8LQd4RDicFYWbO8gcFuVvqJZw38bQhucT0I+GRq2m6w5mH3ASZthNBB9nt/3OJyFlXPBmO3TTcY
X-Gm-Message-State: AOJu0YzrXtPAQCORXSULWvVdBMTGv+UQ41u3RtrS0dyzx8UH642UP4Vm
	1QnHao9g5xr4oPWA4fVr+mLwERNkMPY3vXL6vzuadEQu9k0sR9OvROib7PpZoNKp5uy+2ulezNM
	ln7d7oIgPReeOvb6BkaTQMkpnDbDIJl7rlguSOSM0/vgiYsWchxnWg84=
X-Google-Smtp-Source: AGHT+IGPCUO5yAr/FMUmarCqMkGLRTzcErLX5Ff15XJVqyHEp9rslTTmK/kMgmjxRJxqaIojPuuoWd/JoUaERypvdpE=
X-Received: by 2002:a50:d6ca:0:b0:571:b2c2:5c3e with SMTP id
 l10-20020a50d6ca000000b00571b2c25c3emr41728edj.1.1713918587067; Tue, 23 Apr
 2024 17:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419211650.2657096-1-jthies@google.com> <20240419211650.2657096-2-jthies@google.com>
 <ZiTcqZYS53ITwNLy@cae.in-ulm.de>
In-Reply-To: <ZiTcqZYS53ITwNLy@cae.in-ulm.de>
From: Jameson Thies <jthies@google.com>
Date: Tue, 23 Apr 2024 17:29:33 -0700
Message-ID: <CAMFSARfTa59yueKY4bVQvCL4KuQAeQFBDBBVDRkhhwRD4+zxmA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] usb: typec: ucsi: Fix null deref in trace
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christian,
thank you for catching this. You are correct, this would prevent
correct altmode registration if CONFIG_TYPEC_DP_ALTMODE is not set.
There was a miscommunication on our end when setting up this series.
The intention was to check for the EOPNOTSUPP response and fall back
to default altmode registration when CONFIG_TYPEC_DP_ALTMODE is not
set. Sorry about the confusion, I'll fix this in a v2 series shortly.

Thanks,
Jameson

