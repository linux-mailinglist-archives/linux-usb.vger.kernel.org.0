Return-Path: <linux-usb+bounces-30458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E26C536E7
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 17:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43C4E35247D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 16:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFB3348879;
	Wed, 12 Nov 2025 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV/C9Esh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177A33F8B9
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762963919; cv=none; b=hbtZFi5qRqEiJIFvWrW+2hMnydinArnWGVJV6N0uQR/8ff0/hkDVYRF2nlWReZdINwYzncUAhWvNYRRN5LZ59oBfZioMNejI4M0jP+6aloT5255Z7Rs81LkwSaDfQmLUPlOX6aVaVAtYUv8p5GpUE93lhdv7JjJEpQBHMbCCHNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762963919; c=relaxed/simple;
	bh=6m1+Y1QMmitnq3wdyRnyWgB5iky55Benq343RZOXmFM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zi12NKj8Qb4qdpJM3XRkBBu8b2CNCff1Sl3vNeEanU20W04HY0XrxFo1+/aVuMXSVWnZFnV6VX+7lI0SSOoSir9kE+LRdmXSCbW2JlvZbvN98iAVM9eQN7DSCfvX+/qkZ8ge9MGsiF4Iu1B6yDPRCt4lIqjHdXrxwgC0erdyb4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV/C9Esh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b727f330dd2so166631866b.2
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 08:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762963915; x=1763568715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md4cQcopfc2YIkdpqGWrKBYrabECu39ggSCNB0xdwig=;
        b=lV/C9EshXhIanzw10JsHxS858xYQsTIclOWLljRZmVnXz2BjFvnqKQ9d7avEwk3+me
         zJ8TqeBhy/e8fPkGt6H1dMmTJq9IwoE5CsOopQ+KZQ9d+EzL5YhjBpaLF2X2Z+9SGKB7
         SdUtsYeCGJv4aoyl9lAK5VS2k8lMILeln7ysY17oM3mIwm5ITPt2gmn7FG4FtQNX4Ku7
         YXzH5OCu9RKeR9DqeYFh2S3nazqfL6i1GGyWagQN1lad4pi0xBBxCe6j9UP4c9xq4ZLV
         mmOVwIDtEgd4Vv8gEEt/d7edP4JKlfgvIRXDnHUi4WkYd6YydvYpIKnyl+wuqlMCrbOF
         bgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963915; x=1763568715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=md4cQcopfc2YIkdpqGWrKBYrabECu39ggSCNB0xdwig=;
        b=a57RP+Qpnva/fvCuS6GYhg3VrzrFZAoLcJNq2YoABTNURI6R4iDSFt/Wi1u0zILFtG
         N3Vmem3MDsu+9um/eUn6jj05+EQdo0ivfBfkEEpMHbAMmaE9IaAD5MOz7QduVDQiIBIv
         44TafnxaQOdf9eswnCTA95uBeMLoXEWJIs0kOXAxJMWQQgFrg7FOUbyoGFi/PZ7dqmUV
         UVzq+3sQRBFhnSiZJX5X69kIYFm96leEoqSfC77BNUfE5/cuojPwj+lWW8o6O2aq4N10
         y4fTSu5Npd91+7Ds7OIDMwVfKJCxeS7OrTDXcJ2Uq/7QRAZkUoEh07NruhHvPbOTKXXi
         GPEw==
X-Forwarded-Encrypted: i=1; AJvYcCUi1yRAb1sp2LJyDPATMm5V4i+xHEqjQdFUL9zCW1LBGOIbbdGBzA4uugENQvnqZywwJpTlf6Kg4MQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHElOrQmFPWWRtVojcXMpLFGCzqN1BjqRCHUPeg3eTq7UuLw/
	2bu8L7TGesD878a7o8c8RAF2IdTVkdaswOo+jC/mSMoROayCL/MhOH0LauIW+w==
X-Gm-Gg: ASbGncujYTw5xg+h6yCi7TdsxTyfTg16sileCW1THcKXcGM/NWhE6MnX5rdfmBf+W1b
	L/sWM1xCfxVrTppp0cetF4U1Ro+Uj/0sY81KHEA8gCpRD9VGtbPPgPXhErRe0uY05n7k5A+qlRq
	olk2TT4uO6YidjEdhTZ9gOJc0D4EUkAFDdOoPunlcc31qZvLszkPBatc0HPxycTaIgO+GizfIdI
	8PjWE5gyGs4DGtr8ko54hRxhHjcgbD5wMHCWHufUFPv+PFx/yZ5LT1IgRsao3OFk30pfHC6QwY+
	7zB9Iy7s5A6oyQz9W+yCMxwX/oHlVBKKX4S1FIVBAPCn48UauyZsqUuscA8YmzGGt224QQcPgam
	5+nKtSEG3RlweWEUp+23ofZccfeQyBOgCYcs94a6qwVDwWnmmulA2aaU4YQhJVgxTpqMSYXkwgW
	BPAhXAkGq5SSKvImiLYfMW
X-Google-Smtp-Source: AGHT+IGPAo4vcgq9T8HPnY89X1Wiq0qQEsqsfJiusIJLtZt+YOM7MA7+c1poePh8SeT7l9I7ZTh00w==
X-Received: by 2002:a17:907:9722:b0:b73:21a9:d435 with SMTP id a640c23a62f3a-b7331971a24mr410639666b.3.1762963915273;
        Wed, 12 Nov 2025 08:11:55 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11333sm1623343566b.69.2025.11.12.08.11.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 12 Nov 2025 08:11:55 -0800 (PST)
Date: Wed, 12 Nov 2025 17:11:40 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 08/13] usb: xhci: simplify Isochronous Scheduling
 Threshold handling
Message-ID: <20251112171140.108056f6.michal.pecio@gmail.com>
In-Reply-To: <20251110151450.635410-9-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
	<20251110151450.635410-9-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 16:14:45 +0100, Niklas Neronin wrote:
> The IST is represented by bits 2:0, with bit 3 indicating the unit of
> measurement, Frames or Microframes. Introduce
> xhci_ist_in_microseconds(), which returns the IST value in
> Microframes, simplifying the code and reducing duplication.
> 
> Improve documentation in xhci-caps.h to clarify the IST register
> specifics, including the unit conversion details. These change
> removes the need to explain it each time the IST values is retrieved.
>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-caps.h |  9 ++++++++-
>  drivers/usb/host/xhci-ring.c | 26 ++++++++++++--------------
>  2 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
> index 8a435786f950..e772d5f30d36 100644
> --- a/drivers/usb/host/xhci-caps.h
> +++ b/drivers/usb/host/xhci-caps.h
> @@ -24,8 +24,15 @@
>  /*
>   * bits 3:0 - Isochronous Scheduling Threshold, frames or uframes that SW
>   * needs to queue transactions ahead of the HW to meet periodic deadlines.
> + * - Bits 2:0: Threshold value
> + * - Bit 3: Unit indicator
> + *   - '1': Threshold in Frames
> + *   - '0': Threshold in Microframes (uframes)
> + * Note: 1 Frame = 8 Microframes
> + * xHCI specification section 5.3.4.
>   */
> -#define HCS_IST(p)		(((p) >> 0) & 0xf)
> +#define HCS_IST_VALUE(p)	((p) & 0x7)
> +#define HCS_IST_UNIT(p)		((p) & (1 << 3))
>  /* bits 7:4 - Event Ring Segment Table Max, 2^(n) */
>  #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
>  /* bits 20:8 - Rsvd */
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 5f46661c8e6b..7b7c61d79d0a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3983,6 +3983,16 @@ static unsigned int xhci_get_last_burst_packet_count(struct xhci_hcd *xhci,
>  	return total_packet_count - 1;
>  }
>  
> +/* Returns the Isochronous Scheduling Threshold in Microframes. 1 Frame is 8 Microframes. */
> +static int xhci_ist_in_microseconds(u32 hcs_params2)

Not a great name, too long and "seconds" surely doesn't belong here :)

xhci_ist_microframes() seems better.

The argument could be 'xhci' to simplify callers and deduplicate more.

> +{
> +	int ist = HCS_IST_VALUE(hcs_params2);
> +
> +	if (HCS_IST_UNIT(hcs_params2))
> +		ist *= 8;
> +	return ist;
> +}
> +
>  /*
>   * Calculates Frame ID field of the isochronous TRB identifies the
>   * target frame that the Interval associated with this Isochronous
> @@ -4002,17 +4012,7 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
>  	else
>  		start_frame = (urb->start_frame + index * urb->interval) >> 3;
>  
> -	/* Isochronous Scheduling Threshold (IST, bits 0~3 in HCSPARAMS2):
> -	 *
> -	 * If bit [3] of IST is cleared to '0', software can add a TRB no
> -	 * later than IST[2:0] Microframes before that TRB is scheduled to
> -	 * be executed.
> -	 * If bit [3] of IST is set to '1', software can add a TRB no later
> -	 * than IST[2:0] Frames before that TRB is scheduled to be executed.
> -	 */
> -	ist = HCS_IST(xhci->hcs_params2) & 0x7;
> -	if (HCS_IST(xhci->hcs_params2) & (1 << 3))
> -		ist <<= 3;
> +	ist = xhci_ist_in_microseconds(xhci->hcs_params2);
>  
>  	/* Software shall not schedule an Isoch TD with a Frame ID value that
>  	 * is less than the Start Frame ID or greater than the End Frame ID,
> @@ -4333,9 +4333,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	 * Round up to the next frame and consider the time before trb really
>  	 * gets scheduled by hardare.
>  	 */
> -	ist = HCS_IST(xhci->hcs_params2) & 0x7;
> -	if (HCS_IST(xhci->hcs_params2) & (1 << 3))
> -		ist <<= 3;
> +	ist = xhci_ist_in_microseconds(xhci->hcs_params2);
>  	start_frame += ist + XHCI_CFC_DELAY;
>  	start_frame = roundup(start_frame, 8);
>  
> -- 
> 2.50.1
> 

