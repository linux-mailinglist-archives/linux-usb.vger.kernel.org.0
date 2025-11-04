Return-Path: <linux-usb+bounces-30041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 346FAC3081D
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 11:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90B054E7AF8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57170314B71;
	Tue,  4 Nov 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyc3oTic"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1AE2E974D
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252121; cv=none; b=k7s2O2phxP2hu0E1S7002TBVAmH9BOCFbdgnZWHLjjCdeElC3VnQ+XvmglCqABsyGC9svahehu/VCz6eR9L2u+enLLdeMNE6/qFDRZzQ/1Cjvs/ctn+dKbHC7b/BWEahu2nihCA1eCbkGv+MoTmKFPfALXo3tSH4Hko/4k00/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252121; c=relaxed/simple;
	bh=05d5E9MY0aI85s5xlVR3wKl/xBD93gHT2h1F52y2vC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liBAf5DNbZZBGaUSJRNKWF2m/xXuIdjxjAy6xM1OdcU9mod8cKKetkueGo25bACJtCBJl54SowlMVMt6g7QlEoqRPoPQlyDJunGabDasR6WZ6sgkRpIY4tX89Yyadln1Sy7YOOMTk2PUItLwYx4TARqDq4DQgca3CltVoc2iSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyc3oTic; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b9a6ff216faso2028620a12.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 02:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762252120; x=1762856920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=;
        b=lyc3oTicnUvduLEcq+ir6xs9w9OIk5mbU6FHdgZyVUZPYbW8L+u4HZv7rS7pJjDRnl
         rHdbgv6zE7uxJ//IVZozB/2yZEHA70BiVpcw+UvMeNIeqniaf3rY6y2EFNf5FnfDlBPh
         hmJneagOHzwkxT5+hk6hBjqvvLTndk6RBElWMUV8TbXoiYXJuhBjQv3F9hQ+Rb0esHKC
         +kbsJrnrUU9jN0Q3+jnxxl+NSqlE7kbPdwPn6ytRIp0dkljC9AuLDBMJurpRzeTBgK8d
         hPA3aS3jJ4zv41LZ8hrcgX7GeR6Ig9dq6tjWVomsZSg9BPHSjm6aPcepDHrAeT8kbuzW
         /EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252120; x=1762856920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=;
        b=ZXTYLQ9Gbd3MHadbHldGsk18Xabiv63+TQlWVNM310N1zp+yenOXfQjP7fstUf6mcS
         aAKRlcwL5yk5bMiGOeu6Hc+o3YJ04jmA6ul1puy5BntorEteNSsd8qsa328rfYTbDN19
         QsCSIRccCHzFN0ft3OcppS/w1XnvGLswC+3K4YrUMajBgOVM6+h3Bl+/iAGd9anPt9+i
         EBaPZAEvfmG/ScR0lRnRB9BXI9RLoCQ5yI2POs19CkuFB04E1gX6vsr/gAl/Ryo8aHu8
         c4UtaBnCfpu5QwwQzou8V9UoH16vbcBHRh3Jp6Ol2cJqTgGLiL+xiywVUdtMmN5St9Ab
         F7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxZl1UA9n0QyeZoIVvIbaJbIk3HsZIolOi31oq+J3IyaTFMYMIZ46WJERScQF9EqoPd2IVssBPOiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO38T78fv7mE6LUOMFoGQZjaHK5RO1yNrP1OGHJWYxu0CdpJEb
	CiVmZ05hZvf7e3iaXwS/IJ/vau4vkJbFlqna/5PyYXbEZMSwBoaot2uU76zPDR+uNxGeHCCovja
	TcQZwjBBl7V/Th8Bmj65ItnNsbsVzvxPP80fmfKrn
X-Gm-Gg: ASbGnct8CKcFBdk9kJsGQyjhrF9JpbHV+Di9e3MEA4mslsNyvly/iraJANbI2e4j51e
	KM2eZsWLTlcd9qyNxefxtWl96PSihZAi3VZV99CMk+R7SDhqlpe0/8T3vPNCJMmrWcB1Jrz37mD
	kS/l4dKchue5tajhGa725f1GXalRopx9r8ahgL7/xPQIAna47lTsSWF2FyoLRKx0TddSm2FJBHC
	DaFIFBoVtNePdRQ9C7+FZMSX+Z0kuz7z5LZV2hFP78OQrfjnfDVsthgrXZb3CwsWnoQ1QM=
X-Google-Smtp-Source: AGHT+IFtWCITnsqCpapCWEO1jfYZL/VVdrKbyDrZUYMRozSaaP1/me7PX/YPZoiJBaJe87Ul4D28jeHU7OTgnpSDtH8=
X-Received: by 2002:a05:6a20:549d:b0:341:5d9f:8007 with SMTP id
 adf61e73a8af0-348cd21b580mr22355749637.57.1762252119315; Tue, 04 Nov 2025
 02:28:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <2025110128-jailhouse-situated-22b1@gregkh>
In-Reply-To: <2025110128-jailhouse-situated-22b1@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 4 Nov 2025 18:28:02 +0800
X-Gm-Features: AWmQ_bnRE9DIQMXPkKDyyG2DDLmVc1ZLrXHYPMXtrjkVwdpu0f_b01Bk7DLUsug
Message-ID: <CA+zupgwOx5hADbHC8LbxkcsFBfgWyssqnRgE+YXy0umZmj6XNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 2:10=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 31, 2025 at 05:49:28PM -0700, Roy Luo wrote:
> > > > +         dr_role !=3D DWC3_GCTL_PRTCAP_HOST) {
> > > > +             dev_warn(google->dev, "spurious pme irq %d, hibernati=
on %d, dr_role %u\n",
> > > > +                      irq, google->is_hibernation, dr_role);
> > >
> > > Should we limit this print and do we need this to be dev_warn? It may=
 be
> > > noisy wouldn't it.
> >
> > Ack, will make it WARN_ONCE in the next version.
>
> So you really want to panic your system if this happens (remember, the
> HUGE majority of Linux systems run with panic-on-warn enabled)?
>
> Please do not, handle the issue, dump a message to the log if you really
> need to, and move on, don't crash.
>
> thanks,
>
> greg k-h

Thanks for pointing this out, I overlooked the panic-on-warn scenario.
This case is actually very rare, I haven't seen this on the field and I
feel it does no harm to the system even it it were to happen, having a
debug log should still be useful if we were to debug anything specific
to this interrupt. I will make it dev_dbg.

Thanks,
Roy Luo

