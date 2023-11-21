Return-Path: <linux-usb+bounces-3084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D07F2B1D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 11:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EE728269E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 10:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FE6482D0;
	Tue, 21 Nov 2023 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eZdlaOVh"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8418113
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 02:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700564340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlG9WPRpH5aLXxN0geSA1wmhi349BNl6rxlB9y+EYI8=;
	b=eZdlaOVhvCwg1YB7y8wN3mF/3I7CQGPvHGU3YWEoiA6Iw9wG3CO+FZb5rI0R3vIB03AQlJ
	3v84s6KAGlU5sOK7qoemhD94wAUJnQaO6cUZaScHxTLb2VRidaoExFTvy8L20e+z2Lux5d
	rcFUSEXrcp5AlAhHNxzyB/YuKSxdJig=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-83OvyPFnM82_IrF8aE7pHw-1; Tue, 21 Nov 2023 05:58:59 -0500
X-MC-Unique: 83OvyPFnM82_IrF8aE7pHw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ff9b339e8cso16610666b.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 02:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564338; x=1701169138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZlG9WPRpH5aLXxN0geSA1wmhi349BNl6rxlB9y+EYI8=;
        b=Q7E3154y0snS8cmjSr2qAXPusyNNquy8j+42+2T/4rOEXY//PLg+eeDNVPIOFN38wp
         B+gCGV/3EX92yJb1uVFJeFRBS7ukdgeRHdaO3LSqFAR5hIzjcXvPJCkASq+c8+Nv9/zK
         /vr58h7CI01V3ZRYxbU6P/spzmRqUQ4NiXaDiTquW5ACu+HLYAH+C3AHXIj2lfqG8oMf
         05iDWUxV4rn6ybOcLR8NAVgH0TlnaGL0C4MbwBs04nFBrOXvIuk/5faduTz2n7JEfYhL
         t/u9R8tq6Pm+6y2SSi5sT//66ItLiWROONKQIYH5Hxgu8covgNOh4BkCyb5rPjntiPsL
         W5yQ==
X-Gm-Message-State: AOJu0YwMixX43SNfkOQGvMnRwfU7kxZWyin3HogXLLJ3EPx2TYEenyTS
	rGQMce1JyHcg4wBMMfWn6BLiOfYIyIhirybxn/t/vZ6hB/XQgcVYjwenBC2w3jDgH3BGKqIXNOb
	ynRq2Y5mPpqkBKsmTXav5oX8MDTpE
X-Received: by 2002:a17:907:78d5:b0:a01:b9bd:87a with SMTP id kv21-20020a17090778d500b00a01b9bd087amr1071759ejc.7.1700564338001;
        Tue, 21 Nov 2023 02:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAG5ipzdlI8GZfIF0WyvN4yVli0RfO8w5wk/nbUnc7CLOu/xfgWAvds4G/6A6bAIl7P5Wpqg==
X-Received: by 2002:a17:907:78d5:b0:a01:b9bd:87a with SMTP id kv21-20020a17090778d500b00a01b9bd087amr1071737ejc.7.1700564337586;
        Tue, 21 Nov 2023 02:58:57 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-234-2.dyn.eolo.it. [146.241.234.2])
        by smtp.gmail.com with ESMTPSA id qu14-20020a170907110e00b009fc6e3ef4e4sm3031062ejb.42.2023.11.21.02.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 02:58:57 -0800 (PST)
Message-ID: <4b534e6aab6e4cf461f07680466f146e65b3fb25.camel@redhat.com>
Subject: Re: [PATCH 0/2] usb: fix port mapping for ZTE MF290 modem
From: Paolo Abeni <pabeni@redhat.com>
To: Lech Perczak <lech.perczak@gmail.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Date: Tue, 21 Nov 2023 11:58:56 +0100
In-Reply-To: <08e17879fe0c0be1f82da31fdb39931ed38f7155.camel@redhat.com>
References: <20231117231918.100278-1-lech.perczak@gmail.com>
	 <08e17879fe0c0be1f82da31fdb39931ed38f7155.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-11-21 at 11:49 +0100, Paolo Abeni wrote:
> On Sat, 2023-11-18 at 00:19 +0100, Lech Perczak wrote:
> > This modem is used iside ZTE MF28D LTE CPE router. It can already
> > establish PPP connections. This series attempts to adjust its
> > configuration to properly support QMI interface which is available and
> > preferred over that. This is a part of effort to get the device
> > supported b OpenWrt.
> >=20
> > Lech Perczak (2):
> >   usb: serial: option: don't claim interface 4 for ZTE MF290
> >   net: usb: qmi_wwan: claim interface 4 for ZTE MF290
>=20
> It looks like patch 1 targets the usb-serial tree, patch 2 targets the
> netdev tree and there no dependencies between them.

Sorry, ENOCOFFEE here. I see the inter-dependency now. I guess it's
better to pull both patches via the same tree.

@Johan: do you have any preferences? We don't see changes on=20
qmi_wwan.c too often, hopefully we should not hit conflicts up to the
next RC.

Cheers,

Paolo


