Return-Path: <linux-usb+bounces-12635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA15941069
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 13:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CBBE284CBB
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 11:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8E819E7D1;
	Tue, 30 Jul 2024 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CUGLUJNM"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FD1993B0;
	Tue, 30 Jul 2024 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338619; cv=none; b=vDC9A0o+0dYCMDlABiJH7ind+vnoEhWatVleBdbTWSH8TlNrgx3A5iHmsT40YEzpu9uOe2lExi+ZuzR5gUHWEhAiHor0zZWKtfOl4fJgJcHlnOTdhuXxgEniLnpVEQ4o/b3gitAxkHufuiJCQAPiNTbnkBmUn1Lys+JG3hOgB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338619; c=relaxed/simple;
	bh=KBxaGDG26S3B0Ai7RzQD2VOLJEW/2u8AVLg2eBR9S/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enXHT2h3SNBBwuTwfcp9VLIgbSXuoVf3ml4jK+u3LMhhJhzU/P561UzvfUFta1KqyCavEFpn4VGKUasKOAlpkz9R+A2LVOe5Hku3nzQFqgapKjSZneQsUs4jhnFur+y6FCzJeJYBcPOOjYKncPx9FmrryuXxZ5GUaM7qjhs8Avs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CUGLUJNM; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nNyldukC3+/UZFzwYX6ZUMiLrrFKVXdB48gtwRUqtRg=; b=CUGLUJNMjXXOeX/U+1qvh/B+V9
	62NBDvouI2EkvM2jr+TquS/E9gGNs/TwGgtPH1IC6EggVqgJ4DPaElMri6P0wcLbqPFSQBJzTlDW/
	6x8KiE8ErmknWiyWpqRs9g3S4ulz6aiAqn55wl3As5VKkknhU4YlY81KozmbftZxrmhZLj1uW1w7H
	D3KyFAz5wZs/iaqgPXF+uLOnOi1gsuoCxDEcz12rX/i6GPpTlf5HVEcOH8C7rZi9qKCA9SwwgwisW
	4avlyg6okHxnWtqLyID0PEF4JpBYOpOxzOnzk0JDGTWgboYM9wzFtLZCJXrerAXVj5xfJISCSlaf0
	A3zlIn2w==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1sYkws-005ZPr-Ph; Tue, 30 Jul 2024 13:23:23 +0200
Message-ID: <581726ae-dd9c-476f-817d-4140f7217ec7@igalia.com>
Date: Tue, 30 Jul 2024 08:23:13 -0300
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
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/24 10:00, Stefan Wahren wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe() and devm_clk_get_optional(). This results in much
> less code.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/gpu/drm/vc4/vc4_v3d.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index 1ede508a67d3..4bf3a8d24770 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -441,20 +441,11 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
>   	vc4->v3d = v3d;
>   	v3d->vc4 = vc4;
> 
> -	v3d->clk = devm_clk_get(dev, NULL);
> +	v3d->clk = devm_clk_get_optional(dev, NULL);
>   	if (IS_ERR(v3d->clk)) {
>   		int ret = PTR_ERR(v3d->clk);
> 

Super nit: you could delete this line ^

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> -		if (ret == -ENOENT) {
> -			/* bcm2835 didn't have a clock reference in the DT. */
> -			ret = 0;
> -			v3d->clk = NULL;
> -		} else {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "Failed to get V3D clock: %d\n",
> -					ret);
> -			return ret;
> -		}
> +		return dev_err_probe(dev, ret, "Failed to get V3D clock\n");
>   	}
> 
>   	ret = platform_get_irq(pdev, 0);
> --
> 2.34.1
> 

