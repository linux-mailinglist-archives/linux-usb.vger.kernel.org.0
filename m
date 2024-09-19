Return-Path: <linux-usb+bounces-15236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C2797C7A7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 12:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86EA1C26B36
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 10:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C3C198A30;
	Thu, 19 Sep 2024 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vay3HjJv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D321CABA
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726740207; cv=none; b=lymw1ZeVwjJuXu4dBnszvWvckRFgE0CZIe7VTCmXCzxigjTJS1xVCKnDVLC+jgzBJ6Cg4ccy7z0qD+AEfec6PAPO0XmgmslfUw6L3pUr12zvXqIqLMp1Cygg15o9YTEGl0NIhnB3QyLtC0ySUBZYZ0pJpUC6AdOjrUWnzU+9XaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726740207; c=relaxed/simple;
	bh=MNOnGVCE99581+jiwkLz73JprsxI/4REtSHuWgT0vSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOd1MvyzclWm8xPx0I9v0BAa4X63JTGkE6I3aG4vKPQt0pMXhx/4G1xeAAgo8ZSKDMRNYfSu8xZKFZWCmCFyy3VSsJs34dQDZ4zRlTAKXhVQNbV2BYSQ3ygNIYrGVmQKbPkZ17AzORiw3CbusHE3NxKXE4wCORTfOkZx/Kp1Ubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vay3HjJv; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f75aaaade6so6832831fa.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726740204; x=1727345004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm0T3lBlXW71oI/6MEwcs1PF1tdgRwmMxsF7unyMjq0=;
        b=Vay3HjJvrmgUosAzL8WJd+XUXOksjrvTE9Cu7+cJ9Y1s4TJWSCeWfbGVeWw/OWmOjg
         Y21pGO0NW2NDMi291AunPjsdsf5ncHBbQD2wuyygm6CLbsShOcp0402H/bvjreUWJJQ5
         o2sM53JgQjB9fMGsfr0nYPK/VtUMSIBA6OsPqQQ5EfFXH45h0TZHPUM8AIcbbzIvpVaw
         F4M4rr4ESag36TCYXlohQxHVXcgugrZNJn/K1Nb7BzaFiWHD12XZ69byUUGJccCFJ08E
         uSY2hfcl71fXfIReChQMzk8AcPVVHl6WQ/B2LQpHfMoAwWRKL8IDanRjtwfjhlVgd0A7
         D2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740204; x=1727345004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm0T3lBlXW71oI/6MEwcs1PF1tdgRwmMxsF7unyMjq0=;
        b=s/tiqNY/F7Ma+mos/+wCMHOxNeAZ4SLXlwgGRnv8pVJIzK5Y67HfL2W4t7JCV5lkWg
         73YJSElMq3tyOdXm0L/sjAlZKt2j2hr7x76uofQwSCi2LlWZ5VfslF5wvHompLQfWcXs
         5X/SPIPcuBldWNdj/x7mmEvHuWD/BCOO55nSc20Czm16/sK0XqgSIFKIw+KfITU6s+aR
         at7C0U6xwG7h3TxW9jZqwxhAjHhkyN0Ugzs1mQVAIOYdqIjpPOzIbE2qsRBRStQ/vCpN
         4bEjiKtbI8qGZxxZIqQ2K9jfHbzUF48fKLdSU3OkkCox8RJJJIRIFHk+aH6CX41fCqGb
         eRCA==
X-Forwarded-Encrypted: i=1; AJvYcCVmwFCO1iOPEAFoFR4z6YnnuSX6XZ45E5JSXukEHOGHWE6pWA0hAat1PfhV8Z8lg+qc+EqHGzS2sYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSJmFzVpDqLzn1soBa/hPoVZF6SYn+gAFmkBk+moPDp/0LOsg
	fOMl7MPLcN+3jlX259g5qf10fikDhshHUOGUJiG+6f83jyDydUAhDUudGct9fiA=
X-Google-Smtp-Source: AGHT+IH7yRz+qVAWJpTNuo7mcNNrHWvXkaxYUChIDjIxvqogt/cFaoaX3ftEGOc3rT9khbZqeQ3HWg==
X-Received: by 2002:a05:651c:221e:b0:2f0:1f06:2b43 with SMTP id 38308e7fff4ca-2f787f4f472mr154568801fa.41.1726740204303;
        Thu, 19 Sep 2024 03:03:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d4866f8sm15991701fa.120.2024.09.19.03.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:03:22 -0700 (PDT)
Date: Thu, 19 Sep 2024 13:03:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Amit Sunil Dhamne <amitsd@google.com>, heikki.krogerus@linux.intel.com, 
	badhri@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: Fix arg check for
 usb_power_delivery_unregister_capabilities
Message-ID: <gkyzytmvcaefbfvu6ryss7zq5cm3t3mcjgtugsryhxl7aglpkk@gi2fgjnyidgi>
References: <20240919075815.332017-1-amitsd@google.com>
 <2024091956-premiere-given-c496@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024091956-premiere-given-c496@gregkh>

On Thu, Sep 19, 2024 at 10:11:37AM GMT, Greg KH wrote:
> On Thu, Sep 19, 2024 at 12:58:12AM -0700, Amit Sunil Dhamne wrote:
> > usb_power_delivery_register_capabilities() returns ERR_PTR in case of
> > failure. usb_power_delivery_unregister_capabilities() we only check
> > argument ("cap") for NULL. A more robust check would be checking for
> > ERR_PTR as well.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
> > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/pd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> > index d78c04a421bc..761fe4dddf1b 100644
> > --- a/drivers/usb/typec/pd.c
> > +++ b/drivers/usb/typec/pd.c
> > @@ -519,7 +519,7 @@ EXPORT_SYMBOL_GPL(usb_power_delivery_register_capabilities);
> >   */
> >  void usb_power_delivery_unregister_capabilities(struct usb_power_delivery_capabilities *cap)
> >  {
> > -	if (!cap)
> > +	if (IS_ERR_OR_NULL(cap))
> 
> This feels like there's a wrong caller, why would this be called with an
> error value in the first place?  Why not fix that?  And why would this
> be called with NULL as well in the first place?

I think passing NULL matches the rest of the kernel, it removes
unnecessary if(!NULL) statements from the caller side.

-- 
With best wishes
Dmitry

