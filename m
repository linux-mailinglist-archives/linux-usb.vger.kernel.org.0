Return-Path: <linux-usb+bounces-11654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A4916DC7
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 18:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E9A2B277A0
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A111917165B;
	Tue, 25 Jun 2024 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uyh46b93"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95C170838
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719331677; cv=none; b=sAtnZs4xE+bktZJxCLbgKY2xieQa5MQI5YRm+sSxJSG2XFrz5ZA2x1droa8b+/d1Xf+r9ZcM7dRDAbj3ODyeZMAsOv6yp5mSzqxYIHOGR804iAUsyepmYkmmcD8u9XllpJBwdnehn7JDBdY1hwnwfjwDGEB7EzuRsqYS/N1YNwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719331677; c=relaxed/simple;
	bh=MITC5Dpw59PNG3gH9LJkI2TRRsflwYIg4/sSfG8aFOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4vm88tO1qYH/aLwd6djYYeylQJXFXd6GApcSDiOe6TFWFxmLQamXu8mPRkdkGhJkOc38mCopj8hcNZD1GWSb7y0T1ku+6/7B1LrKtvb9cddK3HvnWJieJv4azuh248l17kJergN/T7p51N/jpf3fU2rqjKMTxFF66BiJZ2JOWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uyh46b93; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7eee7728b00so211147139f.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719331675; x=1719936475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MP9ThQ+daRDKC61/fbRCzsXnGThsgTesQ7WwlFfdMA=;
        b=Uyh46b9389kxL/t8N/4CMzoaYmjGi7YaepdvgWkrG/h7ACzLySV8TkaE8QuG0x4P0l
         yfav7s+YOcvmntuAwpcOJi09CNiik/oPuLqwf0aDqyhMX+ozfKdGLa3P3p6cHVlS8A4A
         6JeziXA5i69LrkkYBH1Ar7LeGQ3wgJ8f1Nnx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719331675; x=1719936475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MP9ThQ+daRDKC61/fbRCzsXnGThsgTesQ7WwlFfdMA=;
        b=oB6jpEItkkLXb2xC62Nv+SnPjrsd7pMxSuEW+xVVobfCdwOHtPStZZPC5OaXn29weC
         QtBeamWvhFsphaaT97h8dm/wvwXlqydk3Fb7PmYCZXWuFy9tdiaZTmu/WvIFaxDIn5L+
         unC+pCQkDPvyyJUOJbQvur1k0p60uMU5nQuDL7NJ4f1BV2vrJhPcNBJA1xSvI73VUCH8
         34Z6E1DoXvUafZlHHr5iJBj5hAqHYibEiNDps6pXBaD0F3pIG2RCLEhzZH6in5AbTykh
         hoVwGJJFSF16l0VWaFfaUWlT0gFBiN83ecmyj4AfZKuM6a3b1Abx7TYEX2vznsd/QoF2
         kC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEIg7f7SuCe9FvNR1cNqRWelqNprJxvtncbFv1R8T/GNYPJO2xkRU9K3CGLXXUdwaUKZChlWxGKkwPYzhoLAePTY2Wo0Afbb08
X-Gm-Message-State: AOJu0Yzvy0VuzS0bHL1rSuIcEwIzqsTa5nKxMpz5Ksw5jVhhzEP8LWTI
	ISd5ewmOnYVyE+Tv68wI3TQTQr197JVwyls/5yDpWRrcWakVk8b3C0RywCNCEQ==
X-Google-Smtp-Source: AGHT+IFmpORz7FTl3zC3V3Mc8GsQORkCPn6Jex2m3rT9i9BCFGhLbaBTsW1U1XoDluMsGW6HyNjfnQ==
X-Received: by 2002:a05:6602:3f81:b0:7eb:b257:65ec with SMTP id ca18e2360f4ac-7f3a75e3622mr719116439f.20.1719331672894;
        Tue, 25 Jun 2024 09:07:52 -0700 (PDT)
Received: from localhost (11.249.122.34.bc.googleusercontent.com. [34.122.249.11])
        by smtp.gmail.com with UTF8SMTPSA id 8926c6da1cb9f-4b9ecf47885sm1829652173.140.2024.06.25.09.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 09:07:52 -0700 (PDT)
Date: Tue, 25 Jun 2024 16:07:51 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: Add match function
Message-ID: <ZnrrV6A01WWbVNqv@google.com>
References: <20240612180448.1.I805556c176c626872c15ce001f0e8198e1f95ae1@changeid>
 <2024062032-bobbing-backspace-8bd5@gregkh>
 <CAMFSARehnCK-xEe31_diLV_oavMSctXgZZcJKARN8gg443R4nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMFSARehnCK-xEe31_diLV_oavMSctXgZZcJKARN8gg443R4nA@mail.gmail.com>

On Tue, Jun 25, 2024 at 07:27:01AM -0700, Jameson Thies wrote:
> Hi Greg,
> this fixes an existing problem. On chromebooks using this driver for
> an onboard hub, connecting an external hub in this ID table fails to
> bind to the generic USB driver at the lock screen (devices default to
> unauthorized). We are still trying to figure out why the hub isn't
> able to bind to the generic USB driver after the onboard_usb_dev
> driver when the device is authorized after it enumerates. But, I think
> it would be preferable for this driver to not match external devices
> in the ID table. This resolves the issue for me.
> 
> Tested-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Jameson Thies <jthies@google.com>

Thanks Jameson!

To Greg's question: from the perspective of the onboard usb dev driver
I would call the change an optimization, there is no point in binding
the device to the driver if it is known beforehand that probing will
fail.

With respect to the issue Jameson described the change is a workaround,
but not a proper fix.

