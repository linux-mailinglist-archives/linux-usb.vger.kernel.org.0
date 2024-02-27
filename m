Return-Path: <linux-usb+bounces-7109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03F868501
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 01:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A38F1F21D39
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 00:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59491879;
	Tue, 27 Feb 2024 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eR2s4e5z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CA17F8
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 00:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708993812; cv=none; b=kvrJM4u8ARZMx20Vy1L3PwkyfBYTgxWKj3CiZLN4t5s3UqaJJe2kg71yBev1/58NDG1CL4Giuh3VlsX3TfXFFaHWTNXxay5w87NbHsEGwSXwdLRh/cfARdZ67tlK9j1VGY1o4g1nTVMXir1UBR7qNBux1q9hsu7xfe0QLhgG9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708993812; c=relaxed/simple;
	bh=yVPBQDUjuD+tYmrS/kcvNQbeUvNqDeWFlaS8iuf711I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEblxgNQmgJY/GghBe2EyzG5IIaFy03VQoXf6U6iVa+9NO3gfU8OvwESE7/wFLbhwod2hU4WJRMxyzhRdiJDfHtMf9TpN0PPkngyN41ec7iF8Plfbsbq2fzU6p+Kum7v9WtqLY8eP7QZUpegxxNuCXfCH8cKjwNAonFOFHMRX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eR2s4e5z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412a9f272f4so22175e9.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 16:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708993809; x=1709598609; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVPBQDUjuD+tYmrS/kcvNQbeUvNqDeWFlaS8iuf711I=;
        b=eR2s4e5znwsnPT9pGFOtWGAbncU1XdkeBcPNPQ1VhkOwzVISpnKdhOwFUQ1uaxwdLb
         1FlQvJStbDGhyVgajge0XyQcoXKH9a2Q17yTN/Zrdgkh0Ek0NDLTTcXOwhXoXmpEe7Q0
         PnhO7GEKmYxZfT6pwsIBKcON3utHf0qY0yBCFfAeCU1/KFQgMfzpIN/o5PcIdhPBsMHA
         s+eWaSisFhUs9ivsrhI0ZYLObf1L8g4+ISgdjql0bq16wLS4mMUIw5bwrVW7y6XSSClh
         Ouxpw/ysxsJUEnpSfUqnkmxtJuxqPbB2aD1LBIRuMIRjFPNSsEcffXBS8G1MSBH5PQ4M
         IBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708993809; x=1709598609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVPBQDUjuD+tYmrS/kcvNQbeUvNqDeWFlaS8iuf711I=;
        b=TfhIcr4wDjGkg0P/AxiD9WtdRAk7Yrg+nh645xpeY+rETQTPd1Mf6L8WiROwUBCkhc
         eDe10jj34zSy2yaujR2kfxs/k6X8k6zDK8jDkiB8S9Yp73pBlszhcUh+ONkVAExZbSyt
         mgqSBGx2AUMk1J0oVdqU9yVolN+KDyKlPai203LGx0XJxKyS8iTHRazG8qSXTOrgd0rz
         6EWNh4q5WNQs29XvbnPhPjpBF7OxWaJjiMJ8n4+x1j559q3gcy/NGBDIicsgaxbLoZy+
         JeV3Vq6tZA958N/djNiGUs9vVW+4tXt+UHPLQQ9g36VkiagRHVS7BPfxwiEUamvoJvv5
         uP7Q==
X-Gm-Message-State: AOJu0YzdOS2S6tHM/JY/xLaFNgqoEuOycUM2yArCcduli73GEoSYbQd1
	kl14NB0sQxNWpE0rOFLcwZJWYKj4zP1U29QgpAOLxJY5ENEiEquxKYi67/KzQh6dEsQTM0ANyil
	e74Yl/1pfiznxnqqFYIhgHKkZlfjwQ7kccUOO
X-Google-Smtp-Source: AGHT+IETEJC6f2+EyT5GONac3YZaKpAj1sMifOOHbQn+MKI1RFrZIS7AeXrjdAUkcx1iBNdjj2pwYCdvplZy/5AoYzs=
X-Received: by 2002:a05:600c:1e15:b0:412:a0b4:c7e8 with SMTP id
 ay21-20020a05600c1e1500b00412a0b4c7e8mr47082wmb.5.1708993809089; Mon, 26 Feb
 2024 16:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-2-jthies@google.com>
 <ZdxQaTmhF9q7A4p3@kuha.fi.intel.com>
In-Reply-To: <ZdxQaTmhF9q7A4p3@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 26 Feb 2024 16:29:57 -0800
Message-ID: <CAMFSARftofJ=iox6zy_23PhaiHgKgtwcc1Qrc0RqPvCmCeePkg@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is missing CC stable.

Ack. I'm planning a v2 version of this series to address the other
comments and will CC stable there.

