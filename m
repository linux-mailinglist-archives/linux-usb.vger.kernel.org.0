Return-Path: <linux-usb+bounces-12219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EF931281
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 12:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5761A284457
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 10:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFEA1891A4;
	Mon, 15 Jul 2024 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCJQdAdx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2339188CD6
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040251; cv=none; b=NioYu6ef8dTwo/wwvewLtGl4lTxrNgcezDwcx3Be3WcSGWv1TmCkCdqEv2iegJ8zmg1sDTW94T88AhhOw4CJae95vXbWA5n/hPV61wka1BuwznpkJpgP6J7dU928ObFY/lUP+5R8c+hPJpW1RdLAT99cCsZwPxos0+GQYfVgfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040251; c=relaxed/simple;
	bh=ArjFpvyZSZjnJ0EBwp7II7TtY5rAXouqIJMsKyh7dpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsJDjUXppaBT+cOReVAEKWv1R2ysd5sXXYwx8B6yL6G04koo5oKv4F0Je5kgwspuGtS0ZMClnze+yTEcrpDZhumLT3GwArYnpur1kuv0hz8yfVLRXnwb4bs/nAUUuDPwvJEvJ0gTjuY21p6icpb1aG0FcLucGwqNty7z+Z+PqyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCJQdAdx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so56356611fa.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721040248; x=1721645048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6DOZ74q6LaS+OZDxCfdEKnLwse8S4I+GqgO+t/odvM=;
        b=cCJQdAdxBz7M5xnQQTZj/RW4pea84TWQcr/M/uWkc+MoQtEMy9IxWjav8nK0bdvC9g
         JZQ+Am+NoxSXRuc5XSIDZPUT3/KbQGNgOSuRbXHulJdOjWk4CkF0ScbCRi8PecmSdVK4
         ZZPmIXwx6ZZmqDhzl+62SvOAomRgGmlqt8LDDtQ88LXzPNAPJuLoBHUsAcYTC8hgwQNr
         NDgfcJ4SOBWo4+Z0gm2QJKb+MAUeSqrZXugeb+RHkheOTQla7G6NOZoEQNkQxDYA1ViW
         tAi+EHIbE3LOTAasJ+oh5y7tqD07/2CDqKVzgib37BHoJq2zf64007GydDjvywcQortV
         N6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721040248; x=1721645048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6DOZ74q6LaS+OZDxCfdEKnLwse8S4I+GqgO+t/odvM=;
        b=DFQ6NbNR8lvqh6oExyQ9Bd/T+EjMbViyEy6ThwQWvWn3xzlytyX8Ct/QkdZquUBawS
         rqkcxJd0jDLZKRqTxO3bLYEtvLErBcWwmwue/9kABV/wQTrxtX1vuCjVbBDFDFrXnF5X
         cegHFmYU2jek70t+YOypVFrG/GkiGEQwE/Z8EWLo60Sd9JODhYoytTH2vRf/JXk73hoW
         q/+7uMgb6syLKcEIN96TY8L2pq+oKU9kJmA/4l5WSXUNiIDhV36/6fkL+eyauH3+8Bh9
         EvoLO9R2GJn3iYa0sIIkzJ24I0sLDEOBxYxASBCUMyUdBBLOJNE/00CAVGtEVNjkLQ2Z
         JeQg==
X-Forwarded-Encrypted: i=1; AJvYcCVvqk1EcZ5PWinjrkvgo49Y71zLU8yi4obxBmEx+yBWrl5tX/npn0ZNJJQ5QCQjMgpihTVXoquq5LG+awgavODvSLnKVB7RIR5q
X-Gm-Message-State: AOJu0Yz24Gr4afHCg1V3DSoqFSEV4Ud6+D8yPrDb1RIORHwrmNIpOh6t
	qvD5+1tNd9QWgBcmNZ/pJgsq2xXLeS2Ra3hdHkSXdw4M/q/iOFlbtXJuaEYwh7E=
X-Google-Smtp-Source: AGHT+IGnyG/Ll9H6oeJ1EFHxhpSIWM36luDTN8GTUj1UNcKQxukVJP29d+tdlNljt20MhCCO1QXm6w==
X-Received: by 2002:a05:651c:1a08:b0:2ec:1a8b:c377 with SMTP id 38308e7fff4ca-2eeb30b4cbemr141866201fa.5.1721040247851;
        Mon, 15 Jul 2024 03:44:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee18bf096sm8128601fa.61.2024.07.15.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:44:07 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:44:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, johan+linaro@kernel.org, quic_kriskura@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: glink: Remove unnecessary semicolon
Message-ID: <txweguq75ghx6aqxkllvurfiituyki7skfgkiq6t4wk6xbgjxw@foigeiebnrzm>
References: <20240715073947.4028319-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715073947.4028319-1-nichen@iscas.ac.cn>

On Mon, Jul 15, 2024 at 03:39:47PM GMT, Chen Ni wrote:
> Remove unnecessary semicolon at the end of the switch statement.
> This is detected by coccinelle.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

