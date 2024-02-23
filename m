Return-Path: <linux-usb+bounces-6936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8E86086F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 02:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD7D1C227E3
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 01:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8240EB664;
	Fri, 23 Feb 2024 01:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U5ELMvfu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCCAD5A
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 01:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708652625; cv=none; b=eqHhlsK6ZJ82z2N8Dk3r4enx1JnrPFwKEmHE5q0C+8NfMOAbySa26fQ5mqeME0Dvl/PFaXddF6YmeohehsJvOGgVqhsENB9nkrM2UyEdy3H8xj1kizXo2Bbiwml6CJMvWy2eHuJD5cosLCdr4VQ7qAUPpKT7GobJxV7qJOXuUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708652625; c=relaxed/simple;
	bh=Q68JTkmTvaca/7XKfrcLjsI6zB7P1f/ULoMPv/7Ii5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWZW9/kD39Igss+dN9mAKNk0ro3lGCzXimR3CaHarUvYJLsRTWHw0VtAzZ4LJgcKtb+cldtF2/GMDjqx+9JTpN+HlZUuRb2LzkP1LLoUkXpBMl2E84dbG9hHoBFhHxpv3Dwk9t5Wtko0v0PyW2HngU0Q28Ri3iWyO++W5Kc+p5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U5ELMvfu; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-787a9c54219so19596985a.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 17:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708652622; x=1709257422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q68JTkmTvaca/7XKfrcLjsI6zB7P1f/ULoMPv/7Ii5w=;
        b=U5ELMvfumvWRZxc/bD8Twdo0zXNP3rsWj1d+412tg8j3RX+yq33iZuepVo3BoPUWgo
         Ma7Y/s4eA7a6jmOUQ18rqRMAxyBL6ZTZ6M8xniCDXm4E/D2/dLrhfyBZIs9Yn+2/Vkz5
         h34XJMer6kALIED5dF7tW7/b5BRm9qGSitzxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708652622; x=1709257422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q68JTkmTvaca/7XKfrcLjsI6zB7P1f/ULoMPv/7Ii5w=;
        b=l1br9To20SbFfSGcoK6AfoALLDZ99F1oz1HI40y6yfmfCibfRIzXjKFCjt31PMk7vm
         lSm999HIIw2L9VHiXpwteSp0VsOkRKjBfXtKALtDrUsdayclduRzTsvjQS6/THdoaPIh
         HhiaNLKDxNAbwJ1L7VgAyrTofQlZCvWE4LQYkSYgLX2NtB+mnbl6Iw5t/Mq5R4XdtH1h
         kAV6nQ8PErBwHyGurKk+S7zrDnM/oin0ZQ92OVbG066QZUJJ5ub5EDvIOKxKT2ehYAz0
         9scjjO6XJCjRUqjDKEP2bh1+LyRostPg/2DEWd8f0cpjKwG7cczPbLPh+MxSmf4LjhYE
         TTsw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0lVGu71nhhue6eP11XIG98tw1KWkGDuhpQ2DgHykE35a494GCsQE0OVk045f6Qghc7Jk8Y56Z4MfGlMoC3oQFZg5rhHe94Jf
X-Gm-Message-State: AOJu0YyIvLHyhfyQrAksw4xNgSZ+cxUT8jZtTpgIaFY7xNv75fmndMwy
	tRpimMIdQ32ShtezjwnnEmBTVeWEkhKnFRQ1/4YGXfW4KK5JCF9/GZQTDCZmHQ1+Ch/STWOvekT
	QIXi1I6TV0k6n868tTDH7Ei+bDaufGful7GQr
X-Google-Smtp-Source: AGHT+IE+61R6YeJrVypveqB8cGLlYKqNb6UwFmpsKtWuEUYQ3EDm9X5NTDZSuB7qWlGuX0b0wwD3TT+QJpZoN+s/kZE=
X-Received: by 2002:a0c:d988:0:b0:68f:6a2e:cfc5 with SMTP id
 y8-20020a0cd988000000b0068f6a2ecfc5mr872706qvj.5.1708652622374; Thu, 22 Feb
 2024 17:43:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-2-jthies@google.com>
In-Reply-To: <20240223010328.2826774-2-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 22 Feb 2024 17:43:30 -0800
Message-ID: <CACeCKadU+A=ydQq_pQdfwQ3qLT=ydLt6PPdLNQaqbzH53W2D9A@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:04=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> Clean up UCSI_CABLE_PROP macros by fixing a bitmask shifting error for
> plug type and updating the modal support macro for consistent naming.
>
> Fixes: 3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
> Signed-off-by: Jameson Thies <jthies@google.com>
 I think you should CC stable@ for this patch.

That apart:
Reviewed-by: Prashant Malani <pmalani@chromium.org>

