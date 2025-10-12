Return-Path: <linux-usb+bounces-29175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B385BD069A
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 17:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBADA4E192C
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 15:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B26D28DB56;
	Sun, 12 Oct 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kzwT1mjD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295F2749D9
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760284690; cv=none; b=Fm332xircR7e5UzrkKZrRrzOlpZ1WVcYs+gzaIUKGQriXDON2Tu/GsWaHx+vLs2v8ijr9x00oim7Lb57sSgAGVNGsMVkrO4FOByrlp9iwlOtuC9V9VEIpAYhsifyoJSBpuxm2T78UbtHu8CXij04dBIwEvIMOXgLnSlF5oG/sgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760284690; c=relaxed/simple;
	bh=SBO5IALsT/Yo+hZ8pR/AUFz3emp3jHr2hUsMu1aZHTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OopiATd9LchUSH/r0gLCEyQSROjMgMoaDI7OTLz4j7GBdQjUOk67o97RsgjfdeMAdvzfq1uP2hUUCqw8STngknhHvJZ26/UQivwyLqi7RKKaKBBikddB8Uxvjp5xZjd2HyGwftU6te3VSj5IgtcN2WfbGMbfSz222vrvOC12Igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kzwT1mjD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57b35e176dbso4187147e87.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760284687; x=1760889487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETrttjME+RLAz9oF+Vc0T2L5AfdebwLUQ97sC+ebeVc=;
        b=kzwT1mjDA/15AjJl/w+uAbDfMVu+ABdeVmqZ1zOt6BU6B1SkGNA1T4R1dVzhXEzORx
         aYEw73Am65P0xNNlAqRboa53dZw9Mmjkns/41DGU41ofFHwNe4wwTZkUro1ray0sZ5eq
         VyYbJWeDBiWoQKJ22CjkDJDxuDC13yrvBJLzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760284687; x=1760889487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETrttjME+RLAz9oF+Vc0T2L5AfdebwLUQ97sC+ebeVc=;
        b=l/FHldGnXfh92XyN5D/W7nsYQyNWDinoT1oLYMFVOMUPdBSTIpLDIZhcqlPZST9l0+
         FACRo95QPwfHr54aCYe2pClQb/ejIygIzE2W3CAIg8agE04pq18g80nl8qjFVcewFm4t
         NBOJI0ADrViZcdlmBySCGo6zcSVfW20fSHZrigB5ZA1e/w+3M+drYIZEW3Ts5e5iVsbi
         D3nWpKPC5Tzc9MgV/1VUmed/IgOA+5XgVtzEY4RiYcBGDFi1F03ZFUl9LD0dp2+lXu/D
         XqgJ/iCR0q5NNNPEpzmCGRX0pNFDVeQOa0iKPcbHZbTxD7LY33YzzX5GUaRwF4YnuvAs
         PEhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/Cai1nf5tLJJObI0o1IMw+/6VwPJP9Id/eUn9o3arjdrcpZiQZK1jFUVAeIbSFrxNpNYXF39up8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx71pFHgYV+OY0wimwG86aj6oFS0+4Z7JoJzf7kP1y0aTCOBdH6
	4MhRIgXgYy2SlQxUsPzgkaH7AVTbMMk9Jo11TS+Lm4fOTs2yfqhEQ2hpktEadVRmwrSNbHT3/TG
	kTkDeVqWMgtaXxweFrnMjwV1Hh8hrPe9UvdauREM=
X-Gm-Gg: ASbGnctIS4G85kR9y1CwjoCZUqO/LSgdLbdHI4Fagk9ityTDRqndf+rdIrIHivuDk52
	PTCWWENKbUhyMpN2Pgfew1c8zlre6u9ZMYYUI3KRlQbGUZf4eacD0mIpyDXLPcPNDGQYJLL3vGI
	dsU2ZYsvMNZ+2v3SNKAfOrEWIan70gJpaJwpZTRkNbIVdGFbxUCLneLv6ItfNCt/BiQFWuKNnCA
	gYwzMXKuyN2GWbVDbrnMA==
X-Google-Smtp-Source: AGHT+IH35XQ59FPcOvngWzRy/oQxDiGYS0Hw/mZ3IyFp1aXt4wLRKNgTBA455RbE6iO/Ovw2EsuFG7ciajcpB3mWTAs=
X-Received: by 2002:a05:6512:400d:b0:58a:f815:b4d4 with SMTP id
 2adb3069b0e04-5906d8965b4mr4456259e87.25.1760284687076; Sun, 12 Oct 2025
 08:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007213902.2231670-1-ukaszb@google.com> <20251007213902.2231670-2-ukaszb@google.com>
 <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com> <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>
 <6e9f3b8e-2605-4eda-911f-b11f900f8292@rowland.harvard.edu>
In-Reply-To: <6e9f3b8e-2605-4eda-911f-b11f900f8292@rowland.harvard.edu>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 12 Oct 2025 17:57:56 +0200
X-Gm-Features: AS18NWCZGVAZAL8V0_qN1es6q8FfsnLrPm7Fi6O0VCtaS8PAHe96vLjAIAxG-bc
Message-ID: <CALwA+NbvqWD5Kz=RM9qR3Q4dta617=mWO+xOXU9VRApwuaRftQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
To: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2025 at 7:13=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Sat, Oct 11, 2025 at 01:22:45PM +0200, =C5=81ukasz Bartosik wrote:
> > > > @@ -63,11 +62,19 @@ struct dbc_info_context {
> > > >   #define DBC_PORTSC_LINK_CHANGE              BIT(22)
> > > >   #define DBC_PORTSC_CONFIG_CHANGE    BIT(23)
> > > >
> > > > +#define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN +=
 2)
> > >
> > > This looks like somthing that would be defined in ch9.h or usb.h.
> > >
> >
> > Unfortunately I can see only USB_MAX_STRING_LEN but no definition
> > for a maximum USB string descriptor size.
>
> The maximum length of a string descriptor is 255, because the bLength
> field in the descriptor is __u8.  In practice the maximum length is 254,
> because a string descriptor consists of a 2-byte header followed by a
> bunch of UTF-16LE characters (so 2 bytes each).  This allows for only
> 126 characters (or rather, code points) max in the string, which is
> where USB_MAX_STRING_LEN comes from.
>

Thank you Alan for pointing out USB_MAX_STRING_LEN is maximum length
in utf16 code points ;).

> > > Maybe a more local name like DBC_MAX_STRING_DESC_LEN
> > >
> >
> > I will rename it and also remove magic number:
> > #define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN +
> > sizeof(struct usb_string_descriptor))
>
> You might as well just set this to 254.
>

Mathias, do you have a preference here?
I mean whether to use
#define USB_MAX_STRING_DESC_LEN             254
or
#define USB_MAX_STRING_DESC_LEN              (2*USB_MAX_STRING_LEN +
sizeof(struct usb_string_descriptor))

No matter which one is chosen I will add a comment with Alan's explanation.

Thanks,
=C5=81ukasz

> Alan Stern

