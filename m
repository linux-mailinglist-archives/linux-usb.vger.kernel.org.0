Return-Path: <linux-usb+bounces-10732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C38D69EC
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 21:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8069A1F28459
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 19:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0F917C223;
	Fri, 31 May 2024 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEjD+wln"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F1D7F499
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184523; cv=none; b=dH88f2QlRP+tfOjTgZbb9kIY8le3thbhcj/ucImXXU3UsBzb/fkadYiXNUALe+46uf/Fl31AFPJUVU4Qql4RvYrMVvgTDlrX+dyuCsxXiQEthyWI5P1hEHj0UDeezciaZD9Wu776ycHu3Jhm5b0nCCfUx4lNcHpZeiHL6+NWfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184523; c=relaxed/simple;
	bh=tNZXFB+HzysXCL3SMJvzwkWGT1EYNKCv4E1TAW2tYXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpOvRbZtk1Yn9fhEORGrwMK4PmqNhI8aBE7V7Jg0qZzuFtFoLoZ4936MjSzd9oZ98B3pM1x3uzl7GvIeMktw15k16o9gVtJxzU5QMalV4pntb20KkXl0MXJYkTJE2fQl6b66jQzru12UYj7kmdJLK+VCScO9tczfgd2MM81ISjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aEjD+wln; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso26310921fa.2
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 12:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717184520; x=1717789320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZ0301p+dghmUaCnTpXNdQ1J5YZlPh76f8+4DGjY0+Q=;
        b=aEjD+wlnaursSteHIgesXjt1SzJamqzKfdVbd6BuKqrSbbNdsmfNCadRNLD5NEMIGx
         Ksj7/ucilsv3OgTfjGIKN4NBORy71U0knIxzEmSb+xldoX5vk7EiGyCpu8ohCdpQEuLq
         5lVbNL6DgKIR2fooEWhLMZUPNNw3opzQ9cKzGNocQumfo3gm1Z578xlSR6Po3jFN0mgS
         vIjVeYkhEBMErdhuOdld4eSUEL3gHDKVG5iS5edHMu2JHh//mImDS8WD7c4K4Q7Kz5S5
         uoD+ZEvqZ1iM9C1eUnHrl93OpuSV+DvImYMjY2ajszGLhJPUtOKdNTV00dMMVf04rxDx
         3cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717184520; x=1717789320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ0301p+dghmUaCnTpXNdQ1J5YZlPh76f8+4DGjY0+Q=;
        b=waXWOHF0RwL8ibP/Wh5JP2gAJEGpZGHcnv9JeqNR531hHrVwGo7mFiuDhyHNmCngb6
         4Wz07JFq3z3bdj+VD7FhsnKDteR02f14J31+rShiRp6IsGUz3/NbTyRRGJ5p1SXJSRyD
         2gIKlHrdPPPv0yaxkzrI9YLya3pW+v9iUXfHpssrbPOKQxkzVlOrCvswjAGy2qmZIHkv
         CeJOFV9B2F4DyZ9llgTaQ33nxE5g7lnIDv6f8TJelybojXCd4XU0mWPUssZqAt2D7GhN
         GJ2nKB+yRmpiXk+lx9gfh6+WjnmB+qb+Iy1NKSsHiPpJ6v4OjM6ARqpqfCljlyPAlMls
         2jLg==
X-Forwarded-Encrypted: i=1; AJvYcCUxQRY1eESd+kD7G1IQLH7yTpSe0dcxnk2wQHlNpn5FvgCeZIduEr+jwRExJCN0YCLDtrw7nQgBy0KaVJH1bjdHDnQZGvaU7dOU
X-Gm-Message-State: AOJu0Yy8tI9VgwkaYi1oD30k4YRqGb5kJ4GaG5MytSOdJXREiEm66vo7
	52ziVK8zKMvxKxU12RGXOtNd2pybxdHs3W1o5rdmqZoCphZZ6TnwTnJ2cmtNqI0=
X-Google-Smtp-Source: AGHT+IF4pO0JCQm2es2gv8MurHgCDQYtjCA/ts7nYsSQCEEAQtgW1TUMv3lIPinW0+x0qwguCCjMKg==
X-Received: by 2002:a2e:8756:0:b0:2e1:ba1c:efea with SMTP id 38308e7fff4ca-2ea950f8729mr20314681fa.19.1717184519743;
        Fri, 31 May 2024 12:41:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d999sm3753471fa.16.2024.05.31.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:41:58 -0700 (PDT)
Date: Fri, 31 May 2024 22:41:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 2/4] usb: typec: Update sysfs when setting ops
Message-ID: <g4a5cfodzudb2eqgvvcot7kmentahfqs7m5ibchx3tdszikp45@p6c5xgyyaixq>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510201244.2968152-3-jthies@google.com>

On Fri, May 10, 2024 at 08:12:42PM +0000, Jameson Thies wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> When adding altmode ops, update the sysfs group so that visibility is
> also recalculated.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

