Return-Path: <linux-usb+bounces-19565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA3A180AB
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 16:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440F01885AE7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 15:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF281F4281;
	Tue, 21 Jan 2025 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DJhojse8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E641F37D2
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471970; cv=none; b=l2qrp1wfn0x/6ZegIT0EeSQmjsuZqh6k/f+DjDdK4wzRSlerYYidagC6gYSmpRKwZWllhd8P0RunY9gdUCDzhxfSPDZU1+KjDJCkcq11GSNMUv8D7TPJQEbSVi4UWlI0jCFRMfq18vLWZo7OpHZg9vp95g3+Zwg1L1F+Tu1I2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471970; c=relaxed/simple;
	bh=uCSXJJ1j8FfbFOw35ZUBDXGKx92ot25fJFDl6TL46eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3ogqtHCJCOA3NCiGCUTgyOQa7ngEHDoD0YVttH2K8vY8GTjPns1bpHlYvmEU6PDrKSJQzhLX+g3rV4tpey15+zCS8UDYhZeQX6+o8rE2ukhYfYzTlfm2FJ4UMf/PjUQqVJC5r3PV1pB2nhUp03/VhsM5SysraFsb28fFVaHicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DJhojse8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6e9db19c8so518563385a.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737471967; x=1738076767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79pohmEcmPYL/wDaMhP9YVXhVDj5rctCG9EVinXUWvo=;
        b=DJhojse8V+7VbtFtkCZ2Z6tQv5QVqNdeH3Ys3RlhU8K5vnw0KfVjK02X/OPBQKdzkF
         9yLtFzOrhWcoe1OiNlIR4zCkVwWe61G1O6toAJmz/k4dC/qhy/gFc8eE7WUPHWWTZgpQ
         FHlJGpDxyCjYzdhb5s9t0r8vz5mhYfXwD2CZOhxlF4YFsu+0dGgibSq5E/Nl5vnhe8+r
         o+Bt2FVe5VhFdRYC0Z50j4RY7d9ng+RpBNgMP8x/LjNGFCS/6Zdn6QPXzc7Pc3WWqkOI
         T3ilfF5rsmeXYMqz3HBT8WM3Vn/B4EhsnA7gymaXyRRgWqFzRE+4xgBg6yHjdoVtPZpi
         ljgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471967; x=1738076767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79pohmEcmPYL/wDaMhP9YVXhVDj5rctCG9EVinXUWvo=;
        b=XbPn5Gg467FzIqSfp1PGQOhr66GGq3Oq7mNnja3dXBOolVXArwzAsf18yYyFyVTo/H
         ArstNrgxJ+9GtRFn+obQy+V1DDV49b+WtJ7SgfskaJemb9znbPP8v5Qo1CoYGnArgMRq
         IXFm5hW2IZ960M+bWUqGneE00soYl66s0Ac37cowWMUvZvylX90rKB7zW8XI4WDn8aBP
         enkdD5GDIbUg8nRvY7/vr4aUjccLD1TZt2QjNi4qn1llT9ksQsVi4ozvskrRhGkC2l6y
         /vV/j0JPZrlL2zqnZUY6stHjzmwceVypJPicT+rdhL7cPIevPZAJ3UL1WNXZ+fSRUAc0
         ty/g==
X-Forwarded-Encrypted: i=1; AJvYcCUEUg49k0KFjxNQBYpiZAPGcYBfxNgw/rmREsej2h1ycRqYrkM85XXpU5J4nYdHzKHFiIB2jP4ho7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1S265SpAjQ8twbjHKEtPUdvka2iu5Q5CoYUu+92CYm5xZuVY
	H7+VNivLeZoNtM4T5oF+gBk6imdyOG8WWlsD2BkIi9wuMvV0FVN0XhyIsVs4oA==
X-Gm-Gg: ASbGncsWds7fgEv+YvkPWdY7azX/SHbu3kZ1bQqowde6oiNdJi7BiQMpfKquWlnBQuV
	NDfDeKyHLZgmiu3yu+6cTNE5T4HkAHfNou9xvqy1wH4pGLtvEkqPN+sSqIUzYGV4I+pQZapAZ/2
	W1Lk6cXKzmLKa5TpD9xIMsKVyA95eA2P90iJ0g2K1UPYwHbzYk5acnyn9z0eiyrAgIhcrU5uIYT
	kgXUL6kkLuRsiE4y2kBC/y/gL7BE0wPIgrNTP83XZhST7SoGXfV/woVGOQVIajrBn7RNmN1NHGn
	O+RLMXgZoTf8OdAADSRRiV2y04nw62mlrir86iGzvt+4IvQeZhTo06+S/Z5rOv4=
X-Google-Smtp-Source: AGHT+IG6Nep851iZb1a5ufOh/tW3+fjYIgg+aJRJqHfsktaN9I8toWmg6+4RoWNZDIOmC/fKCwk3OA==
X-Received: by 2002:a05:620a:2698:b0:7b6:c583:9737 with SMTP id af79cd13be357-7be6324ae5fmr2513258185a.34.1737471964278;
        Tue, 21 Jan 2025 07:06:04 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61480ff5sm562090185a.47.2025.01.21.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:06:03 -0800 (PST)
Date: Tue, 21 Jan 2025 10:06:01 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Increase the limit of USB_GADGET_VBUS_DRAW
 to 900mA
Message-ID: <e36303c0-9d1f-4c66-bc40-891958507275@rowland.harvard.edu>
References: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>
 <894f42a7-50a5-401e-a705-a06eafd6161d@rowland.harvard.edu>
 <1b1587e8-5c38-4138-a27a-1de71ff07ce3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b1587e8-5c38-4138-a27a-1de71ff07ce3@oss.qualcomm.com>

On Tue, Jan 21, 2025 at 09:50:08AM +0530, Prashanth K wrote:
> 
> 
> On 20-01-25 08:17 pm, Alan Stern wrote:
> > On Mon, Jan 20, 2025 at 04:47:02PM +0530, Prashanth K wrote:
> >> Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
> >> drawn from Vbus to be up to 500mA. However USB gadget operating
> >> in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
> >> ConfigFS takes its default value from this config. Hence increase
> >> the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.
> > 
> > Is this the sort of thing that really needs to be a Kconfig option?  Why 
> > not make the decision at runtime, based on the needs of the gadget or 
> > function drivers and the connection speed?
> > 
> > Alan Stern
> > 
> 
> Right, set_config() in composite.c does this in runtime based on the
> values of MaxPower (from configFS), VBUS_DRAW defconfig and speed.
> If we don't set MaxPower from configFS, this config helps to set it
> during compile time. In fact MaxPower in configFS takes its default
> value from CONFIG_USB_GADGET_VBUS_DRAW . Sent this patch because Kconfig
> has this limitation where it's only allowing values upto 500mA.

Why does MaxPower need to be set at compile time?  Why not set it at 
runtime instead?

If MaxPower gets set at runtime then it can take its default value to be 
500 mA or 900 mA depending on the connection speed.  There will be no 
need for CONFIG_USB_GAGDGET_VBUS_DRAW.

You are trying to improve a compile-time limitation on a quantity which 
isn't known until runtime.  The whole idea of doing it that way is 
fundamentally wrong.  You shouldn't try to improve it a little, you 
should fix the basic mistake by doing everything at runtime.

Alan Stern

