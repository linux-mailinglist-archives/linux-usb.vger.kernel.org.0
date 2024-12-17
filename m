Return-Path: <linux-usb+bounces-18596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 624589F5123
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 17:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3059C188B12F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 16:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF2014A0B9;
	Tue, 17 Dec 2024 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="SzLP0Xpz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A16211C
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453318; cv=none; b=G66WgMvW/WgC37Ia/Mpu0sEas5yVI2zBngYg6pRwWGyRTw8OWptKCIzFFrYtT/JwSoVXKikqD9pUHiTCh6bzCtNIaOKUdMRE3OauS6DbuntyCB+3xyGVo/c8nLJKUl26bVVuxJBai5J22uyUxfcMm76JctmWor2Xij7OUr/UvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453318; c=relaxed/simple;
	bh=z+sKILHrYA245NrgRttN0pC45EwQN/0ppfsg7/ECJ14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+ugOUcJgTQor9QMKaaNpJryLb/ILgwTnj/WtRcgk57knAa51gdFhso9dQ/TuBzGm30GHO27v5IQy/OpVSbON3jmCedzuqdpkm2z6ou5sWEzHOav5qXizTjNIgCdE17nPkPnnltqbQhcUSG5k/SDgXh+L0IoPC0iUZ8drUAASNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=SzLP0Xpz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 197C320778;
	Tue, 17 Dec 2024 17:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734453312;
	bh=QrltxmbhHGaNdSNea/2J9Q+FwymcSy9dUR2LsgmKmGo=; h=From:To:Subject;
	b=SzLP0XpzHSBP8kDNlZarqi1iE9Fl9+SioPWEsYTYHwrKEHdoWVxqoVKWI5lkZGwfk
	 G0b8iAy1Xj08RmM8gPtXbs37wzASHu7vmUO+CSFtRnvTJ8b5PUXIrvvnJRb8a819Zg
	 QUkMfjWbMrH4SqqLgjG5EYVhJqoqK8ZtEDmlE1xAV1YsYcqMDTe7WmiKpLPGcs+DAp
	 D8JEbZ53S3zj4OJBpk9GF+BLs/VechTQ0SPOSPmidNfhjpAQ6CvBEGhLNMe6nJZ6/y
	 v4xvgT3FvG7EmS0MY5PK38Ni8pmmTxWK9muHykSzAYJ+2NniqpTJM3o3jnKLppqokw
	 nvepmqCmhRi2w==
Date: Tue, 17 Dec 2024 17:35:06 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241217163506.GA80703@francesco-nb>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217091208.2416971-2-xu.yang_2@nxp.com>

On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> With edge irq support, the ALERT event may be missed currently. The reason
> is that ALERT_MASK register is written before devm_request_threaded_irq().
> If ALERT event happens in this time gap, it will be missed and ALERT line
> will not recover to high level. However, we don't meet this issue with
> level irq. To avoid the issue, this will set ALERT_MASK register after
> devm_request_threaded_irq() return.
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

I had an offline chat with a Emanuele (in Cc:) that worked on this a few
weeks ago and he remember that he already tried a similar approach, but
for some reason he did not work.

He should be able to try this patch in a few days, but with the upcoming
winter holidays he might not be super responsive.

I wonder if we could wait a little before merging this to allow this
testing to happen. Or maybe you can just test if this is working on your
setup using edge interrupts (you would need to use only one TCPCI, for
the test).

Francesco


