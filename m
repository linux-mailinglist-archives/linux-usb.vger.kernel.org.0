Return-Path: <linux-usb+bounces-1892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A50247CF29B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E27281F27
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 08:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D73156D3;
	Thu, 19 Oct 2023 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gXQMp0Em"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289415ADF
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 08:31:00 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D807811B
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 01:30:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BFFC25A;
	Thu, 19 Oct 2023 10:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697704246;
	bh=EYRAWa3cvbPI1SX8l4ZjV9kbab4hi3G9ZmYnQLSdgWs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gXQMp0EmoH/MfeqwijF07LnhDKvWsGXd3as0s83X70l4D8VNhqATNsrcAMCTgO4Mg
	 XbD+HJPJY/k+GvyQ014Ngm2LnoYo843OeerAMNrZ2KF1sh5ZCx70OvdAYpPNl/QmT3
	 PfV9uCcavH2F1wqw6pvV4bMsOBYF4Z1CMPMSRSS8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9fec0dd7-f111-4e71-95f2-a06488eec066@google.com>
References: <9fec0dd7-f111-4e71-95f2-a06488eec066@google.com>
Subject: Re: uvc gadget: Adding super-speed plus descriptors
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>, etalvala@google.com <etalvala@google.com>, arakesh@google.com <arakesh@google.com>
To: Greg KH <gregkh@linuxfoundation.org>, Jayant Chowdhary <jchowdhary@google.com>, corbet@lwn.net, dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com
Date: Thu, 19 Oct 2023 09:30:51 +0100
Message-ID: <169770425169.3350128.5374821695302559264@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Jayant,

Quoting Jayant Chowdhary (2023-10-19 00:35:47)
> Hello everyone,
> Currently the uvc gadget driver doesn't set descriptors for super speed p=
lus
> configurations in uvc_function_bind(). I see that there was a patch uploa=
ded
> a while back, at
> https://lore.kernel.org/all/20221103060041.25866-1-jleng@ambarella.com/ w=
hich
> was addressing this issue.
>=20
> I tested this out on an Android device and it
> works - in our case we were seeing that the number of configurations adve=
rtised
> by the device was 0 when a super-speed connection was used. Would we able=
 to
> merge this  patch ? Or would you like me to pick it uploaded and post it =
again ?

As you'll see in https://lore.kernel.org/all/Y2PCj3c4z73s2Hxe@kroah.com/
The specific e-mail containing the patch has been deleted and will not
be merged due to the following trailers in the email:

> This email and attachments contain Ambarella Proprietary and/or
> Confidential Information and is intended solely for the use of the
> individual(s) to whom it is addressed. Any unauthorized review, use,
> disclosure, distribute, copy, or print is prohibited. If you are not
> an intended recipient, please contact the sender by reply email and
> destroy all copies of the original message. Thank you.

It will need to be resent (without such trailing message) and confirming th=
at it
is legal and acceptable for the author to submit this, and for the
Linux Kernel to accept it.

--
Kieran


>=20
> Thank you,
> Jayant
>

