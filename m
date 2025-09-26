Return-Path: <linux-usb+bounces-28694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6902BA28AB
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 08:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A639F626AF3
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 06:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4438427B347;
	Fri, 26 Sep 2025 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPuJnlhX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085E18DF8D
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868884; cv=none; b=dZ/d1qG/4AQ2ycdEMVcjXtnqxjsxD3I9oCg2Mwe7WgbE/iKXmx6QsYfSKQHr/xV5DrYmARfj9kWtPPHynmKodHm+XoXnbHlAXReKEND/DdzNrJZj+m9FHN1ODA8x352TR/XZ8g5s9/NidJLcaeGX6yUn11fiNgbs9IIwAtRJBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868884; c=relaxed/simple;
	bh=uUAMECIXNIvOv86QPecXlecTiTn1dP75K3fLk2BLhWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um6LhGOlrvsIhEQp4FQoO91mLOhRtGdVro4RaoR138EyD/oMu0b0/0UgxQ00BS140TiZmu3X95Kf8ebVKQCKZSin65Wrjj/Ignxb1OqRM/eoNKdkgDsFNMQrN8ZBFrxrblzvbVBKM++0rXeXoYJcW4GHPPFZpuKsIiJlKbTYMF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPuJnlhX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso4412885e9.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 23:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758868881; x=1759473681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eAXEhH9mCSkyuGynwGFcg/vSjwNz5p5yU5r7l9pKHs0=;
        b=YPuJnlhX7yIjxgjiogwF+jukcbvUHirAZzvNF6i6AHLGNu1+H2M/fFq8U54W1CQyKO
         77wFmffT1/brnGjxDbI+IpQgErvQ5X1m0a3z5Kb+5iSqKcl4NU0Dly4njLvyQ/GdITF/
         56iipAyNa3Z5Sowlbcv3M20ybusGGqzmnvfd165H43OIVjbN2KUuWfrCkvuhO+BnnsDm
         iFXmRFyfD6n59sEd8HpRJGCw/fzvlgW5G9qDVSWscyJ8PwjXXpwAK6IkI8xHanLcNtGr
         v0YhXL6pUJi9+Wa2ukgEX7kxLJ1Bu54p6AEPu3PXbrYntMlTJpjO9Xy2WKNSoWb83dFX
         rvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868881; x=1759473681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAXEhH9mCSkyuGynwGFcg/vSjwNz5p5yU5r7l9pKHs0=;
        b=pFwAQztc3BTuWGUI+o72OylrAOOt70EilFXptpkRaJzaxc6Yf3SmwznK1vun4z+drx
         xJeSMML3VrG6Hbs1K4IUJo75ffK3KcfDaNNb+uN+uQuQW12VZbTFzAf2ooUxfHICVaMn
         x7iDuKrHZfaIj8jBINHwKrcb2GveC1x8hBr19kvT5NVOT6UVbiXkaoHxWz+sfaYEVINj
         +Uc3ib3KP+R+etlPL+hBJneA5nshoCyh/EikTGxZqYWsEyv/cRwQVnC+ZVwpNEspriGO
         be9SHSerjgGSjcYZwV6D809gXlgigqk72WEDdWBpy1TncRPInlsx44PMIG1Z55ot2j+u
         7NeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI0Li+8vr7G3p0vn8ZQhVgG9ZAgAi68tLmwzamc6wrM6eppt+1rFoYdPK8Lrx6q5kwCKJX1sm1xbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXTGmKCQ1Zy1kw43wlau/CM6+QI0FzTEyY3RlHF7Q5gVHcZYn
	eR0l1jjZyGpDf9WlGQHCt5gZAeC42RrkJqLP4LWNwKgJ/TSNYqoK9TOQ909IoN5wwWo=
X-Gm-Gg: ASbGnct0aHy+btwHKbskwuc0M3cH6Wpv3yzg2ePs0luObXTzE2Yu0qZKgfhAc6u1FqA
	2mkBfrto9WvSmof8TMu/vpSW1knKMAB3sZvPXOKf8Byv92D5HntVl0mG+jhD7TZmvDB3sZTqN95
	Lm6huRIoxewVOy5CIZWRp0BeJv5kZ8rXSHx5ZKxpkJ9r0SEVel7hMwZvoygjwm3bNEBDY/voC3p
	5/JmuQkZXpDb4TCktNFI8gAGyeu9lKS4ksx4151BPLwArPWOlekl2Yoek3xfNW0Ga4HiW3mwqBU
	0x237Q0egHUbizFuB0dtqcIlHCuKFXcB2WV982ZkXSESihdNCqwIV7cAnp4iOzKZ5JtWRabb+an
	8jVHHXAmaKRkUNxAj1RVZxUK2XR+SldN8
X-Google-Smtp-Source: AGHT+IEC51Z3oUc6PBQE26U0pANRwet5KzFeYNOAHSrBB1u4TiB+919unwkMAvmSkArm1PJoNLlhdA==
X-Received: by 2002:a05:600c:8418:b0:46e:39e1:fc27 with SMTP id 5b1f17b1804b1-46e39e1fd05mr21856915e9.5.1758868881334;
        Thu, 25 Sep 2025 23:41:21 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33be359dsm59755235e9.13.2025.09.25.23.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:41:20 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:41:19 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org, 
	robh@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <27lkxf65evdhfdqzs3w6sfura6r3sewqsm6dr6qapvsjuwrirk@lwqs46vppei3>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>

On 25-09-24 19:28:47, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +

I think you dropped the v8 headers since v2.

Please make sure you add them back (maybe separate patches) in v4.

