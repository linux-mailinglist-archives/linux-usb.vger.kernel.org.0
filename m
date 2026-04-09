Return-Path: <linux-usb+bounces-36082-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B1PJSRM12lYMQgAu9opvQ
	(envelope-from <linux-usb+bounces-36082-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 08:50:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43C3C6B12
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 08:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7A4A3019074
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 06:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A256934AB1D;
	Thu,  9 Apr 2026 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HdKs7XmM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E9347FFE
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775717405; cv=none; b=q1MS2Bogo9U9XfvhpXEM5O2RRPP00IJIVDz/sJEN+OB0NAdBwppJFRO4o44HDZD9OgmpeNB6MSMbIBvyhPFIvO7zpFxVMXUtpFXmQwd/FDufHqmyoLz6tSf1ky/R11YdICYrw1mguGRl4NOJO/pMl7hcTVRpU1LL6qSmjz+pEIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775717405; c=relaxed/simple;
	bh=amjMdpMLXPnpXnEVjD4WOv+bzX5GrYRST8oWtDMrcME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bc3pBwXjBFNdZRsPxTKFU7phbOT35Zy8PYPGGzrtFb9FUwYwH80g25K2Hz/Sl+EObAkUWmCVuF5Ep/AzA4b6WvZQnYYpNuDsn8877F/yN5Uq2tedbztkfyXolkZMxoXyhxfBIBzZg8IM5dUYEmC1Z/HYoKYJEOmf+/PCa+eFOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HdKs7XmM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9c01854477so83973866b.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Apr 2026 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775717401; x=1776322201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7X2yjy3G3AjVzbkMNhFNNa6fZ5R4PCuwspi3NYnJRiI=;
        b=HdKs7XmM7XpMBf88O7CMlcatkNczCAJVSV/ZWRL2GC/b67JeTvPwmdjhg8C/UOyuUy
         MgzTNMGa021wGnyp8IQvDxPG0WHkH9ewUwbcXV9brNLwCCNnv3hRu0OCxo105CuI685F
         ZJ+z4nlgnNCxUruAq3SvvKR1adVaLAq5NqCbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775717401; x=1776322201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X2yjy3G3AjVzbkMNhFNNa6fZ5R4PCuwspi3NYnJRiI=;
        b=Cnmm5Rf88VwqoY7du24rl+Nx6u0vgINY0sYEFk6ldUWYqzE5nMUCron2MFmNHwHNTb
         SPdJV+gh6kVl1BYkvnWcq+D8eXP0bTzCv97/8PpiZqTPO1jnsdYfesFvpNOFf6Wc17WX
         rkPN6gENiq5V1UzBZZRfB0e3CUKSr2YkKTCy6+rOBbvv/1w1RC6+uft9Wz6TRtYDvnkj
         m/wUwmgf9PGfLrT+7esEG1nhjuBgABOrnKZNqcb10CvR+IuZy9O7aHqSqTGh2iF/3IUh
         LhWCuIwRn+F9Or5u+zCd3HKIMk9SbCcEuEo14o8fEjL5aIVTl3gy7126oMtqYpSwFkrJ
         /oyA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8l2yrYUS9HcIZ8er4uD2ni6qZ93EdMz6vqNhr4qBSbOeC8JAyxtDKnh+kYQte+bHlqfUh3RKqHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjujiSES18xQ8vaDJ77sjxKoe1NAXs8aJIVieNy+LWXRM5tWA
	gWqwiTPEQAW4zZSAgfc9OinNRnfDtaetskG+0+cCvJEkYbZLenKs4EYnWeLLFeGWRPAUPlKfNRK
	RHnM45A==
X-Gm-Gg: AeBDievR74p8ko0LUS9PHdzRCY5XNvKVtlIwhmGSYD82hBXaLCJ0OW0CJgCjrrC/wFt
	Ug8u+sSAhDwwVzxkBMGH4VX7wZLIl906S/ByPMKRKiefxb1a+alYwmkgOfZN1IaHuiQWwr0eNXj
	UtSNxQ5E7K8RZ5Tzp7NqKsaggeAgd11fPH8NYReHHj6WUYvP0QJml1RK1L3BvECGq8pqywtdRjY
	xZOXEGCGZAu1t+sfs6dGEGzNF74PPaZFj7bOcVjQ6Gw4qfUUcDCQJdj5Y2z4YRA4lGDjJV1BA/Y
	ayJSD5JDlyxXmHQJvkNdGGteP6+ybcICAhktysPmifolnev/QjCAd3zoIFnGR/XIbnMkTmw5sNm
	I/E61ejscq3JU4y0nbOnOCVQb0COtvNALlbL7Fkv9tjIuXreqkTCSfvIN45UO6aYakBxcFWYyan
	Dob3XWg+lF+RbO157Yocjko7vb5CjaC5QZCSBIkdCggwI20whX9AHMXoQ4SfB3
X-Received: by 2002:a17:906:478e:b0:b98:7e20:b25 with SMTP id a640c23a62f3a-b9c67548d96mr1156399366b.20.1775717401202;
        Wed, 08 Apr 2026 23:50:01 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba18126sm86556266b.41.2026.04.08.23.50.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 23:50:00 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b886fc047d5so68989866b.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Apr 2026 23:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUh+KRxj9Uaf9OHmc+ScwIBj9EXjacXDk2rhHOHAGcVh1A0dEPGw/D9mcXkfJzdHHAQhciVtvFjPrM=@vger.kernel.org
X-Received: by 2002:a17:907:6e92:b0:b9d:33b5:6ba1 with SMTP id
 a640c23a62f3a-b9d33b56dfdmr256685766b.15.1775717399530; Wed, 08 Apr 2026
 23:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-4-jp@jphein.com>
In-Reply-To: <20260331003806.212565-4-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 Apr 2026 08:49:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
X-Gm-Features: AQROBzBsfD4ymzSBIuuyaH-Qc_jqwlmKYUxuJe2TlFq6gdFCbWCcLr_Y33tBcFQ
Message-ID: <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_FROM(0.00)[bounces-36082-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: 3F43C3C6B12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi JP

When we add a quirk to the list we include the output of `lsusb -v -d
1532:` to the commit message. Please add it to your next version.

Thanks!

On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
>
> The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> two failure modes that cascade into full xHCI host controller death,
> disconnecting every USB device on the bus:
>
>   1. LPM/autosuspend resume: the device fails to reinitialize its UVC
>      endpoints on resume, producing EPIPE on SET_CUR. The stalled
>      endpoint triggers an xHCI stop-endpoint timeout.
>
>   2. Rapid control transfers: sustained rapid SET_CUR operations
>      (hundreds over several seconds) overwhelm the firmware.
>
> Add the device to the UVC driver table with:
>
>   - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
>     skip error-code queries after EPIPE to prevent crash trigger #2.
>
>   - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
>     that trigger crash #1. Same approach as Insta360 Link.
>
>   - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
>     path. Same approach as Logitech Rally Bar.
>
> Cc: stable@vger.kernel.org
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
> Signed-off-by: JP Hein <jp@jphein.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b0ca81d92..e8b4de942 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2920,6 +2920,23 @@ static const struct usb_device_id uvc_ids[] = {
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
> +
>         /* Kurokesu C1 PRO */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.43.0
>


-- 
Ricardo Ribalda

