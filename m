Return-Path: <linux-usb+bounces-18904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1879FEC6B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 03:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15A893A29E3
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 02:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21E81474A9;
	Tue, 31 Dec 2024 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xx+2MN/9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E92A1D7
	for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735612739; cv=none; b=M6SeqzCobzWM7VsLpOZlUH2TbNsMIIwLaUNAjv9QOHDrI5fLSIDbGDuwwcwQ4l27ywNlhGDQ6I3BVp6jW08ymkBrCI+tT8+KaSCSgLUsgvWsSKlyu5eJpML56H6B4p1OP1FVuDyYRqWS0lfBxlfldjzbfQJflQ+7CE+NfHrFudg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735612739; c=relaxed/simple;
	bh=+rSQgcXxg362jfMf0t1TOwvCHLaTIkfkK0zfIzueFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npDRmbIG0hMcopHFonZriwIi0+uxK4zpKEFI0VZuzGW37hLuiuREv7vOpNlAwhNr8FxwfT9EdV7/8oBf6fwNjgQazuVEQlfrGu5za3gG8Vqlol+ZWoXrF/TkH9KiCKRgkP39lLrJOxhZiqPe0M8u0xsOo5dZyHdBeq+TIDII9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xx+2MN/9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30039432861so110755601fa.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2024 18:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735612735; x=1736217535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tH2aIEf8o48ClMgo1fjIlcUrMY2a908zC0Elg2J1T0U=;
        b=Xx+2MN/9q7hNcguKG9IkblFLeZpxfKlWShXhpsP8hW9gURzGr8Ca4Tni2nF5htKbZ7
         3firG440coMGL5cEqzEjrpoNaIaPR36ZToM1ZjmeiQUap7XqfFJqAKfpgXyAb+M3Px4s
         zYLnrrVjtMJ646Bl+Wqt6yPO43qMfhXQYOAHF2KGqsvo44Lg7thziL4YWyZveUoHEAu6
         7k9kicxegz0fz0El2AlvCdlVPH2tyE/G4VCGR90eUWi5G9UfOzJFWH65N8wagl7fRrhD
         A5XTp/hAE57C6A42wEfusB/ygZaU0GL9n4Nwzx5a/ke9Ne5LoRPPxmzgR0qQYPeOFZ62
         zAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735612735; x=1736217535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH2aIEf8o48ClMgo1fjIlcUrMY2a908zC0Elg2J1T0U=;
        b=tCyBBodlNFkEIDSh0/z7Vgb7vdw0B1mqf44uUf6zMEWnnayWvAMo2tfZWnyMzlQu79
         kz1i8UNgifF14Puie4U8cq6Qr5YTm8bxJ/q45h5TI+r1geJWHQFilAf4Suh7F+VGKA/W
         D5Ttj7ELLC2oc+SlmybDkMSHyaWXrnAYMjqESQ1TJ5WgAHD1gESS1y33Xr9YDJhfdsMt
         hCSpWDxgy9D5fqGtd5QHhI7qnyhWYPHiJatS8JUv+H10c+YSiUWI9ZzaJH6Pi5XTXxJx
         yMttrODDBBgBvjcplakfPjFhT7HF6vGZMSbZ0/9OGo/r4nWtqvQMlaX4el2A2ZzK7cR4
         HuoQ==
X-Gm-Message-State: AOJu0YxQ67Usa5Y+wjRTdqXAZyJPtw80rxWEd7bbVCnxXm3vv1jRpu7V
	d9h/mtgeW/N160282xP5EkoB/mcJkFcOm4PcVo+EmG6WwrVzZI4drJ/jJmVhUv4=
X-Gm-Gg: ASbGncsddgSLE+xga6E/9BpAWY51Dm3Qfm3SrtDYNbJF3fnD4RZoMUa2u8Ny8rsC/k9
	OS0X1irsWbDcfbx0TsB5Kop7TDuNL4tophQzgPQGL1mznrl/TbYfLh3938gFuoCKSvdFupYAJ7B
	jqMT9SN8PigeAoZ6ZSMfciwZRYCZzzui9RPhBZakd7+L1X54BPjmaIEdW79BBVZ2TNXInVNY5cO
	444rUl4cAA0hAs7jqtymUi7bjgWj6G0ECjVFRL+jLwG8mVfL0fVkAC6lfN9UqQOBndP5fkomRTj
	JDWLYE8olD/8cjtp/hQ9gJbWrsWlQ/zV+1Sx
X-Google-Smtp-Source: AGHT+IEq+Pw2uMB5B+ch/gtOb1YNr5SJKw2fRRQxr9fk5g+riokJmhhoLrsUyITerTJFOWFyFyEeEw==
X-Received: by 2002:a2e:b8c6:0:b0:300:7f87:a4f with SMTP id 38308e7fff4ca-30468557147mr138080891fa.19.1735612735440;
        Mon, 30 Dec 2024 18:38:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6ca8fsm35624391fa.14.2024.12.30.18.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 18:38:54 -0800 (PST)
Date: Tue, 31 Dec 2024 04:38:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	heikki.krogerus@linux.intel.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: make yoga_c630_ucsi_ops be static
Message-ID: <lzlugui4ogy7k54vceyntbwl4pykxnx7we5b3y3cqhklf5ogpb@cm3jflfje3gk>
References: <2ffd08092fabaed0bea8b7a5e19e5c9464e76077.1735278513.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ffd08092fabaed0bea8b7a5e19e5c9464e76077.1735278513.git.xiaopei01@kylinos.cn>

On Fri, Dec 27, 2024 at 01:51:51PM +0800, Pei Xiao wrote:
> sparse warnings:
>     drivers/usb/typec/ucsi/ucsi_yoga_c630.c:101:30: sparse: sparse:
>     symbol 'yoga_c630_ucsi_ops' was not declared. Should it be static?
> 
> Fixes: 2ea6d07efe53 ("usb: typec: ucsi: add Lenovo Yoga C630 glue driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412102033.J4vZNaaR-lkp@intel.com/
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

