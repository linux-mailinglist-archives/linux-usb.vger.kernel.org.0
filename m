Return-Path: <linux-usb+bounces-16184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F392399C841
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 13:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A50491F24729
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 11:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2872115350B;
	Mon, 14 Oct 2024 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXH3F2iq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04561DDA35
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903742; cv=none; b=sxw4UnbdmrnQiJSOtdAthPQvqtKXgOTsyjQKYbTZ1auWpqo7PUv63tujravYbwrDAUmvLQJohlV9YxAtAGr6TpM1kkiiuO1iR+7h6aCNVnO6v11Z9bVPT82E8UBqS4jtsKUQjwaoAmUZlmKLVbdU9jgoSmtftJkpQZ2GrCJlaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903742; c=relaxed/simple;
	bh=DNk+6cHiqUVl2uCNmV7ktND/12rjOLXT6Lm+hcSTZWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ1Hp+b8Nmc2LG+3UPbhlBpB7PoajCZoQu/UK2kfMj8CzbMc3jhPVjvOxmD+b8KoC4OCq6srZMmowOCnIt3Fvv9vfzw4utBFiPDDiabD/7AHUmZVgU9IthvB/rH69nucqN+l4C4RW48x+wZMJQIRYnNy+ithd6yMdDl9oF0XHxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXH3F2iq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1570395e87.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728903739; x=1729508539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPG5syvQmdIElZ3OPvKI1tUxnKFtCrmS600/6uIfwrs=;
        b=nXH3F2iqB5Q9XkW2V1IfBuLKZ5GBhUTCRQRXyWUvcTcJdIm8quAiGuFaE+fZm2nI8s
         DaCJPvV+lFcd3JAD7awkkSh3gJInkZlzph/EhozhNnMXunkKFgdI+u9Fus2J2gZHOnCF
         cZvE6Va57OVpBZ0d1jxrE2i0bR26OZoFx45bz3xfXZOKG4ewxWwfz/nOoqtlYq8vFA9K
         L8Yh63pk2WLaGbv1OKbNgvnoU89DPMIqTctZGzCUx74GM9c9A4sF20jQNJ/FahD6yKcu
         mi9ZcyWDpi38a5LsroJWnoGcuj/WqqYUnsmuCqzA4jyS0lh23ERLZfd0CrMGRtpYv0me
         r1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903739; x=1729508539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPG5syvQmdIElZ3OPvKI1tUxnKFtCrmS600/6uIfwrs=;
        b=jIAdDYkf6X4AETEkmV74rs/5m+6sjCPonQKAH5IUSsnXk/jI0S66xuxWKavw/cJmfk
         nporxNprVMD8fRLS1wnFqCJmb0SQWSsz9+9MWPzSuDIPIyrUIf64zAKPVnk8FfX6Zuhk
         hCiITgS5nBu5jmgZx3LAMDHCHx5WMNpFlZa81tTddSiLjakWhdaPVYuNFYvp78t1So9h
         yH9tLu7seYVDTK72cE01N2hm5aid0LA/57/7bxOwrojsUFE7lPFKYBbl63c/ud3OoCVU
         tljPUmh2yZsiWhvZEG3AjwCnXtYRCd9IHZtyk0jW1mQa5Wl/r+oSZKISesPl56879h4e
         0M9w==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ds+rpjLY4HTFBpKXdf1uTTUz6bVuLWwvl+mNllqCzvkhiEkkaD+pnJ8lfij/0fLpbZOSpel18/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/i16k8S1tHn3FPG0jtaDsDDs9H99IAuyT1BJ0neP5J8zgOZB
	OIg+R4g60MBNOALaqNLeMkjSkrrN3nW9NLZMwYOLas6fVVNBRXEc2hCM9ws3sIg=
X-Google-Smtp-Source: AGHT+IEuiWssWlxRsSEt59sxgm4J1iwV9VrCy52qiaQ6PWdHX7Ga7KTuh7tgvmtXbf+UOvM8fdAF8w==
X-Received: by 2002:a05:6512:a93:b0:535:6ba7:7725 with SMTP id 2adb3069b0e04-539da3b6c23mr5260919e87.3.1728903738909;
        Mon, 14 Oct 2024 04:02:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e44b766esm1031460e87.239.2024.10.14.04.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:02:17 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 5/5] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
Message-ID: <arqe2egym2ljme75lpb52mkkchn7ojs7xkozbgdw2jn3lmhiry@oixcxrsteszy>
References: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
 <20241014084432.3310114-6-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014084432.3310114-6-quic_kriskura@quicinc.com>

On Mon, Oct 14, 2024 at 02:14:32PM +0530, Krishna Kurapati wrote:
> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

