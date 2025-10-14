Return-Path: <linux-usb+bounces-29295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB34BDB132
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 21:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CF844EBCEE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 19:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1815D2C15A8;
	Tue, 14 Oct 2025 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wPPdKJ1W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33492BE65B
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470651; cv=none; b=dpe3UoFtQAi6e0UwtFz57JNYEdkdLudIGdndBOu1awvFAi2IXyv58fNlJYuzx6noiNFiTqclgJ6fDgb1UqO/ULPjNF0GUtKP/VGzafWE+6wYgbXGsEKIiUKrihmxfqby25B2FIWxCjSTBymrCTIJQ0LBzXJXrqBtE8alrdmyAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470651; c=relaxed/simple;
	bh=WpoN2NoXaT9CR12hFCKn2+PEKmsf5WG4u+Zdvv27Glw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+eqnDtpVUKABWsL03Dn9Lx5iMJi5pEiSHZ8JhzaDKNITz83vramFbY7OE/r6nOIwf0AhsFLN55vqZa+wokDlIJ0UIhWUPc2zqFnFxyAuFLcDJDMsjbZ6jF9dv+f8q64V1zf3jHI6UT2THlzImN1zAcay4W31gvsukR+8xtHmq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wPPdKJ1W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e3f213b59so14925e9.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760470648; x=1761075448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBfc4szJsjHsEvRat5/jXwpW1dq1NHeo2iUYWcXGEKk=;
        b=wPPdKJ1WcwcR0jL874r9O+U037PO/D7hkTNp8QeAPmsJYjsiBCPgQQdYBLMvHkYBC8
         vdoZWFJAsLLrXBsOGQn7KnI1Sn/5RjwWEJGmqTN7x5p/LpV3n2WmKSTOCl+7JrE4Xyae
         grHC2AQUjtFEZ6so6KLyM2Su+mGsNShDz7gQANdJ8aNKAVmPHhl4sqLlQqvTTr8ug3Kv
         EVVOEsax/wy/BmGMmycK+Eg8KbeoZ4XTRPNK32y+1bkZn49WGAoivss74x+fBxgntjsK
         aV+HF5wafSUdGIEbGoCeHedVlUF3IiBrjXcPP/f4HTxR4w3s4Oi5NX2DC5QD2xPgVvvn
         QmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760470648; x=1761075448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBfc4szJsjHsEvRat5/jXwpW1dq1NHeo2iUYWcXGEKk=;
        b=TFk9RVJSy+z4Te3mup5gkpatG2niJ0tlSoSKYJqUjpK/VNtIuenpBm7lrYEsNY4roR
         tqsnNRNRMFT/uMdv2KMs3zPBIdScB+Q/UWGZrE2MChky8rKDSMpkzTt3mJC1k1ItWXdv
         m6hKGdueomB04O439LTLk6UKznLebyOmRbNA3NKhmGGy/yJOtX5lDExnO4dGgfbCfiMb
         XJrDcgYuOSGQdtgGaZ1n6ytrHCgbKZOBpBC5DL/vVnvSCuHUP0s9kcPa09o9QmwppTLt
         M16eLCRFPZz5ImqJecT/KlsYEbRXqUp25rP4Jw0dpduxH9N1qdGLgy+AECzEjlzw2yDn
         F8zw==
X-Forwarded-Encrypted: i=1; AJvYcCV2ulqQAlssZRkrwTm4205BdH2sztPDpp9coRROGfccVLqhA+Fwi+iw/+qZ5RnqzplGSB3teVuYAd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YypQtL08aqkQIxTRdsR3ri9H6ZYRq/xUucnVJpOkqygm4CKMWbU
	9URIMziXkxu7TCrmcCGq+ncrAztHLL29SAOtUvKQ6Gt5qQeIyECL8NRRVTMad8bXH5n6OVD7sMa
	tAU4RUNtQmNStbX2DwGCgRZNbHIZCvkHT5wSqmDVg
X-Gm-Gg: ASbGncsP/bMQf6e9XbtAMJjzmbClIICBGpXkopo/7haC8FE81qO/W16CkL21FdNRcIu
	no+FQZsv0Qr8uaqaL+ssLu5MmPmQavCoULOYPrjqE6Vtjd8LZexhdCLxeWwN2NUXIEbzm6uhRXU
	hGWcs1W5YvsvorIt8R/cpUnzUQ4qCjHrmBGW5/5mAOd9+S053qloZohiwu6blkrO+bDho5hz38I
	ofhC2pVXryQ6hSa1gvDj45iahFMM0JBpkHDBt5jM+iEXzn0Bk4riEoOWzJKsz8mHqRzoyWN4lw=
X-Google-Smtp-Source: AGHT+IHi7VU9fjOa+wMSuBAx0+S1twfLSEIhQMqZnY6DR00TGtusOPM2BcIVhlwEt34Txr3c2KzQ56eBKbj/bN5fLz0=
X-Received: by 2002:a05:600c:a10c:b0:45f:2db6:5202 with SMTP id
 5b1f17b1804b1-470fd77c050mr138465e9.3.1760470647950; Tue, 14 Oct 2025
 12:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-usbcore-tracing-v1-0-b885a3121b09@google.com>
 <20251013-usbcore-tracing-v1-2-b885a3121b09@google.com> <2025101446-starved-brownnose-e9ed@gregkh>
In-Reply-To: <2025101446-starved-brownnose-e9ed@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 15 Oct 2025 03:37:01 +0800
X-Gm-Features: AS18NWA_DirshGTrrjNh1d83eGstF--T7Xklyq51qF-9R82ZMs3zHNtmax1ZzpY
Message-ID: <CAKzKK0qzx=VtNo25q7JEeCdBW9Wb81+K0YM5RHwkVY2By2vc=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: core: Add tracepoints for device allocation and
 state changes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 3:57=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 13, 2025 at 10:01:23AM +0800, Kuen-Han Tsai wrote:
> > Introduce new tracepoints to the USB core to improve debuggability of
> > USB device lifecycle events.
> >
> > The following tracepoints are added:
> >
> > - usb_alloc_dev: Triggered when a new USB device structure is allocated=
,
> > providing insights into early device setup.
> > - usb_set_device_state: Triggered when the USB device state changes,
> > allowing observation of the device's state transitions.
> >
> > These tracepoints capture detailed information about the USB device,
> > including its name, speed, state, bus current value, and authorized
> > flag. This will aid developers in diagnosing issues related to device
> > enumeration within the USB subsystem.
> >
> > Examples:
> >  usb_alloc_dev: usb 1-1 speed 0 state 1 0mA [authorized]
>
> If you are going to change the state to be a string, can you also change
> the speed to be a string as well?  That will help out with people
> wondering what is going on with the speed of the device a lot.
>

Will do. I will update both the speed and state to be strings.

Regards,
Kuen-Han

