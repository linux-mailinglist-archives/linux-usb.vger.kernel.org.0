Return-Path: <linux-usb+bounces-20929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7717A3F7EC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 16:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2479423A5A
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 15:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955B22116E4;
	Fri, 21 Feb 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JBdjSsI6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE9211272
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149963; cv=none; b=VJV36MCI7lmtgC0pU3AiFk72ZBXzH/ntdZB4KaHV36ysrwauEY6zgGxPj8rFJabc/6Fl+QZJF7cPpRb2n/5jUNfc+UCw3T3ywl8t0U05i07ElC9a7jv+3zMMe3a8aGoNfGBVb6dmL+UlKnF2qFyNENKdHa+tDtJrtAx9JX+tTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149963; c=relaxed/simple;
	bh=TUUIT0grktOI8Xd03MtCeg1JMhbb4flc8Qq+f+lw26Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOYtR5GdpGdh3O0P7QzRPfacIYAzRwSXbUxPwmQJWTEUYB5ez13Mmc1CCCSc8ggIag101JfJ0SvLmr0mhSyaeBQ2Pvw58MDSqgrRPbkraB0B8IplCS9wBK1XG1+kFM1W00tvNZcVRJQcHjt/2Dhrp3vLEnFa4tYqrUMW3RylmCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JBdjSsI6; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c08fc20194so379858085a.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740149960; x=1740754760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYGRgU42ehvZbI1iapXxcYB4NMASEL0ksLdLIKCBAIc=;
        b=JBdjSsI6gOcpZ4EvTE5wxyNeRE3VOkuL6QINjjYKbMg7TcLNWWap/FrQ0ZXhDXTaFP
         KJmm02Ezh9/Oyp0fXAh2Y1onArkbeIlKrizdOdtjPOtbdowqnnwM3Bt4ccrpUoFicWsg
         jni0FLTKK3DihRDTvyyF3fnIt9MVriLC75LxtsgfzoRvffQLpJtfNkn69h0y1GMm9IBz
         IlJJ1V7+cA2ndtFKjEl4HYSOenb6zX2JpTVHc2VsJSgRNye29zl/6b3CPGYs26QSODTg
         x3+t98sNNtQs2Zqah8TMgjUFqqEOJyGEpM1zivOSatKsaqscgUajUEgLl/5OMFZIuUkF
         gLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149960; x=1740754760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYGRgU42ehvZbI1iapXxcYB4NMASEL0ksLdLIKCBAIc=;
        b=tvGPrYOO1UBFgSu2S0WKPxN3fD9KnM+9PYaRoZjgp+9GqFFZIKMjUjRgfHE8K1dVp0
         fXUycQy3Xp4TD8j/IGF5FA9QAToRRl4yI9tTrWr9DaPCOcebbhrSV6t94yvS4twOk6WI
         XrfXBX7KFEUJWEz5mtGAJNocVOsLoITAKZ9jmlVKTuyEgl6rgY7NBDLEvlSCWorNIALs
         fJLqCxjCCL7zFDkxYjLdENnmFRZT38nTYuHHc8OxV/WS93zPa8s0zvV5X0CXd7m3yOIs
         pcdh8ve9AsG5gnk8ROuOjB48gtIljEv7qQouvGrU8FSu1UUrLaFyOuE+eTBf/1GiDt6w
         H/eg==
X-Forwarded-Encrypted: i=1; AJvYcCU5BTmlsVll7M04QHkokPuFgPOeRNQmONiyYAqPXubzDLy7Pw61JzEfBHqPv7IES5Krdwy1CKjqx9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPToOumj92Jr/ARJTgfQDNopFySgfG6M6PttM87mmlTG0r+Pl
	rtFFk6uStYotQd5p00sdGEM/AU0Q91ei5N4Ly6Q8gY/gjSD5gvP03IYzkHCJRQ==
X-Gm-Gg: ASbGncuEFk8jW3e0iTA/kYMLzEU32MeCbFMEiNXYVhBSL2gO3Trh9dXhU+pyzXK8Nzp
	WYidA82JGJToqBjj9iZS/Z8/1x26JjZjXLagyt9myNYhCcj4uFdj8yI/O9VCsCQh18fr79ZcMnD
	Z0o0f74r2+UFILS5G10SsVrWD7ypzOM7BD/JpQOJLcR9ToOmL+Pi1W4mL0dlOLOQBo5nQLh/NHe
	LcvzAqIHdTDYb0TdTrIn+rS7rPWrdRPOPzb3OHPMYL28cGSOMoRgtnJ1y4LmknxXoJgiiW+/1n4
	jNeySmdEBVKLt5IDxXcPS0Yz3OVxGA+GV0Sk5vOXyd+PD3Pzv5nKMoPYzN/2SWHYYUUiKY4QYCh
	lZZ6PI1zJWZvXfeahljQ=
X-Google-Smtp-Source: AGHT+IHA5seq9J5RtFe//jrhVxI2gtGF/efdOGwVuMxHe0sWSYJabebxtKnGSBzPb21sltEN2qVpug==
X-Received: by 2002:a05:620a:2404:b0:7c0:c5b8:e3bb with SMTP id af79cd13be357-7c0ceef77e6mr480480085a.19.1740149960178;
        Fri, 21 Feb 2025 06:59:20 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-31.harvard-secure.wrls.harvard.edu. [65.112.8.31])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0b29c6128sm392555085a.27.2025.02.21.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:59:19 -0800 (PST)
Date: Fri, 21 Feb 2025 09:59:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Kannappan R <r.kannappan@intel.com>,
	Amardeep Rai <amardeep.rai@intel.com>
Subject: Re: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
Message-ID: <99b2c305-d789-4dd4-8ae6-0bd558e93536@rowland.harvard.edu>
References: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
 <2025022056-confess-unlovely-da5a@gregkh>
 <01300a1a-a2f1-4816-9341-933ef236e887@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01300a1a-a2f1-4816-9341-933ef236e887@linux.intel.com>

On Fri, Feb 21, 2025 at 10:53:08AM +0200, Mathias Nyman wrote:
> We did consider defining 0x0220, but checked that usb core uses magic numbers
> for bcdUSB in other places:
> 
> hcd.c:  if (le16_to_cpu(usb_dev->descriptor.bcdUSB) >= 0x0201) {
> hub.c:                  (le16_to_cpu(udev->descriptor.bcdUSB) < 0x0300)) {
> hub.c:  if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0201) {
> hub.c:          if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0200
> hub.h:          le16_to_cpu(hdev->descriptor.bcdUSB) >= 0x0310 &&
> 
> Makes sense to add a separate patch later on that define all these.

It's hard to imagine how introducing #define's for these numbers could 
improve the readability of the code.  I mean, is it really better to 
say

	if (le16_to_cpu(udev->descriptor.bcdUSB) >= USB_v3_10

than

	if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0310

?

Alan Stern

