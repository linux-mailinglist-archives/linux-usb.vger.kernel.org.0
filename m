Return-Path: <linux-usb+bounces-24403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA0AC9A96
	for <lists+linux-usb@lfdr.de>; Sat, 31 May 2025 12:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7494A46B0
	for <lists+linux-usb@lfdr.de>; Sat, 31 May 2025 10:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F86239E77;
	Sat, 31 May 2025 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="R1LY447n"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBF238C29
	for <linux-usb@vger.kernel.org>; Sat, 31 May 2025 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687805; cv=none; b=IOsx9d1oeTgbqQxe10VA5jwnrQt0xWP/L/OViGPIgTjHSxGwd1nelJlejTrXul0fKpgrx5V7K0GJwqoZhXZDRSniU+J+h3+K74Pk4VJj2RZ/i4F5wwtdPuguhPyQEN2vmx3IBZ7s1ptbY3H/HR64NpsgYcG2+oQKNtyA2sQQVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687805; c=relaxed/simple;
	bh=LCCWL2kDcC71cBm4psAu8hEsXTmwFcOHqF7dcs3bdUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9dsAtHhEYkTVHnxDpw7w+HW8q8xmPac6/ZEr/nrLHIgrdoizY5zxS5Ckub3X8u101eTdY01IFEOqhPjzjjw0x0D9eC81BzzODhhjLwoDkKhNfAyJc5astuIJNEf51GIfMOtYmGc5TR1YRPjpXg3wuguvv3Q8BbFdZdimag/LfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com; spf=pass smtp.mailfrom=kuruczgy.com; dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b=R1LY447n; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuruczgy.com
Message-ID: <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
	s=default; t=1748687790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxENrXFiNdrr2zkChFJJEF8ySg4LaGGh/I5I68/5WaI=;
	b=R1LY447nICiWNxc1AeI717EBaqxuqxidlYGclnrwaFfXxxy7JHZSSb2HkdRUZnj0JNGeki
	IjULbd61t+yeNxq9FSjgiQQSpKC8tjQqFgA0ngZyh8MRSXM5EiZO8rew8BIWgjKtwm7pak
	7/w5e9hGRvi2wEVhnEYpcty4ey9N0pk=
Date: Sat, 31 May 2025 12:36:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>
In-Reply-To: <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> Add charge control support for SM8550 and X1E80100.

Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works 
well, I finally don't have to worry about leaving my laptop plugged in 
for too long.

One small thing I noticed is that after setting the sysfs values and 
rebooting, they report 0 again. The limiting appears to stay in effect 
though, so it seems that the firmware does keep the values, but Linux 
does not read them back. Indeed, looking at the code, it seems that 
actually reading back the values is only implemented for the SM8550.

Anyway, this is just a small nitpick, this does not really affect the 
functionality, and I would support merging this series regardless of 
whether the read back values are always correct.

György

