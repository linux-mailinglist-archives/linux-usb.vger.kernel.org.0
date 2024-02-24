Return-Path: <linux-usb+bounces-7006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7586228C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 04:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81BF1F258EC
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 03:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4C2171C8;
	Sat, 24 Feb 2024 03:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="bpXpZtFg"
X-Original-To: linux-usb@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44F14005
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708746152; cv=none; b=LxFZ3naSagn9Hflsa50h+ZJ0TbQgBfVsLWs664wtjSacPplr+gLQsisjn1S5aZZFotAiOLelXcoAWgt6BcI1OElqIQN4wqUGSi9cOkyZvvMaZnRvxmMvbpwpD7LlD0IGwv/Tr/bRnHXdBwMMAVM0D+mS0lDWwnB+a3uwG0o8HGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708746152; c=relaxed/simple;
	bh=McLch3tS+/5+oCYGnQVfL0gwTi+psGT6sEv8V4ALvYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1JhhMK//ZLRaG1EH4X5gYYBSUtaJq3rkz5/6BvkA7OjKxOnUq1Z7FNZ26dlChqIBQzc4v1YB0/1e1irMAUs9mo5vq0WIwkgpYWsm3hRywSMgi6c7rjMttNY/rZiEe53hVnEylS3RID6oiLEpo9jGQMY0szzWsF6roKrg8+CXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=bpXpZtFg; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1708746145; bh=McLch3tS+/5+oCYGnQVfL0gwTi+psGT6sEv8V4ALvYg=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=bpXpZtFgIzLzvVXC4Deb/SPfbLxvkm1uLFaQK+83ViKNfifLTDUNHNtV5I2r+QfBc
	 /fiSI+wYgt8OlUJoi/7vL4EZjveZk98nPLqXSaeD7gzkN826qNCl4gN1uYn5VIxHw9
	 uLB0bbUYIERoM5VQXiyjuNtt70cbjf1LMwlCHPfg=
Date: Sat, 24 Feb 2024 04:42:23 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, 
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter
 into unattached state after try role
Message-ID: <fgrfpifljfg64uz6vck6viooqy4zhd2f5xi6e52m6jsh6vt3wi@6c4nlklkgbe7>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>

Hi Xu,

On Mon, Feb 19, 2024 at 08:36:50AM +0000, Xu Yang wrote:
> Hi Ondřej,
> 
> > 
> > Hi,
> > 
> > On Sun, Aug 20, 2023 at 11:15:18PM +0800, Xu Yang wrote:
> > > The try_src_count and try_snk_count may still be 1 after enter into
> > > unattached state. This may be caused by below case:
> > >  - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
> > >  - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED
> > >
> > > The port->attached is not true at the end and tcpm_reset_port() will not
> > > be called. This will reset counter into for these cases, otherwise the tcpm
> > > won't try role when new cable attached.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpm.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > > index 5639b9a1e0bf..c9a186a8c58c 100644
> > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > @@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *port)
> > >       if (tcpm_port_is_disconnected(port))
> > >               port->hard_reset_count = 0;
> > >
> > > +     port->try_src_count = 0;
> > > +     port->try_snk_count = 0;
> > 
> > This patch breaks partner detection for USB type-c hubs and USB type-c docks.
> 
> I guess the type-c port of hub is sink-only and the type-c port of dock
> is DRP, right?

The hub is sink-only, yes.

> > 
> > Connecting an unpowered USB-C 4-port HUB:
> > 
> > Before reverting this patch: (endless loop)
> > 
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
> 
> So the issue may be why that CC change is not reported?

But there is no change. Your log has:

  CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, connected]

How to interpret this? This is with fusb302 driver. The driver has bunch of
gates to not report cc status when it doesn't change:

https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/tcpm/fusb302.c#L1215

in several places where tcpm_cc_change is called. Not sure what is the
expectation of TCPM state machine, whether it always expects tcpm_cc_change()
call after it calls set_cc callback, or what exactly.

kind regards,
	o.

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

