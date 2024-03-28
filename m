Return-Path: <linux-usb+bounces-8629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D4890DBE
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 23:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A04029CFA5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 22:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F442E40D;
	Thu, 28 Mar 2024 22:40:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79562206E
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665620; cv=none; b=LFfTwzzJ07jQiRxg3dqJX6l2z+FuG4XtLAI7cKuKpt1t6P0S7dW9uani9OW30wZUiDg67aJ8DQXKgIMipou+U0riH/4Q1syVV0E+0kq60456ObO8b2jGeU5Pxkswgs9TpsqbV+ds4AUFikJrpwMYJLPq/SIwzOyfRZFFX6um5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665620; c=relaxed/simple;
	bh=h993KaFZUS4e6tz+/a7jfa76O75xwuYnZaXV0A3xs5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikgJ2eQO+5cJxS2peuG5JDgqsS3o3nNsSDuOGP0/9ZXEZn3KFhXr4001tnUxO8IvAxft9lFMu0Zc/EMvqK4GCq8L8VttMstPe5aP5vJBqfTQIAS97nHzbZCWQK8MldKakNpg1M71GNF8BxhuY2g9Zy3aAUewM1OphA/8qbw3+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 684B914040D; Thu, 28 Mar 2024 23:40:09 +0100 (CET)
Date: Thu, 28 Mar 2024 23:40:09 +0100
From: Christian Ehrhardt <lk@c--e.de>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org, quic_prashk@quicinc.com,
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
	saranya.gopal@intel.com, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <ZgXxyWsdA7YML3mR@cae.in-ulm.de>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
 <ZgREDo9tYAmdBcUc@cae.in-ulm.de>
 <ynrqweb7hhfkrlvjr6suajq3jpgi4sqexz44qt4chekce7phiw@cyofo73xztdg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ynrqweb7hhfkrlvjr6suajq3jpgi4sqexz44qt4chekce7phiw@cyofo73xztdg>


Hi,

On Thu, Mar 28, 2024 at 03:42:40PM +0000, Diogo Ivo wrote:
> On Wed, Mar 27, 2024 at 05:06:38PM +0100, Christian Ehrhardt wrote:
> > On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> > > This fixes a problem with some LG Gram laptops where the PPM sometimes
> > > notifies the OPM with the Connector Change Indicator field set in the
> > > CCI after an ACK_CC_CI command is sent,causing the UCSI stack to check
> > > the connector status indefinitely since the EVENT_PENDING bit is already
> > > cleared. This causes an interrupt storm and an artificial high load on
> > > these platforms.
> > 
> > If the PPM does this for a connector change ACK_CC_CI command it is
> > IMHO violating the spec (unless there is a _new_ event).
> 
> Yes, the problem is exactly that the PPM in these laptops is really not
> conformant with the spec and moving the command change ACK_CC_CI to the
> end circumvented the problems in the PPM. If [1] is the way to go then
> we need some sort of quirk for these devices and I'll have to dig
> deeper.

Just to make this clear: This is not my call to make.

> > When I saw this type of loops the connector change indicator was set
> > in response to an ACK_CC_CI command for a command (sent by a different
> > thread for a different connector) between clearing the EVENT_PENDING
> > bit and acquiring the PPM lock.
> > 
> > Can you test if the changes that already are in usb-linus are
> > sufficient to fix your issues?
> 
> I am seeing these problems when addressing one connector only, so other
> threads for other connectors do not play a role here. I have tested the
> latest usb-linus with and without your early ack patch set [1] on top
> and the issue is still not fixed.

There are legitimate reaons why the connector change indicator
is set in response to a command:
- If the condition was reported previously it is sticky until
  cleared.
- Something else changed on the connector.

For a more complicated device that I have here, there are five
different connector change events after plugging it in.

I'd like to understand why you run into a loop here.
Printing the completed command (if any) and the CCI in
ucsi_acpi_notify() and the details of the connector status in
ucsi_handle_connector_change() could shed some light on this.


> [1]: https://lore.kernel.org/linux-usb/20240327224554.1772525-1-lk@c--e.de/

Best regards   Christian

