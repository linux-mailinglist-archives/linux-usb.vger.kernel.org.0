Return-Path: <linux-usb+bounces-15229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7E97C628
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 10:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41BE281D20
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 08:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2BB1991AB;
	Thu, 19 Sep 2024 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBb3xMYj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8A416D30B
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726735661; cv=none; b=O9d9m7n33XbjZJE+mNmtqC7XalYZbjXRUdu9bnXz666zZi9QGsY1aDk1GPYSMH8K9TzJKzkjnaF6eWAnFOUItEKy7SKRWbkhcDUDn76ugvwTH0N6lOLFJiLzxv6k7vtAmxmmyOMfsZClfbNV1HlEMMwrsvQCE4kY7/YNszSyei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726735661; c=relaxed/simple;
	bh=+FD7P1RjeKfnXr/F49snqK2IMqcMU2TVYlAGvnt+2RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtfO8+O390D7x6yNuJAfizfj9ILDV1lh+FOA9EelnDLS2KYI+CW7P/ELU4C5VDedCnfvvCiMhvabTdiVjP49rzLYvFUx//ducOZGIadWXYjHq+8oT9gI22NgYwh20q0rRqInPufT3akHAI5W4BoStpj2tvIIwY2/TcOSNbukIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBb3xMYj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so728275e87.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726735658; x=1727340458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jq2tX2ECC3NUmAnqbQ+Yt1rqokfE1U1W8AO/4Bkj5WQ=;
        b=bBb3xMYjSku9FBmd4laRiWh7cGGJ3jzIak86emoyHHAFPCwMg8oW+eOS70JtGuprkf
         J1MkVCMxrnDfOyBuJOokn3TnJ6EteGBKQUSNsrUmlcTk10/gm7Vx4EQ7A4HkCBL8TYIl
         GOx/JTiOgLJ5HrV/sls/RopfUQBDLkvx8KYnPmSMo1cKdZWh9AONzYKaYT9M7XPnphHz
         FFemXxsqADAV07JToS+Qh6JcINIQTbSRmN5JdX1dpCf2bmzjPNIykOLqePs1ZQ1BWnON
         XIJZ3+YpzmKM3C47hwEI9vzIuaqT6tmJbko9zOrHnjT+z3yIIgesi8AFjPryUdPaeNTG
         TfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726735658; x=1727340458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq2tX2ECC3NUmAnqbQ+Yt1rqokfE1U1W8AO/4Bkj5WQ=;
        b=ciMpEs2QKjjb+Q0p2E3Tz6Ct0MWyTHA7wbTy7JZaVG7cy3teRQJ4HtD0qs9IYNLe86
         rxWGBGQ4s3LzZ1A2l2friXRGLhuNSHbG9xrNYsU4IAJ2B0Yx7ltvlgBHodO0Uo+Ht/rc
         CiI1mYb6FWWYsC/YMdkpYRhCwIXy/9UwefU8LmEtqZ6b+pmeaFedQbcBNcZ1BuNyQi8o
         AiU9lnV5Tc6sKyWFc5hlGWSofPVaIW38DJJcFvOQDBhISpnpnXfL9FyQdI0wlu6F46LS
         tLx+dkbhPmCBA2xp4iu0px9i9ErEB6/wMw7NCQlTX1ebVMA5f2iXNxNFDz4dZTzOsqGG
         BoJg==
X-Forwarded-Encrypted: i=1; AJvYcCWswbuitma+IOv+P1o+XgevhP85omcKp16NtvuXIkij1zKkPqtcVsY6ghcPNlVUjX3tyYfnyhBVIbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd010qoebic3K/I/v875aluTK7r6QUc0g+ygs1tlRXpm81JyM1
	QvLdGYc8JOk+6sW+L9H0f8NE+7EHDkvzAJQB6vchXUiLYbB6KqwYuLDTmeU2zJ8=
X-Google-Smtp-Source: AGHT+IEI2GKBKE7AgPotBnnyM1lctw7YMycpN6Tti5HLjDEBxozLBz3+JepnDw3k1so/zp3SU4r3ew==
X-Received: by 2002:a05:6512:a88:b0:533:4722:ebbe with SMTP id 2adb3069b0e04-5367fee45a2mr12651689e87.26.1726735657700;
        Thu, 19 Sep 2024 01:47:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704685esm1766668e87.27.2024.09.19.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:47:37 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:47:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, RD Babiera <rdbabiera@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, Badhri Jagan Sridharan <badhri@google.com>, 
	Kyle Tso <kyletso@google.com>, Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] usb: typec: Fix typo in comment
Message-ID: <ofyvc72hsjebsnfiwg7qkehyy4flqfeffzc3gyupgeikfutkbj@g5m7x7xum25q>
References: <20240919014646.1635774-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919014646.1635774-1-yujiaoliang@vivo.com>

On Thu, Sep 19, 2024 at 09:46:26AM GMT, Yu Jiaoliang wrote:
> Fix typos:
> reseet->reset,
> reaach->reach,
> compatiple->compatible.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  drivers/usb/typec/tcpm/tcpm.c            | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

