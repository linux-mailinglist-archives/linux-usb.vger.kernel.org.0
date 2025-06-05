Return-Path: <linux-usb+bounces-24508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB251ACEA3B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 08:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF181894F2C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 06:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FEE1F63C1;
	Thu,  5 Jun 2025 06:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="lpham7mT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657373451
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 06:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105261; cv=none; b=JGCGeiBVI6vMGNm3yrmtO+oj31nXvjHjV7Meol5kD9lFP5QLiJIKiGBjuoO89J4a/SuWXMl1U/TsUxBuUIabcg7su9QUNBwt3RwjKqUB82JnxmZyikSt1WFhCmMeLaOWRyskm2HA6ckFoJSQ19pUEECYiEJCfM6bU7OhAP6Qsbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105261; c=relaxed/simple;
	bh=WBKeGzxGzzd9x0XUdV5HWMXtxw3JKDGOjRT4f4tNWF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb8jrklgwPv7agF40/4GgKWKq+a0yZ/xjVclSCrG0Z5NOfoZ5vj8nu3WjCdoGH1VgDMrfCNKVXo+ApYvSYcX2bfYGSbRUpE6NCGTq9VvaQzlEDzwIMt3cFHud5j8bPV7E1WSabUsW3LWzr5+zDB2cVns8I/Tu17kqeCW3HtA8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=lpham7mT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so626453e87.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 23:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749105258; x=1749710058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FSYAF2WstzvPvCo4AlPKEcAwzeUBhl4r57KbdFFm/JE=;
        b=lpham7mTESZl4ymp/NNBT2cDgtWiRaAzbJFkYJNvAOewq9680IxZM50qiej5AXg9SB
         FuGm1mq2cBZd6Q+8FmsefN+ZpdmznhQfVXJGPPgCDL2QQ3J+JPD6QH68vrnPvqSDHYJz
         qFGcqL7pnNkt+W+iOf8r3Vw2ARMUrj8d6NGO6YCxwCtOe0isA7x2ekwAKbKbdHPwFssl
         UKIOrvLfVu4Y5uPCUy3VQhkGhCPcf/Xr8F4bQURwZw5IGLJjWh3Cs/R6bJhHygYogMV3
         EaWdF4/jPOoAZlKxwvYIQ72FelITw+Z+f3yO0QQtC+J9W8+VE9KWYgfhAGmMOSMIHg7Q
         4yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105258; x=1749710058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSYAF2WstzvPvCo4AlPKEcAwzeUBhl4r57KbdFFm/JE=;
        b=MaiGf2BOinZOSZ4NcVmGtmH4rJ/LpT+2AWxdj8gl/Ljbd1GWeJYQocsSB4WyxhFCWj
         I9OlnCPhZ6XSvHwOzlsZVeX/VBfzwjEgOwrdInJ5IG1HkeSchxQ6p9QOsCELn1xDH6aQ
         IvMFIS94lkL4TpMQWcUxAbyNurprb1g7yTrSgbdqbWohfErCwUIuGU77HxniM2Exj5j1
         rv/pMzGGVf51ycvhqzQo24QPKddLznQrGgeSieSGQthWW/87l5ysOyvhOhwI/SUm99lJ
         lAvTX+jPo1GVx+HL/bacaJoZw6Z9lvpxCW+sikUZjyR9x4ikJUHY4nv2PF562HrFq8o/
         +I8A==
X-Forwarded-Encrypted: i=1; AJvYcCVRvTmJen7AF5SHnbzHF8cPjr6Lupj6VuVtyHZeuIwYxgSVkAvNfxhgvbtWu/bX3to5vu5uJnkjD/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3g3LOnJQc//h5ut402D7CIF7w+qZOMYzkGFcbW+5E5XIXP+7R
	zV/iWqh7AAUIiiikjq53rP5m7K4bZWKNMdt9bZ7hJuUGBNM/egPAteCiVw1pJt+iMVk=
X-Gm-Gg: ASbGncvI8P+JNAU5FpRsstrgEniGLcpO4pIFjYoOGGp04BSLPmPbTPWVG687dctWFTX
	867/Ps1f/HjSQbQTix9/MPqaRWZqIokFtmCw6kHLGpHTxXeToS30LUw1ANIQJEO/5CrLSwmCzPz
	c7oAPqg8l/Hi/qGeibyAoTdmuIl4aXducv56mk2op0plCu0TXEynVW0sQtwC9kH9eZpNZwWxbMm
	qIEX0XxJcOnTTTTbMLbINz5OS56nfX1bdZDi4TYY91FeC3+gr6a3P00ocmSg0QTpBt5VFPhukUq
	J7KFSBTm9xUFj/nQbfR/mdOnNpEiXaGgpsmnrLpXmlAMwS0LB8Su7dheRhWiBQgYVuuVyDvKs3x
	IAcr7MvgT59EXvVYH6cKNOtb79ivjn4gf5ZDkctofpDpf
X-Google-Smtp-Source: AGHT+IEeoLpgJuAlO/Hd+Yo0ndJOTyX+6xSjbYLZNp63nindH9o3ENze5fCiwM3W+rGkVaSW9Rgplw==
X-Received: by 2002:ac2:4c4d:0:b0:54b:117b:b54b with SMTP id 2adb3069b0e04-55357bd6e59mr1492888e87.54.1749105257542;
        Wed, 04 Jun 2025 23:34:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553510f7402sm1025889e87.185.2025.06.04.23.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:34:17 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, David Collins <david.collins@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@oss.qualcomm.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
Message-ID: <3ldf7w5cpv4wt63kvewl2a32abx4uohvir7zgefpqly5rytkcn@p5fslnvpnjn3>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
 <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
 <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 02:08:30PM +0800, Fenglin Wu wrote:
> 
> On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
> > > > > +What:		/sys/class/power_supply/<supply_name>/state_of_health
> > > > > +Date:		May 2025
> > > > > +Contact:	linux-arm-msm@vger.kernel.org
> > > > > +Description:
> > > > > +		Reports battery power supply state of health in percentage.
> > > > > +
> > > > > +		Access: Read
> > > > > +
> > > > > +		Valid values: 0 - 100 (percent)
> > > > What does it mean that battery has 77% of health?
> > > I will update this to explain it better:
> > > 
> > > Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
> > Which basically means that we don't need it in the first place, as we
> > can read capacity_full and capacity_full_design (or energy_full /
> > energy_full_design) and divide one onto another.
> 
> Hmm, it is true in general to quantify how the battery performance has
> degraded over time. However, estimating and calculating for battery state of
> health is much more complicated I think. I am not an expert, but as far as I
> know, different battery management systems might have different algorithms
> to calculate the battery health and report it in as percentage. For example,
> in Qcom battery management firmware, a "soh" parameter is provided as the
> battery health percentage based on the real-time calculations from learning
> capacity, resistance estimation, etc.

Ack, this is more than just full / full_design. Please consider
expanding ABI description (though in the vendor-neutral way).

-- 
With best wishes
Dmitry

