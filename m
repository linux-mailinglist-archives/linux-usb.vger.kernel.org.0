Return-Path: <linux-usb+bounces-19167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC23A07B47
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 16:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6B51169390
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 15:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6B2206B6;
	Thu,  9 Jan 2025 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uENzFcCJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5621D594
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435326; cv=none; b=aXmSL+8lMrixUlMV399XBF2FJZOCJZfpR6KNs7ldn8bGjbs1B34s9gBy1uOsK9UJPpEn4yijhmOeHTgK6DKbWyDlA1ql1DU8aDkmH2veqRRuXmgUMjgx8x7yAWjc/r1qk+GeDAd56wuFd8sN0DppsKJs6Hi8eBs7aTkvuhWgBNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435326; c=relaxed/simple;
	bh=Hs8G9BdXWWQ+E7HsfMZasw5wrbRVEhMEQGIHOTN3Px0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhKA78uSSsLEtWRpM/SsDBOKjfcVTYwuoK6FJrIskRUT1/ffXv+gsiJkavD2Hfvk9mCnnuibVlaUT0abxE9vDO8bkHyLrPLk0Hz12EgRTzS57UYX/LLRjrZDwSyVbjUzvqNoo2Hk15Lcw6XQODlitjsv+9laBKGHBafKukZDndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uENzFcCJ; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6f95d2eafso101161885a.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 07:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736435324; x=1737040124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDqGQuMss604YjKdh+3KbZqv31g0cBW5soWN0nWP40g=;
        b=uENzFcCJjwn0lkkdYlvfP/lbGHjRsRj2gwxkyLKqmhrrbQ4IH22Sz3+hfF+afkVjJC
         8/v7/xb4YviOr24b3CfVo4DItVK5lLfK34ulOzXcLK8l57ecDQ8vPve6Yavr9L/AIyXV
         rconWqFsa1alAEj3H0JXIDbn3REobiEfaMNnl5O0OPMe09cmEu6cwwEzP6EVpn8zIQo0
         S7GWC4R6x0VHkYb4pTjTufN9De0NMkNJsH9k3u6fSrWrdxSVj51OfUA9SG3Npy6lcvqy
         px+Y1LSfW83fFj6ybXS7U0oNLQuio0h6Y81WyMmisYmBy2uMd6odEfnDCPVhFt5kO1P6
         Db4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736435324; x=1737040124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDqGQuMss604YjKdh+3KbZqv31g0cBW5soWN0nWP40g=;
        b=gUyXeSGD5UHEHZbOU1dcCv2BCwU3scnlg+qNfqhfjm4YVDGLNlFMFrbW0mLVyyMIqj
         v+GTNkQ8dFFUpCRnolf4h5aqdLyO9hl1ThtGm4Ws+CqDM2AR1ZLVElWEXjv2PHa5wUXh
         Nbq7OaagxToxJY2vNuRs5hBIyW8SnjX4Uof2N8Mz2lk0nMbymcukeIp3V+i6NbZWHWwu
         K5F/iYeawU0SM3CMmR9IT1MitiHPqnymt7Y3FjZ8qN8i1DSwWK59JfN4IWqk/G8vcfVm
         TyBXZPPDlQqXeGR85CotV3KNQ2ZihJpnVJzEun/x4Ndeo2MdRFLRipLtlrJhNohgesZR
         Wenw==
X-Forwarded-Encrypted: i=1; AJvYcCVQL/nLXxn8fmOakJXHCvB28syyQRMIB7VovXp1oy9b0FO9vwpGHnvAXSoppKyp3Ghq2DszxwDMxBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynvr+XLcPndQzY0sVSC8hFrY1kiJB7V4d46xiPUn0WyV1mSyhS
	0I0d08lquu8DPIQakFJX/5bKzWtj4u2DYBN1yHlDpJ8gij2dD28SCRyzZ1TtgA==
X-Gm-Gg: ASbGnctwHlULTxWJ3x/0yS1FmVXs/bChSDJJvRdqyML8GT3C8W7/tznr4yc6A3dYB4T
	StNjUvM+wFw68akm/VG+6MdZWfRK3PAD/lqb1tYy1IaVGoUCot56FAUhsp+Gcooz05NWJFWvk+4
	+HvDMGAADVuCtCT1qsQ6NRmtkkFrifaX96RKmO7pCL8yVmTtkyaTdfIZAI6RerwO2vJNk8lxwdX
	ePPROQ94PsvNkUMDo419cM20oH6hKnqETF5AUdqbR2jE9yYw70dq8wPPMO14m2dGXF/VDcTvKc=
X-Google-Smtp-Source: AGHT+IGdYzsmHzGPQ1be8zuaohgSMxlt5xF7Y9moguZZCiNTZC049BYYzClBgx8f75dJqTlJLE334A==
X-Received: by 2002:a05:620a:720a:b0:7b6:cdd4:bdd8 with SMTP id af79cd13be357-7bcd97093f5mr894586685a.16.1736435324132;
        Thu, 09 Jan 2025 07:08:44 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3248c94sm75149185a.43.2025.01.09.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:08:43 -0800 (PST)
Date: Thu, 9 Jan 2025 10:08:41 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 5/5] usb: host: enable USB offload during system sleep
Message-ID: <e8de4837-4c4a-4acd-bb33-6811d7381d20@rowland.harvard.edu>
References: <20250109035605.1486717-1-guanyulin@google.com>
 <20250109035605.1486717-6-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109035605.1486717-6-guanyulin@google.com>

On Thu, Jan 09, 2025 at 03:55:09AM +0000, Guan-Yu Lin wrote:
> Sharing a USB controller with another entity via xhci-sideband driver
> creates power management complexities. To prevent the USB controller
> from being inadvertently deactivated while in use by the other entity, a
> usage-count based mechanism is implemented. This allows the system to
> manage power effectively, ensuring the controller remains available
> whenever needed.
> In order to maintain full functionality of an offloaded USB devices,
> several changes are made within the suspend flow of such devices:
> - skip usb_suspend_device() so that the port/hub are still active for
>   USB transfers via offloaded path.
> - not flushing the endpoints which are used by USB interfaces marked
>   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
>   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
>   pending interrupt urb during system suspend for handling the interrupt
>   transfer, which is necessary since remote wakeup doesn't apply in the
>   offloaded USB devices when controller is still active.

Does this reasoning apply to interrupt-OUT as well as interrupt-IN?

Or looking at it another way: Since the device's endpoints are being 
used by the coprocessor, should the system flush any of them at all?

Alan Stern

