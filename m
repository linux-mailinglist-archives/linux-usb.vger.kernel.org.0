Return-Path: <linux-usb+bounces-8547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9FD890479
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 17:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9509B21FF0
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 16:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121CF12F5BE;
	Thu, 28 Mar 2024 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="uWgNH1G9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42918004E
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711641895; cv=none; b=oU6cY0qXKIewGszQfeijXw62ARMi+rGtx27qMF8lw1DUJByp4pJ48CFksv/asQ4/uP5jrtUnfZaMDacuTLN6wAd2YPL7Wal0Qf9FqPkf9v0FLgJ/LNEB0k1wHg000CBSQL9Nqg1RebLZ58CwSL1qXI1wjGf5MCiF5Nw5cRgIoHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711641895; c=relaxed/simple;
	bh=MISz/EoQ/v7ePwqZvKtpzcJ45035R5Ed15qc0+lLFvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxZk70f7nXHgLUgS+1vl9cXpWb3RNMh2lNCvn9yhImVs5lBv0LyMe0doX7F0Ygj1joeqdUsWwXJur0uGUKFAa0WGXkBZr1a15mFGIe8uwdl+f/Hlcj/7pRSW/RSOfDInM4q31cL4FP++c4Inw4v0oY7qxXelyztUYx1FUJaNJ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=uWgNH1G9; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 884626003C03;
	Thu, 28 Mar 2024 16:04:50 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id NeUumWbioh8i; Thu, 28 Mar 2024 16:04:48 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4DCBB6003C0B;
	Thu, 28 Mar 2024 16:04:48 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1711641888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EvI81DIWvWDSN/i3VU1xa6wdfKe+x/PMJfL6iHJNDcU=;
	b=uWgNH1G9LjDC/4Zo3ytw3lAJIFQZJOT7ltVU88x+1OaD7G//Znr3lPBs99sXSFkVJjomZw
	IAKINoQG4DYyVewSGCy8Td4OzZKEyX1xjyQ8w3o3sl4Bqyo+1Cm484hFUJxVVmg9izbw3O
	lip/UhQqynM1USA9EtX/Tbbf1CpyK24=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 82862360073;
	Thu, 28 Mar 2024 16:04:47 +0000 (WET)
Date: Thu, 28 Mar 2024 16:04:43 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Christian Ehrhardt <lk@c--e.de>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, quic_prashk@quicinc.com, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, saranya.gopal@intel.com, linux-usb@vger.kernel.org, 
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <nbvsbechvtakxdtsmabtcb4zf2sojmcucv3lhyxe32dgg3z5cy@ljru526jospx>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
 <ZgRMhB96pVgxnMq4@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgRMhB96pVgxnMq4@cae.in-ulm.de>

On Wed, Mar 27, 2024 at 05:42:44PM +0100, Christian Ehrhardt wrote:
> 
> Hi,
> 
> On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> > 				...
> > +static void ucsi_handle_ack_connector_change(struct ucsi_connector *con)
> > +{
> > +	struct ucsi *ucsi = con->ucsi;
> > +	int ret;
> > +
> > +	if (list_empty(&con->partner_tasks)) {
> > +		mutex_lock(&ucsi->ppm_lock);
> > +		ret = ucsi_acknowledge_connector_change(ucsi);
> > +		mutex_unlock(&ucsi->ppm_lock);
> > +
> > +		if (ret)
> > +			dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
> 
> What if a real async connector change event happens here? It can because
> you just cleared the connector change condition. But it will be ignored
> because EVENT_PENDING is still set. In practive the new event might even
> be reported in the CCI along with the completion of the ACK command
> above (without an additional async event).

This patch was more to see how this idea would be received so I didn't
think too much about problems with timings, this would come after but
yes, you are correct in pointing this out.

> What UCSI backend (ACPI, CCG, ...) is this?

It is ACPI.

Best regards,

Diogo

