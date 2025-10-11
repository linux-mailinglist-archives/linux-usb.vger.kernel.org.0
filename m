Return-Path: <linux-usb+bounces-29168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC292BCFA18
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 19:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CBE54E63D3
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 17:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07F82820A3;
	Sat, 11 Oct 2025 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bCbpAuaQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057E281509
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202817; cv=none; b=UotBJWlMVTTphsKJVL5CeCatlLJlotCUS1DrSHh7meA/X2qn9veaEk5J3PfUA0CAhToDOv3nxe5E9uI4KnonHG+M0TWhZdFh7P/RxQ2sQnVAx5dsY29H4KkPfNL/CYGjaFLTeKQECXvKPHz+Hn0T11ts3mcH82yin5XtvYA4kNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202817; c=relaxed/simple;
	bh=ahkuRdstz0SMj8BSX8LFRv++of7Kvey5MJA8uoxSfco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7mVQtWYrffEI8vaVJY3FEEKxeRx6CYuI4tSa6NqF7BNXlBUbFvVVVByib7nuUxmixUv38egfDBSpklcuYnb4cNytHWzgX2eBcw1gVLo6EyC9zs9bPxFo5OOcOA6Y1i8vN9cAGP8ol6PxcKG5pRpV2k2HGBHiuMMTLNG18dkumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bCbpAuaQ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-78f15d58576so32319776d6.0
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760202815; x=1760807615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TACNrvlJ/uhPxu8z3V/jMHZy/0WokgMYy3a6wxGwyaw=;
        b=bCbpAuaQdD9wngLuJTrRs27gaJwsiGZNETY0AmjLPJ8dFipG2oj/rA2jTHnMhDwVn+
         TsHzJ/x5ez45vbJ5q80D3Z68HucDm0h/tqpTIE+yD5NXUUVmBYbWvnWNJeAUSykjVU/t
         pszM3P2bLr6f+wbwgv5/vuv5p0Soe8LwzJRhR+t/dwTK+eyG/Ae83GWHWyKlrt90+uwk
         rT5N7eEGCeqyfGxgFJvgdElCt3Xk/+NfLDgoJoYSOZUQSLXU806ry7YK+E0nBzCsTwxm
         WjlXuZ9RWPeRThV6vVYkry+QHjFfLHIGx/nPD1ZT1NlaNaMoqPIJZs7x/pvWqgqPcWWV
         W4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760202815; x=1760807615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TACNrvlJ/uhPxu8z3V/jMHZy/0WokgMYy3a6wxGwyaw=;
        b=fgjKO5MS6Y6LAHQOaLUEku2uIjT/cOvNzKSN1JXwRCD8bjC9UiwTWrHmrjfh548yzC
         m2/BBvEB8YskddTxEJt08eL1quFO1NWPRoeGNnqZQx6ULCN+WSCNy5yX3AxnU1LEiJea
         Sy2sfDoq/pG6H8tWUXkt1vavQOJjJEJur+r944aqljF4wWEUI+XPOZkO5WIhYi5G1LHb
         qTWDiFaPdoQmu8iisKIcAkX0lVD7ktcKLBZX9avQ7jKaoGcppcTGbcmCIrq9EBtfguTD
         HsNmQNI5aropBHiNPgaPwk+KwutZcACCXFOlWoI9W8+y7TqAOCUEsZbk0uIr2vhv71fP
         jEKg==
X-Forwarded-Encrypted: i=1; AJvYcCViYDWS2/nCacXdtUJTO+fbmbo/XOYBUuDjhquSZ9kh8CIeJHaVye1J1Ca/YTfASe0TNY7H9m0kpgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Fj59GSTY7jKaEJojdLYgKpA5HR9R6QnHUWqqYhDogE6WSBKO
	3ElZ6ug1IjNT/Zg4MZZrC0HwTaeX79TA7nW9p+aqmJvyHV9x1B7dxHazv+1OuVspFg==
X-Gm-Gg: ASbGncuDw0sYNUxamyTdVfwrJkSzgxXW1hP7PIulnP96CLowhCM39D6PMySygnGCfcn
	CmB2geUIq62qU3SXnKizNiQzFS02U1Lu/EZEQzsxrz7SSln52MFIwd62S5oasepTTx9HmGq7zVx
	b2bJYRaxFRQLUW7oRTvU/EYEKbIOXeORLdl9egLCLfnCytEIXCgvu7FRCgFJLmk+8STU/IsK+zA
	Ur51qNc7kym1kAIONt9TPbqsqN2Z+N9lC+K6vV4U3ouzNJHgt7rUxIhxRHY0OvTl/MGza+7Uavz
	xByBekLEjUzt1JPgIkrt/vHH3sGMHxGpp6KP81Jvw8mPnf89ENYcicXoDtlxsUHqCTwOz9f3H2L
	xM/841ffKSl56jmLrPFUaxkRni6OvLSeDqbMHiaii7UJ2s3XtAw==
X-Google-Smtp-Source: AGHT+IG9Z4mzkK/8NI0ss69ALbnrDrF/wZvmo7/fKtBRVLs62iCaDUGmqd2lz7BxnDH2Z1n+IC9SUw==
X-Received: by 2002:a05:6214:3014:b0:78f:48ef:d8c with SMTP id 6a1803df08f44-87b3a7e7b73mr191173966d6.22.1760202814720;
        Sat, 11 Oct 2025 10:13:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::de67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc346f6e8sm38129846d6.20.2025.10.11.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 10:13:34 -0700 (PDT)
Date: Sat, 11 Oct 2025 13:13:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
Message-ID: <6e9f3b8e-2605-4eda-911f-b11f900f8292@rowland.harvard.edu>
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-2-ukaszb@google.com>
 <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com>
 <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>

On Sat, Oct 11, 2025 at 01:22:45PM +0200, Łukasz Bartosik wrote:
> > > @@ -63,11 +62,19 @@ struct dbc_info_context {
> > >   #define DBC_PORTSC_LINK_CHANGE              BIT(22)
> > >   #define DBC_PORTSC_CONFIG_CHANGE    BIT(23)
> > >
> > > +#define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN + 2)
> >
> > This looks like somthing that would be defined in ch9.h or usb.h.
> >
> 
> Unfortunately I can see only USB_MAX_STRING_LEN but no definition
> for a maximum USB string descriptor size.

The maximum length of a string descriptor is 255, because the bLength 
field in the descriptor is __u8.  In practice the maximum length is 254, 
because a string descriptor consists of a 2-byte header followed by a 
bunch of UTF-16LE characters (so 2 bytes each).  This allows for only 
126 characters (or rather, code points) max in the string, which is 
where USB_MAX_STRING_LEN comes from.

> > Maybe a more local name like DBC_MAX_STRING_DESC_LEN
> >
> 
> I will rename it and also remove magic number:
> #define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN +
> sizeof(struct usb_string_descriptor))

You might as well just set this to 254.

Alan Stern

