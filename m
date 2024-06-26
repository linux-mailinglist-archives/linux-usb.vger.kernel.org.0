Return-Path: <linux-usb+bounces-11708-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E1918E79
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 20:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599E81C21E97
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 18:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17098190669;
	Wed, 26 Jun 2024 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmyLlT4n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64936E613
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426538; cv=none; b=CzzPTb90AwQQX3fbnZfTJ7U0orgY48Umh9053lH4dMCqKDJW4qk+EzdICQUEiP51XZDekhBu97ioNyEuIyuowah2rMt/tI0I2lyIGkkszaSnTWySTeB1ecTRHDOFT8dm1W2d8J6W1UAJg+oicNGPd9C83zfIGYqkR2FbRiVdqsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426538; c=relaxed/simple;
	bh=eKRBvuVsBIUht4VwixhBBiAcPNSRigXXTjzRFdC3l0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvK4xs0R5MAWo8xyxa8wI9LG87Iz/9OTR+yY4w2zTjEawsPVLain3gxkU2bdSnTaWXrmpsoBfb+BCp23AzDLp4YEw7ZCfUcHY/aQaiHZaoO++m/kMyV/5Xua5qFoqKEryl0sQiaHCJug+GEjMq+YvYsuPY7lF/jYeKMAXSJrRYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xmyLlT4n; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso5116582e87.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 11:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719426535; x=1720031335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=llV5RmcUgj5BZ1LNtC4Xqg2HQ2Qk2/PW4RR/EDhyLcM=;
        b=xmyLlT4nwsfQuW5RLZtU5U15uAhyxO7ZTOE5FNhyytIKAzMmEEX6hK6o8Kx0PtlrWo
         PUmJYc7CD+S7rvU2BMuG4iWpNtNBQEC0L7MOaeNt6ugjmvwwbFBiK6qmq1HKBU1PR1OU
         L2ZQMOcli8EkUPlJBHtI9Ro2Y4rcwxhQ8PRQMWHl1HRhDs1Ltpn+uH4uKpWeaE4bXCpB
         Tg/XFcNp1Ky5jDCcr5o3LkKe6L1YsaTZbKN241ztzuJ4WZda2zzGJOJ6sF1gfzsF4H9X
         8zMtb+pl1uehouEMxjzmArlgkQzDSmDHMNVzvM4GoA1x7v4Pl8yT/RFY5wCTUsB6lNaa
         68QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719426535; x=1720031335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llV5RmcUgj5BZ1LNtC4Xqg2HQ2Qk2/PW4RR/EDhyLcM=;
        b=EQkDBOnxpiBvhmFYpenk1+yTNGIVF/9gQhB1f0BD52NXRbphv0pS0peMD74hipocCh
         E3MVJxm2oRQhpRyyzp0ZHqCu39E1PJEPISYsSqEmZ2fYUwRaFMWAY0hsVRVgw7CbLYTj
         PICgw+JIyf7kFM74x0RkkvphNqEuMhWAxBizDgsr2mQNfOtZJR37wKmkzVUpei+95EyZ
         tmvft2PMpVwK5pfTnW8M2y64YQc6bwyLg3TgukSHMg2TzPfVEOhULu+Zp3b6Igt9LSTy
         uqnk2vh/ZoJ2+NEDMgbvIq4PnL+XOJjx2V88NWVMYNE5uErFG+Z1tO9839OaofV8br3R
         n2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlr9UA99z4ZJYJJN5ymkAjF8beYAxcGRMlj3pv59mTfBG0+aTtzUrao4CfirohN69iPxDO2h2psAcptl+P9BDloChZqoB9tZIc
X-Gm-Message-State: AOJu0YxxZW0f/nW4esP6aqpFEidVZhwx5RjptcQIEQU614/T5jw6Nq6X
	01rfuGOeSL2i/r3UuRdLO75JW2/gy9GzWSwVgMh5sjulFtugRvTr/p1NVvnK49s=
X-Google-Smtp-Source: AGHT+IFbP34C6diNqJLLb3MTQo9AnJsVc+x8hC7VON+KEozVXfyLzLz94epjeKUeENRIlr8qwKg6eA==
X-Received: by 2002:ac2:4c86:0:b0:52c:d27b:ddcb with SMTP id 2adb3069b0e04-52ce183270emr8553919e87.3.1719426535066;
        Wed, 26 Jun 2024 11:28:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdc4ad815sm1491621e87.306.2024.06.26.11.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 11:28:54 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Nikita Travkin <nikita@trvn.ru>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/7] usb: typec: ucsi: rework glue driver interface
Message-ID: <2gbvt24uete2mg32eq66rksfjb5gehazwfszoceowejmskxmb6@jv2k74clpiwa>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
 <ZnwkloBH6UVzPOjg@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnwkloBH6UVzPOjg@kuha.fi.intel.com>

On Wed, Jun 26, 2024 at 05:24:22PM GMT, Heikki Krogerus wrote:
> On Tue, Jun 25, 2024 at 05:54:25PM +0300, Dmitry Baryshkov wrote:
> > The interface between UCSI and the glue driver is very low-level. It
> > allows reading the UCSI data from any offset (but in reality the UCSI
> > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > is to be done by the glue driver (which already resulted in several
> > similar-but-slightly different implementations). It leaves no place to
> > optimize the write-read-read sequence for the command execution (which
> > might be beneficial for some of the drivers), etc.
> > 
> > The patchseries attempts to restructure the UCSI glue driver interface
> > in order to provide sensible operations instead of a low-level read /
> > write calls.
> > 
> > If this approach is found to be acceptable, I plan to further rework the
> > command interface, moving reading CCI and MESSAGE_IN to the common
> > control code, which should simplify driver's implementation and remove
> > necessity to split quirks between sync_control and read_message_in e.g.
> > as implemented in the ucsi_ccg.c.
> > 
> > Note, the series was tested only on the ucsi_glink platforms. Further
> > testing is appreciated.
> 
> I tested these on couple of systems that use the acpi mailbox, and
> didn't see any problems. I'll be away for most of July, so if there's
> nothing else, for the series:
> 
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 

Thanks!

-- 
With best wishes
Dmitry

