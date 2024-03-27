Return-Path: <linux-usb+bounces-8480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4570588E7A8
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86EE3038E5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438A74F20C;
	Wed, 27 Mar 2024 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fCPLqiYV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBEB134CC0
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548989; cv=none; b=luFnuGSNnooGqe1XDvneZu5mfDsKk8dtsmL6ip6ajlEsIAESm1ie1YEJaaUiEiXpXsXJDRopZvTch7pI1jugY/vXaKuwYjVyWMsSCC0eQXSC+U4hELILVkgPf6IIbQtv+WE8xu73FYh+zd1ALkIr6vQGiiOKDHUwYAO1PrySE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548989; c=relaxed/simple;
	bh=3xvi/XKpuu5WKLJaDgStaMmmPwwhtkIL9Muv+GfvCPk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HSPIPECrmkGrtUCydMpUCqupQtytn2C9B3n/WCCvwIzSwZgu22awdH0jn5ilm6+7jFoOkZ/k6RpmMR58/nx3x3Mh8LO4wShJDAIpvn5S7x6HR/gIAgLfJJVICDAUvg1maWjk/u78yABNP8n7+knVjF+vRAPwLKWAwtO/IGCAB5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fCPLqiYV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4a39ab1a10so461334766b.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711548986; x=1712153786; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ull5TuagLMQHv6DUtRD9GstVCdH2EZOd8vG8mnvtOGU=;
        b=fCPLqiYVEuXt0Fp9zeprQ7SPa4qe8SyuR2y4q9oVMCnQLCOkxfPsz1BgnpLOrDns3B
         BY3S2w+IYOcjopfaee6amu1HanXJA9UMZltvdg1hawgJZUdg/0ycJlCbFp2ufS0H7bRP
         r3Rad5Iq2iNwiCoppDAG2dcqgJhJ5vc+2J31VWSF8C0gE4oVZHkVYgLXIzteEqcCS7W4
         Q6Yrk3O8BaMZaykDNpTK5cCisznNkiAEDntThPEfjyMkvJKJB8Atrck57NN3Ta2HtW2X
         GGEbShTtl5tSfjP3fFuYsnpcaD8+4+qIbZYz/w+eAYpMQQ1Eui4k/UCJs0NVYVN3pAEI
         TP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711548986; x=1712153786;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ull5TuagLMQHv6DUtRD9GstVCdH2EZOd8vG8mnvtOGU=;
        b=kk548q/qrQ14ERwnGoz+gPcGpJQJkUZ4PM4abNY2iexAV8BvroVzMJo54EPCo7ZM74
         1IBWOEgQrXC/mSVLHjO3Mvsun+QfHTW214WmCVXetTBF48gjpLNtJpb8x+PQ63Os3b2k
         +xvl2wgmKtvIYlNRY9aSCN7PGC//eOazjzOFBgTUwIM1q0nl51tFNWGBQrwnGgEhu3Pt
         6Rs4EYqg3t94N6gILjqAkxu/45XIs1omn2MLLgipnVPbsYyj0bwAWvJX3N+yneY1Aybz
         L+3/RDjjFCOM8JlpH8vHAEFZAcvqYw2uWb0YVqVNZojaQ6zRMNdopgJI8ZvWuurHAO1R
         cKkg==
X-Gm-Message-State: AOJu0YxiXy0zCMt5TGtSrEBM1yTwNSB/C3wi7PnEkUyN/F8VM0GF3pDP
	SqsHniZun6DuJ+Vw2m3I7VfOuPyP7oYAu2Nqckcr5U6acinvraQUw7DOTHUvhUw=
X-Google-Smtp-Source: AGHT+IFnOlbpEYD32Gn+Tsti41BrFJeUOZH/jXLTC51AuOxXbH59gvYFk1ui5CFlcG5j7kVojPUjCw==
X-Received: by 2002:a17:906:614:b0:a47:3437:7fe7 with SMTP id s20-20020a170906061400b00a4734377fe7mr1832200ejb.56.1711548985778;
        Wed, 27 Mar 2024 07:16:25 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:b2db:904d:e0b0:46ec? ([2001:a61:1366:6801:b2db:904d:e0b0:46ec])
        by smtp.gmail.com with ESMTPSA id v8-20020a170906180800b00a46be5169f1sm5473213eje.181.2024.03.27.07.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 07:16:25 -0700 (PDT)
Message-ID: <72aeb263-fe7a-4637-82ec-043a6f9104c7@suse.com>
Date: Wed, 27 Mar 2024 15:16:24 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alan Stern <stern@rowland.harvard.edu>
Content-Language: en-US
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: doubts concerning error handling in usb_parse_interface()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while looking at this strange CVE
https://github.com/wanrenmi/a-usb-kernel-bug?tab=readme-ov-file

I came to look at usb_parse_interface():

         /* Parse all the endpoint descriptors */
         n = 0;
         while (size > 0) {
                 if (((struct usb_descriptor_header *) buffer)->bDescriptorType
                      == USB_DT_INTERFACE)
                         break;
                 retval = usb_parse_endpoint(ddev, cfgno, config, inum, asnum,
                                 alt, num_ep, buffer, size);
                 if (retval < 0)
                         return retval;

If this fails catastrophically, we bail out

                 ++n;

If not, we count the endpoint as success

                 buffer += retval;
                 size -= retval;
         }

         if (n != num_ep_orig)
                 dev_notice(ddev, "config %d interface %d altsetting %d has %d "
                     "endpoint descriptor%s, different from the interface "
                     "descriptor's value: %d\n",
                     cfgno, inum, asnum, n, plural(n), num_ep_orig);
         return buffer - buffer0;

However, looking at usb_parse_endpoint() no errors are returned.
Should the check just go or have we dropped something important?
This code looks quite suspect, as we happily count duplicated endpoints
and endpoints with invalid addresses as successes.

	Regards
		Oliver




