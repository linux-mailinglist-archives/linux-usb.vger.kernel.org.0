Return-Path: <linux-usb+bounces-10733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4468D6A04
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 21:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25D2A1C22F9B
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 19:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CF717D341;
	Fri, 31 May 2024 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBqMBe9I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB5183A87
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 19:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184584; cv=none; b=EVH74CaOjQqV4h6DxNGry+sIK452tVUaqfowC5SN3zAZdkIJ5emcXORrEeMnutQLHu8zurgZ/ugw2UofgNE6hharaL+jM9vGeLwUtobdQhOwRFRyRvk0PhEEUNKCiboChUhBPbIp3DBUoCxiUGj73EbHLUE9ka9BjKS9uhQ9Txs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184584; c=relaxed/simple;
	bh=f51U8aqpLXT7drYRY/VYQWiKVq6GFj4oP94dMlSV8i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mcm+ZLIUAiGSoxlrsx4udGUOfpRwNAFUbOvvrAsDKkUgegOp8uYJkrbPLayLZBP4/jk26QezxubOOmwIIxInRUPVtw3i11y8pY0PlIc0xKM021BD6cmD9W+iJb1kk2GjVyunCj8RV6yhxpBi3hdeqAeKfVACXMxKfyU5wSCcH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBqMBe9I; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ea24dfd508so23998051fa.1
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717184581; x=1717789381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cj95dgjOxLUo6tCNv9nV5YDxUYseJBGSFHyhTNhlFaY=;
        b=uBqMBe9IT/BBCKnbvceSWqWifmovCuZ2O+hlH3sfN8XOkfGuUjc9k7bWrq+FfJDvmJ
         31Ue36F87/NzFmI8xn6+xshJVa8VRiTcuIwgmxH9ux7avAfM6Ca+LZqdaHpEx9NXAG17
         u/Aa51KIUN9o49531HkPRYK+eq6DkGqB5ZYcFfllwvnwzw8sDgmhPWMQrOT33LvUSAD4
         Rh25um0zOcD7is1G7sYUBmGLcDe6IqoZktAzjoFDlGE62YcOUJyp2BgzLH3FsZc8l7Vo
         pbpHkF6woey7AKPzoPBhCuFou5McYEzytiLlwwUt1VKgzsoBHjY+QMlNx0rQcqAjEoqB
         iS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717184581; x=1717789381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj95dgjOxLUo6tCNv9nV5YDxUYseJBGSFHyhTNhlFaY=;
        b=HvGKrgeEC8R3ai5SC3jRx8rp60d+4PS5TpMB1FvqlWFdz+WyB4q+lpswv5lc0dNJYc
         S6YtsElhPHntQLXghvwNEAPJN0TDLJIb75mLM0PdDek+Npy48eN0iJ0FfcKsvMawmkgc
         s10fQjTgMGox29W07ULHRJspiTkb0Pb9+lJjtLMR0dDEqPsydtR2jXlHgx9yPlZaVb8w
         yRpoKjPfEkyxqPFiEWM3JuWx8uOUvvq0Y4kCmVxi87N2uaL6TeKLgRLL5UH/iH5CF4zo
         sJZ0vmdDKQBkxnfn/wWiB3b7U/2lT1uOltgDExxwkfhHjeyX6e7Iddlo0VjgTIxboUjz
         3liA==
X-Forwarded-Encrypted: i=1; AJvYcCWzWG7lHVCHjaT8UeMQX8sTLbmdKWMpsWRYTB9YaDAj+vAhTJ3PZ7D9g5hybh4N2UEVnxQtsHFAX2Xa8Xpwq4ZdDJAyu9CvLFbZ
X-Gm-Message-State: AOJu0YybCnt4oLHMlrC1RP/EVmwj1VLQbioJ6UNBaalXAm1nKJDiTVeV
	p63hS5tOESHofu2UgSPicCr+/H3vk4hmVC/AfGuYIjKyVM7EsLvn2cYxfAND1fw=
X-Google-Smtp-Source: AGHT+IHzqBZ1LEUcFL1D6TCejJenG6VfoBrosLpFZFBnTRXCL735J0NFUWcPUhOYmxwkj1m3ii5Rjw==
X-Received: by 2002:a2e:b019:0:b0:2ea:97a3:74ce with SMTP id 38308e7fff4ca-2ea97a3768fmr7246431fa.5.1717184580711;
        Fri, 31 May 2024 12:43:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d739sm3809701fa.9.2024.05.31.12.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:42:59 -0700 (PDT)
Date: Fri, 31 May 2024 22:42:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 3/4] usb: typec: ucsi: Delay alternate mode discovery
Message-ID: <26wuxpalndpjdpxbvi4cch6aixtv6zwofyefnnkc4ngkt26342@s42issc4douq>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510201244.2968152-4-jthies@google.com>

On Fri, May 10, 2024 at 08:12:43PM +0000, Jameson Thies wrote:
> Delay the ucsi_check_altmodes task to be inline with surrounding partner
> tasks. This allows partner, cable and identity discovery to complete
> before alternate mode registration. With that order, alternate mode
> discovery can be used to indicate the ucsi driver has completed
> discovery.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

