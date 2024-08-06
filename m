Return-Path: <linux-usb+bounces-13135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1C9491B9
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 15:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F317282F8A
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 13:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1621D2F60;
	Tue,  6 Aug 2024 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="m6BU9HvT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECBB1D27BE
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722951531; cv=none; b=Jmmq7rA0hDic+MTPUNzqudn6Xr5khe2kzwMHzzYiGe0dWyvMESylvFHZ5KPYpZiODT3nu6pf3d5j+6mjYh4xIKd0YStHhSM9Z4kwxY0api5lnWW+dU4fFJmwfZeA75YkXcCsvKsPw2K+QjJOs3hSSieSPJ+ILvPTV7lIUTXNz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722951531; c=relaxed/simple;
	bh=XDJwCo/h/M/ZmSG3Xc/DIm9ivwODOk2659C8kTOffJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c62MUjyho8+LGH6FPt6QpY/5GHXALH7h77Jd/zHyg+QPzZjkteLxQDJkk084GPhR33dMqVwwquddF6/ZGj7fv+20e5B9jLoWmdNYlSw+bZLa+cnfg+wQKbeLBCqdVcqkHywtaZYuV7nzR/3/g5GsXZpJ4CubrvoCid9yzmQeZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=m6BU9HvT; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d436c95fso31832885a.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2024 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722951529; x=1723556329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dLrcx4hTpQ0PboOrNReCi2rK8G3ZQu70WmtPK6NfNrk=;
        b=m6BU9HvTppCqqHApsqso4sj4+MzGK+JPo+ydSkb1Wwb+SR+oKG6yVYDgEx8gfTQ1WL
         EI50QUvIFg9GyjytlPgqYDZ0zcOQlylk7P9zIIhImibw/D65DCZpSd0EYoVJplU5iR7O
         SDpdGL8ixZ/6d3ETvTqOE+tnPlV0gHTMT9TTfUM0NmmGiI0ohuOncFRal1jzOYlTkKg3
         MftoA6VDuqk+QnImTFweODtFPFuLJUDAtgkicdQVqOKL0Fq8mulY59sXKhiMB//WaGr8
         OFqLBCKgJo2QRORtv4aqP+vZCgkypxrgfdA2Nhwx2BGYVgQ8yWhYNZRKtpOIowu+1Hcp
         y0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722951529; x=1723556329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLrcx4hTpQ0PboOrNReCi2rK8G3ZQu70WmtPK6NfNrk=;
        b=hYbgiCzgXunh0zSNzejiGW4kiBiamASKlk319/Scvugz5+dfNt8RbCq+D7aUinHfep
         Giaqjiy6LSKNc+QoUnvyuFLostUyw0hswlEfbUwby6gNuh7R38iopM4M5wKkugcVcDoB
         EWEr3ybxTlGvCOu+GjF1tpxIAjPD17LpWS+y+XetyhWzqpZw8USYvf79rE7m4j37Zpbl
         vzJYzJ6HO2dy5O4GpxQAWa9sr2+3SvAXBIYJbSVuIAyndzLtfGTc9vJRnocnBOFlsW1c
         eitMqQs3Yg7/zwB/mbaN+GHTwPA5uEW8BcWiCSBmhflr7hTqZHCaMxGRjWpuIfxBDGwd
         1fcA==
X-Forwarded-Encrypted: i=1; AJvYcCUrlJzlkRPPscNojIqaMoDtv7sX53OzpSpg5NoL9sPaA5wahXWCXBI/C+Kjdr//cOffE23PXgC0M5dKgV9ZQ1lUvXsAsQtxh4C+
X-Gm-Message-State: AOJu0YwvGU+36j58G2EylFMss9IT3Ug36IKKJbZ8bNJSDys36yGLZi8A
	u4rpk1rw2+CdPLqzb/HU6OtN1OpjsNq6sHUKSWC/2HT/DORUWw+lBLJxfmMw5Q==
X-Google-Smtp-Source: AGHT+IFxdSCruZKlRJfn8gDEDSSUyxF700rIX9BIcCRtb+/pa+qm0TY54qO4RzYMbEBlxSb5Fkaq9g==
X-Received: by 2002:a05:620a:2910:b0:7a3:4946:d483 with SMTP id af79cd13be357-7a34eefe5e6mr1917592685a.16.1722951528976;
        Tue, 06 Aug 2024 06:38:48 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f798193sm451544885a.136.2024.08.06.06.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 06:38:48 -0700 (PDT)
Date: Tue, 6 Aug 2024 09:38:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: LidongLI <wirelessdonghack@gmail.com>
Cc: gregkh@linuxfoundation.org, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, mark.esler@canonical.com,
	stf_xl@wp.pl
Subject: Re: Ubuntu RT2X00 WIFI USB Driver Kernel NULL pointer
 Dereference&Use-After-Free Vulnerability
Message-ID: <bc57c8b3-4334-4595-8b5a-5233316edcfb@rowland.harvard.edu>
References: <2024080359-getaway-concave-623e@gregkh>
 <20240806015904.1004435-1-wirelessdonghack@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806015904.1004435-1-wirelessdonghack@gmail.com>

On Tue, Aug 06, 2024 at 09:59:04AM +0800, LidongLI wrote:
> 
> Dear Greg,
> 
> Thank you, Greg!
> 
> 
> Yes, as you mentioned, it requires users to create their own udev 
> rules, which is not common among Ubuntu personal users. However, in 
> some non-personal user scenarios, they must pre-add udev rules to meet 
> their needs. A simple example: in some Ubuntu embedded Linux 
> scenarios, we found that when starting a wireless hotspot, developers 
> must configure udev rules to ensure a stable connection, enable 
> auto-loading of drivers, or auto-run or write USB-based 
> auto-configuration scripts.
> 
> Alright, thank you for your fix. We will proceed to the email you 
> specified to request a CVE.

LidongLI, are you able to test patches?

It looks like the driver does not properly shut down its async queues 
when it unbinds.  The best person to address this problem is the 
driver's maintainer, Stanislaw Gruszka.  Nevertheless, I can help by 
suggesting things to test.

Alan Stern

