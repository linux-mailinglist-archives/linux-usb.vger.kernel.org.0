Return-Path: <linux-usb+bounces-24038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB4AB9C70
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 14:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EBF91B652E3
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC9424167C;
	Fri, 16 May 2025 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lf7jzOC2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7D23F40E
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399399; cv=none; b=Vagxm0f5uCrnlzbqIfiIPc0cv3LraLtwipvSZaum/vWCiKaho2WT1SfVH8LEjEtpucgyf+VzFAYaX0bbgLk9T+Sv5+U4hFehNkK8Kc6ejcm32D65gSIJ/67uNEixX/t+p7PjNlykjVnd234N7wliITTTiEN6S8EHQLDHv4vHYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399399; c=relaxed/simple;
	bh=qQ56V7c1H0b+snov2uHgcaFh4Vs6vYye9wRzWSxwuoE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sC3yrCpEv+e/aH3PLnk6/k9S8MiLK80u+jicP/wFGEuG/NXm/zaip52cg9mUDxXJVDjuv9MaZ/WHEl8dvNQmt7T4YEx0Ws28mgQhKCbxmSFA8N4DVizcfV/NS8QqVL6sG6lrXGjIIYFjyb9GPY+O0hxbvcz5lhKLLHoSrmEvKdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lf7jzOC2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-550ea5df252so550105e87.0
        for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 05:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747399395; x=1748004195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz3qAydm+cVrm8DQEXvOAv5yhY14JrN+9IDxYXzxlRM=;
        b=lf7jzOC2sgbL45Uot4e3+Y2V+FtQSdZqP5QLQ+kLAM5wn2uwfuxgz3q1tSHjEjUZD2
         54LuyDPKY94DrbbJI2LsAkaZzpku8sQ3rKohBLETkOnwS03ndClyy6HBq0JkJ/Zyc5Rq
         z973UC9xUlMe3E8pzZ6LfKJTmMRBPSv1SZjx943di3+cO953A9TUoT5jP+C9uJokYr7C
         a95LnkNMStHBuOO9fr+r823/HyDGGm2jF2fCKy14rzTF2jEX0j7guM0i1x/5GQlveQhQ
         oijCyYIDJ1XgNSHHSxoSQfJazS8HDhZbPJzCxkcpBFzOMTDMstd69hmsxf2KYQu0W1am
         ToBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399395; x=1748004195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bz3qAydm+cVrm8DQEXvOAv5yhY14JrN+9IDxYXzxlRM=;
        b=Znj3dkeXcZdCyUXFN286PtSuoipWfxzY0Zg64s8vwVx6pxzxRCHigFoL2KroDj5BQf
         F4jY3DVvhUuBlYHCNJPkhqWsBrwACoCFT8gXtx9qXRDSJpl9eHNHo6Z0JJLnCuWW0Lwh
         dBAnUPPhGFKIrVj6aC9yI2zXsnbwlmtBJMzlsCSupnlMhWH/37mvaTJdA43qoh3+6fyr
         GWQCDHonmXBGymsVp5oPoCNJECg0/s4v23iomeU6z91HkDht1tPUzoiyw7Vl+IkGGFzr
         CN01JdYgsfsQ++0xqucKr/uw1L/MWMdTyrX0f4czWvk+D7The68HPi5z8jQk6/IRVC0r
         4fQA==
X-Forwarded-Encrypted: i=1; AJvYcCWGdlLEI6SSaXxWK6JaWcW6twGQ1LS+uInmcz6DAsTlUxG9/k/xLgQfh5vl8VhQYvfV1IHaZiFqPWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTA65DXtGwU9lcRFvS+KDQFRacPJBp28OUpNrDzimNQRd4aX6A
	aoFz0IPPp902amU1g05Dr7n6jXqP3WkG9gsaS9AvE+QbcEQQY9Wq3+SYPTemHPDL
X-Gm-Gg: ASbGnctfGJTGvcbAhcx2Yf1qXJne+eIG1XtDnAjT2WP2oBsmNmcSRuLhDSF135uuiHf
	NyOT/JclZ6Soij3Wrg+PTAcEQiQKcnPOm+k2UXjjn8SSfDSdv9wMQzE+HNUSq8IgfXxrm95aVp0
	31vCEiPUZicXG6oK71JKqprkswcQf7Y162BERLCDU1wsql9cTkra0G8indBju9nvWyj2eKEIvs2
	Y3m9u0xRXEN7iDRLP4JXgvNNXlsLE0J7L2ej0P+42ZWPRf9auS3FrE+/qzxhFpB1LSMKFVsr1uc
	+QgYB4rzUg7LH3xSI9ZafuM+khABFKQIoewos1ZaU1uZpjxBdh8CduIzeoFpY3zCdOuK
X-Google-Smtp-Source: AGHT+IHX51VOZJiQ213JrN89HE6kqR3eZUU/J2/tzBuu7MCfCeuC4C8+2Lunpk/2xKiwEe0m1zgNTg==
X-Received: by 2002:a05:6512:630e:b0:550:d4fc:a0d with SMTP id 2adb3069b0e04-550e7513b7fmr784106e87.24.1747399395018;
        Fri, 16 May 2025 05:43:15 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fc56sm430503e87.64.2025.05.16.05.43.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 16 May 2025 05:43:14 -0700 (PDT)
Date: Fri, 16 May 2025 14:43:10 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>, Niklas
 Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 23/24] usb: xhci: add warning message specifying which
 Set TR Deq failed
Message-ID: <20250516144310.12b4f072@foxbook>
In-Reply-To: <20250515135621.335595-24-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
	<20250515135621.335595-24-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 May 2025 16:56:20 +0300, Mathias Nyman wrote:
> From: Niklas Neronin <niklas.neronin@linux.intel.com>
> 
> Currently, errors from the Set TR Deq command are not handled.
> Add a warning message to specify the slot, endpoint, and TRB address
> when a Set TR Deq command fails. This additional information will aid
> in debugging such failures.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-ring.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-ring.c
> b/drivers/usb/host/xhci-ring.c index e3c823e1caee..eff6b84dc915 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1448,6 +1448,11 @@ static void xhci_handle_cmd_set_deq(struct
> xhci_hcd *xhci, int slot_id, unsigned int ep_state;
>  		unsigned int slot_state;
>  
> +		xhci_warn(xhci, "Set TR Deq error for TRB 0x%llx in slot %d ep %u\n",
> +			  (unsigned long long)xhci_trb_virt_to_dma(ep->queued_deq_seg,
> +						ep->queued_deq_ptr),

Is printing this pointer actually useful? It doesn't tell why
the error happened. It will not relate to other messages - the
command failed, so dequeue stays at its old position.

> +			  slot_id, ep_index);
> +
>  		switch (cmd_comp_code) {
>  		case COMP_TRB_ERROR:
>  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration\n");

This will now become a multi-line log message, even though actual
information it contains could fit in one line.

How about replacing this new line and the whole switch with:

+               ep_state = GET_EP_CTX_STATE(ep_ctx);
+               slot_state = GET_SLOT_STATE(le32_to_cpu(slot_ctx->dev_state));
+
+               xhci_warn(xhci, "Set TR Dequeue %s for slot %d ep %d (%s/%s)\n",
+                               xhci_trb_comp_code_string(cmd_comp_code), slot_id, ep_index,
+                               xhci_slot_state_string(slot_state), xhci_ep_state_string(ep_state));

Example output:
xhci_hcd 0000:02:00.0: Set TR Dequeue TRB Error for slot 1 ep 6 (configured/stopped)

IMO this has the further benefit that "TRB Error" is something I can
search in the spec, while "because of stream ID configuration" is not.
And it isn't even the true treason in every case of TRB Error.

Thanks,
Michal

