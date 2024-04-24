Return-Path: <linux-usb+bounces-9711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D78B0842
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 13:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65B70B21E56
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 11:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70B715A483;
	Wed, 24 Apr 2024 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="FJDnRHXP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC5159913
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957825; cv=none; b=ad6Fa3WZCFXGIhYA2IB/uKJAXSqYRmYaI3GZvsTeq2kP503nnLNDsEnipL05y9O4v1J37kiwg6zaWtEveZnrp2uyDcbmhdxfX3wD7Yh+ntPIBilTljZDbTgvTRjEXHeIHObq0soh/ECyHW0z08s06wLt6+81PLr1S8MevwboKrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957825; c=relaxed/simple;
	bh=vs/x82Ji4MpINF/4zV/0A/+4ZfH8o385r9E3BShBnIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTotqZIyRDBYKwlnOYcj22rbcF/FKIuA8Ke/endEsmdevG5khE9Jaqw5mhVIjdPjHqkrcpNHrfrUWg7gbUz0ORu6vC0SsUjOd4dV9R4QZGbkoWVqwof3whe88AnADNbcZOcpAfPbRB+NZL+pB2nsXghk/h0Rf/dlTq5K2q8eouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=FJDnRHXP; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A218C60029A0;
	Wed, 24 Apr 2024 12:23:32 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id c93cBy76fokp; Wed, 24 Apr 2024 12:23:30 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 000E46002436;
	Wed, 24 Apr 2024 12:23:29 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713957810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ka3WyDfZIxCofgoCQ0gguiAFj9ewd66Pz/2vvExhdjE=;
	b=FJDnRHXPT16cGb/iYyxwCbHe2dLRWQurKfE+8OOEUtpAQGl5jlgVUNbfTP/CeUh9BpcEHz
	kncCSZbEmog2/U/CBIX7PAnAz5HrVrcY4wHGGCk/HnkzSWJQoOyOVbIxJvG4ergIcZM3aC
	ETjwV20pge+YjjTyi4D4eyctQLrm2dg=
Received: from diogo-gram.home (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A8C4B36008A;
	Wed, 24 Apr 2024 12:23:27 +0100 (WEST)
Date: Wed, 24 Apr 2024 12:23:19 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Christian Ehrhardt <lk@c--e.de>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, quic_prashk@quicinc.com, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, saranya.gopal@intel.com, linux-usb@vger.kernel.org, 
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <vvhn5le253djrcr6u2ksmphupgc4dot3x66hx53fpnhwbhqyma@hku4qvogc6at>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
 <ZgREDo9tYAmdBcUc@cae.in-ulm.de>
 <ynrqweb7hhfkrlvjr6suajq3jpgi4sqexz44qt4chekce7phiw@cyofo73xztdg>
 <ZgXxyWsdA7YML3mR@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgXxyWsdA7YML3mR@cae.in-ulm.de>

Hi Christian, sorry for the late reply!

On Thu, Mar 28, 2024 at 11:40:09PM +0100, Christian Ehrhardt wrote:
> 
> On Thu, Mar 28, 2024 at 03:42:40PM +0000, Diogo Ivo wrote:
> > On Wed, Mar 27, 2024 at 05:06:38PM +0100, Christian Ehrhardt wrote:
> > > On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> > > > This fixes a problem with some LG Gram laptops where the PPM sometimes
> > > > notifies the OPM with the Connector Change Indicator field set in the
> > > > CCI after an ACK_CC_CI command is sent,causing the UCSI stack to check
> > > > the connector status indefinitely since the EVENT_PENDING bit is already
> > > > cleared. This causes an interrupt storm and an artificial high load on
> > > > these platforms.
> > > 
> > > If the PPM does this for a connector change ACK_CC_CI command it is
> > > IMHO violating the spec (unless there is a _new_ event).
> > > When I saw this type of loops the connector change indicator was set
> > > in response to an ACK_CC_CI command for a command (sent by a different
> > > thread for a different connector) between clearing the EVENT_PENDING
> > > bit and acquiring the PPM lock.
> 
> There are legitimate reaons why the connector change indicator
> is set in response to a command:
> - If the condition was reported previously it is sticky until
>   cleared.
> - Something else changed on the connector.
> 
> For a more complicated device that I have here, there are five
> different connector change events after plugging it in.
> 
> I'd like to understand why you run into a loop here.
> Printing the completed command (if any) and the CCI in
> ucsi_acpi_notify() and the details of the connector status in
> ucsi_handle_connector_change() could shed some light on this.

You are correct, my initial conclusions were not the cause of the issue.
After digging a bit more with your ACK early patch set [1] applied the initial
connector changes in CCI are meaningful:

/* Connect charge here */

[88248.531077] ucsi_acpi_notify: CCI: 20000002
[88248.531084] scheduling connector change
[88248.531094] COMMAND: 10012
[88248.690705] ucsi_acpi_notify: CCI: 80000902
[88248.705038] ucsi_acpi_notify: CCI: 80000902
[88248.769716] MESSAGE_IN: 0 294024
[88248.769721] COMMAND: 30004
[88248.905117] ucsi_acpi_notify: CCI: 20000002
[88248.905122] scheduling connector change
[88248.905238] COMMAND: 10012
[88248.921032] ucsi_acpi_notify: CCI: 20000002
[88249.052045] ucsi_acpi_notify: CCI: 80000902
[88249.094680] ucsi_acpi_notify: CCI: 80000902
[88249.113033] MESSAGE_IN: 1 42851545402b0a44
[88249.113036] COMMAND: 30004
[88249.234930] ucsi_acpi_notify: CCI: 20000000

as the reply to GET_CONNECTOR_STATUS changes.

Turns out the problematic command seems to be the GET_PDOS for the
source PDOs of the partner. After testing with multiple chargers and
hubs we always have this pattern:

[88249.235144] COMMAND: 700810010
[88249.431015] ucsi_acpi_notify: CCI: 80001000
[88249.444510] ucsi_acpi_notify: CCI: 80001000
[88249.474162] MESSAGE_IN: 641450004b12c 2d12c0801912c
[88249.474164] COMMAND: 20004
[88249.569839] ucsi_acpi_notify: CCI: 20000002
[88249.569843] scheduling connector change
[88249.569878] COMMAND: 604810010
[88249.694744] ucsi_acpi_notify: CCI: 80000002
[88249.756603] ucsi_acpi_notify: CCI: 80000002
[88249.772341] MESSAGE_IN: 0 0
[88249.772343] COMMAND: 20004
[88249.796672] ucsi_acpi_notify: CCI: 80000002
[88249.932743] ucsi_acpi_notify: CCI: 20000000
		...
[88250.229964] COMMAND: 10012
[88250.341815] ucsi_acpi_notify: CCI: 80000900
[88250.385756] ucsi_acpi_notify: CCI: 80000900
[88250.404292] MESSAGE_IN: 1 42851545402b0060

And the next time we check the partner source PDOS we get the same,

[88251.126928] COMMAND: 10012
[88251.316607] ucsi_acpi_notify: CCI: 80000900
[88251.330743] ucsi_acpi_notify: CCI: 80000900
[88251.358123] MESSAGE_IN: 1 42851545402b0000
[88251.358125] COMMAND: 20004
[88251.474957] ucsi_acpi_notify: CCI: 20000000
[88251.475109] COMMAND: 700810010
[88251.636812] ucsi_acpi_notify: CCI: 80001000
[88251.695686] ucsi_acpi_notify: CCI: 80001000
[88251.709026] MESSAGE_IN: 641450004b12c 2d12c0801912c
[88251.709028] COMMAND: 20004
[88251.827071] ucsi_acpi_notify: CCI: 20000002
[88251.827075] scheduling connector change
[88251.827189] COMMAND: 604810010
[88251.974138] ucsi_acpi_notify: CCI: 80000002
[88252.034895] ucsi_acpi_notify: CCI: 80000002
[88252.054572] ucsi_acpi_notify: CCI: 80000002
[88252.067847] MESSAGE_IN: 0 0
[88252.067849] COMMAND: 20004
[88252.197648] ucsi_acpi_notify: CCI: 20000000

which then leads to the infinite loop. I have checked that we always get
the same PDOs and nothing else is changing, leading me to believe that
this change is not meaningful. The only thing that is changes are bits 5
and 6 of the GET_CONNECTOR_STATUS reply that follows the GET_PDOS
command.

Is this a pattern you have seen before, and if so, do you have any
recommendations on how to properly address it? My first idea was to revive
the ACPI_SUPRESS bit from the Dell quirk and set it for this command from a
custom sync_write() callback for these laptops, at the expense of possibly
losing information on actual connector changes that occur.

On a related note, I noticed that the conditions for us to read the
partner PDOs are not based on the "Supported Provider Capabilities Change"
bit of the GET_CONNECTOR_STATUS reply as the spec instructs. Is there a
reason for this?

Lastly, I also noticed that in ucsi_pwr_opmode_change() we call both
ucsi_get_src_pdos() and ucsi_register_partner_pdos(), and both read the
partner source PDOs, which to my limited understanding of the driver
seems like a duplication of both the reading and the storage of the
PDOs. Again, my question here is if this is intended, or if we can
condense this into a single call.

Thank you in advance for your time and insights!

Best regards,
Diogo

[1]: https://lore.kernel.org/linux-usb/20240327224554.1772525-1-lk@c--e.de/

