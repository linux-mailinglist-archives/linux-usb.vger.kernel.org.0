Return-Path: <linux-usb+bounces-15787-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF2991FA0
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 18:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998E42829AB
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 16:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFA6189B81;
	Sun,  6 Oct 2024 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jjjo8Pci"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C128EC
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728232589; cv=none; b=kSkerkrG8vx5EkwbeTmHMY2QvjQ7Tm9s26e0cMtPRO02zJJG88xfd+vFN7Qm7H9iMwl0+QbsUV8fs7SiUuI4+YOe7HsZHbGzrlDSRRmDja7b91FB5u5bTFTl/3M+/+oyyYVC9Agy9q2C+reZ/QUWx/5AGJ4rxVkrUQTgK2I5A1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728232589; c=relaxed/simple;
	bh=orwhwz8mr7oT4gNN9ey3V8mXzynlfPTT2Eg2wqEPenc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/LMixdSbpV3yQ2bnZgv8YJwrAfnlQaxwmAkbLAGx6cXAj6LhSIQVnqPdFCZX9K0Ytd6erMVsSomMD8W1sS6XwUM7jGfgnMq5V4oD2qPn0RvmQwlpZKeXx5hEdghE0uY332DeE0Von60SfG+Fwpv2QPr4zm91RAQ0rPMCdmDpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jjjo8Pci; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so3707118e87.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728232585; x=1728837385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cBwP42IcpVPQW6JYZpjiuG0TIEw2kOB30Ut5ezxy8/M=;
        b=Jjjo8PciYhhEG1iAqpzwfszrmj6dr/mBV0d9kQPqu01BQxo9VHbA2cJdRtPnAPNPTM
         YT93I8YHtgyvzvO5DZ/rKoFRuXg9rpbcnTH0VilNn9uRZQNTcgnn3ow7Mwb3jEFgykkI
         WEYJxbOIkFUl731l27AY+Qk7uQfFrHzuERKWfJRserH2H9LjLGXy4nReXgZtVq4usWVE
         ZsWyoja0Lsqmv1ZRDu8eqNSAIh6wfxBpbTb6wQuyQvACViDLkXzOxUS/Os4leOyLIdBG
         iMxFN8+BjpWSFeWb//AyPVVW3oahsFiwLupRTpBG7akfpzaseW+Skhml/aVB2lmNSS19
         UawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728232585; x=1728837385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBwP42IcpVPQW6JYZpjiuG0TIEw2kOB30Ut5ezxy8/M=;
        b=ZCPGGL429sld9w+NBG0BYpsLqRKnye8lThFaYV1E47+4d0IrFTgGCUqLui1j2hXpp6
         5jrQQZj5CnvJtISuENibe3wZw3bO5ftDg7ZXDC7awbyqoBmd164fdS9DIMV5CTmkhHRq
         B8C1hkZr/9WBHvxOQG4AK7xA9LAkp6Nnne+Hy9wpTGZXsE5+9eIHNQhXQEvDtwTgO+ay
         UkH5DlqFFDMsBzlBglJMFbENn5js51/wXlrvo2GqG3H9ZFNG8zf2Qd88ytjscVH/5YLq
         dAKSWInEaTu8hLRJhR9eSSoebg1kbEuA6OFJfMpBO1c12QPBdNvVNkPdtvQSaS+IyBjI
         42pg==
X-Forwarded-Encrypted: i=1; AJvYcCV+5tf78A3NyNugAPqjzWhP+FTc9UMLD78Bc9YQJDOqRrTYAzi11OU/kys0use/ISpjMAgEoGYjiR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WCardCHcNrlhtiN8HO3rD5koRO3pYLzP/VYUUGurm95dpaHr
	h7u34wRXFypLJZ40exA+gfV8g0VsYh/aaBKl8ulDF63ewx7T6O11vSTl3oEeIjVHf6840enbrL+
	304D/51L6
X-Google-Smtp-Source: AGHT+IE4snzu7hIKqSUuy45g/BWofpk612zhoW3QuEDAgroYL67MYnLfHcD4PAZcl76iGf7cO+zNGg==
X-Received: by 2002:a05:6512:1245:b0:539:9135:698c with SMTP id 2adb3069b0e04-539a626ab3cmr4267326e87.16.1728232585447;
        Sun, 06 Oct 2024 09:36:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1115sm562120e87.25.2024.10.06.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 09:36:24 -0700 (PDT)
Date: Sun, 6 Oct 2024 19:36:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 3/4] usb: typec: ucsi: Supply the USB capabilities to
 the ports
Message-ID: <ve2zu5doi5uzbiiiimzzrez4qikllu6fjivuwqmcy37kirpz4z@dv7cs2nqo753>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
 <20241004140440.1882311-4-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004140440.1882311-4-heikki.krogerus@linux.intel.com>

On Fri, Oct 04, 2024 at 05:04:38PM GMT, Heikki Krogerus wrote:
> The USB capabilities can be extracted from the response to
> the Get Connector Capability command. USB2 and USB3 support
> can be checked from the Operation Mode field, and USB4
> support from the Extended Operation Mode field.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 7 +++++++
>  drivers/usb/typec/ucsi/ucsi.h | 8 ++++++++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8450-HDK

-- 
With best wishes
Dmitry

