Return-Path: <linux-usb+bounces-12429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2193C819
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 20:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7591F227B2
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 18:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E219919DF6A;
	Thu, 25 Jul 2024 18:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UtTULnQv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9923D0
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 18:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721930704; cv=none; b=rRWF9aftTvDSynAHBpP27DprARpRSLiuwnZLkwz4LY3Fccxq5AqI1VG/nC66i9d4dgwVgg31kYQwBkUbPVK+Z+wYq2oNWpxxVAW1bo9+PPjys/vU7G/BxucRHMYdtUQCLqEHBJkrU9OHMzVkyYkUobSGZ0JiKS8OnAE9watuBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721930704; c=relaxed/simple;
	bh=Ln7pIROyNL2e8TY7o37HN9wu2DLQeir/eCYn6K2E4vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjnqTarbOWSSmarDmRgqEDqBjTC/ViJ1onPRR4F91jwQou62iosgA9nMvidTYhSMqQ1xnurT2g0YyoXZmfKzQ9OaOztvifVH0srSZVVBmgw760DydKAGdGtA7T1MslShU2eM9bYf7/OQVKZHxT/8ZAIEyk32ZCFnva3NDYJkJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UtTULnQv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso1773a12.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 11:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721930701; x=1722535501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln7pIROyNL2e8TY7o37HN9wu2DLQeir/eCYn6K2E4vM=;
        b=UtTULnQvUOD0Fo1+T/GeCLOLiplhxTHB6k2yLthRx2aP8EUbLKzt3vk5D15onHABqP
         o3yAeuNTXd4hugOqyGrUvbE5ibf8kBoDIfsrZOQKzQRU7BgVy4HoYR6qQCTyAfUqezup
         fQHEay3E5lCOn5ncN3YYeAuKn3OX0EPS1Q4n3TBxm533VjvbNdUWM3J/TI9JPs/QJH7o
         TJYu93sKg1/IJUDR+B6KNiUXNggjhIrHVaK+SuMUeIa77/3RzeMzDh94tXqjsAcgV7s1
         0LwZXBCpb0ij97jtIMIJPaGYFK4J6L2AaiS7esP+LHAWOaUFDhzQQPDsDveUbzPfFMQB
         ZD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721930701; x=1722535501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln7pIROyNL2e8TY7o37HN9wu2DLQeir/eCYn6K2E4vM=;
        b=N6BB4UFJoeBm8kO5PIUZDSczSmt/Ktww6vNGXg5QthxOvyvxWS9Qo7+wvO+0vS/7tn
         URynUTLOtPDHPeYBwDMR+5submYj1sl6WAJSES9lBUV4bGHyQa9Q1mItCYUPdtUziG2R
         7ArR7F+F2r9OJF7PqlRaadllGUIMGV5ERCCAJXa/mO8qnx3INk6fagyHylYNAdcozrpH
         IOT4Y98LiwIi/rNGTliddngpUYvTXjEUle4TEdlpm3g4k+C7njCXmvCzPT7Ey9ASUCRl
         quKFGfAvfsIef8zhXOiuTiLcLe+Yp1d8gKpJxcbtnSVwjzalAoyayRZhTnhQMILggWXd
         Y7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW5SLfIpbL9qzLxCwyZzVPPQgEbvQK8R/ZmzJVRxYbtQSEAfqJdNT8yKchGbj5p7dmrO4Gy0dVesKsz5XDComLrDS8jfd/AsmYe
X-Gm-Message-State: AOJu0Yz2jKttnRaf+0nvgwTBNVUB0ex1oSeAZuYnEzUquhEw4oGU0TQd
	j9imZkVrb2KrhrmR90ObA/1qhPe9kHSYC8YXPlY9NRrfSBdzmOZKDrwfs84YMO8AulYkLjh+ktu
	LKEaD5mqQ2B1D+y2uxcopUw5E45dxlrVunjuv
X-Google-Smtp-Source: AGHT+IH8z4Za+6/Z1B3IgbuCXB4JfXr5uheGGyEvuz26GVQ/eQTwpwOYNTdFjUmLYinEclswXmKwzqx6F2YxY0PjYVM=
X-Received: by 2002:a05:6402:350e:b0:58b:b1a0:4a2d with SMTP id
 4fb4d7f45d1cf-5aed9954919mr7438a12.1.1721930701060; Thu, 25 Jul 2024 11:05:01
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724201116.2094059-1-jthies@google.com> <20240724201116.2094059-5-jthies@google.com>
 <qjtutodlbqhsj3ofdhhw2ggjgh3sqglvxmxt72oz3j3xsswmau@g4b5ub56ctfl>
In-Reply-To: <qjtutodlbqhsj3ofdhhw2ggjgh3sqglvxmxt72oz3j3xsswmau@g4b5ub56ctfl>
From: Jameson Thies <jthies@google.com>
Date: Thu, 25 Jul 2024 11:04:48 -0700
Message-ID: <CAMFSAReWroteo9+1K_vFWsfShONyakr_LzxwVsyuBLCaUg2wbQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] usb: typec: ucsi: Fix SET_PDR typo in UCSI header file
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,
thanks for the heads up. I'll move this to the front of the series in v3.

Thanks,
Jameson

