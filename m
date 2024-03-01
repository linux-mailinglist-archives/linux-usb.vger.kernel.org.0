Return-Path: <linux-usb+bounces-7400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89986E729
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 18:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5F5A1C213AA
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 17:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B548813;
	Fri,  1 Mar 2024 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="jdvDeEjj"
X-Original-To: linux-usb@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712A525B
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709313952; cv=none; b=e4UW3uk1e9zp2iW5uZ/vKAQzDRaYT+lNe+Kg+ts7ibLu07BNX3/fmtWHB52+HEyeJaALhNL9l8yPnV5thsfPHYUU1F/0fUOHjQ1rtWiOVIlFnYZhe6uYnryoyxjbdo+aOA7x7sv0fv8boP5BNLRUfNdh/7V6NDE+teFKRtAYTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709313952; c=relaxed/simple;
	bh=SbOHFhFPcW+7wIQkm2ewlx2gB86uDqo+2GQ+VT9omG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUuTMhtV1KqOycBwMmeyijeO/DJjksPZTK0gG2I0ZvsFwqjLAMzGXKU5aXsS+OqipFWLpbIvCALMYZ155G6xOZo4hifL2Q6kis/lxrdchu6z9O6+frJoL+hxzf/vwPV/rFovm4XUr3XnrOXAxjsCMgAJ5C06cc2JPO55AvDBELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=jdvDeEjj; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1709313941; bh=SbOHFhFPcW+7wIQkm2ewlx2gB86uDqo+2GQ+VT9omG0=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=jdvDeEjjyFtRKoj1fj5XW1Epj75CleHLB1davesg7jQJQCM9rN1ZPn7LKBsXXh07d
	 iDYzQHndTxKdUz5ysrwUkD0A8SU5kvFNxqcgU6fkjjp5KdOrK7x/JYzwr8m1n+gdP8
	 NVxEsRHXFhTVJErxuYBO+U42SzohKbOO1acfuBBI=
Date: Fri, 1 Mar 2024 18:25:40 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, 
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter
 into unattached state after try role
Message-ID: <2akgcdydhcz43pt2thnftzqmy3r4ujrvpyeng7f3zctuwed77w@hj5v6kej35ou>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
 <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
 <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>

Hi Xu,

On Mon, Feb 19, 2024 at 08:36:50AM +0000, Xu Yang wrote:
> > Connecting an unpowered USB-C 4-port HUB:
> > 
> > Before reverting this patch: (endless loop)
> > 
> > [    0.657246] Setting usb_comm capable false
> > [    0.661870] Setting voltage/current limit 0 mV 0 mA
> > [    0.661880] polarity 0
> > [    0.661883] Requesting mux state 0, usb-role 0, orientation 0
> > [    0.663879] state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AMS]
> > [    0.663891] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
> > [    0.663897] 4-0022: registered
> > [    0.663962] Setting usb_comm capable false
> > [    0.669903] Setting voltage/current limit 0 mV 0 mA
> > [    0.669914] polarity 0
> > [    0.669917] Requesting mux state 0, usb-role 0, orientation 0
> > [    0.672166] cc:=2
> > [    0.679360] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
> > [    0.779554] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
> > [    0.779570] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
> > [    0.779576] Start toggling
> > [   12.957711] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
> > [   12.957720] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > [   12.957729] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
> > [   13.157924] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> > [   13.157939] cc:=2
> > [   13.167339] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
> > [   13.267545] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
> > [   13.267561] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
> > [   13.267566] cc:=3
> > [   13.278148] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
> 
> Based on my assumption, the DRP port is presenting Rp-default termination on CC line again,
> then tcpc should report CC change due to a connection is established in 100 ms. However, this
> CC change is not reported here. This leads to state from SRC_TRYWAIT to SRC_TRYWAIT_UNATTACHED
> rather SRC_TRYWAIT_DEBOUNCE.
> 
> Below log is a normal case.
> 
> ---
> [  149.954434] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
> [  149.954447] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [  149.954452] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
> [  150.154543] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> [  150.154554] cc:=2
> [  150.154859] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
> [  150.254881] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
> [  150.254893] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
> [  150.254896] cc:=3
> [  150.255200] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
> [  150.257288] CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, connected]
> [  150.257295] state change SRC_TRYWAIT -> SRC_TRYWAIT_DEBOUNCE [rev1 NONE_AMS]
> [  150.257300] pending state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED @ 200 ms [rev1 NONE_AMS]
> [  150.457319] state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED [delayed 200 ms]
> [  150.457329] cc:=3
> [  150.457606] polarity 1
> [  150.458314] Requesting mux state 1, usb-role 1, orientation 2
> [  150.460722] vbus:=1 charge=0
> ---

So I tried with tcpci based system and it works with your patch:

[    2.644265] Setting usb_comm capable false
[    2.645756] Setting voltage/current limit 0 mV 0 mA
[    2.645762] polarity 0
[    2.647884] Requesting mux state 0, usb-role 0, orientation 0
[    2.649661] state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AMS]
[    2.650611] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
[    2.650617] 2-004e: registered
[    2.650619] Setting usb_comm capable false
[    2.652276] Setting voltage/current limit 0 mV 0 mA
[    2.652282] polarity 0
[    2.654410] Requesting mux state 0, usb-role 0, orientation 0
[    2.655799] cc:=2
[    2.656612] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    2.656615] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    2.656616] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
[    2.656617] Start toggling

[   24.268594] CC1: 0 -> 2, CC2: 0 -> 0 [state TOGGLING, polarity 0, connected]
[   24.268599] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   24.268602] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   24.468659] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   24.468664] cc:=2
[   24.469899] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   24.473708] CC1: 2 -> 0, CC2: 0 -> 0 [state SNK_TRY, polarity 0, disconnected]

               ^^^^ this is extra

[   24.569964] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   24.569968] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   24.569970] cc:=5
[   24.571089] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   24.574996] CC1: 0 -> 2, CC2: 0 -> 0 [state SRC_TRYWAIT, polarity 0, connected]

               ^^^ this is different from your log due to prior change to 0/0
	       and here the fusb302 backed tcpm would fail/diverge, due to lack of this
	       line

[   24.575001] state change SRC_TRYWAIT -> SRC_TRYWAIT_DEBOUNCE [rev1 NONE_AMS]
[   24.575004] pending state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED @ 200 ms [rev1 NONE_AMS]
[   24.775066] state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED [delayed 200 ms]

               .... lack of cc:=5? after => SRC_ATTACHED

[   24.775070] polarity 0
[   24.778209] Requesting mux state 1, usb-role 1, orientation 1
[   24.779236] vbus:=1 charge=0
[   24.780234] pending state change SRC_ATTACHED -> SRC_UNATTACHED @ 480 ms [rev1 NONE_AMS]
[   24.782755] VBUS on
[   24.782758] state change SRC_ATTACHED -> SRC_STARTUP [rev1 NONE_AMS]
[   24.782773] AMS POWER_NEGOTIATION start
[   24.782774] cc:=4
[   24.783540] pending state change SRC_STARTUP -> AMS_START @ 16 ms [rev3 POWER_NEGOTIATION]
[   24.799554] state change SRC_STARTUP -> AMS_START [delayed 16 ms]
[   24.799558] state change AMS_START -> SRC_SEND_CAPABILITIES [rev3 POWER_NEGOTIATION]
[   24.799559] PD TX, header: 0x11a1
[   24.807710] PD TX complete, status: 2
[   24.807765] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   24.957845] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]

So it looks slightly different from your log, but ends up working because
there's an CC change event after "pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms".

So I think your patch changes some assumptions about the need for the CC change
event in this state, which breaks the state machine. If I strip the logs to just
cc events:

Your normal case:

[  149.954434] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[  150.154554] cc:=2
[  150.254896] cc:=3
[  150.257288] CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, connected]
[  150.457329] cc:=3

My husb311 working case:

[   24.268594] CC1: 0 -> 2, CC2: 0 -> 0 [state TOGGLING, polarity 0, connected]
[   24.468664] cc:=2
[   24.473708] CC1: 2 -> 0, CC2: 0 -> 0 [state SNK_TRY, polarity 0, disconnected]
[   24.569970] cc:=5
[   24.574996] CC1: 0 -> 2, CC2: 0 -> 0 [state SRC_TRYWAIT, polarity 0, connected]

My non-working fusb302 case:

[   12.957711] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[   13.157939] cc:=2
[   13.267566] cc:=3
[   13.462597] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   13.662827] cc:=2

kind regards,
	o.

> So the issue may be why that CC change is not reported?
> 
> Please refer to USB Type-C Specification
> Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK Support
> 
> Thanks,
> Xu Yang
> 
> > [   13.378347] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
> > [   13.378364] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
> > [   13.378373] Start toggling
> > [   13.387019] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
> > [   13.462597] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
> > [   13.462606] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > [   13.462613] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
> > [   13.662808] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> > [   13.662827] cc:=2
> 

