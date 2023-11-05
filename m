Return-Path: <linux-usb+bounces-2547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC207E135C
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 13:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81B89B20DFB
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 12:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D339E3D6C;
	Sun,  5 Nov 2023 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeRFSouX"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB61123B3
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 12:49:13 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBE1DD
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 04:49:12 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso526424666b.1
        for <linux-usb@vger.kernel.org>; Sun, 05 Nov 2023 04:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699188551; x=1699793351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJtBo0s1r43/zhVvDtgXi+MH/bthkEpblSiSvDSVPfE=;
        b=WeRFSouXvKIegi++Wvr7FiLfKlyjHcx1ryjtP2waEWMMbU7aClhIRIxPFfeM3qZoR3
         qJMzIfdJVgyK8kx030wFDs2+3i7NazRZTWc95V/7yOunb3VX1Pq7JKNII0kc6m98z6WA
         J7O1rU9iyLNq17KVvKb7h29+s77bT8eboEMkEHaZoDhynA085t2vWGpC0KIUaQqUjLEe
         6IDidfq131XTObNobODu4mr8J9OV30UoTBW8ng4e37Ws8cSO8RlMhfGochrb5x3peFl9
         B7C8H4O9ouhpjy2mGynQ6DYyz3nKik3vFgi5929u1dzVrEjWjRkQU2bBk9JmXb3/NJoO
         OjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699188551; x=1699793351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJtBo0s1r43/zhVvDtgXi+MH/bthkEpblSiSvDSVPfE=;
        b=luTf+mfx+HbgoOO6g2Xozz8wCUDfoDEjddVszd1+FEe7DRQQSFskGDRkwAyjQ1NRa2
         3fpsRqvbxfMUWlJdhFQNfYsTS5QdrDJn9nl2te9GcOSjQjki/jTsiiq4iinLSV4kp993
         khN2ALVKWS/8do2HCLl47NfmgA2c+idOWkZyiuLd6ux1XGWpyyK1dpNoAG57FnDlzKun
         2R5IFaNR4UHGxrChwQJr49FONHFTArh7U5kHQU1sYzyPs5mg/2pxfYRLyFzghxb+lHAb
         4Sh8iIx6sJ2IIz3RyPscpdyNw7OHWBtezWCrwTH9wZvaq/fLZMMkKXh0Ej+c8YCa+akd
         +AYw==
X-Gm-Message-State: AOJu0YyETT5gnH6h2PFj1e3uIm6Twq4euMRdssw54xKdcGnWnKgIgsue
	PrgOMx1HxtMVdoCyjYJtNkV4+WRHuHo=
X-Google-Smtp-Source: AGHT+IHcShADPASV2Qciff3v/jjGKNtgn1fJ7uxNEOHNw7neObIyvYiYxk3FrYShpk/hoApCC8wMzQ==
X-Received: by 2002:a17:906:c144:b0:9dd:67db:1f36 with SMTP id dp4-20020a170906c14400b009dd67db1f36mr5214464ejc.42.1699188550894;
        Sun, 05 Nov 2023 04:49:10 -0800 (PST)
Received: from ping (dynamic-2a01-0c23-614a-dd00-ee41-07a6-62dd-2930.c23.pool.telefonica.de. [2a01:c23:614a:dd00:ee41:7a6:62dd:2930])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709062a9a00b009829d2e892csm3040279eje.15.2023.11.05.04.49.10
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 04:49:10 -0800 (PST)
Date: Sun, 5 Nov 2023 13:49:09 +0100
From: Fabian Melzow <fabian.melzow@gmail.com>
To: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <20231105134909.6c3f28d1@ping>
In-Reply-To: <2023110540-unseemly-mobilize-9e82@gregkh>
References: <20231105130215.2b669c8b@ping>
	<2023110540-unseemly-mobilize-9e82@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sun, 5 Nov 2023 13:20:38 +0100
schrieb Greg KH <gregkh@linuxfoundation.org>:

> On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow wrote:
> > These devices should report 5 Gbps for USB 3.0 in the Binary Object
> > Store Descriptor, but don't do so.  
> 
> Why do you think these should report 5 Gbps?  If the device descriptor
> does not show it, there's nothing that we can do about it in the
> operating system, sorry.

Thanks. I don't look at the USB specification for USB >2.0, which
was long times ago and then only for a user space program and thought
that it at least theoretically could be possible to set the device
speed at some kind of initialization.

> > Maybe it is possible to add a software fix for this hardware
> > problem, so I report it here.  
> 
> What exactly is the hardware problem?  What is not working "properly"
> for them?

All 0bda:b812 USB-WLAN-devices seems to only operate at 480 Mbps,
but have a WLAN-chip which supports 780 Mbps at maximum.

