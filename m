Return-Path: <linux-usb+bounces-14173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50809960774
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 12:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 008C7281610
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 10:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02223186619;
	Tue, 27 Aug 2024 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="Dr5u0moT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376F17BEA1
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724754638; cv=none; b=UNPr8s2yXAgUdk3GwoWlRG1J4Y6TbfqtVTzyiFE0J1JpUrcC53Zw+MbQbnLkK5XePPjgmtqbJ6YiufkPJBcIYI++FqoxHk1zVXjf40sCFSkIWtQuU5EIMOic9Eaq+o8+yowHx0zCMAgYTJbaaP7TIpo7TuEPICdp86BSLLC1r50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724754638; c=relaxed/simple;
	bh=ItsVpeNEUwUox40/JaYN6LLRSksh2DiPgYqbryVZGS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VZTYQf28zRlHEJqYgmIztFcRAP4vMP5Ns+ySKVoQCW+PKy7G9BNI3dZz1xbeaBxd6z3JYSwgaOxQ1VLzBzLdOORhlkSlVh8NibFwKUGU2v08ja65u/Dt+OjY8A+VQhecyZR1zzVFLLBhxMWNh5DrpdgLwsy0HB5i7o028/KtfGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=Dr5u0moT; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724754629; x=1725359429; i=mista.tapas@gmx.net;
	bh=k8uYdUPa69wKaKoOhoqnl29CUIN/uWEe7G8uEIiseY0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dr5u0moTNYWt5LE0RYH7k/aURpki0uHgF0uOrI74OO+GuQ5jOu7RPGIW7FDJr1Nk
	 hBZgphMxGuX+cA07ubXajBjH/yVm6l1xO7prsrdBzXYA2ovwr2Kl4sScEGRTwWKG8
	 wLcG5yMotPqRSUnMtezJayzsn2Udai0Zf+ZcOoMb3O2LCYe+dNprqKzNjWYPTyyzd
	 NU0HmF0KS9qC5fEJOuMgByOiYFi6NqC3Y5JSa6D4L7XnhYfBSMiOkqFQcmj4NUE5B
	 aIQqja5vZ1tovJAtO4wEaj5soysVAmMFH4dQ1+4tsT1bNYs73CYNlER9p47vxBx6O
	 FJEAmauROH7D87WMOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([94.229.156.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1sTqUo1J0N-00Me9a; Tue, 27
 Aug 2024 12:30:29 +0200
Message-ID: <eb8ea495-6854-4e2e-9474-6348a7a0bf69@gmx.net>
Date: Tue, 27 Aug 2024 12:30:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
From: FPS <mista.tapas@gmx.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
 <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
 <20240825065831.0eaba5b2@foxbook>
 <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
Content-Language: en-US
In-Reply-To: <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eLyMBD2MZ+ARqz5pywoT//Yl+1gWSPoEg0LNO/oVNsxC1AszfOo
 EVdgGSgj39w4w0gpzB+0t6ziYEyDycFK4r6POgxI/cqbpW0HKdbogfofXj/1EtCQhHtmqJM
 TGf+5CxiBdoBuVUv3Z0Vsm1fN2kTUUUhiH1oEXKJ5LHkpCTB1/jdvaeTcqRwjZf7qVRBsHy
 74JxI7TXQQnMO1lRgx6dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eRjdnRUZln0=;x5QIM7yRw8MzhuGRLPis9xVAkIm
 hnqwwfBaCejpXmmhZZ4kcE8hN+BMyTJyCqs85IaACBMAN13Sav66IhUARk89mUq5ZoS85BOl+
 mLemRpSSarPkIOftszXKEyDiv04wNBIHaxNSpbr+9E8jsQLQJoMuWhJZ+zEtom274pTarDUkL
 EqdSvOHqAY6c2KTxoJDWohLkix98vSD8JUEo3SnfmAf1Dcmbj1WsWOObHb2cD4KyLYMSl0kYp
 kAoIx2sfcIuIK9EGdoXe9NmsudJDB6H9wgU5j1GKeeo9ZVYar6stLT3oKu2ThyjWte/LNtqRS
 1HVt7K4wadU51899KJZ3aoPScTCC1KUlFiyDE9fDI9x5E0BIfMINCvoz522YNAsX3jsnxLtVs
 vxD3MOY0vjEYmYerqvRjnIp7wDhdJaaB2voj1gowL7f/mRjCBEUKZt4YG2ipucAAqSWFxo18E
 bVa97IsItX8Z58mxBKMezlS+djzms4BRUfpgYMqrNTSQUQIyR40jNnZ4TGH0zLUvlvbsr6XSn
 etAO5L+QmjV+tKPkA+vle41gckUFDbmopQXczO1WOLZcS3zC+Tz+8ZeWyxTnJTAErrJKooWyj
 B3/t1no1u7HUYi8zi3mWy2VMEpLnXmIWQRqN9JqPdFDQLquKJ34feg9iEEm+CY14XIqwkhRK7
 5Z/NzUrs9xMAUmoiIgG6+nsrH7pO2g+az1WM8zBRIuXOu/WeWmGDnOIQaRnCh4+XOJ01XzFpZ
 GXTIbbIGuZKpcMJuzQYlKs/SNGg38fA/ds5FG8/J+tO+zcP7RRjw1VZYVIbRF7zSzfL8Psm2v
 9YwPiMwnqkEjw9HTpYogp+hQ==

On 8/25/24 9:46 AM, fps wrote:
> I will try and do a little more "comparative tracing" for the capture/pl=
ayback/full duplex cases on 1. the intel xhci and 2. the renesas xhci whic=
h seems to work perfectly.

Hi again!

I captured a trace from the xHCI from the Renesas and the Intel
controllers and I noticed a couple of differences (this is for the
playback case only). I didn't find info on what precisely these fields
tell me.

I show here only partial traces from where it seems that regular
playback has started. I also added a couple of new lines since I haven't
yet found out how to stop thunderbird from line-wrapping :(

Intel:

           jackd-177754  [000] ....2 119172.988707:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
  irq/125-xhci_hc-169     [003] b...3 119172.991808: xhci_handle_event:
EVENT: TRB 000000010a3f2000 status 'Success' len 0 slot 3 ep 2 type
'Transfer Event' flags e:c

  irq/125-xhci_hc-169     [003] b...3 119172.991811:
xhci_handle_transfer: ISOC: Buffer 000000011730a000 length 48 TD size 0
intr 0 type 'Isoch' flags B:i:I:c:s:i:e:C

  irq/125-xhci_hc-169     [003] b...3 119172.991813: xhci_inc_deq: ISOC
000000001e4e95c7: enq 0x000000010a3f20f0(0x000000010a3f2000) deq
0x000000010a3f2010(0x000000010a3f2000) segs 2 stream 0 bounce 200 cycle 1

  irq/125-xhci_hc-169     [003] b...3 119172.991814: xhci_inc_deq: EVENT
000000001a8ce64f: enq 0x00000001095d4000(0x00000001095d4000) deq
0x00000001095d40c0(0x00000001095d4000) segs 2 stream 0 bounce 0 cycle 0

Renesas:

           jackd-683428  [003] ....2 564371.947885:
xhci_ring_ep_doorbell: Ring doorbell for Slot 1 ep1out
  irq/127-xhci_hc-173     [002] b...3 564371.948914: xhci_handle_event:
EVENT: TRB 0000000115b2d000 status 'Success' len 0 slot 1 ep 2 type
'Transfer Event' flags e:C

  irq/127-xhci_hc-173     [002] b...3 564371.948916:
xhci_handle_transfer: ISOC: Buffer 0000000153a6a800 length 48 TD size 0
intr 0 type 'Isoch' flags B:i:I:c:s:i:e:C

  irq/127-xhci_hc-173     [002] b...3 564371.948920: xhci_inc_deq: ISOC
0000000059645549: enq 0x0000000115b2d0f0(0x0000000115b2d000) deq
0x0000000115b2d010(0x0000000115b2d000) segs 2 stream 0 bounce 200 cycle 1

  irq/127-xhci_hc-173     [002] b...3 564371.948921: xhci_inc_deq: EVENT
00000000ee8f0a5d: enq 0x000000010662e000(0x000000010662e000) deq
0x000000010662e470(0x000000010662e000) segs 1 stream 0 bounce 0 cycle 1

The first difference is that in the first line of the respective traces
the 'Transfer Event' flags have a capital 'C' for the Renesas and a
lower case 'c' for the Intel controller.

The second difference is that the fourth line has 'segs 2' for the
Intel, but 'segs 1' for the Renesas controller.

A third difference is that the fourth line ends with 'cycle 0' in the
Intel case and 'cycle 1' in the Renesas case.

I suppose these differences are mostly harmless?

Kind regards,
FPS

