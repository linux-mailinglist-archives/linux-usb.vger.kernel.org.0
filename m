Return-Path: <linux-usb+bounces-16888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDBB9B77B7
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E0E2826FD
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09443198E61;
	Thu, 31 Oct 2024 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBGZSJi6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7878D2AE9A
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367557; cv=none; b=oH/tARyRrAA7Xl8CtDPrbqcmv2t0k05luf3OkfQcUSnody5AHDr+aV+Wk5896ilxtr59V90g/6NM4834TMiUQIxJiy33ocl/9wZmo/KlPLWx/EjKjUCKPMiWhon6NCH0Ya8rCBLIMcDkC7RZ7CnuMOE5coXQA8kzw67jfooo8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367557; c=relaxed/simple;
	bh=/o4MggE+AzcXkavFkmQNZ85Um2Lx9dIx/mjXbk/xSWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a65Sy+52rPRCB9kZZ0g7lrCVn97zNYsCe/u+wmxtXx0b8EcpB/yRMSIq4T05ydfhF4HvwIkK1jafE473scme5+Ce1/VEcJGZ/GUn1JfI5dFNw2R6VYy+w5UV4pHUkP7/bj46gJZHd5NTuA7wuDRnAnwxgYelP8lkBHvVincj+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBGZSJi6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d47b38336so583067f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730367554; x=1730972354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i42WZwPkLvBRfNlQLAxPTVFJmRSkrVUk9wWE2BSDhqk=;
        b=rBGZSJi6YwyQmBItYrXzf+ClrldPGHHPdOlQjwfPmzBsg347PhHi33xepCNJgTxRze
         fxJAW1O865AZNUsbqu++RWjvRYVwLnkZpi/ijLai3HFKJCd10NBpoGvGLHHEao+QkHyw
         9Naxwi9r/Z1gGhQCcrpPY3+W6b0nju6D1XBvPr+IT4sH7EWXj+bQHCCJztMymZM/4HaK
         xTsIoDtVA+1W48VEcHJ6P3VOnAKQCTD7GcIPJXjqY/Ib7+l6nvcAHXUvQNENXHUB5+Fh
         k1/jZGycbX0PnlKnjqAVxq3QjOOtAAjcwHRQPnQYmOmtcRwwhyACPtMt1PC6WLpCYa++
         0djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367554; x=1730972354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i42WZwPkLvBRfNlQLAxPTVFJmRSkrVUk9wWE2BSDhqk=;
        b=sPLwhq4c9kpNN3j8ug0DsweLiQzBl0yVwa4szcDL2h0w2ImzLxFVVrbrnuwGn00Dg2
         Oq2bVhMJey1VkAYIV8r2og0AIRoHDIpg3ZgzR2KlYa+1+xYM3WdCYkhjLqNdNo9zmvGE
         4tztlPQCKSAR7GmMlCGhVlJ3Fl7jidYi3m39uLK1ZBUA1MxnR1HXjYvyw/nHm5Bzscin
         kF4wVC9oE17fMjblWVaEGtQbixI3DHI8i8KiyUUZcDAvLpzUfPIMKfTje5cinrXNt+V/
         iK3C/L1m90ECIAnDDGSBXXa/Z4W3oT8busjNYDJBxxM3ftSyBHnka6dgMb6axcuADc7M
         OPlw==
X-Forwarded-Encrypted: i=1; AJvYcCVDiKuB8v2oUcosP39tGe0u/8D77x4hkm2FSrRqWioF2TPLDzAPWuaZblHe21FGXRSopNm6m+8JELQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGaOA4bD/ghQlQWv8nD8d0KG01vWKIQxByL8sv6qHcUOWq22y
	fWcdKtQCua6zYlGV/K81AXeK+7QnaiJTrwEwdi9Fyz6vvHuOTlES/1Txh93dofM=
X-Google-Smtp-Source: AGHT+IHVBYXZHIeFVSzJKMyjPPRTI538bYROcADmMmloUIXdIkyVOxBgB4ul/54dATOWsHi6/eAB+g==
X-Received: by 2002:adf:fd4f:0:b0:37d:5130:b384 with SMTP id ffacd0b85a97d-3806119cdd9mr12579318f8f.35.1730367553824;
        Thu, 31 Oct 2024 02:39:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c08sm1561130f8f.17.2024.10.31.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:39:13 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:39:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Fix use after free in debug printk
Message-ID: <490dc872-fc62-49da-89ff-4eba067df8c0@stanley.mountain>
References: <7d0481da-5852-4566-9adb-3a8bb74cb159@stanley.mountain>
 <ZyNI3rQw6q4pkqpD@hovoldconsulting.com>
 <8bad985d-4655-45d2-b448-2b3377a8438c@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bad985d-4655-45d2-b448-2b3377a8438c@stanley.mountain>

On Thu, Oct 31, 2024 at 12:35:31PM +0300, Dan Carpenter wrote:
> On Thu, Oct 31, 2024 at 10:07:42AM +0100, Johan Hovold wrote:
> > On Thu, Oct 31, 2024 at 09:59:10AM +0300, Dan Carpenter wrote:
> > > The dev_dbg() call dereferences "urb" but it was already freed on the
> > > previous line.  Move the debug output earlier in the function.
> > 
> > Thanks for catching this, but please use a temporary variable for the
> > struct device pointer instead of changing the flow.
> > 
> 
> Why?  The output is the same either way and this way is cleaner code.
> 

Nah, you're right.  A temporary variable is nicer.  It avoids having two if
statements.

regards,
dan carpenter


