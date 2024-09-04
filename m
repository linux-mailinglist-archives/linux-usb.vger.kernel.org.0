Return-Path: <linux-usb+bounces-14661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8996C62F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 20:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE79D285F5A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 18:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165861E133F;
	Wed,  4 Sep 2024 18:19:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ECA1D6790
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473955; cv=none; b=M5HsAOSpq+RQCIMeZjze+xsnPrP/Z35SLvd0SIGd9FAcE5tNhzSMhbMYok+ddUX9g39bFzWPecqf4oBiO2RoGOF4Ddh7W11RXv5MKaiAyxd69t3qQi2fp0wTcHJAxd1D5pb8ssxa5Hk2667nbMgBKQ/UtZn2PcCcA/R6uTmm/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473955; c=relaxed/simple;
	bh=D2ZQe0ik2Fc351iYCbhr2lgC3iLcooDYF6oKxrBw0HU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=gRnA7Xj7doYiH/yaqtGjbb9+tXFn69h0P751dhEmCnjOD4T+Xz3Ib1VzOnCype/70mIwDhqz84qQa6GUnNVG4l1KwGyUSth7FKTa5VoxWK9T7rVxNZLQUPq6SgWl/GlYYfeqIZh0LB9xwlUVcCnl5wof/w1iwSV3Pycr/+nqhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C019AC0004;
	Wed,  4 Sep 2024 18:19:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1sluat-00A61j-09;
	Wed, 04 Sep 2024 20:19:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Vrastil, Michal" <michal.vrastil@hidglobal.com>
Cc: "stable@kernel.org" <stable@kernel.org>,  "balbi@kernel.org"
 <balbi@kernel.org>,  "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors w_value
References: <AS8PR05MB84857AB3DC49395AEC7C235990932@AS8PR05MB8485.eurprd05.prod.outlook.com>
	<AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>
Date: Wed, 04 Sep 2024 20:19:02 +0200
In-Reply-To: <AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>
	(Michal Vrastil's message of "Wed, 4 Sep 2024 15:01:39 +0000")
Message-ID: <87ed5zjn8p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Vrastil," == Vrastil, Michal <michal.vrastil@hidglobal.com> writes:

 > This reverts commit ec6ce7075ef879b91a8710829016005dc8170f17.
 > Fix install of WinUSB dsriver using OS descriptors.
 > Without the fix the drivers is not installed correctly
 > and the property 'DeviceInterfaceGUID' is missing on host side.

 > The original change was based on assumption that the interface number
 > is in the high byte of wValue but it is in the low byte, instead.
 > Unfortunately, the fix is based on MS documentation which is also wrong.

 > The actual USB request for OS descriptors (using USB analyzer) looks
 > like:

 > Offset  0   1   2   3   4   5   6   7
 > 0x000   C1  A1  02  00  05  00  0A  00

 > C1: bmRequestType (device to host, vendor, interface)
 > A1: nas magic number
 > 0002: wValue (2: nas interface)
 > 0005: wIndex (5: get extended property i.e. nas interface GUID)
 > 008E: wLength (142)

 > The fix was tested on Windows 10 and Windows 11.

Hmm, very odd. How are you testing this on the host side? Could it be
that you are running into the WinUSB bug described here:

https://github.com/pbatard/libwdi/wiki/WCID-Devices#defining-a-device-interface-guid-or-other-device-specific-properties

IMPORTANT NOTE 1: There is a bug/limitation in WinUSB that will force
the wIndex of any Interface Request to the interface num ber. This means
that, if you are using WinUSB to verify the content of your Extended
Properties Feature Descriptor, you won't be able to retrieve it (unless
it is only defined for interface #5).  If you use WinUSB on Windows to
validate your descriptors, our advice then is to have your device
firmware answer both Device and Interface requests when the Extended
Properties Feature Descriptor is queried, so that you can use a Device
Request rather than an Interface Request to validate that your
descriptor is set properly.

For reference, the latest xusb sample application from libusb has a -w
switch that will force the wIndex = 0x0005 to use the Device mode.


 > Fixes: ec6ce70 ("usb: gadget: composite: fix OS descriptors w_value logic")
 > Signed-off-by: Michal Vrastil <michal.vrastil@hidglobal.com>
 > ---
 >  drivers/usb/gadget/composite.c | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
 > index 17ae3b394469..a3106b179562 100644
 > --- a/drivers/usb/gadget/composite.c
 > +++ b/drivers/usb/gadget/composite.c
 > @@ -1925,7 +1925,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 >  			buf[5] = 0x01;
 >  			switch (ctrl->bRequestType & USB_RECIP_MASK) {
 >  			case USB_RECIP_DEVICE:
 > -				if (w_index != 0x4 || (w_value & 0xff))
 > +				if (w_index != 0x4 || (w_value >> 8))
 >  					break;
 >  				buf[6] = w_index;
 >  				/* Number of ext compat interfaces */
 > @@ -1941,9 +1941,9 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 >  				}
 >  				break;
 >  			case USB_RECIP_INTERFACE:
 > -				if (w_index != 0x5 || (w_value & 0xff))
 > +				if (w_index != 0x5 || (w_value >> 8))
 >  					break;
 > -				interface = w_value >> 8;
 > +				interface = w_value & 0xFF;
 >  				if (interface >= MAX_CONFIG_INTERFACES ||
 >  				    !os_desc_cfg->interface[interface])
 >  					break;
 > -- 

 > 2.43.0



-- 
Bye, Peter Korsgaard

