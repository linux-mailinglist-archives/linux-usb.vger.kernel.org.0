Return-Path: <linux-usb+bounces-12214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C705A930E79
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 09:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51DF8B20CBE
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 07:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B5D1836CE;
	Mon, 15 Jul 2024 07:11:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0994F13A252
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721027508; cv=none; b=gFb0P1RdevvohxqqiI5+0aai0g58Cdq4yTYrF+eDhyhv+nP2j/OSMAlHE16VxD+K/992EovgJpop/F0WQNGDwriSf7NcbeiP2/j5eKI1CpYYTdAtwQIA8dsjGjgqRxPkG6AjalqPCo74g9vETz0BwhgDyjP/zMOdUBtNZ0QeNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721027508; c=relaxed/simple;
	bh=Jl9F54gKC2HZ6RkFE/JPLXbjvDwLcSrFahwOTKM89U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay1rQFVQE9GZ0mR8HjWAR6A/3OeTy65s7kig99H82upAvyGFaX7uTNgw/xqdrZky8eQuSAk8cxoBP+4AiXM+2iVwff0NON05Ysh6dCpMHxZwfuKHPtBqpcGvbbdxyaSEjFYQjbiGZnD/yH82BnCuHlVkuU38DCdN9qs1oeqmsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sTFrr-0000ot-Hi; Mon, 15 Jul 2024 09:11:27 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sTFrq-009e7s-32; Mon, 15 Jul 2024 09:11:26 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sTFrp-000JYF-3D;
	Mon, 15 Jul 2024 09:11:26 +0200
Date: Mon, 15 Jul 2024 09:11:25 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	RD Babiera <rdbabiera@google.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: Fix error code in
 tcpci_check_std_output_cap()
Message-ID: <20240715071125.p5a7eidkvo2jqcvk@pengutronix.de>
References: <b0880888-6719-4614-91fc-8ee63b71d304@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0880888-6719-4614-91fc-8ee63b71d304@stanley.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

On 24-07-12, Dan Carpenter wrote:
> The tcpci_check_std_output_cap() function is supposed to return negative
> error codes but it's declared as type bool so the error handling doesn't
> work.  Declare it as an int instead.

sorry I missed this :/ in the first place, thank you for the fix.

> Fixes: 62ce9ef14797 ("usb: typec: tcpci: add support to set connector orientation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

