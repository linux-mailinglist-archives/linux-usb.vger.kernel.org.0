Return-Path: <linux-usb+bounces-9778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994F8B27D4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 20:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 951FE1F218AB
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 18:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FFB14EC64;
	Thu, 25 Apr 2024 18:05:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B464514E2F6
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 18:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714068338; cv=none; b=I69tmVEGxv4QifxhZjsOrg6fq4v+/hCFjZtszujmQurHctYqYpbHqgbntbw2bzLJmqirhVRFv+cS43b8Zm/e+QxrbZwuYFbNlYt3+zD9keelkmE8hKzuw+SBdbaU9RlG+DwA4CtOD6apKS1ikFWdGfx0bXwK8RKxrC7IMWzZ77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714068338; c=relaxed/simple;
	bh=/qpW0WpE+I4oI0iSh/Ad28v73NXe/peKSTyIUKb8NXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWISCynZBmBRjCP7KoD0QIrEw2XMd9oyywQaNT5SJAIM0WiaoTYb41GILxPYKI9rCqDe8wBrfcRlX49Wm9Yymefshu8sIUdOTtbDUsekCteVPjzHQvC5FxXcO7z/H8iIxsIqqGQ3fmLk/g0Drs3Hoqly9ftnjZprmMRJ/nffLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 8C69614055B; Thu, 25 Apr 2024 20:05:30 +0200 (CEST)
Date: Thu, 25 Apr 2024 20:05:30 +0200
From: Christian Ehrhardt <lk@c--e.de>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org, quic_prashk@quicinc.com,
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
	saranya.gopal@intel.com, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <Ziqbata1wYNCadu+@cae.in-ulm.de>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
 <ZgREDo9tYAmdBcUc@cae.in-ulm.de>
 <ynrqweb7hhfkrlvjr6suajq3jpgi4sqexz44qt4chekce7phiw@cyofo73xztdg>
 <ZgXxyWsdA7YML3mR@cae.in-ulm.de>
 <vvhn5le253djrcr6u2ksmphupgc4dot3x66hx53fpnhwbhqyma@hku4qvogc6at>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vvhn5le253djrcr6u2ksmphupgc4dot3x66hx53fpnhwbhqyma@hku4qvogc6at>

 
Hi Diogo,

On Wed, Apr 24, 2024 at 12:23:19PM +0100, Diogo Ivo wrote:
> Hi Christian, sorry for the late reply!
> 
> On Thu, Mar 28, 2024 at 11:40:09PM +0100, Christian Ehrhardt wrote:
> > 
> > On Thu, Mar 28, 2024 at 03:42:40PM +0000, Diogo Ivo wrote:
> > > On Wed, Mar 27, 2024 at 05:06:38PM +0100, Christian Ehrhardt wrote:
> > > > On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> > > > > This fixes a problem with some LG Gram laptops where the PPM sometimes
> > > > > notifies the OPM with the Connector Change Indicator field set in the
> > > > > CCI after an ACK_CC_CI command is sent,causing the UCSI stack to check
> > > > > the connector status indefinitely since the EVENT_PENDING bit is already
> > > > > cleared. This causes an interrupt storm and an artificial high load on
> > > > > these platforms.
> > > > 
> > > > If the PPM does this for a connector change ACK_CC_CI command it is
> > > > IMHO violating the spec (unless there is a _new_ event).
> > > > When I saw this type of loops the connector change indicator was set
> > > > in response to an ACK_CC_CI command for a command (sent by a different
> > > > thread for a different connector) between clearing the EVENT_PENDING
> > > > bit and acquiring the PPM lock.
> > 
> > There are legitimate reaons why the connector change indicator
> > is set in response to a command:
> > - If the condition was reported previously it is sticky until
> >   cleared.
> > - Something else changed on the connector.
> > 
> > For a more complicated device that I have here, there are five
> > different connector change events after plugging it in.
> > 
> > I'd like to understand why you run into a loop here.
> > Printing the completed command (if any) and the CCI in
> > ucsi_acpi_notify() and the details of the connector status in
> > ucsi_handle_connector_change() could shed some light on this.
> 
> You are correct, my initial conclusions were not the cause of the issue.
> After digging a bit more with your ACK early patch set [1] applied the initial
> connector changes in CCI are meaningful:
> 
> /* Connect charge here */
> 
> [88248.531077] ucsi_acpi_notify: CCI: 20000002
> [88248.531084] scheduling connector change
> [88248.531094] COMMAND: 10012
> [88248.690705] ucsi_acpi_notify: CCI: 80000902
> [88248.705038] ucsi_acpi_notify: CCI: 80000902
> [88248.769716] MESSAGE_IN: 0 294024
> [88248.769721] COMMAND: 30004
> [88248.905117] ucsi_acpi_notify: CCI: 20000002
> [88248.905122] scheduling connector change
> [88248.905238] COMMAND: 10012
> [88248.921032] ucsi_acpi_notify: CCI: 20000002
> [88249.052045] ucsi_acpi_notify: CCI: 80000902
> [88249.094680] ucsi_acpi_notify: CCI: 80000902
> [88249.113033] MESSAGE_IN: 1 42851545402b0a44
> [88249.113036] COMMAND: 30004
> [88249.234930] ucsi_acpi_notify: CCI: 20000000
> 
> as the reply to GET_CONNECTOR_STATUS changes.
> 
> Turns out the problematic command seems to be the GET_PDOS for the
> source PDOs of the partner. After testing with multiple chargers and
> hubs we always have this pattern:
> 
> [88249.235144] COMMAND: 700810010
> [88249.431015] ucsi_acpi_notify: CCI: 80001000
> [88249.444510] ucsi_acpi_notify: CCI: 80001000
> [88249.474162] MESSAGE_IN: 641450004b12c 2d12c0801912c
> [88249.474164] COMMAND: 20004
> [88249.569839] ucsi_acpi_notify: CCI: 20000002
> [88249.569843] scheduling connector change
> [88249.569878] COMMAND: 604810010
> [88249.694744] ucsi_acpi_notify: CCI: 80000002
> [88249.756603] ucsi_acpi_notify: CCI: 80000002
> [88249.772341] MESSAGE_IN: 0 0
> [88249.772343] COMMAND: 20004
> [88249.796672] ucsi_acpi_notify: CCI: 80000002
> [88249.932743] ucsi_acpi_notify: CCI: 20000000
> 		...
> [88250.229964] COMMAND: 10012
> [88250.341815] ucsi_acpi_notify: CCI: 80000900
> [88250.385756] ucsi_acpi_notify: CCI: 80000900
> [88250.404292] MESSAGE_IN: 1 42851545402b0060
> 
> And the next time we check the partner source PDOS we get the same,
> 
> [88251.126928] COMMAND: 10012
> [88251.316607] ucsi_acpi_notify: CCI: 80000900
> [88251.330743] ucsi_acpi_notify: CCI: 80000900
> [88251.358123] MESSAGE_IN: 1 42851545402b0000
> [88251.358125] COMMAND: 20004
> [88251.474957] ucsi_acpi_notify: CCI: 20000000
> [88251.475109] COMMAND: 700810010
> [88251.636812] ucsi_acpi_notify: CCI: 80001000
> [88251.695686] ucsi_acpi_notify: CCI: 80001000
> [88251.709026] MESSAGE_IN: 641450004b12c 2d12c0801912c
> [88251.709028] COMMAND: 20004
> [88251.827071] ucsi_acpi_notify: CCI: 20000002
> [88251.827075] scheduling connector change
> [88251.827189] COMMAND: 604810010
> [88251.974138] ucsi_acpi_notify: CCI: 80000002
> [88252.034895] ucsi_acpi_notify: CCI: 80000002
> [88252.054572] ucsi_acpi_notify: CCI: 80000002
> [88252.067847] MESSAGE_IN: 0 0
> [88252.067849] COMMAND: 20004
> [88252.197648] ucsi_acpi_notify: CCI: 20000000
> 
> which then leads to the infinite loop. I have checked that we always get
> the same PDOs and nothing else is changing, leading me to believe that
> this change is not meaningful. The only thing that is changes are bits 5
> and 6 of the GET_CONNECTOR_STATUS reply that follows the GET_PDOS
> command.

If I understand your debug output correctly, each call to GET_PDOS
triggers a connector state change event. However, that event seems
to go away in CCI. In the connector status some changed bits remain.
These changed bits will cause us to re-read the PDOs resulting in
an infinite loop.

If this is about correct, I guess the simplest way to fix this would
be to enable the UCSI_NO_PARTNER_PDOS quirk for affected devices.


Best regards,
Christian

