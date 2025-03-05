Return-Path: <linux-usb+bounces-21382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDBA4F919
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 09:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 187B01892933
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 08:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC591FCFD3;
	Wed,  5 Mar 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNseqXHk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011661FBCB4
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164367; cv=none; b=ukQ5M+OrgNhFj++1ptpy0XYkbPr2vDLXBtvC4PeJcXvsK2b0dW1WtPHGDf8+oxQwUGkmuDnC6vcsmxsJBWVWwO5isyrPJ0zWYp0T8nKX3c+Tp7wBOn/nq1OGdYyM+mqRPqTFaChFGU7DtenlgRDPMR8LOgiZMMKJ0yUI+SVyeWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164367; c=relaxed/simple;
	bh=1Q0aiy4GYFO00IdYtE1uHKKE/o8arTtTSEvHpAHtgUM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=oJUYS5QmJj59n2LhFLCFVx4+Ye7gf3EOzMVNiY5pmJbwATxMKGX7ZC5OdHJdw+5aAtRhqbrS6kHSOJcw5vKAGLI4MRpQ4gP3kSzAxueDaOihMT+LV1EsbdUAaPDUNdBhzGR7gr5rPSdArylbLeRSk7Y2NlIzgTt16o6a7CRASkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNseqXHk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1189051766b.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Mar 2025 00:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164364; x=1741769164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+OKsbQwDnWtCDSoKcenLz38M3e9X3dRLjgBVoiOVQ/c=;
        b=YNseqXHkSd+4wVpFf3ieBuSNrTP4vE6c72rovwT7Dlcyo05MvANTW9zhBH9K2yzs6s
         RUnxKIa11E6VuhdGbs0hfiZmCP/VlbDgI0QGU0Miw2BLFefDZ17F56pKRLgAwGNOeSah
         NZ1BXplC7cpzZzGFk+PO8xGL2LRkMgibZJoz57hRikjoJIm13tkvx5oalrfS/ydu3lUZ
         qb3ndmy4s6MJSXauQhDMY/A+4M1P21Hyj6FZRFiIJAKbFbDmle/aRrM7YNs2FtSRRavI
         61zYB4ioPJyaPuvb5EQePhtUb6hbn4yPXRseS50jj72UiB+kBHv7epmzHOPZbKsGgBm3
         xazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164364; x=1741769164;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OKsbQwDnWtCDSoKcenLz38M3e9X3dRLjgBVoiOVQ/c=;
        b=szA1dt5hS1W2FfqwuIkbV5dSPkazb2GxaFrv+NJuFUtr4TDE6D7RKjXBLX1TWmCxh8
         GyQqTph8fML/0cpMg9cUhqj6YSOEPMsfHAYrm1aQEmr/iXvArEamfSmrUfcmTFXATrdY
         +y/jDkUdoyYlI7TWmATgMgvj9wvZbKjU9/qhb1qyesk/MS9VDXhpWvbTJ+akfUFty0m0
         WqfYJe6xIVs3NOCm3jKTZ/Fx9BIeYXPY19tlygKcw7uPWAaG5cWBO1nmET0eg+KUqZCv
         S3dyp3IaT7IVNMRwtAyUz0tMUMSyTzwFNN5TUHXgvn+It5MU7ghLINTPGdX7/SgYsuBX
         abCw==
X-Gm-Message-State: AOJu0YyH0PjIE6rSSggOraYNXyW8Yin73rZafib3esW2d3xiPcNfOMcY
	ov9y5+HvOorz6PQb0iOi2q4XlWbeym/e2BMS/3pKnfdCVbhyXj9E+xTtbA==
X-Gm-Gg: ASbGncvu+EmmJsSOaHDa2mtzlJWx9EqoYtgsbPVZvO6HXscbVhSNa5OGye/Cgkvq33u
	1ZEyf+aw2CHyy9TUW70Tg1dZ0cqNS60wO0rWX5Qt4QFKEUY8HzjYVqQswgyNqeN+DPNvaZnVzjo
	g5CQmnf8stIbDosHWM4C0dILY/wA++xiTPD/MZuo4c8kaEbELNgunLxkdtjA4xVdWJorVGPHkJR
	k+o7eDBHQ6Ew4qxwUUlK4oRK5+Z+BUyyh2m05oFoz5uBSf4oM4NfxxPoUVH3GlnNh1RRrl5wO3g
	K2mpb/th6vzocAkueI5YZEuHAXeoLQrRLOI6jGinpoDsf+bI3vFjxg2XdXldFg==
X-Google-Smtp-Source: AGHT+IHqRSR+1CXJK8Nzzm5mkzHbhxeY/t6expsBskZZPNhTWU4/TPnCIH63cI2owbFUa69x5BIamg==
X-Received: by 2002:a17:907:6ea1:b0:ac1:deb0:5c3e with SMTP id a640c23a62f3a-ac20d8bc948mr223693066b.16.1741164363763;
        Wed, 05 Mar 2025 00:46:03 -0800 (PST)
Received: from foxbook (adts246.neoplus.adsl.tpnet.pl. [79.185.230.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac104bbbd2csm431067166b.175.2025.03.05.00.46.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Mar 2025 00:46:03 -0800 (PST)
Date: Wed, 5 Mar 2025 09:46:00 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: niklas.neronin@linux.intel.com
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH 2/4] usb: xhci: move debug capabilities from trb_in_td()
 to handle_tx_event()
Message-ID: <20250305094600.1630ef54@foxbook>
In-Reply-To: <20250206103428.1034784-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> +debug_finding_td:
> +	xhci_err(xhci, "Transfer event %u ep %d dma %016llx not part of current TD start %016llx end %016llx\n",
> +		 trb_comp_code, ep_index, (unsigned long long)ep_trb_dma,
> +		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
> +		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb)); +
> +	xhci_for_each_ring_seg(ep_ring->first_seg, ep_seg) {
> +		xhci_warn(xhci, "Ring seg %u trb start %016llx end %016llx\n", ep_seg->num,
> +			  (unsigned long long)ep_seg->dma,
> +			  (unsigned long long)(ep_seg->dma + TRB_SEGMENT_SIZE));
> +	}
> +	return -ESHUTDOWN;

Cleaning up trb_in_td() is obviously the right thing to do, but one
thing I always disliked about this message is how long and verbose it
is. Not sure if dumping all ring segments is useful here, seg->dma can
generally be deduced by looking at the DMA pointers involved.

As far as improvements go, IMO it would be much more useful to decode
those pointers into seg-number/trb-index pairs. I wrote a PoC and the
result is quite encouraging, I may submit it if there is interest.

Regards,
Michal

