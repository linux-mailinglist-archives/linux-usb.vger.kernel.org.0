Return-Path: <linux-usb+bounces-12886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE34945E32
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 14:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D752843E3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 12:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0923F1E3CD8;
	Fri,  2 Aug 2024 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="e7UhOL0k"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661FD1E3CC3;
	Fri,  2 Aug 2024 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722603459; cv=none; b=VxHUgUGJofBcqSpD7yEBkhGcPwaTnnwNaGcf8HoM6khItTqzAqycLhU8hwBr22WA98elbdSY9myI/YQY1rHnkY/WIE7djAvHNfA5Dt2RAUAnCphtpI9dGnE/71zx62l9BH2YS23AE7f4a7j6Dv28JxHLikC2PDb0XdnEXj4pZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722603459; c=relaxed/simple;
	bh=zN4LruB2WW9fYu0lzSWZcQ/G13AK+ac0vqzyQpNeGww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbgKx51lPVPAxyXzJsrOh3/s0za4+1q8YiNy7z7VxqSqcXmjMsEL6eX6cWegErF4lH03+u5wfiC/ic7lKYwa9TAkbBsBL0sp9vsL2iHqMRsacWcZISpLfIfHmi56xLEMoEVXT0tXqP4tHf93QavA0G7NWEEzDfFpX4ZSjWO7Hug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=e7UhOL0k; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WGiVdLtGzbRUhaAOKkQ2ZU2TyB4J4l9CoKO/GNZ2cyg=; b=e7UhOL0kpsNbyNjnABPXe4xMym
	G4KnsuM3lqj/YSH0+S0yAiTzAXSxfztJmQELIFcaoYUTcZXveyZPjtk6a2769r5Gedg7i/C1pLoht
	UrS56A7Gub0FIhhOXUqCClTOluIQGysmIfr9oGHnSojcnGomuvj5ex8Gskrt6epN6bqHsQFpuizeS
	J3UlF93lgmOvKfsSgACUEXkE5Kp5qS/1WlGSNKayoqSvEQqPxaG4YikMRfhS3Q0vgrnqmJWBnAadq
	dMQMrNBL0ha8eTrqIdDtoarMOUkIIgisysSk7NYweLVCbBM2cYnx64J3HdIfT25HXZ4oipc62M/7Q
	057oLRXw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1sZrq1-006sbI-Bf; Fri, 02 Aug 2024 14:56:53 +0200
Message-ID: <6047643f-e1f5-4be4-b55d-f59576999d91@igalia.com>
Date: Fri, 2 Aug 2024 09:56:42 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 09/16] drm/vc4: v3d: simplify clock retrieval
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <581726ae-dd9c-476f-817d-4140f7217ec7@igalia.com>
 <b34cc73c-721f-48b6-a7a3-da8190d80dd8@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <b34cc73c-721f-48b6-a7a3-da8190d80dd8@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 7/31/24 13:41, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 30.07.24 um 13:23 schrieb Maíra Canal:
>> On 7/28/24 10:00, Stefan Wahren wrote:
>>> Common pattern of handling deferred probe can be simplified with
>>> dev_err_probe() and devm_clk_get_optional(). This results in much
>>> less code.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>>   drivers/gpu/drm/vc4/vc4_v3d.c | 13 ++-----------
>>>   1 file changed, 2 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c
>>> b/drivers/gpu/drm/vc4/vc4_v3d.c
>>> index 1ede508a67d3..4bf3a8d24770 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
>>> @@ -441,20 +441,11 @@ static int vc4_v3d_bind(struct device *dev,
>>> struct device *master, void *data)
>>>       vc4->v3d = v3d;
>>>       v3d->vc4 = vc4;
>>>
>>> -    v3d->clk = devm_clk_get(dev, NULL);
>>> +    v3d->clk = devm_clk_get_optional(dev, NULL);
>>>       if (IS_ERR(v3d->clk)) {
>>>           int ret = PTR_ERR(v3d->clk);
>>>
>>
>> Super nit: you could delete this line ^
> Can you please explain? ret is required for dev_err_probe or do you mean
> the empty line after the declaration?

Just deleting the empty line after the declaration. It is a super small
nit indeed.

Best Regards,
- Maíra

>>
>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>
>> Best Regards,
>> - Maíra
>>
>>> -        if (ret == -ENOENT) {
>>> -            /* bcm2835 didn't have a clock reference in the DT. */
>>> -            ret = 0;
>>> -            v3d->clk = NULL;
>>> -        } else {
>>> -            if (ret != -EPROBE_DEFER)
>>> -                dev_err(dev, "Failed to get V3D clock: %d\n",
>>> -                    ret);
>>> -            return ret;
>>> -        }
>>> +        return dev_err_probe(dev, ret, "Failed to get V3D clock\n");
>>>       }
>>>
>>>       ret = platform_get_irq(pdev, 0);
>>> -- 
>>> 2.34.1
>>>
>>
> 

