Return-Path: <linux-usb+bounces-30787-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DD541C771E4
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 04:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A929341C16
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 03:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378212E62D1;
	Fri, 21 Nov 2025 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="red2nn+N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B32144D7
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 03:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763694495; cv=none; b=nQ8/HtO2adC8mKCThZG6LIXYDPpJzyO0RbULtOgxnHgVkA4cm9PIJ7e9T2/DtCnjGqBVuNtuvvny7sQcURoeLPNEzL7mEcgSGgHIvr24OiwnBSP2V0Kpr0yh2/7nAyz/Lwp8UTfmZnhc81hTjUB9BAE/vRVaVHDa6jZlny2TcA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763694495; c=relaxed/simple;
	bh=cSH1QWncDiXNZK3xMQSSMOWvViAn4G2EA7i4fxqwNtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0HLI/g7xylSWJVGJxdnYUd0vYK/PvB+pkBzf4aOZL1WoquoVZ2w53OQPIh8PjPSq4/uwQgLE85fX2NftDJpB6NyeR/OXbWFnc5KQijLXgFC1iPjeAAh41yuHc5AIgnnjnAAZWZ1qlCZaPYv8i2xw5we7OredMj1EzoeW8jyRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=red2nn+N; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee328b8e38so13429671cf.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 19:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763694491; x=1764299291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ltHyviV8JTeFA+c+5T5yue4HtjqZqVrYQl54fl+c60=;
        b=red2nn+N5hgdB9aJamVKbOhSTo19UuB6+BxJ1fRbK8EWqguNGjlpEvwmJPRA3nhQQu
         OJau5Fhd2T0WDF8H0rsHPsbG31Eo+/W8bvmcS0uX2TMbsDcc1M+fsQ0EJSX9SCBQ5mph
         MU3drCmdSch582TYzNFXailtlshmCD4jjv+HMPxNDwxA+G6DxiO0XeLdvc7je77U6MCh
         oFCdQoS25bfcvC2dK/GooPjnd59ye8lWwWJHUPSgCHOa1CTk4wdtXrXpGGkUlt/SBRPO
         ayqMRudrG4AISkqQ06IxNt8OGwCx2K33DZRbE8ZFsRmePQ7D7Rx0KkmEe2/iMXB9LAgn
         CGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763694491; x=1764299291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ltHyviV8JTeFA+c+5T5yue4HtjqZqVrYQl54fl+c60=;
        b=qW6irDMsrgDKfCvfXgBoGbnSQKeza2WllKrDyBbxvatBgqiZilZh6ojZEwB4jfeKon
         GWNDnlt0WxDC8esspRHec2et47dgYOjvYBJAg44Eq3niVXQrWJdgbHc1Kg112Yg6jtFr
         8O867syYxt9pdd+xPeK6Oa5rlQgq/RN6fT67UbuLC/WW6ZjWZdfX6uzCn8QOu9pDE8sx
         9zrl0ZO1W/HXYEY4PPnx+KDmY2QGrwxY5b6yE88sPRolVoLM5BH1zb+PPOqDQLTUCJDw
         BXczyU43L/cOl09jPXYxaQ98hkjYKcSymtyV5nCO2ZL2Pj6foi+hXj/PQJu3/aevsxzs
         NEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFzI8CFaeBW/vZJEQ3nnTP0WdtFWkoQn5TJYib0KNxQOmT/sRHVqkmdgNGPLBEu3VbUBfn/tNQiUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7O3tFCYRZo+snHiFzFCua+l+EQTy8iXmKT8nHtx6p6OV8P8P8
	57dLMrRPQDuugQt9U0/KnapehPT3Reflz7w8p+UDLAE6t9ctI0rp4BvRUBBsMpo4uw==
X-Gm-Gg: ASbGncvvdlO6Z7zBwNVydvN98OpiYzFuCvSY/LOyqIgJ5jZRHLhzs5c5s7/g+kJbS8y
	NLd/Ply4ZzPXF/c4Vq617Yqxkbtzp1by8sHVB+HezzbaEefNzQ3h/oX7aBKDMgL6ISGwYu0xfl7
	Ee6rRse6SzDvpxujT4p8Ly9clZb6Xt6xt3ZCE8m9kSPK15Jziyuw1Fw8CBCyt9Cv40pOreMRvv/
	cGhf8uj371YwL+QgsMb3N/Cez82u0DOlSs6CrDncUZ9A58icbzacEX8GNwyX6L+tVNlDD+/Hb9q
	sbuyNSmeK/8X6zcx4/JhPNN1CjruBV9DWlBrcoC5Rg52tnivPvpdk5YUW4xHR4vplCgR0lgVQcJ
	FBasFopzaZTRb4iA0EO6rKu1pbSavQgdM1Efpfqa2r77LSdsLu9RwzMtZjS19/XsN9PP6j81Tt3
	1+3L26bcXtyG+a
X-Google-Smtp-Source: AGHT+IEdmoIhBKjORCd09bA3xSbWYZnAdlLWlZlKGK08kQtnR3MCElNKnHLa/KGdHaa6wMD+5YAgBw==
X-Received: by 2002:ac8:5790:0:b0:4ee:26bd:13e6 with SMTP id d75a77b69052e-4ee58821d79mr13629971cf.25.1763694491554;
        Thu, 20 Nov 2025 19:08:11 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7632])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e5ae0f0sm30899606d6.55.2025.11.20.19.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 19:08:11 -0800 (PST)
Date: Thu, 20 Nov 2025 22:08:08 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Selvarasu Ganesan <selvarasu.g@samsung.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
	"dh10.jung@samsung.com" <dh10.jung@samsung.com>,
	"naushad@samsung.com" <naushad@samsung.com>,
	"akash.m5@samsung.com" <akash.m5@samsung.com>,
	"h10.kim@samsung.com" <h10.kim@samsung.com>,
	"eomji.oh@samsung.com" <eomji.oh@samsung.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"thiagu.r@samsung.com" <thiagu.r@samsung.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent EPs resource conflict
 during StartTransfer
Message-ID: <f6bba9d1-2221-4bad-a7d7-564a5a311de1@rowland.harvard.edu>
References: <CGME20251117160057epcas5p324eddf1866146216495186a50bcd3c01@epcas5p3.samsung.com>
 <20251117155920.643-1-selvarasu.g@samsung.com>
 <20251118022116.spdwqjdc7fyls2ht@synopsys.com>
 <f4d27a4c-df75-42b8-9a1c-3fe2a14666ed@rowland.harvard.edu>
 <20251119014858.5phpkofkveb2q2at@synopsys.com>
 <d53a1765-f316-46ff-974e-f42b22b31b25@rowland.harvard.edu>
 <20251120020729.k6etudqwotodnnwp@synopsys.com>
 <2b944e45-c39a-4c34-b159-ba91dd627fe4@rowland.harvard.edu>
 <20251121022156.vbnheb6r2ytov7bt@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121022156.vbnheb6r2ytov7bt@synopsys.com>

On Fri, Nov 21, 2025 at 02:22:02AM +0000, Thinh Nguyen wrote:
> On Wed, Nov 19, 2025, Alan Stern wrote:
> > ->set_alt() is called by the composite core when a Set-Interface or 
> > Set-Config control request arrives from the host.  It happens within the 
> > composite_setup() handler, which is called by the UDC driver when a 
> > control request arrives, which means it happens in the context of the 
> > UDC driver's interrupt handler.  Therefore ->set_alt() callbacks must 
> > not sleep.
> 
> This should be changed. I don't think we can expect set_alt() to
> be in interrupt context only.

Agreed.

> > To do this right, I can't think of any approach other than to make the 
> > composite core use a work queue or other kernel thread for handling 
> > Set-Interface and Set-Config calls.  
> 
> Sounds like it should've been like this initially.

I guess the nobody thought through the issues very carefully at the time 
the composite framework was designed.  Maybe the UDCs that existed back 
did not require a lot of time to flush endpoints; I can't remember.

> > Without that ability, we will have to audit every function driver to 
> > make sure the ->set_alt() callbacks do ensure that endpoints are flushed 
> > before they are re-enabled.
> > 
> > There does not seem to be any way to fix the problem just by changing 
> > the gadget core.
> > 
> 
> We can have a workaround in dwc3 that can temporarily "work" with what
> we have. However, eventually, we will need to properly rework this and
> audit the gadget drivers.

Clearly, the first step is to change the composite core.  That can be 
done without messing up anything else.  But yes, eventually the gadget 
drivers will have to be audited.

Alan Stern

