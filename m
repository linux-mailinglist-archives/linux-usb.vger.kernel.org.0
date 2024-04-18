Return-Path: <linux-usb+bounces-9468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09098AA1B5
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 20:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC0B728447A
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 18:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2A01779A4;
	Thu, 18 Apr 2024 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2DRobMN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC1175550
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713463249; cv=none; b=ELfj7D6i1iv7zxRlfFrslk24QmPOOEVJlQZWoF3wu3yAK4Co7trL521KP0jbgnP7sPEULTP68vleDyQys+3gpQRx9XSMw932ieGVcBdoc3sMBIEpmzDau7UTkc9L1ukDdXr/Yz0pFhKLDDaiKVjHIq2RR9XN+KcGTKtjsZD7Ve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713463249; c=relaxed/simple;
	bh=usm7tepmfqiHf+FiexAMtactC+FuISQE/tDTb1eshBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROEcdPm0HTl1pZiAvFi95V/IvTwK8/WOXgsOuN/KKp21cADNypujwRJWa4j+rfviVX7Uie1CZoKs33d8+SwzE868yOSZ8azV5MBzsvQRClfpp+X5tTK5wk9WaZmaB44ykhphjM5l4owYDMWM/ZLCuo0Tc2wxalNdY/vNmCjAFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2DRobMN; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d858501412so15839621fa.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713463246; x=1714068046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7LM8/XVqX5vMhc0pR52NCARjJborSnDK4sHREh98K0=;
        b=N2DRobMNluGBzWhEv8MvrVp9xPHZbxnD5dokzzQls8OuceN698VWxpVIM2Vt+Y/FDl
         QorJBv8Z6bEpZbn7jxUXd8a6GUnqaO+TIrEFwEWgTsfOXmy3zrprs9mN1sKJtOmmw8qP
         b+SqJWrdLix544m92KryVK2sVXrSSl58Fdmt3FnUBB2RfuMmGcIQ7JpSEsk7eIB/u+wW
         W5NCnCC12/IBln4x5R8nhINO+Dn8FW/RW7iIWI4lQusl9E0XI7XsPbFU1KGxB1n7wPuj
         9bjHkra5BCswTwjntalzY9wom/+48F080Qyd+ViBXvaP4HHrmrUpvpInIb3NgfEsNgbb
         Gczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713463246; x=1714068046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7LM8/XVqX5vMhc0pR52NCARjJborSnDK4sHREh98K0=;
        b=ljV67X5v8Iwl2yCCUpoUeG42sDNWVR9ar1oPxMuZEGgR6g78Jzp9E47zbWQacNtvhE
         INh8J8gCy5stmk/NTxF0AOPI1inGwkPBZ4bWK7T2QEjIIMJ3XE1Zp7NvKp9/XF/DTAZF
         SNVSe44kVXaVBZR9pRdntgM6UeNuqt49t2d8bSypNeZ8syg00F1E6ARPkK4Ay/6MO90A
         +43nXdFsRcNrUCjpCKVRRHuzJwrwjsZUjWaKbZVfVvxV7ZwYbRuwNQknOHSgEsNT5zZ5
         XT0kGWj4KwKFrvmMJadq9mah/H1lz+9SAoF9rtks+1pQLcQjtiJlN95QB8Q0WN2QDfSv
         RuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXoQeWmTktMQiWpONGfnZZWxCy5KjO9G8z/alJn84nUjM9+KinTWajulTQqPTyG7ZKx8+P7kJz6jDuNlB/5pTUMjAiXPsu7D1I
X-Gm-Message-State: AOJu0YzwJ6YXzZ7mUiZXxPziYASvai9Jd2VMVQc+AdW6r+l2NbVEuao6
	HTYigJlhg5TbDFy/4M9Bay1vAFFZ1VKAakQFBd2V7hdYMcIBz0hXWnWIJuXlVSw=
X-Google-Smtp-Source: AGHT+IEiCnXhU9PTGsX0TLChbLHO7a0C2mIRpAW6uKL9oA/lX5wxAQodhjtIHXsX6ynTa1q9kAeGvw==
X-Received: by 2002:a2e:a682:0:b0:2d8:71d4:4c62 with SMTP id q2-20020a2ea682000000b002d871d44c62mr1666799lje.49.1713463246082;
        Thu, 18 Apr 2024 11:00:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id y19-20020a2e3213000000b002d9fe841110sm269655ljy.75.2024.04.18.11.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 11:00:45 -0700 (PDT)
Date: Thu, 18 Apr 2024 21:00:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic: fix pdphy start() error
 handling
Message-ID: <rk3xamvds6vemiy4h36og6uzy3die7sd33jzc6xqbebuzngnyy@eat7ctv7srmu>
References: <20240418145730.4605-1-johan+linaro@kernel.org>
 <20240418145730.4605-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418145730.4605-3-johan+linaro@kernel.org>

On Thu, Apr 18, 2024 at 04:57:30PM +0200, Johan Hovold wrote:
> Move disabling of the vdd-pdphy supply to the start() function which
> enabled it for symmetry and to make sure that it is disabled as intended
> in all error paths of pmic_typec_pdphy_reset() (i.e. not just when
> qcom_pmic_typec_pdphy_enable() fails).
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

