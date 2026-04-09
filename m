Return-Path: <linux-usb+bounces-36089-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMTKNRVc12kCNAgAu9opvQ
	(envelope-from <linux-usb+bounces-36089-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:58:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6E3C75AB
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B286C30089B5
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 07:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57987387587;
	Thu,  9 Apr 2026 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CgSFGE25"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90772387367
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721490; cv=none; b=Ud6n90JsExIFmjWMbRtiKzH+ootcLwf3QLsAUygQucQtlYXoxIGxD9jVnEZe5Gp8p9th5k0bsko7F2uDqbbmpE6BB5qurlthrmQjiJJivgV5FQ3kWZsb10F809bgcusjKfIAMEIn5svQIhVTuzRLHgJyAgRTilIKMRXF2H2CK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721490; c=relaxed/simple;
	bh=75AaxxT51YQYSPWqVcPdIIihL7T5QhWFGdZ1JNY3wXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8gWGyRHkf3l0wb8fs1T5tzdFlQH84KkW66sMwnxzLKaCFCrHXzp50y6TpnUKodAHtW2Z0HDf2A7dIYjDJB45aTPYwRaTWxJvJYskYV1rtaTEgCMllG2YfhVJkzHjvA2WIAmZlavno39EKdi18FzNVnED7iUZzEPKS38Y0tgFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CgSFGE25; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so931490a12.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775721487; x=1776326287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KgjyUckJk89hUGKwnSl/YBODJB2o0tpFWnbI+O8bvQ4=;
        b=CgSFGE259AJoeXpvkDjOCgqLeUaePldeCAI1Jq7GcZiaf9c/wzYtvpxNYKpwT0P0Mx
         yZgVVSQs1Ti94yDTQKi8VBfRoLSkSy3HoHzR6s81g9kmcMi2RkZHHoaFAV/cLxYoZcD2
         Y/i45UIMu8AtZMlVzu/6c9EBfaUUBkyvlsLxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721487; x=1776326287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgjyUckJk89hUGKwnSl/YBODJB2o0tpFWnbI+O8bvQ4=;
        b=GfVKRHsarJK+Yf7Er/i/3m82LYgX90aSfkXlxHyqFG3BuM307lPr6PdmVwPP9XOpP6
         AchHMHpBCdxdYbzJDRXuH/jFbACjgJGURp4oXBZ+S11YDvgy1PyT68rofNmy+SLI1UeK
         jTNmkj1JF8EL1J7/zTu3vWcrzlrF716rMMS81LelNZkVZPE8zZ07YPBTHYgzIWM3J631
         FFfQsum8Kis2GXYwGR9ZSH15MOAndjUZAzBiU1JLfflI0U9RvCW30kUF9ESVK4meH3/Z
         Q+dzKUwtp6p9LJXYnPsNk/JBT+bSGsnaaN6fGOdFgKBrdteNJfc2kwZJHc7e5oo4+KzF
         genA==
X-Forwarded-Encrypted: i=1; AJvYcCUFTMGFsQURY+wHzX6/frXE4JVBPtyFyH/yInyBkXGdO8MbnRvhoTmp5ZJBRb8zPAWLpWy6RtvpYH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwunFRXsihFSn5GNGpELI6hxt4Ytf7JiBqN7xME2NtaDhJz42tw
	Mn4o5SuCmIRo5igNBfF6LwpXZHGpCr9Dyq0vKdPcxCTCkoHXiI0YyHlnw4/2USOWZ0OIk5LZxs6
	Gm0+cLg==
X-Gm-Gg: AeBDieuNl1FIPq51VsEs7yLKpABh8qHr5g//w/V3Fney39W4FpM4gCcEmhGFIkDAoH4
	s3Si4ZRN2ds4thljg88zPU/yCEMcq7YvOYBXJpWUDIyNdZDMJE8/2RFTxhIU2+cKGoDjwmxOrB8
	ETskiRMrXnoFU3hDpzs+39CvL8H60QxHOZl0ZewgmhJdC34PU56KqYFUdWz2BRpiqY4/G8KfG3W
	Rh1nJRJwKMqKo8vI3b6BX8lNvqUq0NytiNhLh5f0GKzvOCNTo3owfWrBDzn77fftr/TnbAj1U0B
	gZJpbOpZyFBrLJxk6GkKLY2IN0bBLlH/91xSfTjenUyQLdd1usPCG6fG4JdtgwqhDH3pSlCuE5k
	PuDPU8g728jpGD8+M0GcGL8zdUXJYjCuG4Cilmvw+IuIf9g0gs9zFPE4q85Zs9VdLJb2UAskHRe
	xfqMFyrrIHtitkeD6EwosF3SzIsba7XXOnO+DsaujpaTDsq4ZCmGhi750A3rzX
X-Received: by 2002:a17:907:a46:b0:b98:b51:6f51 with SMTP id a640c23a62f3a-b9d476abe1bmr121248866b.35.1775721487397;
        Thu, 09 Apr 2026 00:58:07 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cad1350sm706827266b.28.2026.04.09.00.58.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:58:06 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9382e59c0eso94873166b.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 00:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9w2Vlzz9m+z0fTYaqP2ufXd3UlGWWJWVELVPtw9mU1WzcLWVi9hXbwr2caD27JQFkptOqJ4Ix81A=@vger.kernel.org
X-Received: by 2002:a17:907:a04:b0:b9c:3ba2:2dbd with SMTP id
 a640c23a62f3a-b9d477d7b8dmr111645166b.53.1775721485788; Thu, 09 Apr 2026
 00:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-3-jp@jphein.com>
In-Reply-To: <20260409074242.2115657-3-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 Apr 2026 09:57:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
X-Gm-Features: AQROBzDyzMrYjQVbGJVOH7hZjR0hRr3aEheTeyyruzz3-tawdJt0UB-POkfR9ts
Message-ID: <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: uvcvideo: add Razer Kiyo Pro to device info table
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_FROM(0.00)[bounces-36089-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,jphein.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7BF6E3C75AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
>
> Add a device entry for the Razer Kiyo Pro (1532:0e05) with quirks to
> work around firmware bugs that crash the xHCI host controller:
>
>   UVC_QUIRK_CTRL_THROTTLE   - rate-limit control transfers and skip
>                                error-code queries after EPIPE
>   UVC_QUIRK_DISABLE_AUTOSUSPEND - prevent runtime suspend
>   UVC_QUIRK_NO_RESET_RESUME - skip post-reset reinitialization
>
> The firmware (v1.5.0.1) has two failure modes: it stalls endpoints
> under rapid control transfers (~25 without delay), and it fails to
> reinitialize properly after USB power state transitions. Both can
> cascade into xHCI controller death, disconnecting all USB devices on
> the bus.
>
> Bug reproduced on two separate Kiyo Pro units running simultaneously,
> confirming the issue is not unit-specific.
>
> lsusb -v:
>   Bus 002 Device 002: ID 1532:0e05 Razer USA, Ltd Razer Kiyo Pro
>   Device Descriptor:
>     bLength                18
>     bDescriptorType         1
>     bcdUSB               3.20
>     bDeviceClass          239 Miscellaneous Device
>     bDeviceSubClass         2 [unknown]
>     bDeviceProtocol         1 Interface Association
>     bMaxPacketSize0         9
>     idVendor           0x1532 Razer USA, Ltd
>     idProduct          0x0e05 Razer Kiyo Pro
>     bcdDevice            8.21
>     iManufacturer           1 Razer Inc
>     iProduct                2 Razer Kiyo Pro
>     iSerial                 0
>

Is this the whole output of lsusb?? Can you try with lsusb -vv?

> Signed-off-by: JP Hein <jp@jphein.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 775bede..9b6df8e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2880,6 +2880,22 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +
> +       /*
> +        * Razer Kiyo Pro -- firmware crashes under rapid control transfers
> +        * and on LPM/autosuspend resume, cascading into xHCI controller
> +        * death that disconnects all USB devices on the bus.
> +        */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x1532,
> +         .idProduct            = 0x0e05,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
> +                                       | UVC_QUIRK_DISABLE_AUTOSUSPEND
> +                                       | UVC_QUIRK_NO_RESET_RESUME) },
>         /* Kurokesu C1 PRO */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.43.0
>


-- 
Ricardo Ribalda

