Return-Path: <linux-usb+bounces-13094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2291947C00
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 15:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89CA61F2242D
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02C13D0AD;
	Mon,  5 Aug 2024 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OFb1tukG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4BB3B1AC
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865143; cv=none; b=b0lahfeDEnOdDMIYzSwIQYMPdgzT6rWrYYWrD1rziZdn+iEtQ94YOaRPflpMzFow0Mb6DTrzOPclA6ma+Xn0IA0A2w9mz1SoVqBvJ7ShHemTrO1Sw13VzSKOgEmHh/rW768htfD/sc6iXVbxShKhihH5zXFTFDw6xMhvhA9mxo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865143; c=relaxed/simple;
	bh=gbQ+jMJAD5sj8duWQJ3Kwg5JnBV26mTB9+LVTMbYGZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlxTN2+UNl6ytYcGRYJcQ31pYJbh5nygHJXfpAkHmKhizm+VH2Z5eAFQmgyyLZ55OszChaQw9L0X95S2wl4I/8ZEKLRfciz0qqrxPfGB0hbYD8l+PMTsH7Pv3JYepZX4CLh7AEGl5BcoYRYnWXvR99KOy530R7uSoOozao590ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OFb1tukG; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a1dd2004e1so663254285a.3
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2024 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722865140; x=1723469940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8macHAiM5m9R0JEiyIq2Lz6WrfRpygRAxLQsH7F45I=;
        b=OFb1tukGVJTBIQLI96v2SMEZOOSyPLYongMAdDfByC+lRCwUiCXUupdvpzpGATJh31
         u2Raz7DohT9QidMpJukM8Ro0fnI+WRl1ygIBuf6oSJgOd6RC9Um++B4gl7XOVuS0fnLC
         xgOTu1CWbCR15Um/KkAPXsX1bkDhTBTlwA9io6FBLmhjEt7laHvw4RvQfh1jr+LuREnf
         kgq+gmLvBdcDEjhoruLrk7lwUDK2slQvQsd1Dwpc1A2Z9/OZatSb35MJetX4y9uE1UnM
         g4aFIi2uRVj8xQwM/rczYkgmSjfxV/2Y6Vl4QZTH2PwW6/roHNMNVZY6XbgRE7+8Zl2e
         I7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722865140; x=1723469940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8macHAiM5m9R0JEiyIq2Lz6WrfRpygRAxLQsH7F45I=;
        b=KQHpQivS8a79vAmdI7lv27T2gLb8kIvmJB7CxjJ/NeQowebD8WF2Duh8rlvtU0OZOx
         p8gAT2D3zwt+zq3IUFy4zVVfDn38Gpwmkn/wZdjmPfP3Ruwv+t3mb8Jq1/IkZGDcHLdA
         e/b5x9XLy4/RK4uzWrOz0S4qfFErprVDbBKyUfPSxgcQM3wtMPsJmxKCNTeikhJPVfZR
         WF1wqDAlCBBc9oWTKVGBv/iJshKkdEDJpGCQP73cFarYsSvNHkjXZtzrZuKW2cpsanjo
         Hosmmt3uyPMrhELiDw7TP9fIYg7hNDR61aWPmgKRCNMgrvDN1PBUxkgfCT1mYwLtKfJ1
         ruhg==
X-Forwarded-Encrypted: i=1; AJvYcCW0i7YsQ0mZi0Mg53a5w2uIV16c1uCxv4llMDNp1xW3ksI7kJEgDzrYFgcPahekNdSSlg0MxZYzY2bIhIRLvPtj9djAShUzRTyR
X-Gm-Message-State: AOJu0YyGXgWyrtubRtJs0S4ZErkzQvnDB+XK70YCysgaNJliNDNpW/tD
	OhPadzbftP9/Yk3Tb0DmdUP1bv+bPeXTk+HxbexitHpN+xhZcTSyv4h/1K+GRw==
X-Google-Smtp-Source: AGHT+IGwcJnnVolHqIHl/PLBvGhdpuQKEabkjHVeMeMNQwnwyA+CGsL/UDaOAmH0C2fraA4jqEed1g==
X-Received: by 2002:a05:620a:2682:b0:79f:498:2a67 with SMTP id af79cd13be357-7a34eed3c80mr1377167085a.21.1722865140407;
        Mon, 05 Aug 2024 06:39:00 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f624219sm354231085a.0.2024.08.05.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 06:39:00 -0700 (PDT)
Date: Mon, 5 Aug 2024 09:38:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: hub_port_reset: Remove extra 40 ms reset
 recovery time
Message-ID: <5b1d4bea-8d39-4f29-85e6-bd36c12510ce@rowland.harvard.edu>
References: <20240724111524.25441-1-pmenzel@molgen.mpg.de>
 <c7c299e7-605c-4bd6-afad-dfbfe266aa7e@rowland.harvard.edu>
 <f1e2e2b1-b83c-4105-b62c-a053d18c2985@molgen.mpg.de>
 <3d3416cd-167f-4c50-972b-0eb376a13fdf@rowland.harvard.edu>
 <cee9630e-781e-49b1-82c5-9066552f71b1@molgen.mpg.de>
 <8e300b0b-91f8-4003-a1b9-0f22869ae6e1@rowland.harvard.edu>
 <712dee24-e939-4b1b-b2ea-0c0c12891a62@molgen.mpg.de>
 <7eef194d-17df-4681-95aa-be6ec09b5929@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eef194d-17df-4681-95aa-be6ec09b5929@molgen.mpg.de>

On Mon, Aug 05, 2024 at 10:19:17AM +0200, Paul Menzel wrote:
> > > > > > > A better approach would be to add a sysfs boolean
> > > > > > > attribute to the hub
> > > > > > > driver to enable the 40-ms reset-recovery delay, and
> > > > > > > make it default to
> > > > > > > True.  Then people who don't need the delay could disable it from
> > > > > > > userspace, say by a udev rule.
> > > > > > 
> > > > > > How would you name it?
> > > > > 
> > > > > You could call it "long_reset_recovery".  Anything like that would be
> > > > > okay.
> > > > 
> > > > Would it be useful to makes it an integer instead of a boolean,
> > > > and allow to configure the delay:
> > > > `extra_reset_recovery_delay_ms`?
> > > 
> > > Sure, why not?  Just so long as the default value matches the current
> > > behavior.
> > 
> > I hope, I am going to find time to take a stab at it.
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 4b93c0bd1d4b..72dd16eaa73a 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -120,9 +120,16 @@ MODULE_PARM_DESC(use_both_schemes,
>                 "try the other device initialization scheme if the "
>                 "first one fails");
> 
> +static int extra_reset_recovery_delay_ms = 40;
> +module_param(extra_reset_recovery_delay_ms, int, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(extra_reset_recovery_delay_ms,
> +               "extra recovery delay for USB devices after reset in
> milliseconds "
> +               "(default 40 ms");

This is a module parameter, not a sysfs attribute.  Module parameters 
should be avoided if possible, because they are much less flexible than 
sysfs attributes.

Alan Stern

