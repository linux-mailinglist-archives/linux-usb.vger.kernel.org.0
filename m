Return-Path: <linux-usb+bounces-7067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E865A867086
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 11:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70B3F287501
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 10:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9FC52F8F;
	Mon, 26 Feb 2024 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="y1lyInid"
X-Original-To: linux-usb@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC753395
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941612; cv=none; b=l63CXQHE+A0pSU1N2HKa2CKZ9qfR0tE+8ir5B+VY19zql0GuYrYHIYkZdJRP7faCBlg3LbusJxmOniEbFBEmockikbgWyS7TQfJGHMRQOheQCGSfa74pSe1+j+8LiVbGmuI5iOEK2n3nqiHP+pQeoUozOiVNPpB6/3No5jYf5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941612; c=relaxed/simple;
	bh=Y0QFy3P2cW50H5zjXSKDQzSXFENTUgfBkFo6FC6IzbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6RLcAUyy/Out6AVSE9eAv0xi/zG4NDnZolFqfmhA2nkp2wJCLE/pDtfKm6uN0XEPep8tatIG8eQCivNVsPo2e2Y51tyoMoplSEmsLo1QZ//rpv1T4WCmYdpEMaC6jQ3hFn1D6mmTodaCRIH7RtmTJ55gUMO71jDVrIw/RNmjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=y1lyInid; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1708941605; bh=Y0QFy3P2cW50H5zjXSKDQzSXFENTUgfBkFo6FC6IzbY=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=y1lyInid2KXPBw4CClxo7M7dtIZq0Ej1TVlY8nZsKuRIRlytbpnzw/HBhRGoYKqPG
	 Z9z0z5dpBAt9W7AoZSxLYpIjHo80PAZpg0jozJXTAyNwWEWm9WPiwBmEYSgeV9i4ir
	 K7hHpPodo2r0Gygbfldo2qsvgVdY1gaO+Q0CAj5o=
Date: Mon, 26 Feb 2024 11:00:04 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, 
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter
 into unattached state after try role
Message-ID: <xcph2eiyvhlljd275ljhxcrzefmq32qzcens7teqrjqi2euvgg@bhlsgc3o3qfj>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
 <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
 <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <fgrfpifljfg64uz6vck6viooqy4zhd2f5xi6e52m6jsh6vt3wi@6c4nlklkgbe7>
 <DU2PR04MB8822D2EFFD69F1D57872D5428C5A2@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8822D2EFFD69F1D57872D5428C5A2@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Mon, Feb 26, 2024 at 02:44:21AM +0000, Xu Yang wrote:
> [...]
>
> >
> > But there is no change. Your log has:
> >
> >   CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, connected]
> >
> > How to interpret this? This is with fusb302 driver. The driver has bunch of
> 
> When try sink fails (note: cc:=2 in this period), the tcpm will change to SRC_TRYWAIT
> state and it will pull up CC to Rp-default (cc:=3). Since the partner is a sink-only port,
> I think the type-c chip will sense a connection is established. Therefore, a CC change
> event is reported by type-c chip. I'm not sure the behaviors of fusb302 chip when set
> cc:=3. If it does not generate interrupt for this change, then tcpm may think the partner
> has been disconnected and move the state to SRC_TRYWAIT_UNATTACHED. Maybe it's a
> real hw issue or the event is masked by sw.
> 
> Is this dock also failed to connect other sink-only devices?

The hub is sink-only. It is connected to a DRP phone Type-C port (which is using
fusb302), which is where my log is from.

I also have a board with husb311 Type-C chip and DRP port, which I can use for
comparison (with/without your patch), I guess. It's TCPCI based (husb311), so
that should eliminate bug in fusb302 driver as a possibility, I think.

Kind regards,
	o.

> > gates to not report cc status when it doesn't change:
> >
> > https://elixir.bootlin.com/linux/latest/source/
> > drivers%2Fusb%2Ftypec%2Ftcpm%2Ffusb302.c%23L1215&data=05%7C02%7Cxu.yang_2%40nxp.com%7C836aa20d8f9549e9
> > 636008dc34ea9e0f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638443429472475922%7CUnknown%7CTWFpbGZ
> > sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=bCXr5obX2B
> > hKh5ZZt7CZHQ6OLhJ7JFgSPkW7f49NKfs%3D&reserved=0
> >
> > in several places where tcpm_cc_change is called. Not sure what is the
> > expectation of TCPM state machine, whether it always expects tcpm_cc_change()
> > call after it calls set_cc callback, or what exactly.
> 
> I think the tcpm_cc_change() will be called only when a real CC change happens
> on the CC line. It's irrelevant to whether tcpm_set_cc() is called or not.
> 
> Thanks,
> Xu Yang
> 
> >
> > kind regards,
> >         o.
> >
> > > Please refer to USB Type-C Specification
> > > Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK Support
> > >
> > > Thanks,
> > > Xu Yang
> > >
> > > > [   13.378347] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
> > > > [   13.378364] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
> > > > [   13.378373] Start toggling
> > > > [   13.387019] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
> > > > [   13.462597] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
> > > > [   13.462606] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > > > [   13.462613] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
> > > > [   13.662808] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> > > > [   13.662827] cc:=2
> > >

