Return-Path: <linux-usb+bounces-10734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F88A8D6A06
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 21:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F8D1C22A51
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 19:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE8517E464;
	Fri, 31 May 2024 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrJhPj6Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A987E788
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184620; cv=none; b=NB7sQmVr/WxvRJkMcVVAhRAhXjvsyjxFcLJ/Yv8pvU1BmFbzZAhLpZFAgs1WTZwdVaAAVhYofj94crfhB+OlaRgYsHqKQqLzkHAQJVdNzi7ONx9HIdB+QZDSBPqN0I7GdpwIfgIRMxVNgRGucmfefZzGLLJ8ZEc/qZvreHSzlTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184620; c=relaxed/simple;
	bh=4tvjmu36F6bVNll87Rdec66D3Daq61/yZgAKaXG9tA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJQME5BNel4fzQSegaE/DaERvGgQ2cTIh0Fkg0XnxV1LF7TF/HEXaAgyjHikcqG9mHrFTJRsktIv6Px49TheBI4J+LO0pIezS+RekrJ7Y7kKSIooBb8HeoSvY6C5e+kGIlb2phmrP/+Xv5OqFyHGMWXNETqM5bdeeNldc1UF2fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrJhPj6Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b27afe214so2075943e87.1
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717184617; x=1717789417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpEOVVkN3svgvLJ0MSvleVz0zBxYmtfdpebZBpC6rKo=;
        b=qrJhPj6Y0J1Bp/a3KHTPqHe4Ki3QnE1TD+9YoIlSnJNmFbJ+BjmAGoCJ5I8yYrqPtW
         tA0XCPwHrqw3Rc0W5roDyRm4RE5gngHnuEl3n19sLjzpU77ZpKKi8uTpr6w1xGzHOSQQ
         ZS0D1SC8C1aF9fE+fnhVdRMWpvTJKABbdA+A9nID5T20tLwVOUjF+RhpaPWKM9jP5HtI
         dKiXGX/R30S5JksJ0p6rk3/Kf/8cPmw0FIjNSK/Dr0BeTC9PyLRc6PYv38V9kNU5DtVZ
         DxiP3UrGyYQ0xb/uroEZ8JQLwRHrmXBjTkqEXskEt+JqFx/gYJGbO/TAJ5OaJRHTzJDr
         adkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717184617; x=1717789417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpEOVVkN3svgvLJ0MSvleVz0zBxYmtfdpebZBpC6rKo=;
        b=JSjF+o7IGvfuvJFt3CJw5kqLWB8imyGe/TLy7EJjZWb38+YqMnKhbcO1mis6Bs7iop
         839iGnVxZBraYUbG7wC0r8JIkqr9RjJgKkjs9oDqYiM3+QyQr8Y3Iu3ORXWvv3J5GJoF
         DPUGQa9qCmubk3uwPKbWw+e0LHfj/qLG01xNPEcyoYBOuBzN7LI+4TUy8TzJ9ejjLy3e
         pVHOx134yb41kx91Cy5buAnXJSPrpG/MQbM1gQgo0uExxKeQ0rMtkULfLCsvuhIZtG2i
         XVlvq8HDL0Yvp4pzh/Ndh2vznvY2BVwfceLTXsw+VqRDJ7njDhe7vix6S5J9SfcaNQLA
         INrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzR6LRjLXz1hZCcHKQtrKVC/aTN192TO8AzZSZBSuLIp5fh8rSDqrKj1KkO+SN1aWvlL6AXS8n6oZc+eFDKnspQWg3+8o26+H8
X-Gm-Message-State: AOJu0YysTG+jhcjpXzANJD8cJ7HudfRp3WaDpZQvmOkWHxU10GQMLRI+
	qo5vHypuL+ar/dhA1MMZJhUrKXzrBJ8HwJW7HkJ9UcehNPTA8VDCdwurHGDUJHY=
X-Google-Smtp-Source: AGHT+IHTgcrjUunFR0ynx7TMorgozqy6t9LcOd6tSOk8IoMTI8CWw0qRJ4Kk+E9LurNmgIN2XPwxdQ==
X-Received: by 2002:a19:f519:0:b0:51f:a4e0:8b4a with SMTP id 2adb3069b0e04-52b7fa347b1mr1639739e87.21.1717184616749;
        Fri, 31 May 2024 12:43:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d76217sm418812e87.121.2024.05.31.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:43:35 -0700 (PDT)
Date: Fri, 31 May 2024 22:43:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate
 modes
Message-ID: <6lvxjiaxlulwknxo36x5ll7ueneqvu7paiz64vjmzk6v3cbq5d@5s7dkyowtabu>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-5-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510201244.2968152-5-jthies@google.com>

On Fri, May 10, 2024 at 08:12:44PM +0000, Jameson Thies wrote:
> Providing the number of known alternate modes allows user space to
> determine when device registration has completed. Always register a
> number of known alternate modes for the partner and cable plug, even
> when the number of supported alternate modes is 0.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

