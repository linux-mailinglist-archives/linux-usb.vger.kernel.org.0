Return-Path: <linux-usb+bounces-5144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E175382FE6A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 02:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3323288A48
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 01:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9288215B7;
	Wed, 17 Jan 2024 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GHDA1Dtm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB710E9
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705455219; cv=none; b=F34omw+t2AdASz+TFDa75Rfmcd8/L5o3mr7mpAn+tQB84385CGGh9R9dhcPHWX4EE+dYYS7lLB+/uWU4tpqvjSko59Zq2vaHCmWpVf+zWy+7BXL6h67GcLerC/wNbg3cJb4aTe9M0+0gLy8b1YZM8gSqTl1LPqIrFvJVNUgSLdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705455219; c=relaxed/simple;
	bh=miuYmhy7ASQhkQRO0Qe+druGuKMeZzPPMGM1zmtiCRA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=bzrRuUb0GVWzTOAJR5TyoNljatv/PTCKwro9U7XA6n1ka/Jwb/dTm16sKfS3YKrnunk4k0nrjO4qu2Lo6NpqRnqIyMUJBHz6L2iw6Kyv0Nii8Duj2RdQ+YgC6UoIKXu4sPwPb9TmAxj9aO8+k1eF14W861ilqEOK/rsHzExJk/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GHDA1Dtm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e865bccb4so23995e9.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 17:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705455216; x=1706060016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miuYmhy7ASQhkQRO0Qe+druGuKMeZzPPMGM1zmtiCRA=;
        b=GHDA1DtmDc8O5m8mlxBUowG9Iw77R8fMnA5bomvJ6a36ZlT52DcZLElWmPoqOeGA8N
         /S8rm3AL1NEr544rPv5H1EBFBYMkJEInT66Y5LIkLgJQZt9HYh+AIX1UXOQWXvmXamzj
         eHJjoJqW+9lfAarNNdNFj2iOjoDdZEpoH5ggrXI2K6odIABAi/iSFyPwy2E3D25I53il
         eCLJ98nSL0ovMTl+tEAUjTJOE8LxF/dfBkcMnRC7O5uUUqdd6SGToAwd1IZyWXui7AJB
         lt4Zw+6rGkT301tlMfZVvIzGjqCgJ7ibGRi3VPPLQY0u7b97Y4nSRe3PNIGZpGNMjo4a
         ztGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705455216; x=1706060016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miuYmhy7ASQhkQRO0Qe+druGuKMeZzPPMGM1zmtiCRA=;
        b=LHoCy56Ba+BXtwsjaYLRGf8xJBCK1vqWYPh8b2lLX+PqH7SsvEYPbtKbu0YAxDVn3M
         S5beqDqeEE2IH55pxxtGy09h6QeQhKZPzzniZxTJ34IlJaseQYUr7L8vWVPEnkpXk9tg
         AbZ0BeunSK7wb+V9usQjcSK+LbwgEKgZuWejDvD5dVQbwh1J2BpDxzjTriAicsl2HaRc
         K7LJeG+vgj8oylon6pPTwQxENF/ZpMIh4WN4vjbphnUbV46ZrgDJvM+krve04wHGailA
         AkIGRpLuYCruL9pTyVrw9lLJ5LRc5Gh9ynoG8cpY2s0QA3KA2fj0ei8CwWmtE21s4/Et
         x0GA==
X-Gm-Message-State: AOJu0YyLvuQSeUJX11ZB0yK1LPTY+uCx0A2FON2PL063Z/85EKhXI9bn
	GwNGTIFYKaxEUN4hUbuCZ/mGEZZT7LqTOu1DLf0LsRelckubQZM26SHywZc1DLug5vuK0RNMtoT
	mtbqY4++9mQANnotakZNwWIjMW35hAtHwwzKS
X-Google-Smtp-Source: AGHT+IEi6FH8OZ6MuIKSPEmoilpz7hxXnXwwqiqAhKxS4WLTX3fAKuQwdaDu9RycSYLVRxgYV77MIcAru/cJ2WJeXEQ=
X-Received: by 2002:a05:600c:3b97:b0:40d:5fee:130 with SMTP id
 n23-20020a05600c3b9700b0040d5fee0130mr22884wms.5.1705455215686; Tue, 16 Jan
 2024 17:33:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102073840.1579540-1-maurora@google.com> <20231110230837.b5q5dsvsqlxfz5xu@synopsys.com>
 <CAJnM4-wew9b=Ge8QHLRiReNJAqgA0ngOW8WTVk4frta+y+9jYw@mail.gmail.com>
 <20231117015143.nzgqaes256lnz5ht@synopsys.com> <20240117011110.6yubmp4ysd2fit2p@synopsys.com>
In-Reply-To: <20240117011110.6yubmp4ysd2fit2p@synopsys.com>
From: Manan Aurora <maurora@google.com>
Date: Wed, 17 Jan 2024 07:03:22 +0530
Message-ID: <CAJnM4-wqHmvTtkSYbLXfNByPZL4zv-ATwkywK4g7DsAhMtBSZQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Support EBC feature of DWC_usb31
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"manugautam@google.com" <manugautam@google.com>, "badhri@google.com" <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

I'm fine with reverting the change until it matches what the intended
use case is. I've added some notes:

On Wed, Jan 17, 2024 at 6:41=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> Hi Greg/Manan,
>
> On Fri, Nov 17, 2023, Thinh Nguyen wrote:
> > On Thu, Nov 16, 2023, Manan Aurora wrote:
> > > On Sat, Nov 11, 2023 at 4:39=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@sy=
nopsys.com> wrote:
> > > >
> > > > On Thu, Nov 02, 2023, Manan Aurora wrote:
> > > > > Support configuration and use of bulk endpoints in the so-called =
EBC
> > > > > mode described in the DBC_usb31 databook (appendix E)
> > > > >
> > > > > Added a bit fifo_mode to usb_ep to indicate to the UDC driver tha=
t a
> > > > > specific endpoint is to operate in the EBC (or equivalent) mode w=
hen
> > > > > enabled
> > > >
> > > > This should be unique to dwc3, and it's only for bulk. I don't thin=
k
> > > > usb_ep or the user of usb_ep should know this.
> > >
> > > In our use case we have a function driver that configures an allocate=
d bulk
> > > endpoint to operate as an EBC EP. So the function driver already depe=
nds on the
> > > feature.
> >
> > This should be abstracted from the function driver. The function driver
> > should not need to know about this feature.
> >
> > >
> > > dwc3_ep seems like the correct place to put this field but a function
> > > driver that allocates
> > > EPs and configures them for this use case would need to include dwc3 =
headers.
> > > If other vendors offer an equivalent feature this dependency would
> > > become an issue.
> > >
> > > Exporting a symbol from dwc3 is an easy option but dwc3 doesn't
> > > currently export symbols
> > > hence I tried to avoid that
> > >
> > > > Also since DWC3_DEPCFG_EBC_HWO_NOWB must be set, the controller doe=
s not
> > > > write back to the TRB. Did you handle how the driver would update t=
he
> > > > usb request on completion? (e.g. how much was transferred).
> > >
> > > In our use case, we intend to have a link TRB and issue a startXfer
> > > command. Completion
> > > handling and continuing the transfer will be offloaded to dedicated
> > > FIFO hardware.
> > > But we can definitely rework this to disable no-writeback mode by
> > > default and allow this to
> > > be separately enabled
> > >
> >
> > Ok.
> >
>
> Looks like this change was applied to Greg's branch. Unless I'm missing
> something, I don't think my concerns are addressed yet. Here are the
> reiteration of the concerns:
>
> 1) The gadget driver should not need to know the dwc3's FIFO mode. It's
> specific to dwc3 capability and should be handled in dwc3 driver only.
> Usually these properties are selected in device tree bindings and not
> specified through the gadget driver API.

I'm not sure how this will work when we have multiple functions and only
some of them use EBC.The other EPs are working as usual.
In terms of DT binding I can think of forcing certain EPs into EBC mode
and using them for any gadget that needs EBC but that will remove those
EPs from circulation for other functions. It would be great if you could
suggest a good alternative we can use.

>
> 2) This specific mode "EBC" doesn't write back to TRBs. It's not clear
> how this is handled when updating the request's status. It's also only
> applicable to bulk endpoint. If it's to be applied to the usb gadget
> API, it's not documented fully.

I will push a patch to remove the no-writeback bit based on the decision
above.

>
> Thanks,
> Thinh

