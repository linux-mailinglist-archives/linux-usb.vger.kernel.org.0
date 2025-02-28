Return-Path: <linux-usb+bounces-21191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03ACA49CC3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 16:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4CBC1674A9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 15:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3871EF383;
	Fri, 28 Feb 2025 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ME2MWS8c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C252D1EF361
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755192; cv=none; b=APiUfKoWA87FgITlptqajbaP5PwKvghtGTVGbnN8RKwMqnWsbJ0rp2jchpC6rtom1G+NzKiPw954ZcJ5X+5yCTWC7PH3FjDoivSWLXSd42tJ9S4gwVfaFfhPGNS6wTPImYrDS4cGqDJgC6k/qDwOHG7WBAxIE6pIEKw5iR8shjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755192; c=relaxed/simple;
	bh=olVrCQ7UdaQjy46v5P/GSEQYTGRyn0iXsncNea20IsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uh9WshhAsF3m80TL2HAZcQRUzMlWh7LM/37wuFW2F0ZJC1rlcDm3qJjd8if0diyv3GgWsBssA+HlnZnc4nwJXGF+uxoBTxCuVqKxICFoOmwyAsZfjmPBPVT63HnKUCPy14dA9bGtg1/60SqBiqkzgZTymOU2NdolG8GKy1alsuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ME2MWS8c; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-471f257f763so20802481cf.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740755188; x=1741359988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdm5h7ySdGHF2dP5ZUS41EvuGX6rO7bkR29o37l7ikc=;
        b=ME2MWS8cw/pR7gGHK9VgRuBI6UQPxZcNLPxOpzsytnjv96sc3NpqwPUA/XWUDpRbIP
         bHOAwWxPIVu7HV9QzbTgUCGJ++p5N+sOh4acJbcoShbLztswA+ouamkWeNVieumX5u6a
         0+zWdR6pTgCWOHwYkCKexC0w/0rqkhyrgo7xg5Esvx7mnszMDsVRwTFmiaVuIjsKVAqT
         ErkX72obRttYQMkNeVDfD/iURUOB9no+qi5WiCOI+pcUDst/whlSYq9sFbK/4tbwAIsl
         go0qw0Nicwwe/0/3zIORDbX2n2bNfMmK4kLYUr/aEqieiYWG0W+48kigGMN5KSvTAOBO
         uSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755189; x=1741359989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sdm5h7ySdGHF2dP5ZUS41EvuGX6rO7bkR29o37l7ikc=;
        b=W7Y5GngA2Lrxre6ZefnQK4jmNq2CuHmJpDYp1XY8GofEzM4cwuA5djykACiP0LyogS
         QjLamTFwHIwh5ALpaiykXHZfq8U759YEcPVYxBD2B/ivFhN5I3h9Go758fW84ZfoVnWM
         QKqWvGUX0osZdJLr0QvgdryoFaoAj+EaYNTczgJ4tsWNlW7BHP69td2PFJ75EWLtrhwn
         Mt7tPWaziW4/q59howLDJtFa5Rg/xdKOTYkmLxNDF8BN2Rukp+MgokqS2G4m3F+W/T4B
         OJaYDXEuRADYUpyjrYY67O+5z3274d6SeMGOYGMSmBOKiukMAbBIZeczZ1mWihojj8dq
         fkgA==
X-Forwarded-Encrypted: i=1; AJvYcCWuVmDdd/wJ+91aMyFbtiQzcIrJp/bacphdlXkq9ctm8Cqip6btFPK5oSK1p5BtOKhDuYCog+KhTnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6nD7I4fQ9zkOnh4zvMTVMEeMik9/rW697tXmqc0xTKAqZcdgK
	dQ/zyLFtYZqDz+4uboncAfC2anRbXrbmtdE2DPd3V+u1xy8aybkSYSNVbZ3Wog==
X-Gm-Gg: ASbGncuef50CsskQyE91yC+JsDIeqThHfdcHAqTY9InydEckzYzPPk2VdiiGaYzxuXR
	0GBwFNsPAAiLLXo5mJuHCytPIWAyNrM28p0qShP7hrLSwF3uLDMLJR+p5ox/N1BtnmzGpYwQ6Kd
	Cpb1eZT3b6bzYQ/L0BflAobAPv3yZAkzAvgx/GzUaQMCQ4tnKMIyV7MZ+UlOz/YU7wDaaKEp/K+
	x5hT/Ox7IVgpI4tXv7W8AzfqiA/OwDtMWcCgC00U0F4cVy9jOxn3BNYIwI+M1fLy/4NT74h+pZP
	4EMTGXv9T5hYS/LVV0R1kIWarxwc9guRUtOE0XetCxjZtSjW0G66cB7G6n9UTyavndFpfMZloOX
	Bg4/O3eVViMPreApYc04=
X-Google-Smtp-Source: AGHT+IHfWvDK9PeEa52zO3qX3pzdLJiMyo31UITfvvHt1/OXvd6ktHhMaHffVTjDOsAmO6gnooeXIg==
X-Received: by 2002:a05:622a:1994:b0:471:c042:7757 with SMTP id d75a77b69052e-474bc0979bbmr56949661cf.31.1740755188473;
        Fri, 28 Feb 2025 07:06:28 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474691a1d9dsm25621241cf.6.2025.02.28.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:06:27 -0800 (PST)
Date: Fri, 28 Feb 2025 10:06:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Pawel Laszczak <pawell@cadence.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"javier.carrasco@wolfvision.net" <javier.carrasco@wolfvision.net>,
	"make_ruc2021@163.com" <make_ruc2021@163.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pawel Eichler <peichler@cadence.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3] usb: hub: lack of clearing xHC resources
Message-ID: <14c38dde-e2b6-4981-bd24-c714aaa54ef5@rowland.harvard.edu>
References: <20250228074307.728010-1-pawell@cadence.com>
 <PH7PR07MB953841E38C088678ACDCF6EEDDCC2@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR07MB953841E38C088678ACDCF6EEDDCC2@PH7PR07MB9538.namprd07.prod.outlook.com>

On Fri, Feb 28, 2025 at 07:50:25AM +0000, Pawel Laszczak wrote:
> The xHC resources allocated for USB devices are not released in correct
> order after resuming in case when while suspend device was reconnected.
> 
> This issue has been detected during the fallowing scenario:
> - connect hub HS to root port
> - connect LS/FS device to hub port
> - wait for enumeration to finish
> - force host to suspend
> - reconnect hub attached to root port
> - wake host
> 
> For this scenario during enumeration of USB LS/FS device the Cadence xHC
> reports completion error code for xHC commands because the xHC resources
> used for devices has not been properly released.
> XHCI specification doesn't mention that device can be reset in any order
> so, we should not treat this issue as Cadence xHC controller bug.
> Similar as during disconnecting in this case the device resources should
> be cleared starting form the last usb device in tree toward the root hub.
> To fix this issue usbcore driver should call hcd->driver->reset_device
> for all USB devices connected to hub which was reconnected while
> suspending.
> 
> Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> 
> ---
> Changelog:
> v3:
> - Changed patch title
> - Corrected typo
> - Moved hub_hc_release_resources above mutex_lock(hcd->address0_mutex)
> 
> v2:
> - Replaced disconnection procedure with releasing only the xHC resources

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>


