Return-Path: <linux-usb+bounces-20495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8CA30FCC
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 16:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93DEC161D4D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 15:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98801253F23;
	Tue, 11 Feb 2025 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="1C6I5seU"
X-Original-To: linux-usb@vger.kernel.org
Received: from pv50p00im-ztdg10021801.me.com (pv50p00im-ztdg10021801.me.com [17.58.6.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67AC252909
	for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287758; cv=none; b=dYcvBr6ipP4AduO5RQ2FbFFkshv2VqO+6PVnxcPSbO9N4cS6FFKG29AtUSpdmQ5CMt81oXRuvBdtgcwxArua5cub/Mx1sJGjPCNmUlwb+pZ/QkRGaA5cLM5mRTaT4hOJIr36L5l9Y0ZZ6voNyjt/8Xmt3n89rcATCKxzXV6vbtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287758; c=relaxed/simple;
	bh=Lpebr7E4O1qXgM+GwTmjvL9d6fJEckCRITlepkyDUZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAQvl6+NEC71QUUjJw813LHAttT8+NldjEExcVchr3S8WdykwlFROWz/Tm0ZDUHARVZo2IGGxqlEheRz0i/EZNaHAtdAaNgnc3bBVgDB3TsP6N+VeORD4WohhH1bXnks2uF/KKHn3fxz/Qf4Z/9az7YjKUB3EcRsDVOhBGiAwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=1C6I5seU; arc=none smtp.client-ip=17.58.6.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=QOsegHChMEdENsDFl50iHjj6Urk+naCjXjh88gC9Lb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=1C6I5seUBBrmEAmp5wop6SYdNnY3c3kQGSe+xH4zowedPM97ukA7LfAHcv3c744yB
	 J/FYckarWRNq2v4YIdkNPqkKJ3zHFu6lQT9Wy6z9OkW/MILpJTjOyPaid4MjE2jfoD
	 GpgIHYtRZqd+PfY5t6Nu5Hc3SBQcHFJ75bWYuZPXAV5XN/86bdVLS24kIWPnjgM8Wj
	 biLON07NOGTxmax9VVN+W2DSrTaBbWorfOhCSNEIuxIdl/n98jgxzDvudhqO2V+QJc
	 1wmGiNzKErWWFmFMKtv2F692OSZBScDJ8S7SHa1s9a7xMYzGjI33Kaktxm6hFT7ebP
	 mreZsoXB/3GVg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id D090A20104E0;
	Tue, 11 Feb 2025 15:29:06 +0000 (UTC)
Message-ID: <116e9983-6c5f-45f3-a933-dcded223f6d7@icloud.com>
Date: Tue, 11 Feb 2025 23:29:02 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a simple
 device/bus is needed
To: Kurt Borja <kuurtb@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>,
 linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HC7Nsj_fZNeMs72_TJJMMOiDclYVS2ZC
X-Proofpoint-ORIG-GUID: HC7Nsj_fZNeMs72_TJJMMOiDclYVS2ZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502110103

On 2025/2/10 22:29, Kurt Borja wrote:
>> +
>> +	ret = device_add(dev);
>> +	if (ret) {
>> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
>> +		       __func__, name, ret);
>> +		put_device(dev);
>> +		return NULL;
>> +	}
> Now that the probe is synchronous, what do you think about returning
> -ENODEV if the device failed to bind to the driver?
> 

Result of device registering @ret is not, should not be, effected by
"device binding driver (probe result)"

if device binging driver failed, you may return -ENODEV in
faux_ops->probe(). not here.

> This would be useful for modules that may want to unload if the probe
> fails.

may need to root cause if probe failure happens.

how to unload module automatically if probe() failure ?






