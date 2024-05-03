Return-Path: <linux-usb+bounces-10014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BF8BB3AC
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 21:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9931C2373D
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 19:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE9C157A74;
	Fri,  3 May 2024 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dAn9lVUd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A712EBF1
	for <linux-usb@vger.kernel.org>; Fri,  3 May 2024 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714763136; cv=none; b=kIR7orrH5UTmRjHPEHAPGDhyHSHDMjLPlUqSMntfk76Rm/ZCvfuQkEV/mongwEskrcETiPdbLm3on9bo10dXsoDG636irEpiSWMNOXxSA/ALJih0AZTPXaS5empUX/omTPPR6/ETn9eGdusyBMdYNBIlaiiQEhjbt/F+7Cej4sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714763136; c=relaxed/simple;
	bh=TMPkLz1Rk5l8hUIGUHp3SUhVgs+0VIwtmvyAzaSQHtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/7NOKsimakb/rVfHzRWZn8lb6soyvKJfNt2HHaU6WvQVQW+7MMIAnL+48XoGWsEBLCl3JUsLDhc3kTdJKZqoT4EJq0UgdMmNRn8gOTkxYfWw1/gukBOX3sf+uHtURoLijySy7288l0xzMKmGXiFUk1doxJCYO1ZDrl7OVRhCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dAn9lVUd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b48daaaf4so13455e9.0
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2024 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714763133; x=1715367933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TMPkLz1Rk5l8hUIGUHp3SUhVgs+0VIwtmvyAzaSQHtw=;
        b=dAn9lVUd3da+FdxDry6DJiNayIO1O0j43Q4Tgly0Xb6jyXi6iUdbn8gXVw8FpLCSSy
         E4XtAPtbzREcB9ylS9itaJRmWvzd1ZOalJDrVNBqrwBDCUCZv2ocjvZGo3ahD9vvCnBa
         kh5SW1FHkLUSclDnunN3dywDLiiCY2+S1YPaeUefqv7roM2IhuhBrfqyZMtYDt2Y7CLo
         oKBlUH/Q8IAIbLIpwh5Gw1Pvyrrt2IOVBzaPyLjHU123FhyoqmcQ4ikfZnKDNQuw7p/f
         /bf94328qS/slGUpGUNFJardfW5+Z/ITb8gRLYuVLb2Z2VdrL/gIZ4/zHCJxq84gQ4B1
         wWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714763133; x=1715367933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMPkLz1Rk5l8hUIGUHp3SUhVgs+0VIwtmvyAzaSQHtw=;
        b=KBwg7nYOZwEUeUeTxbV9QBqAyw1NnuOoYU9+ilJqaiOZYAkZwDxkACEnZv6dX1zls0
         8Bl6Q1dfVE6I6wWUghczLJa0+fffKW4CLxDil74WYqZac7A7n+kz7zQR66ELp6oGY8iN
         MocllS0W/j1p9a+WQxvUHOE6HO+Q297sVB7eA35YI/QtBIEDyi/4vidFJ/35c5nhxDm3
         Q0koevhU9xyHqyZqn1cWW6uNLpGoTpwQYLTPx7m70RCXNTWYetHv5Hjykq3DGH0iZSZ2
         fpnqxprlRBlvDAThDQoGA0ru+4qbGiJb63IHU3g7Pe2M6tKFxPvNXdP2dbPQtezQHNjo
         VPeg==
X-Forwarded-Encrypted: i=1; AJvYcCVMzi6vdM0ccF2Fn3FKltR1IRFjgWtHzrkrCgMHWhestniQ9+QGO8dvLaAjobWLDZYeFmI9j3mUjRsMReg0xGGIWGjfQdAha0nI
X-Gm-Message-State: AOJu0YzV7TA8ccIsKbf4tGwfmbRYWWuapAq6gkyIp4jRetep+F/zs2cz
	zlxtUolQU/pXbiX1lgIwD+8wOG6ZJyshRmHslxf93KBQazbrdjuMU1ZK4od4Ep2logCCSXV9bdL
	R2rjK+VMG9RQTCaixedfPOQdMT+UJXUD9m4j+
X-Google-Smtp-Source: AGHT+IHZ8sS4fieprHPXKuhNEWGMwXDOzkCGeSsHEiwmvbVydjjUM/n4xrCSSVc3A4FP0QOHDXDRNSYqyHY5Wg9pFM4=
X-Received: by 2002:a05:600c:511e:b0:41b:4c6a:de7a with SMTP id
 5b1f17b1804b1-41e5b0eb9aemr195745e9.3.1714763133013; Fri, 03 May 2024
 12:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503003920.1482447-2-jthies@google.com> <96d63b0b-3258-4bf6-b75a-06eb4f4253bb@web.de>
In-Reply-To: <96d63b0b-3258-4bf6-b75a-06eb4f4253bb@web.de>
From: Jameson Thies <jthies@google.com>
Date: Fri, 3 May 2024 12:05:19 -0700
Message-ID: <CAMFSARdhyWAFWr6qjsabPN6k=sK9LLxOaoSNkVLyTKNE=drSpg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] usb: typec: ucsi: Fix null pointer dereference in trace
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, linux-usb@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Benson Leung <bleung@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,
thank you for catching the typo. If I upload a v4 patch, I will fix it
there. I don't think it is necessary to mention changes to the commit
message in the section below the commit message.

Thanks,
Jameson

