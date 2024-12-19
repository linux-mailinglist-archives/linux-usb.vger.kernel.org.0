Return-Path: <linux-usb+bounces-18678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8249F7BAE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 13:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E05AB188EC14
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 12:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C77C224B1E;
	Thu, 19 Dec 2024 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xml4wwKF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEA224899
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612145; cv=none; b=t5Mh7IqK3tkEYsRIM8aPph6x3lMN2Wexkocp78/GrTb95ZHRNWp0S351XhKBaSMBVlZtRyCXAJv+mAlEFPqi0P9ER0CIL/U4S9Y3iIZ2Xt7MNdqEGfpatUmy9/Zn4gS4/c0vJGXl4QmKWCtEpTi5/uLEjvoBQcvoiRSrArR4ypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612145; c=relaxed/simple;
	bh=X8UXNqv5ecPdSw+vYKNV5ThJqewH+b1pj2AskuWolZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ku4IC9WN0+clZAByqrGGDbY7v7NpQ3Oc9Lvu4efiGiIyDRHnC3A1Zi2XnY0lYv9Nkq2ruEDMQjgd5hCnG12sHdBh73DWMWBSdpshjH29JgR1Nl/406JFFtYNbEbWVlh+f/MfLBMkJYEiZXUZqzuEp6sJBvZ8aiTwxjF46H1qTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xml4wwKF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725c86bbae7so641771b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 04:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734612143; x=1735216943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnCAe9p4yEP5QmywCOysVpvHxzqj8A8f5GBf4MjEUXo=;
        b=Xml4wwKFLGXJKD3hcQl0DdpmpyaoEwyRa/y/0+rK1Rw2tGH/WG5sFzbri+yKjZw6Kd
         kv6ltOjbD7twwviwM0ueChHVUQZkkCyJVljBrA/19HpdmeviQ4hfGRl3ShU/pNNDQNkK
         HUJ92T5CxV3wI01CJj7FEQ6qspVhcYmS9uPvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734612143; x=1735216943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnCAe9p4yEP5QmywCOysVpvHxzqj8A8f5GBf4MjEUXo=;
        b=hloTEo7jY492+2t4HpVfI0rfkw3oRVkTrvEHLIFV0NCKOf5J0QEuF2R6VAYHq1NGtU
         AMuoiVdodmup1u9Hl1ilxI3MJjs0bcK+wOKY8dVmFFW65DHYaikx4QzMGxKS53zvyqbi
         r8bZtBpca2CniHHSKB8uRJJ7rBrrIwYQunfjG3csqRiVjWGQLVS6oU3eyJoO6AVPZz1F
         3k0StTuyfQSUp+BoOW5WzfGdVYc3Hcp81Ibdpy3Wy+Oh7Io/Cs5vJqa8j6QAUxXXAvep
         E4iNXbwXaMWXERlLorMxf0ZY0RHRmL7uI1Khqb8LY2Y8DQsBvE3W90l4Yd5EOuX/1Xpi
         UjsA==
X-Forwarded-Encrypted: i=1; AJvYcCXYXsttTevxsF/NikfH88YlU4wXX6e+xLphBIgLoAlQ0yt3je7pkpkPM5Pi37Orh+AExMerytLuLRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRrJwKnd3KAhWiC2Q0akz7bLpXV/Tbcffv5raHpuakVkEhBcI
	/Sf4sN85HqMuHSmIJdb1ikXQXBuWEzhEfaZKI3/pmf6x8VeeK0YSzPDSL9gtO75GhKlletxOwC0
	=
X-Gm-Gg: ASbGnctjHBzvuKc6/5v9Y/MS3Src9f9i+cxRoSoG8ZVIuMop1WRGr5Drmt55VswiB9P
	Q44MJ8Nao7KvpI/fID6SsfbA2Uay6Wp5+HslceQ26yDgzZpsQfjwdARQSa5Bg2K1V+MA1fhbyyW
	cIt3hyQ8Br6a4xy/IFvpmASeJVT6G7Aya5ENH3FOjmkKzZ3y8HPNec8HrhRmh28nhIWyCimj/qa
	ViaUBkO9BToQpMnaFVMizKgXapUYHnX9vFDPDwYnb2cQIzne0f9yiYWsQmd8y/wccxrpEVMFPXt
	zb6aXOdxBTKxOMAStpT9+Iw=
X-Google-Smtp-Source: AGHT+IFrpdnkAUg4aTkpfOwdrKd6eAwhFlc5+eSl1wnZecwo2bx/Lj44Wy1Zgd/p16jG/KohhNhSnw==
X-Received: by 2002:a05:6a20:d806:b0:1e1:afa9:d38b with SMTP id adf61e73a8af0-1e5b46fc24cmr12282318637.8.1734612143373;
        Thu, 19 Dec 2024 04:42:23 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b84fb8ddsm1092261a12.42.2024.12.19.04.42.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 04:42:21 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21649a7bcdcso5471665ad.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 04:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmplmq2Wv4k74QnGZWcRUO8NBgj0NsyRErZIHxIhVSPnVVRNR+dMu4RQYg/mI7VaovxI+LxlO8T0k=@vger.kernel.org
X-Received: by 2002:a17:90b:51c7:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f2e9378675mr9284447a91.25.1734612140544; Thu, 19 Dec 2024
 04:42:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org> <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org>
In-Reply-To: <20241219122453.GA4008177-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 13:42:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
X-Gm-Features: AbW1kvb_GsNPrAWElm71yNhuDp3lbxsP7Rss3OTpjLvIYa7x_Sh-ce4PUixVmvc
Message-ID: <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > Hi Rob
> >
> > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > For some devices like cameras the system needs to know where they are
> > > > mounted.
> > >
> > > Why do you need this and why only this property and not the dozens
> > > others ACPI has?
> >
> > Userspace needs that information to correctly show it in the UI. Eg;
> >
> > - User facing camera needs to be mirrored during preview.
> > - The user facing camera is selected by default during videoconferences
> > - The world facing camera is selected by default when taking a photo
> > - User facing camera have different parameter defaults than world facing.
>
> We already have "orientation" defined for this purpose.

Do you mean orientation from
bindings/media/video-interface-devices.yaml ?

I see a couple of issues:
- Orientation has a very specific meaning for USB typeC. I'd prefer if
we could avoid using that word.
- For other applications different than cameras it might be useful to
know the positions top, bottom, left, right, which are not available
in video-interface-devices
- The value "external" does not makes too much sense for listed usb devices
- It makes our lives easier if dt and acpi have the same meaning (less
conversion)

All that said, for my specific usecase, reusing orientation from
bindings/media/video-interface-devices.yaml works... So if that is
what you all prefer I can send a v2 with that.
Let me know what you think

>
> >
> > Right now, the only camera driver that expose the ACPI location
> > information is the IPU from intel
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n258
> >
> > And they are only using the panel.
> >
> > If we need more information we can consider adding more parameters in
> > the future.



-- 
Ricardo Ribalda

