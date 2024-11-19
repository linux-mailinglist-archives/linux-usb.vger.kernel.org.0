Return-Path: <linux-usb+bounces-17726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6369D2DF8
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 19:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5681F2248D
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 18:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6301B1D1731;
	Tue, 19 Nov 2024 18:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ECLQWvzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ACD148FE8
	for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041168; cv=none; b=IELIuhFCz10Edbqy6ThU/CVgPswQDaDBECfGWd3E4GBwb3j8RskiABNjigWNvjDlji66swRfNcr82eSMnWZMoTXWBlV6m53VchV7MJ1R1r0DCGijJQYIoh6DceI+syRtjVOayFcj+rOXb08SQCAoyLX6BjrruVVnKHEPXQcITgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041168; c=relaxed/simple;
	bh=Q03afy1pR87I33tzLSWKBJv+Jn60qKZiCJtlfWL/f5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CASFGkpJyM9+4FMnb439ooJ2iCdl7l1EPJcH6MF54roGOiSGEiqBF1C5yska4aPqNFuFavs3S83gbno7JkIzGQ0GSLIK6fsDdR3VTKgekcz4rV6vjZvotx4zSfDt0eEmFXM48CjG735ymO4r1IPTo3d8YIGnR4opR1CMGIx3q2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ECLQWvzw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53c779ef19cso5810497e87.3
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 10:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732041164; x=1732645964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/qujIcm++lq8ximnF/u+BvAkGZqRiSauboDwnp0tHWc=;
        b=ECLQWvzwbE6JQzFiAMPiGhJIRB9i+Y0ka0SY5fM8LGnOX3fsqKLij9IIZZKsRNBXPq
         BLlSAsbCivM32HS6u+ShdvVl0+X8h+gyIrzVBVE/RINRxPIfuFu1Soq8ZgT4xvgdHUCc
         cCVlupkOO9OR1sqJj73+KWWPt9QKtWY9qu27keZsl5rYSAiWQBv7YzgbdqQ3KFxEb3S2
         SIldGKWXHqmjBgFzqhuQYEX3YVx0EktmSK8Cl7UbTt6f+TM/VSEeaxgL6CtDt2u4T0sJ
         0xDoUUCrMFeFEpanmAbDRHxO9edU6Prdd6zJua0eP0/U0va7vi9AAcRq916LC9v+XVkQ
         vOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041164; x=1732645964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qujIcm++lq8ximnF/u+BvAkGZqRiSauboDwnp0tHWc=;
        b=Ie47wUOfnVrju2RzgTF450zE9RGy1iz8AGIJ/8uaZJ8ym9QNr2TSwZ/LRz4GszpFeN
         jx7cSswEBcFVlSlSAaQ9dynNLiC4MdJwQ48gHH7SFlUlp1ZIfxRnGs1mkWYHtVCM6o7A
         szDvIv08NQyGBHp8WmLL0wt6G4VpkzGJBhIyJ5zd3TEWX2q2IUyCTibRWq6lomAGyj1A
         da0QXYo3LEa4zUTxwr2zxA3KfUaWmkMl74Y92zmLQsvILqp/ZSNAbKIRvKJa9o5S8PnK
         5fMMBRI45GFw89lVZythsYHqoBeVkvRpsAXQlQNv3EtCHRKDX20uvTWrILnPFcnGN9+O
         vRqg==
X-Forwarded-Encrypted: i=1; AJvYcCWfl7Bv0dq/TZjVyebvbiW2Xsm5/KmjIeYZbE95x0d+b6AiUJDinq0OercQhAIyvD5FCTFG9ss2NV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRaXE2MxkbIqkeVwWv0tM+OCSGKFENqgPa39JBnrWPCtmoB5yJ
	k/KmS5BUX8f4r7vV6N9BFlHnJc9FR6CZG9cpaoxV+TiiX0ZblM2yan5dUgoCsBI=
X-Google-Smtp-Source: AGHT+IF92tJReyYtOQMdSwg2EHkEJv+Mc/gogwP8Kd1cbsMYdhOur3UCx/g98j7q2825WYgDiwOXAA==
X-Received: by 2002:a05:6512:b20:b0:539:f2f6:c6fe with SMTP id 2adb3069b0e04-53dab29cc03mr9188460e87.16.1732041163890;
        Tue, 19 Nov 2024 10:32:43 -0800 (PST)
Received: from localhost ([179.228.213.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f346d7sm77359085ad.138.2024.11.19.10.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:32:43 -0800 (PST)
Date: Tue, 19 Nov 2024 15:32:40 -0300
From: "Ricardo B. Marliere" <rbm@suse.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	skhan@linuxfoundation.org, ricardo@marliere.net, linux-usb@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: usb: dwc3: remove deprecated member
Message-ID: <5l65sdskdzbehxamff5ax4ptiqhaxh7ewi4umtpp6ynen45nj6@nebuxjg4c4rx>
References: <20241119154309.98747-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119154309.98747-1-luis.hernandez093@gmail.com>

On 19 Nov 24 10:43, Luis Felipe Hernandez wrote:
> This patch updates the documentation for the dwc3_request struct,
> removing the sg (scatter list pointer) member.
> 
> - Remove 'sg' in the doc block for dwc3_request
> 
> This change resolves a documentation warning related to the missing
> description for this field.
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>

Reviewed-by: Ricardo B. Marliere <rbm@suse.com>

> ---
> v1->v2: remove unused sg struct member as per review[1]
> [1] https://lore.kernel.org/linux-usb/20241119020807.cn7ugxnhbkqwrr2b@synopsys.com/#t
> ---
>  drivers/usb/dwc3/core.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index ee73789326bc..3be069c4520e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -956,7 +956,6 @@ struct dwc3_request {
>  	struct usb_request	request;
>  	struct list_head	list;
>  	struct dwc3_ep		*dep;
> -	struct scatterlist	*sg;
>  	struct scatterlist	*start_sg;
>  
>  	unsigned int		num_pending_sgs;
> -- 
> 2.47.0
> 

