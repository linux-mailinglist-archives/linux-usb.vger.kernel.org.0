Return-Path: <linux-usb+bounces-29800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A46C15CA1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 17:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E947B353681
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463A8328617;
	Tue, 28 Oct 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFgGzI8d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAEB28D8E8
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668814; cv=none; b=SEoZT+jsPf5aPl59+tv0V1iFyC3JTrjUwmJOfQxE4iOL5g9mUdBjoKHJ5Pworm/xacQMQUwkAfqGRX9MOFmN2lxHMS6mE2TnDLcdAurOICGHsutjHuY4qLyRJS9vRyulBEqN/EB174oodelc0TlcAEhbSfLp5I7EgjuvwAXhOs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668814; c=relaxed/simple;
	bh=TTeQEQh/zyoqxmgIjaCqSLAZ1hRahpSzJWYP5Njbevg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTBoXRRUOTTigOe4oXuKJboTU65ic1DKEuSRgsUX9HbX5Ux0Tm05Ece1ZVTkgwh3hQX7QDCQ31oQB62u4jYRjBMmZW5RJIjXvhQ+hdGoG3ACQugieW1KgwQKnDgTZA++7ZaXvw2GVdgetJEwsxCFjfoQQy3WrZMpMWCsf0tu8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFgGzI8d; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso23813215e9.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761668811; x=1762273611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mTQDtoLg5tD2EhtUFx8lnwkECbPu6ioaI2sy2RREcrY=;
        b=AFgGzI8d3HLS+LkMyxlAnZ0dSFSqnNtBbSzk4zR6ri6amKQMfZCmmiwdOaNqKD+EAx
         oSsIdCXlneN+97gjGQr0qfBzbTCxPINx+8h6MnhIIjmzZPipsVCPK+30Zf2tAMWAlfTH
         60pYFfJFqmZz3Zx/ZLZXay8jlKLVLNXys04FWAqTAVTGPEsNg2F5EfeHqEme+QmwMcO4
         Qh8Ag8Eci6ylDxr33GgutzYysWEZWM1XTc/wjywTXQxYUM2tBVvxuH66fPnNbJ73jcxp
         dWqjyu5DvkkWNFDxwu8BauHSIGbdyXi6l6zXYB9Hm52lKvEbt71b1lV0iKJUdG5oZPoe
         2g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668811; x=1762273611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTQDtoLg5tD2EhtUFx8lnwkECbPu6ioaI2sy2RREcrY=;
        b=XEfDfGVszC8KAY9lPUOIG7PHb7CmPKGtDe3Oog2O1tCSPTTnbLueNMfccI8Av5VgTF
         jzf+2YBv5ClqnJRlO2ycGy3WkoBwdx3EBURKmO9t8nC5/mZJiCqXpFD8WaEwyV7CB5Qe
         8+8uJg2OOQGIfuhZUN8+NcDd0axls1bawMZPN1pFHMlpMVVYsoeg+NYCcyBSqI/syRNL
         6cBjiotS2PYlLuoozDNi9zlABEggxpwwX7rtIuXjZ568s+aVmWe/t05GWCNg+pcG9yNG
         No/Jvhk95q65yPVcNENQGDQ7oIQf/APucopf6RzIJnfMTU9rpT8xXeNwhpn65RifSkKK
         4L+g==
X-Forwarded-Encrypted: i=1; AJvYcCWBkELibEaOmcxkrG7Qp+wfSjIrpPk+E7LcD6F3ZG7UcoBOQ72TEKsRzW/D0vAkQEuvVSi0zj7e054=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvg063Tz3k7KrAqzl4jVw5Jgk7pWRp0ZoPIK2JPUBaDo+ydx61
	q4n1JNBOn7LYvcMwYVHIzTRCE/NAs4QtgdY8e2ZxaeWe7D0gx7Rlla+36+Qehxck8Is=
X-Gm-Gg: ASbGncsWe33m3da5hYiVl3OfuA6r+5W2gqHR5ooTV/Sf/ClxiPu7AamP5iHUNsDzyjz
	x6mjQpzWGde/bp2ktlrmGxlq/5Dw5jrhs2iVJ/huCVLyrn4AEIq+YS06IChyziO9fL5OEEbaCjw
	CLexNUe6S89E0A4BUW4B2bDx1f0GUp7xsJnr303kD4MLcQ99AkIToMH5RO1izSg/zBZTufoeGlC
	N8rA+pf+e8uwvgL5kbrsePWmmxRAf/g4wQ55zAvrfnAKQ1uMDq/yK8PJx9xQWrKY6s/SdFmi6BQ
	rXNmIYlZWDnvs4A9qFiFfx7+MHXrFwc0GjCFFxubmST8ujBChCSPE/t3ZdVdWX5uYHxrG0mhtkA
	jxtp+iVugFdUpLoEHwyBsjmM8rpXWkJk0L+D6hdGPgvaJdfaMdw7s92fPGTuk6YKBESzta8kz
X-Google-Smtp-Source: AGHT+IGuRgJO13xk2Jpb25G3vg2qNdxnqTK43mT6WFXMrJoTuSIWNrgPsq5EVG0SCzEdej0faMV8Bg==
X-Received: by 2002:a05:600c:64cc:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-4771e171a36mr991005e9.2.1761668810763;
        Tue, 28 Oct 2025 09:26:50 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e202093sm530835e9.11.2025.10.28.09.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:26:49 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:26:48 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <fetxo2ij7rstq52kxzad4yj76l25kzanzaccjrfso4bklcb5ra@mym55zc26icw>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <mjgwv3soxgdcybkoo6xglxfpusswmjoyit4z3qpbnyhatj73od@ywmnx6vyupsi>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mjgwv3soxgdcybkoo6xglxfpusswmjoyit4z3qpbnyhatj73od@ywmnx6vyupsi>

On 25-10-28 17:30:08, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 04:39:19PM +0200, Abel Vesa wrote:
> > In case of UCSI version 2.0 and above, if the orientation is set from
> > glink as well, it will trigger the consumers along the graph (PHYs,
> > repeaters and so on) to reconfigure a second time. This might break
> > the consumer drivers which aren't currently implemented to drop the
> > second request of setting the same orientation.
> 
> Might or breaks? What happens if the driver doesn't ignore the request?

So I do not have a very specific usecase in mind, but my point is more
about complex LTTPRs or repeaters which might misbehave if you trigger
multiple orientation setting.

Anyway, we currently do so on platforms where orientation is determined
by a gpio level. So I think requesting multiple same orientation settings
is definitely not a problem currently.

I still think we should stick to the UCSI payload value if available,
and ignore everything else.

