Return-Path: <linux-usb+bounces-11003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D48FFB75
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 07:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A74C1C25910
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 05:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11D514F111;
	Fri,  7 Jun 2024 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0giEob/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79AF14EC46
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 05:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739525; cv=none; b=JfnQmmE61rBclQUrSb8If/PXR/cRLvTlBXMQ3incABzUGhdFsQtIa5vK6evXkJq/1MuTI7+eSOPAnXrqhn7DzeXu/nit2KykHLpQwKZsVKiHohCo5fNkdFLlkBYrd+RZk9KncFhgx1DPXLOoyfAocziW2OQPktAYSuCErkvj7g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739525; c=relaxed/simple;
	bh=yjfBB9hcHm1GdPkoCIVncn5BsoZSKuknr1ecPwNeNdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaTRl41EH/HnWcmNb9/8CncITj22nUzPIKRlDrBpJkQrBwzlhogGdIa5Ay45FCSRqrkVF0SaPTEcZfZPNRCvOLYOhMZcp4zeHgdaxPiHzBK5B2BBMShExZ/jryZygh/Vm1Q7i8Zb3+vusG7E3S+LUrFVr1akCSoB6ObMmLgTmiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0giEob/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b83225088so2049202e87.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717739522; x=1718344322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ds3YrxKC2YqkmVCc8zc0vIF7O+RXU9qkRaH97//E3s=;
        b=o0giEob/jwm2Ovs+mK2tseP7QHjHt8I/QABq3bIFoGSkiMxSBqAz+AIzlLS7ayEfGi
         D0eBmBNW32NCVkVa2MQdO+c7y3iW7Azzk5B8ULLZguwNX+PlpcFbNSzFE4mpsX2KNhs9
         0eCG6v6I5SIrUJi0/0E2U7RWeKZ2ENhBtVmSnrx6RdOytDSTsYYHSAEqyP7jas9vpaOo
         1Mf97+/M3orkRoSOEArcTDFCPjY1uT6462jH5VlDa5JCCQ+EJ2qP5DcRdotf1LPlGeZM
         u/qR+jb+wxLVNOr8NXVHCzI52Qcv5+y+RtPpOTbCzfVt8g/iiRBHbuPA8BF3SzuCbN/W
         o8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717739522; x=1718344322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ds3YrxKC2YqkmVCc8zc0vIF7O+RXU9qkRaH97//E3s=;
        b=vY6oJ0ZaUbOX1rp3HAf0e+IlfROKn+D0PVMU/i0qkr9mNHCLtOmJ2fnjrYkpoP+dKx
         yzjIQOj0MnKS2dET0kivd3kRyip1/ZGh8+x8x7Y9shpsYYAXeDiZiATXReMRAC/ApgTG
         +0rlIfPxjB2Gip5DntOjQusSNB19Od1ospg2ch+RJ0WPP9FXGb5MPWqcn8YOHErsnqbm
         +D4500pkHN5G94JjEDpVu7ncfcNt7k/bvcn7RhbxPEE1/Y8TlVbTtl3XY9XQaq75+yzS
         ih3KMd3h4P61/Kube0/qoM/SIPJjUXIoriSiki7u6tebpNKyBrrhM5ET5RDGpjZa5J1l
         VxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZLd04xAAbtWXJ5LukRIF88+qwFEl4Ass9uy0VjrpjXotGH9AZX9kWAT11pNYLm79l8f9F+0fLtbhmTUMLaTf7OgWWQGFFa4Pb
X-Gm-Message-State: AOJu0YwzxrIoxdeOjb2R//ek246JnUPW6oVK/88c4yhOzCvEPHnLn+C0
	wVtxhTEjCbnNlckKwCUeFBWwl9sPcRifWq/TBIbeNERYvHKPOwcZlVMFHD1h9JA=
X-Google-Smtp-Source: AGHT+IEbHhFjHS8dWeaZLLp+nTrpqYZYWMO28QUHVkRG+qJlNDvp8ryAUcl0gAoduivNTBb6mfzoFw==
X-Received: by 2002:a19:6b14:0:b0:52b:b30e:a775 with SMTP id 2adb3069b0e04-52bb9f7704cmr941576e87.24.1717739521937;
        Thu, 06 Jun 2024 22:52:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1acasm414342e87.27.2024.06.06.22.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:52:01 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: typec-mux: ptn36502: broadcast typec state
 to next mux
Message-ID: <t76a2k62ykkzqg5kyohkufqsm3xqk33nady6zkbncbye5h7wfz@leeou6ghc77g>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-3-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-3-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:15PM +0200, Neil Armstrong wrote:
> In the Type-C graph, the ptn36502 retimer is in between the USB-C
> connector and the USB3/DP combo PHY, and this PHY also requires the
> USB-C mode events to properly set-up the SuperSpeed Lanes functions
> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
> 
> Update the ptn36502 retimer to get an optional type-c mux on the next
> endpoint, and broadcast the received mode to it.
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ---
> 
> Reported Tested by Luca in [1]
> 
> [1] https://lore.kernel.org/all/D1HOCBW6RG72.1B2RKGKW2Q5VC@fairphone.com/
> ---
>  drivers/usb/typec/mux/ptn36502.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

