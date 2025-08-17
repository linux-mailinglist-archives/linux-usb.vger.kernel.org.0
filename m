Return-Path: <linux-usb+bounces-26940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9841B293CF
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 17:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A265200290
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 15:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82C328BAB5;
	Sun, 17 Aug 2025 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmxUkp3V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7059B2882A2
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755444153; cv=none; b=b4QmIDl+pkehjHt7Q1lHBlyKocMzqnGOStw5VwJVfV3DOCkcQSe57lKeAL3M5r+Ii+siWtJhPpeqsM3n2rNrMPShoZvecz4eFKZAn8Rofk5JZXOLfWjBjp5z7w/Y9Q0JXcGFMmfGhL71KThtb71SAT1Qh5+g3E4Rotz0j8cdk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755444153; c=relaxed/simple;
	bh=4rt9RLGQm+hN7Ch8mDx2J5bMPjsTplqrG+hkuikcGlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEXpRkwVqrpYm3pzTwbVnF4k4QAhKuSLuyNZfRIqc+RRlEQBaQjSlahNvigcWdaz0EsCW8Yvxg1yU/nUOA9xYh9YtBAppzbnlYPj3cpQF1EOXfC3726Y42Xg63ImQnNd+Ay11mlF72EwNloWVDWhOjEP+ByX/K/Bf607Eur45lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmxUkp3V; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9d41c1964so2379344f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755444150; x=1756048950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA+4oXZFzlmg54CswUuTYzPFu4jODQPbp3o1TxMXqiY=;
        b=YmxUkp3Vec4HSHNtw0nXH3gtmoJyqe0ZDBZZr0J2bverMlynv7yrqsA5ullYXtochS
         SrvysZ7HMNpvaEbh5azl55zCJ//Z7epEcaAInBR2HVw5TuiEtv2J0cw6qVBw7+WvJhbF
         +s/HuYNhSTdE2lSwwR2NHh1BtCyqL33LBrhLYSIf7K+M4p0FqXvfUx+azweSOhwR+YJ8
         oKBb8/2vUwE/lAvEQWlMpQAjaAHOISu4IScC37h5qVQ7ibVi7w8M4FVTnZdExx71QXZ2
         F6AalvE3UxXJtqQdGlAgoIXigT+E2n2djCfRw26iz41Yckx05yQOwT17Ovqy9tmzgHIT
         j0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755444150; x=1756048950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA+4oXZFzlmg54CswUuTYzPFu4jODQPbp3o1TxMXqiY=;
        b=feZMf1xbkDikqoMIavP1iqrRsl0bkkPcpUvBRQ3gWe4uXaAw9vuWkLYcn1P+eFcV46
         suPwmrzjFWwHbZu4CzWyvVGS2K1/jpd0yquIr05eoyy4jYl924VzaUeRxN1cxSWb9NG7
         BDwrov5ZvLck6eLr0Y9BF/Hcfto1Ek3l+AUXemRKAICMWWODGvWCHlG5M0MGPLPR4UMu
         enxx8Ldvjc701PFQmzm7KE1n0q35yQUcpxT3XHi8a+HIiL8aRFwXBMEvD+fSflqnB7gG
         d7/6pQMR1DuKYB679N9Co09TAeHmroG9pi6FuQ7X1huZ+RjXUJnG/fA1AHvsgKRImcIf
         YD9w==
X-Gm-Message-State: AOJu0YxN5ZL/RxCaCJ94dEw9zWHrN6KN2gBkrBHGKebfiQttjn0/sEG0
	JKm9buIdtdiCODw8KZk8Ko4TA2LUA6e2rL9AEnuy+I2j4SqbrcIsra6IYNnQwAd408sc4MyqLi+
	B24cwIc7EpvyxpFhZ8ENQ6LW5pytga0/QNMcY
X-Gm-Gg: ASbGncv19H2gCuN0/uE8YyrWJzGJf2yIJjh+twN0jFppe3lTiaxSFHzTdlY+32AfCSG
	8yxiUaN10+4aQA7MPlP/fYJo5qVrSi+wa017dcmBsDbWRzzBmTCTudJNbPPWH6beM1M48lu4aeR
	10tQb7tMghFdA1cQucSzgz4AL5s8vPiX96/5ZpcSJYzSOsI5s/Ge4sgNMd8RrDlHuqWzN4Of3HB
	E9JEcU=
X-Google-Smtp-Source: AGHT+IFn5PxAKX/7R3oi8gVs7IQosg+7zEN5/JLsnXdmrkIS4m2JBwDDRhIFLDWhDP9dIhm4tSskKOn6VmdlR7Jmxzg=
X-Received: by 2002:a05:6000:2405:b0:3b7:c703:ce4 with SMTP id
 ffacd0b85a97d-3bb69a8383cmr6882322f8f.59.1755444149399; Sun, 17 Aug 2025
 08:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
 <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com> <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
In-Reply-To: <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Sun, 17 Aug 2025 17:22:17 +0200
X-Gm-Features: Ac12FXyojzaszEoETjRW6XR-oy1AS4xspgoSbwam0MjlHtBC1u5ntKc9R2Vpl1w
Message-ID: <CAGRyCJEaysizTYu=bsP2mhg54-iiP-rWeS6_9h5sfm4yr705yw@mail.gmail.com>
Subject: Re: Problem hanging Bulk IN, with USB 3.x, perhaps due to
 wMaxPacketSize = 1024 and wMaxBurst = 6 (OUT) and 2 (IN), tested and
 reproduceable with i.MX8MP and Raspberry Pi Compute Module 5 (CM5)
To: Martin Maurer <martin.maurer@mmeacs.de>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com, 
	mathias.nyman@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Martin,

Il giorno dom 17 ago 2025 alle ore 17:09 Martin Maurer
<martin.maurer@mmeacs.de> ha scritto:
>
> Hello Micha=C5=82, hello Mathias at all,
>
> many thanks for your answers!
>
> I have tried if I can reproduce it with a AMD Linux PC, but
> unfortunately I was not able to reproduce (but setup is a bit different).
>
> So I went back to Raspberry Pi Compute Module 5, where I mainly
> connected the radio module (Quectel RM520N-GL) via USB3,
>
> and installed a Wifi access point. All data/all connections from Wifi
> access point are routed directly via wwan0 to radio module.
>
> This is currently my easiest setup to be able to reproduce the error.
> Mostly in a few seconds.
>
> My knowledge in area Linux Kernel + USB is unfortunately not yet enough
> to analyze and fix it by myself.
>
> But I used the help of ChatGPT-5 to create an usbmon and xhci kernel trac=
e.
>
> I create an usbmon trace as well as a trace from xhci (both recorded in
> parallel):
>
> https://www.file-upload.net/en/download-15523936/usbmon_bus5_20250817-150=
158.log.html
>
> https://www.file-upload.net/en/download-15523937/xhci_20250817-150158.tra=
ce.html
>
> This was the last output, my ping in a shell has shown:
>
> 64 bytes from 8.8.8.8: icmp_seq=3D2323 ttl=3D112 time=3D26.0 ms
> 64 bytes from 8.8.8.8: icmp_seq=3D2324 ttl=3D112 time=3D25.0 ms
> 64 bytes from 8.8.8.8: icmp_seq=3D2325 ttl=3D112 time=3D29.1 ms
> 64 bytes from 8.8.8.8: icmp_seq=3D2326 ttl=3D112 time=3D37.8 ms
>
> In parallel created more data traffic, but with ping I see first when IP
> data connection does not work stable anymore.
>
> According to ChatGPT-5 the following places contain errors:
>
> *** USBMON ***
>
> In your usbmon_bus5_20250817-150158.log:
>
> First -71 (EPROTO) on the QMI Bulk-IN (Bi:5:005:14): line 2161,
> timestamp 493245744
>
> 2161: ffffff8003c8cb40 493245744 C Bi:5:005:14 -71 0
>
> Just before that, there=E2=80=99s a -75 (EOVERFLOW) on the same IN EP, wh=
ich is
> often the first sign of trouble: line 2159, timestamp 493245221
>

I did not have the chance to look at the usbmon traces so I'm not sure
that this is really the same scenario, but you could take a look at
the whole thread at
https://www.spinics.net/lists/netdev/msg635944.html

If it is the same issue, basically, if you setup the data connection
with QMAP you should not face the issue.

Regards,
Daniele

> 2159: ffffff8003c8cd80 493245221 C Bi:5:005:14 -75 1024 =3D ...
>
> So the sequence is: several good completions =E2=86=92 EOVERFLOW (-75) =
=E2=86=92 then a
> stream of EPROTO (-71) errors on Bi:5:005:14, which kills further ping
> replies after your last good seq (2326).
>
>
> *** XHCI TRACE ***
>
> I found the first failure in your xHCI trace.
>
> First error line: line 8216
>
> Timestamp: 758267.000115
>
> Event: xhci_handle_event =E2=80=A6 type 'Transfer Event' =E2=80=A6 'Error=
' =E2=80=A6 slot 1 ep
> 29 =E2=80=A6 len 1472
>
> Why ep 29? In xHCI, the endpoint context index is ep_index =3D 2 *
> ep_number + (direction), where direction is 0=3DOUT, 1=3DIN.
> So for Bulk IN ep 14: 2*14+1 =3D 29 =E2=86=92 that=E2=80=99s your IN 0x87=
 pipe.
>
> Right after that line you can see the driver react:
>
> xhci_handle_transfer =E2=80=A6 length 1472 =E2=80=A6 (the failed TD)
>
> xhci_queue_command: Reset Endpoint Command =E2=80=A6 ep 29 (host tries to=
 recover)
>
> xhci_handle_event: =E2=80=A6 'Command Completion Event' (reset completes)
>
> But from this point on, completions for that IN EP correspond to usbmon
> -71 (EPROTO) =E2=80=94 matching what you saw.
>
>
> Does this give a clue, where it could be coming from?
>
> It is 100% reproduceable in a few seconds on Raspberry Pi Ccompute
> Module 5 (and I same behaviour on different kernel of i.MX8MP).
>
> Could it be a hardware problem? I already tried different radio module
> (all Qualcomm, X62/X65 and X72/X75),
>
> different cables (all same length, all from same source), different eval
> board for the M.2 radio modules (but from same source).
>
>
> Can you give me a hint, what to try next?
>
>
> ChatGPT-5 pinpoints me to try to disable LPM for USB3, could this be a
> next step? Or is it something  else?
>
>
> Many thanks for your help!
>
> Best regards,
>
> Martin
>
>

