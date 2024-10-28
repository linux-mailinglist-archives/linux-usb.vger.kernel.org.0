Return-Path: <linux-usb+bounces-16799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28909B3E18
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 23:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86871283025
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 22:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6508B1F7579;
	Mon, 28 Oct 2024 22:57:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71471F428C
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730156237; cv=none; b=TQYrF5YiCOkZ6laj/II2UYc7EhJP7CiM6mUvqh+NPMmYuTLd2ZMe8iSmQPul2jqKdm6u3Df2vX+oNjlv5Jckbutz/WyKtvxl25ZkQl6ucHTVY+XY1qn5o/4EYLMVjR3+tpp+tDemK6gMQP/6dxqtsHd0FxvQHxC4ciw+wD85oJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730156237; c=relaxed/simple;
	bh=zBxzWB+7NYfQRp0L19AL6OTNfIqJpNwmV/Utz6grqUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr1ru7USJwBT5jbAsafwr4i0GI6WkRUSMQkBYw1YYIPIVYKNaUCaZok+k9W+G4ajdLukuLvkA2YRALGfQRKl5UfUQ3arWnM3/dgA+FLiQk65gg1KqPWsOaJMjT5jLKMpAMgHureS4qGycBpE1Jwkp1eCYcBMPpVKONJS8Du1wTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t5YfW-000798-Vm; Mon, 28 Oct 2024 23:57:02 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t5YfW-000vc8-2A;
	Mon, 28 Oct 2024 23:57:02 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t5YfW-000tfx-1s;
	Mon, 28 Oct 2024 23:57:02 +0100
Date: Mon, 28 Oct 2024 23:57:02 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] USB-Serial serdev support
Message-ID: <20241028225702.tdtfqzhm335vvuv5@pengutronix.de>
References: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
 <20241001072453.3xv5sqxaj4zjprnz@pengutronix.de>
 <2024100109-maker-ravine-7c65@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024100109-maker-ravine-7c65@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi Greg,

On 24-10-01, Greg Kroah-Hartman wrote:
> On Tue, Oct 01, 2024 at 09:24:53AM +0200, Marco Felsch wrote:
> > Hi,
> > 
> > gentle ping as this is series is two months old now.
> 
> And it was rejected as serdev does not support hotplug which of course,
> usb-serial does.

I hoped to get some feedback on my answer [1]. Regarding hotplug
support: serdev _requires_ some sort of firmware like OF (not sure if it
does work with ACPI too). That said, if serdev finds no firmware a
fallback is provided to the standard serial handling.

The firmware could either be added directly by the platform OF file or
via OF-overlays. By making use of overlays we could gain some kind of
hotplug: Once a usb devices was detected and the driver has an
overlay, the overlay gets applied and the probe continues, like we do it
for PCIe devices now [2]. For devices which don't have a registered
overlay the standard usb-serial setup is done by exposing the serial
interface to the userspace.

> So until serdev is fixed up to handle that correctly, this is not going
> anywhere, nor should you want it to as then you would be in charge of
> code that does not work properly :)

Regards,
  Marco

[1] https://lore.kernel.org/all/20240917044948.i2eog4ondf7vna7q@pengutronix.de/
[2] https://lore.kernel.org/all/7512cbb7911b8395d926e9e9e390fbb55ce3aea9.camel@pengutronix.de/

> 
> thanks,
> 
> greg k-h
> 

