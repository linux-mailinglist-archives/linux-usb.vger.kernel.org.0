Return-Path: <linux-usb+bounces-17484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 156AA9C596B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 14:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2A481F22EB5
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 13:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAB4156F3A;
	Tue, 12 Nov 2024 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxcwkGQs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F31F4FA2
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731419107; cv=none; b=gKJBSnDEmGLnJLX5FHfxXXtFoLktGXKGAQYhAU+T31hZ+Nfm3l4wmbmIUBVcwPoZ+7IHtK5dypa5dVLbbWFWhzKnEp2pdlUBZgIEqZFgtob/ja/x3ViqrQeFC7hWaKjVoEBVW+oyILBK7VKRFXnPvgJ2S8OgpLOs9WWzD0wdcfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731419107; c=relaxed/simple;
	bh=nF71dfXw9piCIlT2j/742VJmP1SWGegOHqfZKKdLKlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH0Meuc2RNWIjp9lSmjmqipDapakNeiUvKLsPdbYwNp+v1YLmbpw2arcXrlLzqlLuQkrUWB71GpjY0HF6Bxp0ghJ4a8gT6f47ztZNkzyu40IpGvgXeSbWX1wha+AKhylB3uDGE7bJZTjbW7mYQsEk0d3LDygklwleWcgEHSZ5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxcwkGQs; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f53973fdso5421071e87.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731419104; x=1732023904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8XhL/KO7ax4DYfSEQl2Gemn7CXDKPvYLisy0AOZrYc=;
        b=lxcwkGQs4+0XP9ra9K+anbA8sJV894bMriN4IrhuN7H0cKQD0qvVTsRNrLO/ULABnj
         n9EewOya4VEjIdaSyPis++Izc+IZVQ7w7jLKSJw1yqXABZee3Aqb8BXv8nXnpBiv60SM
         NeUDvfyn6wimaBOZS3cTjMUB5u7xExR7YnMf890XLDzSwizSDYLzUNkdf2XVL4O5BEA6
         1Oxf1hHmGtQ00pcdx85c3XWdCYf4tS6SrqCHpDrkEo5Lz888g/w9dY8AcGDh0qZtt2X7
         LTNGkVgfdtCVJ29WA25Cg8EU8xfzuqlNDyvFVq/f5Grj2PCNy4ii09zRdXj6IOri6jk3
         9mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419104; x=1732023904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8XhL/KO7ax4DYfSEQl2Gemn7CXDKPvYLisy0AOZrYc=;
        b=g2qjtUWJOUb98gk8ieR3Uk7ySmdXwrurODIq8/Dl5zz14ewRPXn76z4rTuu4C+DLQs
         s0cx7lyvY2t2hDU3oyB7D9XHu6/AAMCB0PeCtX5cfAWB9OVP4z+A8rVMdXhpjzbZwLUI
         8lYQJ2VThgLz4gew9HEUupmygDmdCIXMrQwUNWXInxk4Dh4jQ8WtVWIFLD5SsMrYIZxX
         Jx21KcTw+Zuzbz9KnB0JA97357HE4gO2pBjKML7nCJuyT6GDotEzGBCKUP0TLM0deLoo
         CoLgXvo2kvhxFvxK1pHBLbN/4l53u0uanaP7djeWHZl9I0l1mF5jtmf0tHNFomP86tYb
         f5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU6tMy86isRJ2UjLO0RP9LuTo7CI3jX3b7lMnmyrPJYWuzLTTjJs50LHUuT3KUvXCHfpiWJLjDlpFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZu1fH4+tXf/FLf5F5kUszo2g71mbGpJouRCeXYc/RPYWYN4ty
	PXt02GhUG6FHEuyuwQj+6uUvPT/ho70l9+prZTpecje7vAjPLkSfkaXetLxD25M=
X-Google-Smtp-Source: AGHT+IFAwO32Ncdw+qEGZ4aWRj0mcaaHcO3uY0rwX+jAaJsbwSik56EmV6ZmRwhhKG4oqdNuqcKamA==
X-Received: by 2002:a05:6512:124f:b0:539:ea33:c01b with SMTP id 2adb3069b0e04-53d866c91d7mr5071381e87.9.1731419103995;
        Tue, 12 Nov 2024 05:45:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9c42sm1890161e87.215.2024.11.12.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:45:02 -0800 (PST)
Date: Tue, 12 Nov 2024 15:45:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	andersson@kernel.org, konradybcio@kernel.org, mantas@8devices.com, 
	quic_rohiagar@quicinc.com, johan+linaro@kernel.org, quic_kriskura@quicinc.com, 
	abel.vesa@linaro.org, quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 4/6] phy: qcom: qmp: Enable IPQ5424 support
Message-ID: <i6z3rplnp2awqwqlkpwwzgaweoxi5yi6jz6klveop7namcovns@q5aecu5mcb3l>
References: <20241112091355.2028018-1-quic_varada@quicinc.com>
 <20241112091355.2028018-5-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112091355.2028018-5-quic_varada@quicinc.com>

On Tue, Nov 12, 2024 at 02:43:53PM +0530, Varadarajan Narayanan wrote:
> Enable QMP USB3 phy support for IPQ5424 SoC.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

