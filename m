Return-Path: <linux-usb+bounces-22620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446DA7D99B
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 11:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633F318879A7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B571C22E40F;
	Mon,  7 Apr 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bV6hQi8g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8712C544
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017790; cv=none; b=PskPfSp1Wsr2+j5LoqeR1Rk6ZZKWwC0PwftSWR/yQmUj/n+kqCRZPcMGepUnOj5YRfgkMadQzVx7LgQdPVw/8rFAVVQReLdtR47OVXupP9HyV9CMeGuztusFIn4rQ2mHu8C9NpjdXEBP74Tx6e+SFgYobCyYNn15fdI8j0EHhlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017790; c=relaxed/simple;
	bh=r9RqrhzeutBtIOlYVz3agoheAkTOhawsk2ceW69HgXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mo+thJbJUsU5JCg+IsZf9nrKyc//XJMSUEGvOpimvJi7AVnn6KoE3ob5LOaxC9NdGisv2YJncoff/BR5ywacN7P17Qm8yQvrtc8zjQ319vFi0WLDPCMk5JGBNCAXTJcqcs1OYSuLw0l/EL9HFY0bSkWrjELuZnZTutUPwGh7Ebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bV6hQi8g; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so23676605e9.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Apr 2025 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744017785; x=1744622585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GEB2/7f7npYgGmINlGKb01Ype4hZwo/GgBaLZ4O8ec=;
        b=bV6hQi8gv1oYpnl4voM20JEKrXRqL0/1yGZfLVjoCkXI+wWagk3OajeMqQARB/dwmL
         Bh5BltnRj1u3oQb0lqubM8jSGfLyH7EJMcRmDgHC6VjyEiCA/OLo8QKWqZU54CehYTuI
         +Q2NdhYWwlewk3zGA4e2jleojLGvyrdRhIiP1q9S2AAlPS9v7ZMCQyrtl++TI1E7KVaO
         HwSS+jGezW53MXTWfUc+kAghRbURXCZnYFfg2o1ZogQnsoR5RmSH7yEbPfsR4e8AmNxl
         s98htRANFyNEORiRnqLAdbofycF8Psr4EqzwBlXrs7rGeu8yUJq6B+BRV+7ruWiHrhTf
         oR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017785; x=1744622585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GEB2/7f7npYgGmINlGKb01Ype4hZwo/GgBaLZ4O8ec=;
        b=AoVTRrhdUF61awhXruYp+bxH30PO3TtXmPQjs4eLT1iBu2cHHmh8CaiePuo0m0KVJZ
         zphGDdQpbppdyhet+qIrkIeTBUaOAG4duOX7tnbqDaCdtKzFrbFIW0TQ892Uy2cQbAan
         NsRC4v97K7zu7LgkyQ9O7K5gpPoNKm1WDVKyllepewBwLVmy21YkQMdLGxBgSMQaRQjd
         ZdUhmeJTOrMmNQp4ho6w57CAgd8iFxuu5agsy/1CIk2e/dlJjJuiGfYQSyFFI9uuRMKt
         2o7zUY2oH3uVn7xycDvPx511lvRBhQQ6QhN1vROFaghEY0/RLjiMd2RAjo/5jeBIAekY
         CNmg==
X-Forwarded-Encrypted: i=1; AJvYcCXPEx49ZRpJ3+koPQ4vNe2zPtDikUrBQlmcVT1wMpeenWYDcye9eWy1AL4aRCWXOj3JReVuSzA47D0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgfBDr3Av2iwTSFwuRnvMQTyc88jt60xMknRCAkrsHg9Pbjpc
	7ly6FEe7rKe3xYgTaB5bpibWhhJIfi3DwZ3b4ODPN9NpAMxdoSLWg41Zsi5wA2U=
X-Gm-Gg: ASbGncsPNv5D1EhDOT0W/LLkvMXHKv+1tsfsppUyktofjSYOm8w4iMzp7zttSG4+r07
	1J+E0DxUCbuTTjCc/p+eEqXUgirNNB0R1T/9rSE12vTjaQh7DO1qjBl9kHyHUw4bK4IDzCv0P3E
	vxwkHy25icqDvUUiG2VrWOZYOhMUW1qDkKbIncxc1S4IlnfP7GeFqvM6h4VQLSlxltLtlFQ3bGY
	lxuCAbo3t8EKfvNm5JxwfJPLf/dHxT5LKCaOUV22tKqWUcPH1yLSvUKZOpvqHvUhx4cN7a3acz9
	X3TtktWbb5EeOGgJ8WV387pe6VC9+FddAwvg0LpdfpJ2Tz6EJiim4oivZypxnMvOdSNjPvuTpCO
	9mVnTNwt/qaI=
X-Google-Smtp-Source: AGHT+IH2D4ZOZwcneAudIPcxeXzVvvPrAKJL14lK9bzoixHtxQl9qS6i6XTiQ1W94FT9J/YucBQ34w==
X-Received: by 2002:a05:6000:40c9:b0:391:43cb:43e6 with SMTP id ffacd0b85a97d-39d6fd022a6mr6415177f8f.51.1744017785228;
        Mon, 07 Apr 2025 02:23:05 -0700 (PDT)
Received: from ?IPV6:2001:a61:1302:8001:d2dc:b329:7532:c373? ([2001:a61:1302:8001:d2dc:b329:7532:c373])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea9a346e3sm110990905e9.1.2025.04.07.02.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:23:04 -0700 (PDT)
Message-ID: <9fdb5e30-8570-420f-940b-bea5fa72e12d@suse.com>
Date: Mon, 7 Apr 2025 11:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: avoid setting WDM_READ for ZLP-s
To: Robert Hodaszi <robert.hodaszi@digi.com>, gregkh@linuxfoundation.org,
 oneukum@suse.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, viro@zeniv.linux.org.uk
References: <20250403144004.3889125-1-robert.hodaszi@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250403144004.3889125-1-robert.hodaszi@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.04.25 16:40, Robert Hodaszi wrote:
> Don't set WDM_READ flag in wdm_in_callback() for ZLP-s, otherwise when
> userspace tries to poll for available data, it might - incorrectly -
> believe there is something available, and when it tries to non-blocking
> read it, it might get stuck in the read loop.
> 
> For example this is what glib does for non-blocking read (briefly):
> 
>    1. poll
>    2. if poll returns with non-zero, starts a read data loop:
>      a. loop on poll() (EINTR disabled)
>      b. if revents was set, reads data
>        I. if read returns with EINTR or EAGAIN, goto 2.a.
>        II. otherwise return with data
> 
> So if ZLP sets WDM_READ (#1), we expect data, and try to read it (#2).
> But as that was a ZLP, and we are doing non-blocking read, wdm_read()
> returns with EAGAIN (#2.b.I), so loop again, and try to read again
> (#2.a.).
> 
> With glib, we might stuck in this loop forever, as EINTR is disabled
> (#2.a).
> 
> Signed-off-by: Robert Hodaszi <robert.hodaszi@digi.com>
Acked-by: Oliver Neukum <oneukum@suse.com>


