Return-Path: <linux-usb+bounces-7699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47CA875833
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 21:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D6E1C22ACF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 20:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483361384B7;
	Thu,  7 Mar 2024 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z9qYltEc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEE2130E35
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709842972; cv=none; b=iJ8eOkJYGg/6mViIBPToa0n7UgctAWP44cpOkkKaP4OPNZyOfP2zNdGh6SEgIPHU6Vy0RlwrbNEFlqSjnmnVXUsPkesdcu2QBzpmCwz47fI/JYy2/9hMiKtT9efHwPf9ewXR+RwYtsr5yRRLBqLLuy9VTpBn0kNZOJd909M7rSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709842972; c=relaxed/simple;
	bh=rsRY4KHhOJ11hCtZ8v0Bh9J/hZ5MuHy4e/+hy4b7p7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu01TK1tlv8BZp89jVgp7862Zb+hLyS74LGoIbodXwV6xf/ITFyWNB4Sz1bB4A/iDMZXpVh9McwHDTzZ30A3Y8VPNa5n4CqC01z15Io8SFmQQtNoQYyA5CzCgIa0ikSttCPHyYhd+3q4X18fYBJQKcMnty26v01HiY9PSrOyyNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z9qYltEc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc09556599so12096745ad.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Mar 2024 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709842971; x=1710447771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gj7oOuwiWTs3D3sNhRN8A6+8rBskvEU4W316SxnrZUQ=;
        b=Z9qYltEczee533bhL6XcuFl3TuMK+ESAhilan3P4tEKBrRuWu4xMSw2AVzsiGFK//K
         Iv4JNewp1DzM5TKsoI+f9U+O6uxYMjMrNvITeoy+wMIfZRv7MEcUOrU73oQHCWG8JRim
         EFrot9hhxqtP59O9lGYQT7iMAetLMkhmdVsb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709842971; x=1710447771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj7oOuwiWTs3D3sNhRN8A6+8rBskvEU4W316SxnrZUQ=;
        b=bafyxVJtiR+1tcEutSXZehOMu5wCbgaJi81jhM/rLKosR5pVFJPl9VaAYt0oYtXDn4
         h8whm+oFZuPgsJ8k5UycWewbwHAJxiSY++akgL9Gqhqrd+ogp/k53O+439JIFwNKHh4z
         bGJPowXMuSCB9NPo8yK+tb1Kjl1N/Ue7GlC09UoVFx4neDcECIpCVjlT4w0jr1w9nNcc
         ILmX11J4be0WDIV+m7H8OlnmZPRdRu6ogF8LmH52TRlyhKgmdLVDITtEJMxuiloTlF9k
         Fuc8bMm/25NitNDLFm17BWidmz634+2Wbzs/UKVYqGIvro9e6bDIaMOPX6sZ36xpMaqq
         kYxg==
X-Forwarded-Encrypted: i=1; AJvYcCXvlN1a9WVJBpP8q+Zlauj1PD2aJlTHFMSqK5PJC6g1cxhC+KkZmNBCov3zWgi0KqKRPopEAfRytpl1NE6xSfsuX5K5yJHz0ZAL
X-Gm-Message-State: AOJu0Yxsm54+y8gIP5HrFSoNwMFWRnRtB2u9vmp8BblJOb+Lxk6VZy+4
	hOECOGF6wOcjXQzKyy6U6vh64QuFdXHPKArEkac1lkWrPzJphpqi8zdVmpTT8w==
X-Google-Smtp-Source: AGHT+IEaVq/z1Ao7qbCydAde3vlTjlckhexdCldutHJ7sK0OKwFxXDLmqCrbxxaDdS2K2YLHyqccRA==
X-Received: by 2002:a17:902:e84f:b0:1dc:3c3f:c64b with SMTP id t15-20020a170902e84f00b001dc3c3fc64bmr10989479plg.24.1709842970750;
        Thu, 07 Mar 2024 12:22:50 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001dd62b4dd7asm581604plk.47.2024.03.07.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:22:50 -0800 (PST)
Date: Thu, 7 Mar 2024 12:22:49 -0800
From: Kees Cook <keescook@chromium.org>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Jameson Thies <jthies@google.com>, Hans de Goede <hdegoede@redhat.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: ucsi_check_cable(): Null pointer dereferences
Message-ID: <202403071216.DD2F952B@keescook>
References: <202403071134.7C7C077655@keescook>
 <ZeoggIXSLy+lVHP1@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeoggIXSLy+lVHP1@cae.in-ulm.de>

On Thu, Mar 07, 2024 at 09:16:00PM +0100, Christian A. Ehrhardt wrote:
> 
> Hi,
> 
> On Thu, Mar 07, 2024 at 11:34:21AM -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20240307 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> > 
> >   Tue Mar 5 13:11:08 2024 +0000
> >     f896d5e8726c ("usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
> > drivers/usb/typec/ucsi/ucsi.c:1136 in ucsi_check_cable()
> > 1130     	}
> > 1131
> > 1132     	ret = ucsi_register_cable(con);
> > 1133     	if (ret < 0)
> > 1134     		return ret;
> > 1135
> > vvv     CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
> > vvv     Passing "con" to "ucsi_get_cable_identity", which dereferences null "con->cable".
> > 1136     	ret = ucsi_get_cable_identity(con);
> > 1137     	if (ret < 0)
> > 1138     		return ret;
> > 1139
> > 1140     	ret = ucsi_register_plug(con);
> > 1141     	if (ret < 0)
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> 
> This looks like a false positive to me. The code looks like this:
> 
> 	if (con->cable)
> 		return 0;
> 	[ ... ]
> 	ret = ucsi_register_cable(con)
> 	if (ret < 0)
> 		return ret;
> 	ret = ucsi_get_cable_identity(con);
> 	[ ... ]
> 
> From the con->cable check coverity concludes that con->cable is
> initially NULL. Later ucsi_register_cable() initializes con->cable
> if successful. Coverity seems to miss this and still thinks that
> con->cable is NULL. Then converity correctly notices that
> ucsi_get_cable_identity() dereferences con->cable and complains.

Ah-ha! Yes, the ucsi_register_cable() check seems to have been missed.
I think it's confused by:

        cable = typec_register_cable(con->port, &desc);
        if (IS_ERR(cable)) {

This isn't IS_ERR_OR_NULL, so it thinks cable might still be NULL, but
there's no path through typec_register_cable() where that can be true.

Thanks for taking a look!

-Kees

-- 
Kees Cook

