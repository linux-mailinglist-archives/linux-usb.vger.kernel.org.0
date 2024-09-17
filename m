Return-Path: <linux-usb+bounces-15160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87797AAD1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 06:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46841F22E04
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 04:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFDB3BBF6;
	Tue, 17 Sep 2024 04:50:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE244C77
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726548607; cv=none; b=FN7p6XPEfQRJTiOEk/QMawHUe3scK/DLiibhlb3u0MLCqiyjg7i+JeMtx/7iq7DBFMzW0349qtOEJkQSPbJXdGtt5er+cHHvlbU0d2LN3g8saNVdTGmCcnb8+YZsK7s+/V6pjB3NjKv0adgxppHVvlJl9ROn8Vr3H5VrYZKOQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726548607; c=relaxed/simple;
	bh=Sn1LKgeiv7Ac9Vx4YAFMr8WB687zRSgn39BsPkqstYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTHpCKsHysE8VEjg4KvTOQdK7jj86n2bU21xAtLnGsyC1YddVicKsjoOsa6FFM5Qk1trvJfPzAFFwMqM+zgGtwO55OEqVD57Ra5sArsYBBkIiXjubXCegb+3F/MNHPO+MyvEh7BDU2PgA6fk+xbYJYG5hios88xAJjoM4JIKALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sqQ9s-00005O-Rv; Tue, 17 Sep 2024 06:49:48 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sqQ9s-008ToX-BP; Tue, 17 Sep 2024 06:49:48 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sqQ9s-00D9So-0m;
	Tue, 17 Sep 2024 06:49:48 +0200
Date: Tue, 17 Sep 2024 06:49:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Johan Hovold <johan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] USB-Serial serdev support
Message-ID: <20240917044948.i2eog4ondf7vna7q@pengutronix.de>
References: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
 <Zt7kCxawoszunWq3@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt7kCxawoszunWq3@hovoldconsulting.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi Johan,

On 24-09-09, Johan Hovold wrote:
> On Wed, Aug 07, 2024 at 04:08:47PM +0200, Marco Felsch wrote:
> > this patchset is based on Johan's patches [1] but dropped the need of
> > the special 'serial' of-node [2].
> 
> That's great that you found and referenced my proof-of-concept patches,
> but it doesn't seem like you tried to understand why this hasn't been
> merged yet.

I'm glad for your input.

> First, as the commit message you refer to below explain, we need some
> way to describe multiport controllers. Just dropping the 'serial' node
> does not make that issue go away.

Sorry for asking but isn't the current OF abstraction [1] enough? As far
as I understood we can describe the whole USB tree within OF. I used [1]
and the this patchset to describe the following hierarchy:

 usb-root -> usb-hub port-1 -> usb-serial interface-0 -> serial
                                                         bt-module

[1] Documentation/devicetree/bindings/usb/usb-device.yaml

> Second, and more importantly, you do not address the main obstacle for
> enabling serdev for USB serial which is that the serdev cannot handle
> hotplugging.

Hotplugging is a good point but out-of-scope IMHO (at least for now)
since the current serdev implementation rely on additional firmware
information e.g OF node to be present. E.g. if the above mentioned setup
would connect the "serial bt-module" directly to the UART port you still
need an OF node to bind the serdev driver. If the node isn't present
user-space would need to do the hci handling.

So from my POV the serdev abstraction is for manufacturers which make
use of "onboard" usb-devices which are always present at the same USB
tree location. Serdev is not made for general purpose USB ports (yet)
where a user can plug-in all types of USB devices.

Regards,
  Marco

> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/log/?h=usb-serial-of
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-serial-of&id=b19239022c92567a6a9ed40e8522e84972b0997f
> 
> Johan
> 

