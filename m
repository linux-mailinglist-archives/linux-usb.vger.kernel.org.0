Return-Path: <linux-usb+bounces-9631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943F8ADDC8
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 08:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D1AB1F22EBC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 06:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C125824B26;
	Tue, 23 Apr 2024 06:50:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5FE1CFB2
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713855012; cv=none; b=RfRmteWiZ8fjBE0r16WnqpMP6MIb0YM/VnieDpswcVvHuk/283UyDgTGYWCgreU3oDpzS9F9UX/P1rW5aOAxpcWaMmTCYDv/dQJSdIK7YkSf88ggtsEPX7/bBpJaxqTbjHoRcD5od2P+jaRfrZJIE2TBF/PXsG0iAWvCPD00dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713855012; c=relaxed/simple;
	bh=+9KvkDVRi/Yl9RpEYN2odgJz77T9Tcb1vb7LzV4dACE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=LBXS7MY37DejIgqaHPEei76tdJKr8Sdha86qJENW5rVmN8rFc2FWsDsvWpjjq3ynSt/EcGt4p8yWJYkF3AfnX4sU9agyGBsf6dbr0pZmMgH3eKh5Fz4gScgFdUTcx0enubqAT7/TlCPM74pSwq3lug3VlDLJt5W59JCFus2RPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE4F1C0008;
	Tue, 23 Apr 2024 06:50:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1rz9yf-0081ig-0h;
	Tue, 23 Apr 2024 08:50:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-usb@vger.kernel.org,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: composite: fix OS descriptors w_value logic
References: <20240404100635.3215340-1-peter@korsgaard.com>
	<ee546f65-2f72-40ac-9b10-aea469e9ebab@collabora.com>
Date: Tue, 23 Apr 2024 08:50:05 +0200
In-Reply-To: <ee546f65-2f72-40ac-9b10-aea469e9ebab@collabora.com> (Andrzej
	Pietrasiewicz's message of "Mon, 22 Apr 2024 21:09:03 +0200")
Message-ID: <87cyqglgiq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: peter@korsgaard.com

>>>>> "Andrzej" =3D=3D Andrzej Pietrasiewicz <andrzej.p@collabora.com> writ=
es:

 > Hi Peter,
 > W dniu 4.04.2024 o=C2=A012:06, Peter Korsgaard pisze:
 >> The OS descriptors logic had the high/low byte of w_value inverted, cau=
sing
 >> the extended properties to not be accessible for interface !=3D 0.

 > Out of curiosity - did you run into problems running some USB gadget,
 > and if yes, what was it? Or is this patch a result of a code and documen=
tation
 > review without actually running a gadget?

I had issues with getting Windows to accept the OS descriptors when the
function I wanted to use with WinUSB was not the first (=3D interface 0)
function in a composite device together with HID and mass storage.

--=20
Bye, Peter Korsgaard

