Return-Path: <linux-usb+bounces-35895-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJW2LyN3zmk6nwYAu9opvQ
	(envelope-from <linux-usb+bounces-35895-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 16:03:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668438A2AE
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 16:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D1D33065F24
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0883DE449;
	Thu,  2 Apr 2026 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aKom4NQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19A32C937
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138216; cv=none; b=nk/H4/nkTJ1/k4kl4Ml6Q6il1GJ5HiHoAqc1y53b0Jl38Mi2k39cG3WlSRsaFIeqJxVrRItrHidC6wZ4liJsj3QkAg9CduVoPHu0ntjO2nEj5JfbSgCkKLlKktgBYj+O+QjANaBLkB0SdfG8Z1Q13oauIF9BSR8PfQGC1sP3DcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138216; c=relaxed/simple;
	bh=KCCA9jnaiojSGmvFpsadbMJRYvkck6taf5csbT0fYbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMSU+hlGp+My308WCXSEDsInN/bVaQauVniHmmWiJSxj4V5pZHdZY0qPByMrwBRCDe1BGuh90lfZelHtjQyHsQNvLa55pvpyUC8Ko0TayMeXncYfKMNDHYaD/XZEOi2FUxCXttM6h/UtsKcL+joowYD7ksgfCquDV61sltCfR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aKom4NQw; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd71fb9f06so57398785a.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775138214; x=1775743014; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aMcYRRHaeHkEdKOK+XQr9uF66twatToBigFcTZn3WGE=;
        b=aKom4NQwZPyJ7wlNPMlH6Zy+auIfek2UeLioL7dSaXK22AYR+MhXrzkmZMEZO9P9C1
         DLQ9N32zi/ou51Xa2RSaDl9WIXf1mHCduxfvLx4VUkoMNsg48gTh4WpAAGxGSuJO1UcX
         328q2Jac3nq2X24FwODgGsO+wfGNE7XQcy08DPDEIn+pycZ+Gs09UVStsiajAFaaRV3u
         sKbaZfd8nDIf8/OfhzZurdVbtkJaR5uc+Dq6/2ah6VWfDUT52gSe0Qtazo0qBIq/X3Tk
         Im+RFXQ3p08fCVvQwgED5S87AZQaqXbhofPj5c8B//H9WKCA5cp2gkuizmVWufEESrED
         VlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138214; x=1775743014;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aMcYRRHaeHkEdKOK+XQr9uF66twatToBigFcTZn3WGE=;
        b=PD70xAOyIGvfm6o7SWeictPhIFjoxmPwjZyMX1EeU4ZNfjZ/mcVYDvmaIgMGm+Hd1x
         RG1w3UPpWFd909fAA+MlXAof1xTHP1bp+cR9noCUt/ysLcfH3D23E7JZaoWRSfpku6Eg
         a7k+mEUFtE2sQwNtH0uvwjhC/YFDI3XRDpocpEXJ29uWYsk5EWHvq87ONcJCBeCFSeY+
         gHtAz4czTxW8ZqgXIegOtVIpHISqxOlUUz4qSz6tFMf1OgszcjRn94CmqVTn0llxIeoE
         D/x6sKM06kOMBy9/mNXFhy9cmw/XzKx2h0bdmDFar0rsHWEvoQ25N64tIBOLXd0R3vQa
         czeg==
X-Forwarded-Encrypted: i=1; AJvYcCXCgtgQrCm1aZEOlBfM6zpeFIXYb3ZYHGm8v0PUkxNK39xcalBXB+Ol/A12kdDYylarmjqWYHgGbLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSO7Zfe0BqUzIV32o+TXiIjL7hvN7ifnWRiDtPp4kXm6QqnxF
	xSzWMuYM/59+VZs83UQgeslGcIaGOE9jZHaVvGXPA2Pu7uzhsu4mpdUK6k2Db/kWvZq2iqF/4/0
	xxj0=
X-Gm-Gg: ATEYQzzRXH9qO/YIH29KbaXv3GE3mSruLbtl5HNaqBguwxmtJVXLe61tcMzkTKIApIB
	qJQnTwPu6Bu1vskYu+QjO7H/fVr5Gd/B3Fh9QCllvgsLtGIPf88tqDx94mX7noQs+EUWTMUivVn
	KSIS6pND1rQ4xpmvX1L6H+sUaplOCeTMTF2iN/0KsRlSS6fpfGcHP3qP+tS2itP2mAPgCu1TAQo
	c79dd6biocCbmMZrnphpP8BF0SakV15Q4wnLDsNySjEjN9rbEhRwgv8fYqLF1UghTgoPmNEayGn
	GyLFgQtkxPrlMAWIpL8gzBbxjkIfB5Gqexv5YI+IRK5zqoESxvjmbuhMX15B6uAqwEEjTQ6i0S9
	nrkpcGOd1dxqZ5tBfc7Esa8iVHoYYNceWrg1GGULvkjRH3/JnpG8+IXdgz6+Xl331jU0Yuzs2mE
	z42J/IQLQ2wufQHrbgjpNTpef8o2PypIq4teU42lF5+A==
X-Received: by 2002:a05:620a:1981:b0:8ca:105a:298e with SMTP id af79cd13be357-8d1b5c26391mr1110490585a.63.1775138213604;
        Thu, 02 Apr 2026 06:56:53 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5393a7bsm232674285a.3.2026.04.02.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:56:53 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:56:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, caiyadong@huawei.com,
	stable@kernel.org
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35895-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 6668438A2AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:59:35PM +0800, Xuetao (kirin) wrote:
> 2、Following Alan's suggestion in another email, should I check whether
> wBytesPerInterval is a valid value and handle it in the
> usb_parse_ss_endpoint_companion() ?

Yes, IMO.

> However, when parsing the device descriptor, we do not know whether the
> actual data length transmitted by the peripheral is greater than
> wBytesPerInterval.

Note: wBytesPerInterval is in the endpoint descriptor, not the device 
descriptor.

> Therefore, would it be sufficient to only add a check for whether
> wBytesPerInterval is 0 in the existing flow, and if it is 0, set
> wBytesPerInterval to cpu_to_le16(max_tx) by default?
> 
> For example, modify it in the following way：
> 
>      if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
> le16_to_cpu(desc->wBytesPerInterval) == 0) {
>         dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
>                 "config %d interface %d altsetting %d ep %d: "
>                 "setting to %d\n",
>                 usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
>                 le16_to_cpu(desc->wBytesPerInterval),
>                 cfgno, inum, asnum, ep->desc.bEndpointAddress,
>                 max_tx);
>         ep->ss_ep_comp.wBytesPerInterval = cpu_to_le16(max_tx);
>     }
> 
>  Could you please give me some advice? Thanks.

Try it and see if it fixes the problems you see with the network 
adapters.

I saw the Greg said not to change the descriptors and just fail the 
device, but we already make this sort of change to correct other errors 
so there doesn't seem to be any reason not to do it here as well.  
Especially if it allows people to use devices that otherwise would not 
work.

Alan Stern

