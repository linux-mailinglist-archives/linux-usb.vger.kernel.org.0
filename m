Return-Path: <linux-usb+bounces-21340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FCA4E2AB
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 16:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACB25883F5C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 15:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D174227D782;
	Tue,  4 Mar 2025 15:02:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BB623A562
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100525; cv=pass; b=SiCRQ+B2Mfqoj9tGEX3uTBPtFOpvKSAeY3G1EwUQ+I4ZZcHXCO3NyBR2qsOKrscElPokT/Yxat+vUOKRmGonFFAMaPf7D6qUYeAhuyp5Ar1LhsPVaajiKyQez7+phkGoT4HnRpmWRrBDnTvWPTuP7pGYghUOVxatXTzHJK5qqh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100525; c=relaxed/simple;
	bh=3+YMU5QVO8O5inRiM0lXe5oV4sm6tHhKvfipqFyuCeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL0a/5v17co3BHReZQc4Qi3hYkRaJrL8vEWriCrpIjFMweazq06s954y5QiuqXl8GXpXhlhWURREnhsiVJ6Lf7o2fW9vIp2FX5e+6aTC3XcU+zsmkSzMdI4nQpZgJZ458Evy/MosVl3GDtknPkML+WolcFcTKXcGZymscgD5Rcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=cc.itu.edu.tr; arc=none smtp.client-ip=185.203.201.7; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 0D5F640CF642
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 18:02:02 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6f2c46R4zFy7b
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 17:58:48 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 2EF9342723; Tue,  4 Mar 2025 17:58:46 +0300 (+03)
X-Envelope-From: <linux-kernel+bounces-541576-bozkiru=itu.edu.tr@vger.kernel.org>
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 4507941B4A
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:28:28 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 1CBD7305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:28:28 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDF82188FF0A
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACEA1F462A;
	Mon,  3 Mar 2025 11:25:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE51F4180
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001141; cv=none; b=C+mKUZMxNqeAqEOpvy8/VnqvLXzuw2PCOnhWFgwEvvbGh0opJ6QlrcfUa9EPlE1vcuSSUX5w+ZRgb8DHbGM9Ckd8XuVkgDGRfM7U1C9DLXKw/Y7YT9X06nRaaDDXh4oEqZrthBJMUeou8wxtw4PwXPRDoDiTPNbiad1Mbr0GmKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001141; c=relaxed/simple;
	bh=3+YMU5QVO8O5inRiM0lXe5oV4sm6tHhKvfipqFyuCeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/CE+eKUNBu0p1crL2IMj7bK6wl8vRF40pedbovHwiRTbO7vtXeAIYaHG1UQ7hL/NoqOV1ydmNSB2lnRnWCqgohWvLCI5zaZXfwdKTI3McC1Lg6WwCeNdNmfrhT/A93pqIO27wBZ+EA2Bg8qCJ2chyq82nKpDEBzm5cjgugdoj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tp3vO-0005VN-TN; Mon, 03 Mar 2025 12:25:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tp3vO-003mo5-22;
	Mon, 03 Mar 2025 12:25:30 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tp3vO-00AihB-1j;
	Mon, 03 Mar 2025 12:25:30 +0100
Date: Mon, 3 Mar 2025 12:25:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] USB-Serial serdev support
Message-ID: <20250303112530.igosjo3s5uocndxj@pengutronix.de>
References: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
 <20241001072453.3xv5sqxaj4zjprnz@pengutronix.de>
 <2024100109-maker-ravine-7c65@gregkh>
 <20241028225702.tdtfqzhm335vvuv5@pengutronix.de>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028225702.tdtfqzhm335vvuv5@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6f2c46R4zFy7b
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741705130.26967@Ux4dlFwwxtZzjFxj6rNW+g
X-ITU-MailScanner-SpamCheck: not spam

Hi,

On 24-10-28, Marco Felsch wrote:
> Hi Greg,
> 
> On 24-10-01, Greg Kroah-Hartman wrote:
> > On Tue, Oct 01, 2024 at 09:24:53AM +0200, Marco Felsch wrote:
> > > Hi,
> > > 
> > > gentle ping as this is series is two months old now.
> > 
> > And it was rejected as serdev does not support hotplug which of course,
> > usb-serial does.
> 
> I hoped to get some feedback on my answer [1]. Regarding hotplug
> support: serdev _requires_ some sort of firmware like OF (not sure if it
> does work with ACPI too). That said, if serdev finds no firmware a
> fallback is provided to the standard serial handling.
> 
> The firmware could either be added directly by the platform OF file or
> via OF-overlays. By making use of overlays we could gain some kind of
> hotplug: Once a usb devices was detected and the driver has an
> overlay, the overlay gets applied and the probe continues, like we do it
> for PCIe devices now [2]. For devices which don't have a registered
> overlay the standard usb-serial setup is done by exposing the serial
> interface to the userspace.

is this idea worth to give it a try for a v2 or do you have something
different in mind?

I'm happy for any input.

Regards,
  Marco

> > So until serdev is fixed up to handle that correctly, this is not going
> > anywhere, nor should you want it to as then you would be in charge of
> > code that does not work properly :)
> 
> Regards,
>   Marco
> 
> [1] https://lore.kernel.org/all/20240917044948.i2eog4ondf7vna7q@pengutronix.de/
> [2] https://lore.kernel.org/all/7512cbb7911b8395d926e9e9e390fbb55ce3aea9.camel@pengutronix.de/
> 
> > 
> > thanks,
> > 
> > greg k-h
> > 


