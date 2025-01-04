Return-Path: <linux-usb+bounces-18964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA1A01278
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 06:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ECAC16403B
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 05:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79F31487F4;
	Sat,  4 Jan 2025 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REqYfUOX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321C8467;
	Sat,  4 Jan 2025 05:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735967452; cv=none; b=UKww+O0ku8fuf1YzRvMBmKRG+T6bVrsmf5kdjXD+pRjyfODNZo177pOgCFlICzTyCmYk6GN/hlvLf4bX8i9awxx7VgeHXpZ03/m1AoRw/s7EX3K2nPO+tMrgNM6LgL2OMil7062ROxfdLsLzj4vqz9VLWKhvhrpRoE6Dd0JU6Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735967452; c=relaxed/simple;
	bh=o07iVHCjXz39Xj2B3yWvuTIZC6o6cnxCvYXfnSyRM/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnweBAl/Tjl6MpFOCReMUZe8IYQ+Sdl0WQPaKh1PQ9IYy1sGIq+j1hTM6/wlEHxxt2jphbMBuAbKNDq2Qf29gjKX+J2AhFcryTBhUTIHhNEJf3Ef5x3V7LCsoT9uexAvaVphmmyfzIOmpNUh0whx8Pk6T3JQLNDMgYtxDYs7MAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REqYfUOX; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2a8690dcb35so3278289fac.3;
        Fri, 03 Jan 2025 21:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735967450; x=1736572250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPII5ajuwm4kb2VfG9WZV46CMZXB8H2yGSdYqx5bWng=;
        b=REqYfUOXOWZEVaKvWAgkOcO08WRlxKUowPj7z/OKpSwKKxNsn/6lnAD8VCxNXhoZXZ
         607gTs8bPwNkHZvXJ4hPwh922sIidBKgyRTOxMgQN0jmvpTBCzpZ86P9/NFYACayTstP
         mwcRHTp15g1PmWOEctO59fA/26XTdEtSV5wti//MOm5mBlCsI7IMMPmq53DURMeKsFQo
         OrAMjpf/TjmUOvT7pHVWkABRn6YsLw1vfni0gnxDvxJIj7kyrE7MBOfCwY4YDdTJp/8O
         7HtISIadTEKdxQdKdF4LiRyGJI7SnG8AZpqYnw8REpBantIEC0LVl4WX+AR1yMwfn5m3
         zieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735967450; x=1736572250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPII5ajuwm4kb2VfG9WZV46CMZXB8H2yGSdYqx5bWng=;
        b=pJR5iwgnyGh/xJ7gEa8ppZSdOj31QL0a/+eGX+evXFiHqvQpi/jt6OfIdS6puZJl5u
         Z8vqQbqyg8lxvh/j2aDMw37yMPmARKJoiYtxKLnpf8VWfgmI9eywkk2rU0dAz5Umv7yE
         //q8OTOASqNNH9vOzMCHh3OGgD/57VSGzpCy9D5ubD49dVsGSrst2k4TZSOqT6QZ2x9R
         Z82n+9+q28sAOqdIerdVnYFesrw8KFCmNW/Dn/3Iqq4khlTce6tZQXJ4nvlM5OH9IwLe
         QBvS8fUcR6YW8RQPhh91hv9l72Kn8TGr1MQVe8pxFBsWhTQuFbGLgtYaDjZXxbq/g5vi
         WRfg==
X-Forwarded-Encrypted: i=1; AJvYcCWqKeBRby5QHLn+DQIFw4hHrxcF4am/SDcwYMDLEqz9qmKB5eoNGPIgUgvlzGpb+q2XwOVhUlqrWV/U@vger.kernel.org, AJvYcCXmKdV6G2o8aDNO1jx733pehe7zxJf+pT5H0kDWk8tzYJ1gG9WJBYpyLZxrVzx2iThg0/+AIzxnbmOp@vger.kernel.org, AJvYcCXnGSHUGiPdVfeksfhv1/VBIejPn8MUfp7haN+QJF7XwZ4qf3icoD9XrYauyvtxMgsfGgwAiBBRnnN8yAWE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxujekbz02txNQX9wLIuhz+ibpslk8tWS0NU1/+7TDvHvtrtjcb
	WS17r3sfsOBu42cXqKPsbhVq3tpgcLzhS+MJjs3FNmCimO9GP8mpIwdaPqO5O7EvzM6T51kMhxX
	DeW3S5coL/r+w83TkTJNBe5GD1x0=
X-Gm-Gg: ASbGncsEO2WCHTz3Rj+pxBzOnFeg4UIa5tSUd7sJhcBxnoUqCdDREpSOsWuGN/bCRgw
	JlWm3wvAu+C+J9tGuelk2x2ILFqS/v00PyKeNPUo=
X-Google-Smtp-Source: AGHT+IHP2iyg8h+rV23gbaKpNS1mORXBUrVw8XT7LfiiUsQxxZqhqsjpHhWBaa4KTY5v3LNyJcIxLHmcTf1+T/UT0tw=
X-Received: by 2002:a05:6871:4410:b0:29e:4bc4:97ca with SMTP id
 586e51a60fabf-2a7fb14cf4emr30581104fac.21.1735967448339; Fri, 03 Jan 2025
 21:10:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222105239.2618-1-joswang1221@gmail.com> <20241231134709.GA79257-robh@kernel.org>
In-Reply-To: <20241231134709.GA79257-robh@kernel.org>
From: Jos Wang <joswang1221@gmail.com>
Date: Sat, 4 Jan 2025 13:10:39 +0800
Message-ID: <CAMtoTm3oCnU+dXO1QOZqs_=PNP_MKWMyNuSxZDjOEPO=dHEUEg@mail.gmail.com>
Subject: Re: [PATCH v2, 1/2] dt-bindings: connector: Add time property for
 sender response
To: Rob Herring <robh@kernel.org>
Cc: heikki.krogerus@linux.intel.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	rdbabiera@google.com, Jos Wang <joswang@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 9:47=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Dec 22, 2024 at 06:52:38PM +0800, joswang wrote:
> > From: Jos Wang <joswang@lenovo.com>
> >
> > Add "pd2-sender-response-time-ms" and "pd3-sender-response-time-ms"
> > DT attributes to better solve the following test items in the usb
> > pd compliance test:
> >   TEST.PD.PROT.SRC3.2 SenderResponseTimer Timeout
> >   TEST.PD.PROT.SNK.6 SenderResponseTimer Timeout
> >
> > This is to enable setting of platform/board specific timer values as
> > these timers have a range of acceptable values.
> >
> > [1] https://usb.org/document-library/
> >     usb-power-delivery-compliance-test-specification-0/USB_PD3_CTS_Q4_2=
024_OR.zip
>
> Don't wrap this line.
>
OK

> >
> > Signed-off-by: Jos Wang <joswang@lenovo.com>
> > ---
> > v1 -> v2:
> > - modify the commit message
> > - patch 1/2 and patch 2/2 are placed in the same thread
> >
> >  .../bindings/connector/usb-connector.yaml     | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.=
yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 67700440e23b..83be66f6d406 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -293,6 +293,26 @@ properties:
> >        PD negotiation till BC1.2 detection completes.
> >      default: 0
> >
> > +  pd2-sender-response-time-ms:
> > +    description: Represents the PD20 max time in ms that port started =
from
> > +      the time the last bit of the GoodCRC Message EOP has been receiv=
ed by
> > +      the Physical Layer, it shall be stopped when the last bit of the=
 expected
> > +      response Message EOP has been received by the Physical Layer. A =
timeout
> > +      leads to a hard reset message by the port.
>
> I can only guess that 'pd2' and 'PD20' refer to Power Delivery 2.0.
>
Yes,   'pd2' and 'PD20' refer to Power Delivery 2.0.

> > +    minimum: 24
> > +    maximum: 30
> > +    default: 27
> > +
> > +  pd3-sender-response-time-ms:
> > +    description: Represents the PD30 max time in ms that port started =
from
> > +      the time the last bit of the GoodCRC Message EOP has been receiv=
ed by
> > +      the Physical Layer, it shall be stopped when the last bit of the=
 expected
> > +      response Message EOP has been received by the Physical Layer. A =
timeout
> > +      leads to a hard reset message by the port.
>
> And pd3?
>
Is your suggestion to change the description of PD20 and PD30 to Power
Delivery 2.0 and 3.0?

> > +    minimum: 27
> > +    maximum: 33
> > +    default: 30
> > +
> >  dependencies:
> >    sink-vdos-v1: [ sink-vdos ]
> >    sink-vdos: [ sink-vdos-v1 ]
> > --
> > 2.17.1
> >

