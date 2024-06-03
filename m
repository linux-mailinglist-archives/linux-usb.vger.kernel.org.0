Return-Path: <linux-usb+bounces-10776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A68D7FBC
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 12:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB781F211B3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D12182496;
	Mon,  3 Jun 2024 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWmpd119"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF38060E
	for <linux-usb@vger.kernel.org>; Mon,  3 Jun 2024 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409375; cv=none; b=raT7lWL+coVdz0676mljP4dcQQWzrkTaOOE7cdhHMqrDhLXUhYc4VypzbSsH18Hzq6dTUslXWRkhu8Qj5WjkBs/793K95GJ8m49Q2noGTbP6Id6Iu8+1uxY0cpjiU8H1JHN3yOesCyJDr4K1jdwlHQzuPJMIDrsSdqzhOnUtHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409375; c=relaxed/simple;
	bh=8BHuRrOCb7HqxYBRn8MN8jOZMiTqLn7G0LCNqkdK4g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGb3e2pg235BNCTPVr0QR5ThZv05PMMNtKYzMb+q9GYUi56u7Ft/wklnwuIvex7vpjO3BQav3RekKs/BMNr81wyI9tNRQu4wwIoxH6FWHR+JcG9oqNXG0QNC5bQKctSszREeUL5sUb2SAk11jkcDFCry1bLi+doDqlL1Xc1932E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWmpd119; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b912198a6so1601106e87.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2024 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717409372; x=1718014172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJLtTZK6q2KW9686AABWiaK/qwi0Q/2bFgFZ6sr25AY=;
        b=qWmpd119ZH9IJUIJaWrZ0wjy8WLax/tvBVJa/rZUwAKzdG5HQDz9ES8UgRT4R5SnNA
         d/xu7fdN3gpMY5N5R1K6EqGRUsBtCPWdacDXsf6gTXoSndtGCnvL3u9w7p1rSikFI0GG
         1K/Qc2vyjvwTC6ctwDAfUAjoc3KF4z+GK9NEmSP7hV5JlEZSiyvFvUZ9WW28OCn8QSbB
         5b3BRgvqLhHVh9rLbJEyFiybJ7lSc92nvUcBnNT+/rr4ss7iqil/2D+21UNiEo49w0os
         1TV+kzkoSLHu9JAaPZh63oIg8HFA2shsZXtXvoATD3+bk27w5jtzD/BGXF4L2Wd/finU
         JwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717409372; x=1718014172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJLtTZK6q2KW9686AABWiaK/qwi0Q/2bFgFZ6sr25AY=;
        b=gKsAjdv4SARSp4v70Bz9JLxQgUdLKgDZC/ANl2IKwqwAB+cCvDTtPDwX10pFmjozia
         HTMvXrTpsOD06JDoqLD+zepeuLUal3eXLelgxpTF7i+pHsCDlhAN+EpAMvhkZPe+52Uu
         IOMTXuee1I/ejBf/EvBRyLj7ZAFM3MyCNEC71tri/92q5I0Gh24YiV4ULqazC6oknCG7
         GSJ/QTqTa1qWT5rHm44/0qadSRhWpgTXnoF5irbtyY6F3hXV25mwt26Evoto+/JzXKVG
         CILqD6CCz3dHy5Ll593c4VmebNdhllpm5m+kRvWOWIG8DKxX12THuIZu7XrQ5M8trORx
         Ok/w==
X-Forwarded-Encrypted: i=1; AJvYcCW0fr2ewGZxB4dl9YzIcbn0h8+Nw9O7J9s4yJNH9Nl3H4JqvMdeiF5wTjalsQsCi0RcADRx7Oap+23pWnhvxJrdFzTXEQw1Vrbt
X-Gm-Message-State: AOJu0YzDYFbOknIy6gqJn6d0VKaUbonyUn+Rs+TJnZu+mhUzR94Blb32
	86dqjgdiHv+QWiOcbjkEY/UC3cmifg+NRmHE9O4Hbao/uj9UPkMou/CYKIAsqLw=
X-Google-Smtp-Source: AGHT+IGCq8KtySBjiO3I17k/w9tsAcyJFI+HJb53zZa5FlUDBMyLfUGxolu/CGhhXVOn0KcBxeTPXw==
X-Received: by 2002:ac2:58d8:0:b0:52b:82d5:b361 with SMTP id 2adb3069b0e04-52b8959629amr6345911e87.37.1717409372262;
        Mon, 03 Jun 2024 03:09:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b90b6b142sm739556e87.247.2024.06.03.03.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:09:31 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:09:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: glink: increase max ports for x1e80100
Message-ID: <xpknnz3qjtm2t3hazvx67c5flob25vg6jek2w7frxotmp22qym@lqexbdtynl7o>
References: <20240603100007.10236-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603100007.10236-1-johan+linaro@kernel.org>

On Mon, Jun 03, 2024 at 12:00:07PM +0200, Johan Hovold wrote:
> The new X Elite (x1e80100) platform has three ports so increase the
> maximum so that all ports can be registered.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

