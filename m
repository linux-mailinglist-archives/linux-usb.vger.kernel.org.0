Return-Path: <linux-usb+bounces-24695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6BAAD5808
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 16:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145F43A66C0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 14:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2BF28C028;
	Wed, 11 Jun 2025 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="p0Xdys8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170B2882A0
	for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650929; cv=none; b=cbiH+v5/NuZ+MOLYnIKGXmqVF3+0tsPu11XNXY4WSMpIqsOdMQMZp3G6RQVFMT8VI2JOxxcgSnOROFAtbrB4pOiq2lhJk3Cqi+o5Irpkofr3A1VUy6X3T7hy/QyAoHmTELhcZYeHqBtRHRwHV/Yg8cYrVMljnbhDyl44abWOM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650929; c=relaxed/simple;
	bh=BiUBiEP4mtMU0sgm8Ro7YfKxN/VojxVwmdYi69ZqhB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct17xuINHCIpftsNgYM1k/pjs7EwK+C5UiW5Yhc7fByuz1ejkRHkyA3EICp9AxeIoDqAp1Cct0iBUJ9hJ9cAooi9XZ66KHcsrvq8CVP6vFqglCJYBM1G6ZFl10tPgBymBdXN4TMe4pcLNzwQBRyA0y1GiYIJkMyRBMyyBdYVg7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=p0Xdys8X; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d38ddc198eso386706685a.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749650926; x=1750255726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=;
        b=p0Xdys8XKYbh2EZNSBDrLUlYjRVriEjeUCtYvrh8vSJgbfETNNa34VoAda83g44XTF
         i8hNFdE96aRP0wKHxYjSXa1Fdld4At818/2vW8hgOUaGqPUmShc9L1aKKQdhHUa/ZbCb
         A6n7GAiyrijuSARVvydri62e843IBcOfS3nmnn4pwUW2v/pEWzVF7wHl7ng5x9hjNUKV
         MYqc/Ht6EQZ55WO73vdRajsw1yduBgxZJ8G7xg5OBIper7+oMJR63xB9alyJiqGuUymq
         Vm1tnbRCf6TmjGl6gSLAWYttu9oe3m8IUV7dxI8mNIwIYsa/7eBJksJs3cZg532Nyg8a
         ZgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650927; x=1750255727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=;
        b=IO9X3q5ysJxkiGu0LeVDVaj2+DljN540+lMb0U5Y/dJWWTpjKY7jFu2dXOpxyaTNHz
         oa6/Pm8XHVfu9k5sp+w1cpSEUOtO+h+BxfCgRRyh1UNfXULAz6PbecdozCdW6xLG3F2e
         AVNom2osiGhclcJdGSW7EpM0fewTPac+++JFEzMgVQAxmWsPCHczFMtrDsvVQLf8ITdK
         46OpO/FdgYrriPTUiry4CPu8C44Kuli6EDYMBkp1SWEPNoPYPfpxMVCMCeUeuGU8YvLF
         8DsORQjhTwkyOyWhtD2LQhC2Akj1eyOG8m1ocDE1ZWLi3smB8X9vBLtA4LfgxX9zAbXQ
         +fhw==
X-Forwarded-Encrypted: i=1; AJvYcCX+C27Sb+j9/Zcjk9xYd1zqBte/0BU9kLfnCaa7uAUAlWFh/yhU4aSkZPlIzpV96Y6fNi/UUM9M8aY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlc9v5LfAY4zwYYdU1I6bVuGeqxc2vNZPDT8D0qLT1GEsDPesx
	tnviLkwLcSBvVNTgtCBc41A7ARXbbKaQmDlOGn6tOGuMlrfkfdqxCuEm6eaOKY0LEg==
X-Gm-Gg: ASbGncuFIY3sr+mBh2qqcvA/SuM8tWNsYyQpHTaRtlEUHCYFiSzZ6FeMXLa25MAZSvP
	LnUkPfGdQdpK2D/SFpvfhGmC6Uc90+BIPsA2uhQMv5EVuYmH3ucuTX6e3rcblDlh8ZM8G5caGEb
	bzPlzlj4IFdMq2NlZN1h1ansNt4Bax/gbA/ETXIrgo+bPl2Pmy/7xN3/dl9ZwLAmuD+JPADkqcC
	JBDDY5psHcX7lT8IqWP5rCg/MXmxlTppHVZ245Td4YivI+6THXB7PUWUmtHJV5Pyb/R/Euomeb9
	C64Ls6aLYL1d8P52Adkj1gti8wrcUlB1VN2+2O3M6ZbvxRDGtprDKs8SV5Exydyp0gvz3FtYGce
	ZZpEr
X-Google-Smtp-Source: AGHT+IFSaTTLDfYx+UWWlDovaDt70hJSIR1Xh3wlmjJQPRnGgcY8c3QuDCpwsHT6wqBwpIU2/viMsA==
X-Received: by 2002:a05:620a:f05:b0:7ca:f447:c676 with SMTP id af79cd13be357-7d3a887d47cmr524768785a.43.1749650924532;
        Wed, 11 Jun 2025 07:08:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170613csm865441585a.6.2025.06.11.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:08:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:08:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <afaf4c79-ccec-46ad-889c-e8347454c065@rowland.harvard.edu>
References: <20250611075414.4239-2-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611075414.4239-2-mihai.sain@microchip.com>

On Wed, Jun 11, 2025 at 10:54:15AM +0300, Mihai Sain wrote:
> Use the dynamic device name instead of the hardcoded string "at91"
> when creating the OHCI host controller driver.
> This ensures that the device name is more flexible
> and correctly reflects the actual device in the system.
> This will be in sync with ehci at91 driver.
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> 
> [root@sam9x75eb ~]$ cat /proc/iomem | grep usb
> 00600000-006fffff : 600000.usb-ohci usb-ohci@600000
> 00700000-007fffff : 700000.usb-ehci usb-ehci@700000

Are these two outputs supposed to make some sort of point?  It would be 
better to have a before-and-after comparison, so we can see what the 
effect of the patch is.

Alan Stern

