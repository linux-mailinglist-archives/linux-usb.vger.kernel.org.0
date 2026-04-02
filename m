Return-Path: <linux-usb+bounces-35852-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE8+GZg6zmmAmAYAu9opvQ
	(envelope-from <linux-usb+bounces-35852-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 11:44:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD99C387223
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 11:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAC453033FBD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 09:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C824D3D9DAB;
	Thu,  2 Apr 2026 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9+y0ZN8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64D38D016
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123074; cv=none; b=Alaoz6GFd+qAlCluage+w5Do5irxx2Y7E0tNZGsWeQRoE/DhbFcOjVEwbwAvFkcLM/W2SfIBGchQJfZZAu6qgBkaeCAhQngObHH/zSawTgA/8vEnrKUpoBv6Ay4NGGcrs/qw2QBLyzhEwdk7J1XMBLicx2lsZ7DY76fS2UG5tug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123074; c=relaxed/simple;
	bh=MVk8UqusO2YAJThlmcP4EVqF+YQQQUkUublTM8NTy4s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YgiTggRP2Fhf3HsE05tzfiuK+epqFr5IPh5yUzMY9wXdpiblFUqJZ67XH2AzUwm4KTYcAP51TZFYyYKQ5tfAnNxl7pFxFCIbYRBe+3kfRoAldIsKA5MJpGcsFWp5xWCRuURHypTIzBC0KcZdteFSS960zp5xk0EYGXTqMgwQrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9+y0ZN8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d03db7f87so377841f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775123066; x=1775727866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhy6UcHsW2sEceIgi+BWAq7/HDA3iTNjZpezFJtrBio=;
        b=W9+y0ZN8LziExoDQsUY7gSi4YOrW/R+aZBw1k8L1RrmVCjiDVykV7ISoOjWSd+5bwP
         ridMnzpA1tOXLWmkVAuBSkG1ciHP6gJzSj9gBQSRIR1bvhiDcSoGDeNc0M7qYdnS8ARK
         Wbj5dfo5SaLjDqp48NUGMeQ2JHc+ykHRcJvTKj6HIuRs8uYt2MWNXFCbrP96WkpitUOa
         DcW6KQ2IcZCclC2vy5ql1uKb5itUHyq969QNpZVY1ARB4WVMexsNKeui5C5Nz55m0CzH
         Tw+TFQPMACp8Tr6GArrrehcsxZa+pZgHjlfuvrEhhXlxYqHNlW/6pj8QNL7kY9fbpW7H
         QlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123066; x=1775727866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhy6UcHsW2sEceIgi+BWAq7/HDA3iTNjZpezFJtrBio=;
        b=Au7i0w7AW8SkUqabycxXk4UaREimCxzc1rzTiubXa3+HNW7GyY6qqnOhfS55+9MnWn
         SfTNyf7EEAuMCuIhP8dNx3XbbWdtZ59s7VQtJ9oWUu3hENTdt+pCxDw/huwQDyVNcBzB
         F+v7hKBlnEIU+iIxpJzJBADtaX18a4HVA/0sXr35fZ5cBrK4CK6xkRSTXEDD4lazGrs9
         QXgV4JqwZpCEZiXCIxBK9eKZZD2UE0IOWFk9Rd9RSZy3jo/rJOoXaCuXnSiwiJJVu/uK
         ZlQvdxwaytFuwrM3IFXSJlWcjsA+LwxvKWW3cGi9Adg0rgU9KRr3B6dnHnzuHeu3jMe7
         an5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+dTEMLoGJLlPfXNI9C2Nxsypc364PENWi9tal2fMJ1eGlhF8uMD+ZUdQykTd7en2QEzdD64sMUCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdSCi0nJdldXJaFCOd+qNZPhFo3nYP5GqVpFcnrIrj/wkXwG37
	GbzSt/LR8iyHrZiHcQJZxf5NVwsIpjAANzo86HkFnCjZO6iQairtqKoh
X-Gm-Gg: AeBDiev2hK12NDWtkJjXTNnaTSrAraiEOHrM8F9b/ke9GnoPwZzz/OHJrDa9QuA6X0M
	6c6+IxdX588FSxOR/kv5G2R7zzxKYr/t9R/pBzV84vXH3TEs4yoMXdzel555W2Rylf7d2FvkTnX
	p44M3xc22WoIUIPXAl0HcPsAX9PQ7NvYn4R9Xxi/gUbvF+m0JfS0Vlf6MlGLs9/NIzbYsPAXmmh
	40p/+tZnUjsa5ImyumfgVSR4r5Y4Grw6wjAmaqHZ9WUkvNCJ43ewvSXxcjs0V9myw5DqqcQQjZo
	3JuuuqPDh9YSr9+380E7W6jPHMjSV2zTWLxMx37P8t8RD7aXvjt5VJCAtsmMTO201jEkPQ0Clvn
	j/1zpkpCihBDKPnpHqWmMNVahN9Uw54IlwStD6/G5oA0so8v6UJVaGoWpbsmMboxnYnN/7Zzxe2
	nIfI8u29Od9yNVftbfZeYwSK13UBMjx1Cp
X-Received: by 2002:a05:6000:230c:b0:43a:4de:fdc2 with SMTP id ffacd0b85a97d-43d15051e7bmr12856124f8f.13.1775123066185;
        Thu, 02 Apr 2026 02:44:26 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm7052418f8f.15.2026.04.02.02.44.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 02 Apr 2026 02:44:25 -0700 (PDT)
Date: Thu, 2 Apr 2026 11:44:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Tao Xue <xuetao09@huawei.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <20260402114421.738e375a.michal.pecio@gmail.com>
In-Reply-To: <20260402021400.28853-1-xuetao09@huawei.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35852-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD99C387223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 10:14:00 +0800, Tao Xue wrote:
> As specified in Section 4.14.2 of the xHCI Specification, the xHC
> reserves bandwidth for periodic endpoints according to bInterval and
> wBytesPerInterval (Max ESIT Payload).

For SuperSpeed endpoints, yes.
This follows from USB3 spec 9.6.7.

> Some peripherals report an invalid wBytesPerInterval in their device
> descriptor, which is either 0 or smaller than the actual data length
> transmitted. This issue is observed on ASIX AX88179 series USB 3.0
> Ethernet adapters.

Damn, it really does.

      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              11
        bMaxBurst               0
        wBytesPerInterval       0

Any other examples besides AX88179?

> These errors may lead to unexpected behavior on certain USB host
> controllers, causing USB peripherals to malfunction.

Out of curiosity, Bandwidth Overrun Error or something worse?

It's an oversight that these URBs aren't rejected with EMSGSIZE in the
first place. IIRC zero-length interrupt transfers are allowed by USB
specs and a zero-payload endpoint is probably legal per xHCI, but then
submitting non-empty URBs to it is not.

> To address the issue, return max(wBytesPerInterval, max_payload) when
> calculating bandwidth reservation.
> 
> Fixes: 9238f25d5d32 ("USB: xhci: properly set endpoint context fields for periodic eps.")
> Cc: <stable@kernel.org>
> Signed-off-by: Tao Xue <xuetao09@huawei.com>
> ---
>  drivers/usb/core/usb.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index e9a10a33534c..8f2e05a5a015 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -1125,6 +1125,8 @@ EXPORT_SYMBOL_GPL(usb_free_noncoherent);
>  u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>  				      const struct usb_host_endpoint *ep)
>  {
> +	u32 max_payload;
> +
>  	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
>  	    !usb_endpoint_xfer_int(&ep->desc))
>  		return 0;
> @@ -1135,7 +1137,12 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>  			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
>  		fallthrough;
>  	case USB_SPEED_SUPER:
> -		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> +		max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst + 1);
> +		if (usb_endpoint_xfer_isoc(&ep->desc))
> +			return max_t(u32, max_payload * USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
> +					ep->ss_ep_comp.wBytesPerInterval);
> +		else
> +			return max_t(u32, max_payload, ep->ss_ep_comp.wBytesPerInterval);

Obviously a kludge is necessary here to make these abominable devices
work reliably with xHCI, but OTOH exceeding wBytesPerInterval violates
USB3 9.6.7 and it's unclear if all devices would be happy.

There are devices which define such odd isochronous alt settings with
apparent intent to allow fine-grained bandwidth reservation:

        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               0
        wBytesPerInterval     512

        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               0
        wBytesPerInterval    1024

        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               1  # 2 packets per interval
        wBytesPerInterval    1536

Isochronous drivers use this function to size their URBs or select the
right altsetting for given bandwidth. UVC has obeyed wBytesPerInterval
since forever with no apparent issues and UAC has recently been patched
to work like that too with no issues so far AFAIK.

Maybe start with something specific to the known bogus hardware, i.e.
interrupt endpoint with one packet and zero payload? In such case
it's high chance that the device actually meant it to be wMaxPacket.

>  	default:
>  		if (usb_endpoint_is_hs_isoc_double(udev, ep))
>  			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> -- 
> 2.17.1
> 

