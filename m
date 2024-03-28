Return-Path: <linux-usb+bounces-8544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE818903A4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 16:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3221C2E2CD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 15:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF1D12FF76;
	Thu, 28 Mar 2024 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="i7kmhiDi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057A12D77B
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640581; cv=none; b=qEYmyLQj8Uaelna1VDAMlQryGuBZTaQAKgv5K859wn5EzT9HcFWF2zjqq+3PBDQVKf7F54wwgytDvOAMH7F+6ilKgcQiyE6mwhbDxmLZV08xEIk0nm0AXX5fi4Hk+bymIu2WKxmNvtA7O5k8TVpgw58sKuiKRMoah7zkFr9fV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640581; c=relaxed/simple;
	bh=pWYnKdo/qz5omClU64TzlwSjBWOMhXlg5xBZgOOHTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQQq3WckXH2BqWgNloFBRuNRmlBRUVBCZgikzAturnVzp5I+HZk+RydNTZ6AOJb2EBIWek+hnzhC7X/w43YnA2xgbnLXXCRXAtKI/pfuQP4HoCu2EAvhboLuqMyJfpuKqQPmpq9OHZxAUa/39dLwrfdC2Qf1YAPJ+fXLsgeFEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=i7kmhiDi; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7BC886003C04;
	Thu, 28 Mar 2024 15:42:49 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id RZsNJhjE0rXp; Thu, 28 Mar 2024 15:42:46 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6E7C46003C0E;
	Thu, 28 Mar 2024 15:42:46 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1711640566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojg/x32ax22uo8gM76LU8LaFSpmLDHUOe3g/7PUf6tE=;
	b=i7kmhiDi84pkBn6RGW/Ux7RPd0g9yNYh7BpoAFpJlmYHljDShnGWCcNtNZR8oYrp5e+cVP
	6qgPz1bJgJxsVs+uSUcYsqUpntoIysAQ6I/Tvdnlb1+tSwBTYdJAhAvLkPNA9HPq1m95nZ
	Fae0FSRAKPD3z8/gzNvmF4l5HKWCzRg=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C8824360072;
	Thu, 28 Mar 2024 15:42:44 +0000 (WET)
Date: Thu, 28 Mar 2024 15:42:40 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Christian Ehrhardt <lk@c--e.de>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, quic_prashk@quicinc.com, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, saranya.gopal@intel.com, linux-usb@vger.kernel.org, 
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <ynrqweb7hhfkrlvjr6suajq3jpgi4sqexz44qt4chekce7phiw@cyofo73xztdg>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
 <ZgREDo9tYAmdBcUc@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgREDo9tYAmdBcUc@cae.in-ulm.de>

On Wed, Mar 27, 2024 at 05:06:38PM +0100, Christian Ehrhardt wrote:
> 
> Hi,
> 
> thanks for bringing this to my attention.
> 
> On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> > The UCSI specification mentions that when the OPM is notified by the
> > PPM of an asynchronous event it should first send all the commands it
> > needs to get the details of the event and only after acknowledge it by
> > sending ACK_CC_CI with the Connector Change bit set, while the current
> > code sends this ack immediately after scheduling all the partner_tasks.
> > Move this ACK_CC_CI command to the end of all partner_tasks.
> 
> I think this is reading too much into the spec. The only thing we
> really need to know about the event itself is what we get from
> the initial UCSI_GET_CONNECTOR_STATUS command. I was planning to
> send a change that acks the connector change directly along with this.
> 
> All of the problems that I saw in this area were due to the fact
> that the connector change indicator was cleared too late and not
> too early.
> 
> Moreover, it can take quite some time to handle a connector change on
> one connector. This would block any progress on a different connector,
> too.

Yes, this is true. We could move EVENT_PENDING bit into ucsi_connector so
it wouldn't block progress on other connectors but if the interpretation
of the spec is that we don't need to send the connector change ACK_CC_CI
at the very end then I guess it doesn't make much sense.

> > This fixes a problem with some LG Gram laptops where the PPM sometimes
> > notifies the OPM with the Connector Change Indicator field set in the
> > CCI after an ACK_CC_CI command is sent,causing the UCSI stack to check
> > the connector status indefinitely since the EVENT_PENDING bit is already
> > cleared. This causes an interrupt storm and an artificial high load on
> > these platforms.
> 
> If the PPM does this for a connector change ACK_CC_CI command it is
> IMHO violating the spec (unless there is a _new_ event).

Yes, the problem is exactly that the PPM in these laptops is really not
conformant with the spec and moving the command change ACK_CC_CI to the
end circumvented the problems in the PPM. If [1] is the way to go then
we need some sort of quirk for these devices and I'll have to dig
deeper.

> When I saw this type of loops the connector change indicator was set
> in response to an ACK_CC_CI command for a command (sent by a different
> thread for a different connector) between clearing the EVENT_PENDING
> bit and acquiring the PPM lock.
> 
> Can you test if the changes that already are in usb-linus are
> sufficient to fix your issues?

I am seeing these problems when addressing one connector only, so other
threads for other connectors do not play a role here. I have tested the
latest usb-linus with and without your early ack patch set [1] on top
and the issue is still not fixed.

[1]: https://lore.kernel.org/linux-usb/20240327224554.1772525-1-lk@c--e.de/

Best regards,

Diogo

