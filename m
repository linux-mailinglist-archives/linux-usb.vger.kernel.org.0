Return-Path: <linux-usb+bounces-28268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66BB83C0B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F061897CD5
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFDC2FBDF4;
	Thu, 18 Sep 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFuewE3j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5152F069C
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187299; cv=none; b=ofg1smm41z/k2KH/wlSQwt3mdaAWTALcdumEs81OwTfWEMLQ/cPxURyabbgq7gba0NlNKOiGWOkq9/XYo9sK2tI8imDamq4jUwZH2+t+oRt656xQfmDIH9gElw0O1m44GS+peC/tanSiUYshx9bkL8HTTciWopkCh1Smb6Bu6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187299; c=relaxed/simple;
	bh=1oNKDwAVIqXNKhfFqcmO3Na8MtFdxfnPE6MGIc0lLYY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hA0P9gJIt69GS56miBPGDGSDEqVUJYOG17qgp+RKy33rPkrnuVIGbuPBR3R48UUBNr7+TJB5sT9ZbK4L/w9ieyyRGuQwySAQ5+5rDkgC2s5l+BkQ5mh97fo0lVhSM6utyC52htIVTQfgwzJDFWeyhsfTgTqKV7nG7ZAu5or/xY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFuewE3j; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5607a240c75so771042e87.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758187296; x=1758792096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpWgU8u9YAFG+3rh4mCnaRM1sCo9ldsU4C5Gr/OOCwA=;
        b=cFuewE3jWQaaGMNvTeMnMJaDCE9twtIxd61/9a5J2WQMjK+ynDZw8V2fm9G4RCWxv8
         8pY5LlkwEx1+dk/RwhWod8fMSFTlHDBEfjwwRB7TJb4F2DXgrx9FU1Da52O3ONjfbVW7
         /IMSeMt+rOwQ7t/db9tisRwev7Mi7MZWZKLJ1rE2zQQ7dYKG2pNQ88jADY2G8T0DXmvL
         ATFwb6JwyPQEADAWyizx+cgh/e0JygYNm9iYRizGYbrFjbEVjF0rlgi479sOm7uEck2e
         OacLKdvZPrFs+haO5/m5POTpAy9Dp/bFoOn/VxKLuCPYaBoOiciFu4ASAeHPLVvZIArK
         6zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187296; x=1758792096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpWgU8u9YAFG+3rh4mCnaRM1sCo9ldsU4C5Gr/OOCwA=;
        b=tL9H+LhUGughW1rvtaWgMURwkpPMKae5wHkJEuBmzUBxWuVZu/KsD7LiBEq6VEKzIK
         HLVTFbtIKv0VxrLAt6MGo3QVWOc+OhY9FbeIz9YkVmIJ8Zan55szSm6MR9tyEW0k8cQN
         JzCiNREaQ/7opEDUFe55+DCnLnlRSpft5/tXNDCXwDrD1aFn7HsZvDQQ99EkCmFC/oMU
         nzo7NdS1cqSRoA3L3R8HQWzVxxF/HeETkksNQNb9hiQpYDfbm6mNebXi1ihVCOD18oFe
         cuwZbuf3RBXu1IN8EMw650z745NGukIeL30Jvj+Yd914drDlYu4wC05d/iUz7UHdkNKd
         Cbqg==
X-Forwarded-Encrypted: i=1; AJvYcCV8IjDFP69z66evTQUhXkl5LPeSxqM2I+fGnKpb56jof7LAEADFZGC8cB6HIvEkRDGlDmiALXQWHBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvqobonggib2VqWxyT99e02FxIiDceTDjezu9NvbtSo1eGAPV
	3r2EkMUIsnJZf4qKiNs/Ejma0KrQTjoRvskLl4JRnoM01DTmJB9VpxtQ
X-Gm-Gg: ASbGncvvgbgqna8zoT7eWm+qPXXEcJcyNIBroOpE79W1OyxMq7h09aVM3FEvMYCJguy
	0JCA2MoNDDygrYuZkK0zjb9BrCjeW727Sjq7SFUyfCnbCAiFcp97dEeD0PRbENv8casq/9sXplh
	MwCv67TIWDKVe1ftkNDu26bcTJkyuOtE1UuWP9rDdeHmjaX3EQGJoxsiMpzNYItCt8nkXKiZUv+
	Y0omPAoumV7OGl04DslPCS50HZfYp68vZjM+U+GYGxATjKY48hpi/wrj29sXweEJHcXJUaILPuk
	A/8Tm2yLFHKBFzosLZMZQlAQSHcvdCfA6mcHOlsqSChOXCacoRQgupRN0XvGFMpWNuGbQzxG9Sa
	fttwy56liBODxKya4+YJmauBpvCi+J0BpJ1hSb55uZs1H7QrJBYXvfw==
X-Google-Smtp-Source: AGHT+IG3eppiXaI7yyqn16hYM3enqwcxTctwACOEZhBqBjTGrXDZIT5SOQCqD+J4fjqhaTr/KzXXBw==
X-Received: by 2002:a05:6512:6382:b0:55f:4495:51a with SMTP id 2adb3069b0e04-57799cba2e5mr1303376e87.52.1758187295562;
        Thu, 18 Sep 2025 02:21:35 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a1da5sm533710e87.91.2025.09.18.02.21.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Sep 2025 02:21:35 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:21:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: zhangjinpeng <zhangjinpeng@kylinos.cn>
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid/usbhid: add reset device for EPROTO
Message-ID: <20250918112128.05c21d6b.michal.pecio@gmail.com>
In-Reply-To: <20250918055527.4157212-1-zhangjinpeng@kylinos.cn>
References: <20250918055527.4157212-1-zhangjinpeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I think this patch may deserve more explanation than just a log snippet.

Is this for case when the mouse is actually being unplugged? Why bother?

Or is the mouse disconnecting itself in response to missing clear halt
request or other misbehavior of host system and the patch fixes it?

On Thu, 18 Sep 2025 13:55:27 +0800, zhangjinpeng wrote:
> [  792.354988] input: PixArt USB Optical Mouse as /devices/platform/PHYT0=
039:03/usb7/7-1/7-1.2/7-1.2:1.0/0003:093A:2510.0028/input/input53
> [  792.355081] hid-generic 0003:093A:2510.0028: input,hidraw1: USB HID v1=
.11 Mouse [PixArt USB Optical Mouse] on usb-PHYT0039:03-1.2/input0
> [  792.355137] hub 7-1:1.0: state 7 ports 4 chg 0000 evt 0004
> =EF=BC=9A xhci-hcd PHYT0039:03: Transfer error for slot 4 ep 2 on endpoint

No timestamp. Log corruption? Missing fragment? Copy-paste mistake?

> [  794.579339] xhci-hcd PHYT0039:03: Giveback URB 00000000ab6c1cac, len =
=3D 0, expected =3D 4, status =3D -71

This looks wrong, shouldn't there be some noise about cancellation of=20
this URB and Set TR Deq before it is given back with -EPROTO status?

If not a missing log fragment, this may be another case of HW failing
to update EP Context state. What sort of xHCI controller is this?

Is this condition reproducible?

> [  794.596152] xhci-hcd PHYT0039:03: WARN halted endpoint, queueing URB a=
nyway.

Either the dreadful resubmission - async giveback race, or indeed
a halt has not been recognized by xhci_hcd.

Is this log noise the actual thing which you wanted to fix?

> [  917.451251] hub 7-1:1.0: state 7 ports 4 chg 0000 evt 0004
> [  917.451323] usb 7-1-port2: status 0100, change 0001, 12 Mb/s
> [  917.451362] usb 7-1-port2: indicator auto status 0
> [  917.451365] usb 7-1.2: USB disconnect, device number 45
> [  917.451367] usb 7-1.2: unregistering device
> [  917.451369] usb 7-1.2: unregistering interface 7-1.2:1.0
> [  917.451429] xhci-hcd PHYT0039:03: Cancel URB 00000000ab6c1cac, dev 1.2=
, ep 0x81, starting at offset 0x2361ea6280
> [  917.451432] xhci-hcd PHYT0039:03: // Ding dong!
> [  917.451436] xhci-hcd PHYT0039:03: shutdown urb ffffffa2ebc8e400 ep1in-=
intr
> [  917.451440] xhci-hcd PHYT0039:03: Removing canceled TD starting at 0x2=
361ea6280 (dma).
> [  917.500303] usb 7-1.2: usb_disable_device nuking all URBs
> [  917.500310] xhci-hcd PHYT0039:03: xhci_drop_endpoint called for udev 0=
0000000e00ae900
> [  917.500324] xhci-hcd PHYT0039:03: drop ep 0x81, slot id 4, new drop fl=
ags =3D 0x8, new add flags =3D 0x0
> [  917.500326] xhci-hcd PHYT0039:03: xhci_check_bandwidth called for udev=
 00000000e00ae900
> [  917.500330] xhci-hcd PHYT0039:03: // Ding dong!
> [  917.500351] xhci-hcd PHYT0039:03: Successful Endpoint Configure command
> [  917.500579] xhci-hcd PHYT0039:03: // Ding dong!
> [  917.656189] usb 7-1-port2: debounce total 100ms stable 100ms status 0x=
100
>=20
> Signed-off-by: zhangjinpeng <zhangjinpeng@kylinos.cn>

I guess if I won't do it then Greg will: you should spell your
name properly, with spaces (if applicable) and capitalization.

> ---
>  drivers/hid/usbhid/hid-core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 257dd73e37bf..253f82f33b08 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -306,8 +306,13 @@ static void hid_irq_in(struct urb *urb)
>  	case -ESHUTDOWN:	/* unplug */
>  		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
>  		return;
> -	case -EILSEQ:		/* protocol error or unplug */
>  	case -EPROTO:		/* protocol error or unplug */
> +		usbhid_mark_busy(usbhid);
> +		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
> +		set_bit(HID_CLEAR_HALT, &usbhid->iofl);
> +		usb_queue_reset_device(usbhid->intf);

Isn't usb_clear_halt() on the affected endpoint enough?

> +		return;
> +	case -EILSEQ:		/* protocol error or unplug */
>  	case -ETIME:		/* protocol error or unplug */

Documentation/driver-api/usb/error-codes.rst is clear as mud, but
these cases seem roughly equivalent to -EPROTO and all seem to imply
a halted endpoint. Why handle them differently?

On xhci_hcd it's true that -EPROTO is the only one you normally get,
and if you ever see -EILSEQ you have a serious driver problem which
no reset is likely to fix, but other HCDs could be different.

>  	case -ETIMEDOUT:	/* Should never happen, but... */
>  		usbhid_mark_busy(usbhid);
> 2.25.1
>=20

Regards,
Michal

