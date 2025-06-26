Return-Path: <linux-usb+bounces-25136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC81AEA47C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 19:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E81CD188BCD5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 17:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868F32EA48F;
	Thu, 26 Jun 2025 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="XOprbVTK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F0214236
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959349; cv=none; b=pMjsEp7WYpmcpVKdpcoHAQGld7HDw24RoXKvehaqrPkG3g+QZsFULcn2wZcSK0B/3BhWB52clWH6SiCS1yftzFbE16OCn3nqXuRCSVVCtVOCOMI5LsyNvUaKWD32tPsa5wVndDgnUZiUyZPqmrFMSiQ4eAt1XhuNPiHZx4DpsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959349; c=relaxed/simple;
	bh=owqT5Dg+crvKyuGwL4S60bIfz9jQaJ4PE7SMHfA70y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx+fHWK2zU/AU8Pr0uYuPebMMSFlZkP/vnuxFAc1NVGaoasXza8wI0y/YdlqOhXe90+jJSZ0cyUekvT0EyLoseP82pcDup+xaWw9mtSKo51qBa/Ubi8EFFaqHzvTqSAwJboIoD9Jrk4Yo8wV1cU+2NSGylxC+g+wb8Juf2DAc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=XOprbVTK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a6f6d07bb5so15421391cf.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1750959346; x=1751564146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kq5YiwCJOc6rM6hfYT6kDVkrdlebVMFigkkEqCw26Wg=;
        b=XOprbVTKM7S4P3uS7aFLIGwt02Gxazu12VJqK/hs/aAlMwcz/XlBFkXBaUWZ7eeazi
         iPPcfGDhCTLN53TvkfuGGjEd88j6fsDs9cwpK6jTARXjfzNBnKIrgc27eLgLY1EReLT4
         Xs13L8mKdW05bwu3/WGFc70RY6/xTy3AHs4uuLfOEWBvmLt0uFVFSUAAhG98uTN+x1BM
         c0Hww22d0GocyUShHhtj+wU+LhloJfcJg/Bc8fB4nnKU4GaQB4QE/bh21rp9/Q+ApYgG
         gPGOFBWDaUTGUIcI86U+WgkUnjA0KKRkQRMrCJHJ1lUS4cedfe/rgR3LXGZat1+BIDig
         W+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959346; x=1751564146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq5YiwCJOc6rM6hfYT6kDVkrdlebVMFigkkEqCw26Wg=;
        b=syAiVQlaIeGZxKR9+15uuw2Bj0oEpityQTJervghjwTwkUeIyT5+g/4TykmEpIBCnf
         xUqIaC5uKsGVQ22uHlYBrY8CM6KETqyIdRlzImgtRZfEEhWlFpOyDYCkttFL1xJxcJgH
         57/kh0c5gsFaeD/PwDbYwVRsNfK1dmnUGAxMvBPUJJKe4G+in8nf8l89YHufcbGK9Wkj
         MwXr/W9u0Via5ifmoWhk21M8HNJsY1yeMz9wRdzA5pc5MdiU5oiBjbcfjeBICWEjdVcy
         Wffo5nwXx6n4WlXAawUj/sRIhmAo6P3pPi5IuxSiDH9d9qA71Hxc20ea82vjYAOP4diD
         x5EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCau6B29xEbpO23gWjpPRefLqyyBxwdXYBdMQjUr4ZuOitFyhJv7dQysZmfBCKpNbx4RElIGWYrTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1KSF0KMXKwsKqoRrZPNopSLG1s+hOUOu7fg0mOn1uaYVln/H
	MVaHFfoje+7+MBMXHJR9aQTlndcVvTsBgxB6LcrydLAtzJYytRKNjKOuyCdVWm/SDg==
X-Gm-Gg: ASbGncszBE/G5nWwGv1cvEZPgQXJID66qT7yNxtqYJwNl/s3r9mHsKxMGgvO6h+TJyP
	7tyxLCwO7dGdFRNljyZ/ZII4YONsDszO+rt6dXmvwYd4hOiTgWYlnLZhaN6c4MRjnihvduE9/YV
	KmGJ8paa1fAcmkCZoDmJjMoNsbgsYlm+dbsnzHQnapKRv1CgiCyPa9XncGSfEUw8a34H0kkz4P6
	xQxaiSslBMFlmFwuZrWGLv9Z0f/pq1ZwqFcj0R7vbSooRrsfIl1j7waey2EGo4ZKI313u5qnlVP
	40Fts1PR240O3zdDIAfPdFiRLQH27t7G8fsUY8kJh4i0CIj1ZutpQC20W3RV6dW1AFoQ1RI=
X-Google-Smtp-Source: AGHT+IF4aBQ7fvxJXfKi7QHAZH93XBf4dITeJb2LNxUlqLidVkaBB1/OMarQUabX97CPuzGxK0Hq3Q==
X-Received: by 2002:ac8:5a4b:0:b0:4a4:2cb0:2b29 with SMTP id d75a77b69052e-4a7fcbd4724mr6757961cf.35.1750959346392;
        Thu, 26 Jun 2025 10:35:46 -0700 (PDT)
Received: from [172.24.25.40] ([65.222.209.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44316d85esm27760785a.35.2025.06.26.10.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:35:45 -0700 (PDT)
Message-ID: <f8988d47-d84b-4cff-ba20-9b3341879354@zetier.com>
Date: Thu, 26 Jun 2025 13:35:39 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: musb: fix gadget state on disconnect
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
References: <20250624140930.25887-1-drew.hamilton@zetier.com>
 <2025062456-cameo-directly-fc66@gregkh>
Content-Language: en-US
From: Drew Hamilton <drew.hamilton@zetier.com>
In-Reply-To: <2025062456-cameo-directly-fc66@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Jun 24, 2025 at 10:16:30AM -0400, Greg Kroah-Hartman wrote:
 > What it does show is you missed the many thousands of changes that have
 > gone into the tree since -rc6, is this still an issue in 6.16-rc3?

Retested against v6.16-rc3 and confirmed both that without the patch the 
issue is still present, as well as that the patch still resolves the issue.

 > What commit id does this fix?

It seems like this issue has existed for the MUSB driver since the UDC
'state' sysfs attribute was defined in v3.1.

Thanks,
Drew

