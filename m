Return-Path: <linux-usb+bounces-32228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71584D174EC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BF853025D93
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A31F37FF7C;
	Tue, 13 Jan 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkyw9TV6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138337FF73
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293217; cv=none; b=lHTUrruxxGTBgam+IPCRDv9EGnkVPY+PmYd3a+YYekWRsRGlNBU6JKk4asCFNv2plf5NS8+v4uO9ek1Bk12ZWh6BxXfs4awThm0BU7KlLaQsir3TJ8oXnX9IzYMVj3euJKNixicHe5TLcnFl+hFR6irCYm4QVQOED7G8VeOH114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293217; c=relaxed/simple;
	bh=6Vf+z6DmApEpgd74IiDMlnggDpe5PHFGaES6iOjxScE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czZQdjsFu6dlS+6lO8YLWssWPpEwZdv+vgSE/W32Cp60THA+QDV341YzwVftlVHExdcUOfLU8Lbo3G0jxIrn6hHwIRZ0tCxNpSnyVOCTv3p9EkzOzZS1t+UZbSjs1E5u9Al75hcCa0p1THermIGxbQrXdkRPk/WZ3iQ2E14Ixog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkyw9TV6; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88fca7bce90so73153946d6.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 00:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768293214; x=1768898014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v03HcVlyRDPNDKOnTijkifKECBVa5Hdrrwnb4NSOWas=;
        b=rkyw9TV66bVATOu8eEZuZL+43pGjXbyWaGmEpaDuYPMw1zBmP+GGI/YKmN4KasVmHT
         prYJ7oR3jA8MkE5bA/kut6uIaYAndlxZ2h43DfQ5xm2ti7UAt/dOFDAoQYnPBPusTZA0
         Uvv01gEGMkPY/cf9wNwTtHn/Yu5P5Y8yQhxpLiwDLxRPug/o0tGJDy93ptMxu4H90i2K
         P8h5EbfQdTAHCeTISMO0O4E2HQZ4ji8SlmlxfqSSokqN7Z4NTCyxEmyYyUgFgTYTf5YZ
         +PPA9RWB6uHxoAx1ue0+SmTUBYmd58KFFUFZFhijxH3zgk1HTCuUSdmSpASgrJaC21BL
         QO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293214; x=1768898014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v03HcVlyRDPNDKOnTijkifKECBVa5Hdrrwnb4NSOWas=;
        b=AHyWG0jkKaS923D9CIqLK0gmW0pbFqkKQMAq4hNz6pBbZUTBI6s3VgRNwSJIMdiTOZ
         m9QlTHmVxVHTNipwpGyysyMWcu6zV9t+aAP1zgViaa1sFCz5qYPNq9KPYGhgavLob9UK
         xirQiUJhQ2MWTu9LexVQy5nP3PxMfl9RSC1yYXv/Jf0d1ZtpZVWUO64EWhL5B0iNUduy
         3iLVJYuOlxr75iRzVvd1kUrzd5qAY9BP+7/pC9p+sQ4Sv7WB0FT9FIjdMZA7Y4H1v77J
         QYEW/x2C4qrRkbFJOF+uxjORADFWvNQWQeRUjF6++kke/omLkZEkijvWIYqhoXykogvR
         AWvA==
X-Forwarded-Encrypted: i=1; AJvYcCVkfLrWsbqQPHHITueDF6l01M9in4kGXlv9X8BAFzIp832/Ryq2XgYxbFliXsJcv0M6O2Gqgnv1aJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqmZBMqUX6i2B5bK/iqM/dkZGhI1MZcT7Vyr8uU/vHBNfviv7o
	HJT5ZacODPp0lhjYZzXRstPmm/MXW6yDlHM2r2IMTA2BwFFA8j5qpWNsfc3+N0EVFoIUGXmZC5j
	/e6NQpnAnuqgF3yKMlHaPdJBEHvpGR0awClEqAg8Q
X-Gm-Gg: AY/fxX58kq8pzTj76r4pMjrLWVKYzjBxEhOTMGsm5seUOA8MW4X/9nWqo6N0jXGEhb6
	Yw0y+V4vFgvNN4Bzeu53XvzuSiKsmiswpgSFxHkZlpCGLF9cQoRnrrcMGB/ZXdZ8ADkrVKqqK4J
	7oyJgQ7a1Xmrx+S2eNQUiy1hfxORvx58SozXM7sPdBr59c2rp82Woqk5YGKMhj0TexOrQUIyfQM
	2VZ4mGMIZCd57/VMivpGRxZc0hUNyIiFF6Q5KFh9bL4M8T0r07g5quxOCPw1mlX3kdYeg==
X-Google-Smtp-Source: AGHT+IGHsDM2OG4WxVYJeIbbyxy6YsFnQb75Xk89C6cKf47+Dg+9lKm9iT4HecRG7Cg3Mk1bLBk2N2CHp+6xwBEBZz8=
X-Received: by 2002:a05:6214:5403:b0:88f:ca80:2b98 with SMTP id
 6a1803df08f44-89084188cadmr298898546d6.27.1768293213587; Tue, 13 Jan 2026
 00:33:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113075139.6735-1-simon.schippers@tu-dortmund.de>
In-Reply-To: <20260113075139.6735-1-simon.schippers@tu-dortmund.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 13 Jan 2026 09:33:21 +0100
X-Gm-Features: AZwV_Qje-LJ3n584sqc4vJ9B3gmC6uvzhfPanoikn82IWbeoqA-K8U4R2qr9FM0
Message-ID: <CANn89iKTB2w+Dh-Aka1o5bs9WKkUGo7RqraPYJ+3gpDzzS3fQw@mail.gmail.com>
Subject: Re: [PATCH net] usbnet: fix crash due to missing BQL accounting after resume
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bard Liao <yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 8:51=E2=80=AFAM Simon Schippers
<simon.schippers@tu-dortmund.de> wrote:
>
> In commit 7ff14c52049e ("usbnet: Add support for Byte Queue Limits
> (BQL)"), it was missed that usbnet_resume() may enqueue SKBs using
> __skb_queue_tail() without reporting them to BQL. As a result, the next
> call to netdev_completed_queue() triggers a BUG_ON() in dql_completed(),
> since the SKBs queued during resume were never accounted for.
>
> This patch fixes the issue by adding a corresponding netdev_sent_queue()
> call in usbnet_resume() when SKBs are queued after suspend. Because
> dev->txq.lock is held at this point, no concurrent calls to
> netdev_sent_queue() from usbnet_start_xmit() can occur.
>
> The crash can be reproduced by generating network traffic
> (e.g. iperf3 -c ... -t 0), suspending the system, and then waking it up
> (e.g. rtcwake -m mem -s 5).
>
> When testing USB2 Android tethering (cdc_ncm), the system crashed within
> three suspend/resume cycles without this patch. With the patch applied,
> no crashes were observed after 90 cycles. Testing with an AX88179 USB
> Ethernet adapter also showed no crashes.
>
> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Tested-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> ---

We request/need Fixes: tag for net patches, in the footer.
And we prefer it to be the first tag.

Fixes: 7ff14c52049e ("usbnet: Add support for Byte Queue Limits (BQL)")
...
Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !

>  drivers/net/usb/usbnet.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index 36742e64cff7..35789ff4dd55 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -1984,6 +1984,7 @@ int usbnet_resume(struct usb_interface *intf)
>                         } else {
>                                 netif_trans_update(dev->net);
>                                 __skb_queue_tail(&dev->txq, skb);
> +                               netdev_sent_queue(dev->net, skb->len);
>                         }
>                 }
>
> --
> 2.43.0
>

