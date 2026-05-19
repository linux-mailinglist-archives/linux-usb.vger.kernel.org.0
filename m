Return-Path: <linux-usb+bounces-37666-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJgGFm0lDGoIXQUAu9opvQ
	(envelope-from <linux-usb+bounces-37666-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:55:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02D57A968
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28B533006120
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 08:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28503EF0D2;
	Tue, 19 May 2026 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tgq0QCxQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4703EEAE2
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 08:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180904; cv=none; b=FbGNFPZ73NZbcWqbHDDN52FGkDwz92zQ614oRbzx5dmCLgcN7Ypquk/YO3IpxPoaODx1lS5SI+qBqfhcr8YlqAKLWRu7p1G9OW0zT1HNzf++Aq8L/ARA26NfcVLNqZoeTPzJdtIhEYynxhMwoi+RKLhNfxRdpN6VAiytdAyyYLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180904; c=relaxed/simple;
	bh=jL1wRQJLe5WLat50It2LrgPluh3+w7X+ACNLGMeqek0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDhsZKGRP38x/XIIcSNR4Oe76c0fRVUh9YZw9+udmO1xIgKGkUvXBM85E5CrLkM5jgwySrxw2IDq8JjjgOJ5V/WE0EF3UsBtBcDcBkJ1FV1dulR3DC2LTZw83SIK90w02VmbLJ2b5KiXkbsakvACnwOYZz5LmgO4n+7MwQHkAT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tgq0QCxQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so2829321f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779180900; x=1779785700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttEEnCBEgUK+wfN1BWs0jMhy7eonfn0k5yN/j3m945E=;
        b=Tgq0QCxQIEtkik+2nZ0FmV0DuLF3e0jht2XIKHFgCs8v9P6VKVXROIRUi/zMhr6cVE
         DTyiyPmklOx4XvwMpTgsKInax2vbsbrd8M7RiQZMrxdRvveCyCXV3TxBGwjHBbz3E672
         NPox5wrwD8tgbLhQ0PFYJvsthYU2nXL0nbFpV0gA914pYWSsARFMgnPsxBW7E+YGIYME
         CEv+jfBa2PMVH94COAbb8QMXC4gQWArPzDKhY1k7jnPGifbH7PoY7s65hCgqvGQTWIBz
         ddMeBaurTR72aUiVEqr8zbRTLAabwiOSwNG03LGRXrg2vVlIssXpP2nUKZ0qHUt26qij
         tYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180900; x=1779785700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttEEnCBEgUK+wfN1BWs0jMhy7eonfn0k5yN/j3m945E=;
        b=PpBEcgHoxArqaLMYs8fP1xt/c70WnnYe9lujyG8gfdFmoQ/5uP4+3nFGvG/OjP1Zjf
         4baJk49OzOxVSKULgR0pOebzHG5NlMAC1N8BuSNUlIUgOHvNLa9B6BDG+BE1MfJo6AzW
         4Zjwq5NyTjOA9ZizGgO/QiHgbiBcO0GQm5S5qBLa/PgSoHotiAhWtEwub+12Fsv7GkJ2
         HcuYWJe+kGlVyFAZNvO9tBA7Mud0NlinXfyvvlRBbqpzVFZm6GkoXhFul+W4rgJZF99H
         IBXmjUPrUsJm/3lOpKiJAbH6iZtekX5LaZbtSuEdDSkdNPEejgMktn57vYN1/480Wq3N
         /deg==
X-Forwarded-Encrypted: i=1; AFNElJ+IU02L0agmxLp5LNEHiKVTMFuPWDJ7hkDnoh2aU6MruMKafcFbL2EQa/aE8sjNbAd99/jiqnv3xnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvJH2S03+ap4oEZdSNMkYaDvWzT+ZDg809Te/u1kMv9VmpLaf
	N2P+bJS7GT9XVZc0Sbl4r6WE618Lvv2lpq3VFwiixorF6TT+5JAAztq2
X-Gm-Gg: Acq92OHmoheXOG+g6pPwFf291pew8VpOkeuAyk7j12OSgdvj0ioWF8JvyLtoYHJuxlr
	j/uFmRNQq0JJP4M1esttV0aZgBCIHv7gG4pGMnPh0OcKblztrHppbG1ZTrpcwaMA0S4YtndaqYi
	+WvLPTDaCaqiKK+/EPdkQqfyIjWoet1Eq9DCHE3VAKxcCmHD/1+/Ztx9DhISWdq0eGHjx0l+Q8a
	dWiV+lixxheqRitpEXhFfftNuH6qJtS3QBQoumfs73tHeg2oLVFs/furAMzgB9bKAMbvkLbZU7Z
	cketmI8r25cx9eevcOzYBC694J3speh03YdhlAao7r3qWEfTPooOPSXPNlzlL0K0TOeEH5RDsk/
	TNs/AObqsPbbRQDdtesFlmG64AA1/9GCR92fc9JlVFrobPvFcz6LUZQqQN9DV82HUgXRFgoMOZD
	T51we19c0ZZq4pAmVILiUGSuYa4+3jDCz3TNu5Cz7jAJvBx4nG3T1NrtQQpy6QMR+OUP9k6GhYv
	1Acz3014VowzwkIsjk35PBvPvSz1lzVwX7YtkBkVoVD5P/gVcyMH6cgX6R0O4HrVtu48Q/8c5g=
X-Received: by 2002:a05:6000:4404:b0:448:908a:398b with SMTP id ffacd0b85a97d-45d9288b8c2mr25159333f8f.14.1779180899971;
        Tue, 19 May 2026 01:54:59 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17ec2sm41021489f8f.24.2026.05.19.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:54:59 -0700 (PDT)
Date: Tue, 19 May 2026 10:54:58 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37666-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,dolcini.it];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fraschnyder@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.14:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,4c100000:email,2.164.186.48:email,0.0.0.52:email,4c010010:email,2.159.99.0:email,2.220.108.0:email]
X-Rspamd-Queue-Id: EC02D57A968
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xu

On Tue, May 12, 2026 at 05:53:57PM +0800, Xu Yang wrote:
> 
> OK. I mean, does dwc3_imx8mp_probe() still succeed after the kernel dumps
> at the end?
Ah yes, afterwards it still succeeds.

> 
> OK. More debug information will be helpful.
> 

I've attached the logs below with and without the commit. looking at 
what happens before the warning I think the problem is that after probe
deferral the depopulate path races with the device link state changes 
from the fw_devlink cycle fixup.

One important thing to mention is, that we build dwc3 and typec as modules.
If I build them as built-in I can't reproduce the kernel warning so far. 

Logs whith commit present and when the warning appears:

  [    6.405710] device: '4c100000.usb': device_add
  [    6.414620] ----- cycle: start -----
  [    6.414626] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.414640] ----- cycle: start -----
  [    6.414643] /soc/phy@4c1f0040: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.414661] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/phy@4c1f0040
  [    6.414671] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.414680] ----- cycle: end -----
  [    6.414683] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: Fixed dependency cycle(s) with /soc/usb@4c010010/usb@4c100000
  [    6.414700] device: 'platform:4c100000.usb--i2c:1-0052': device_add
  [    6.414783] i2c 1-0052: Linked as a sync state only consumer to 4c100000.usb
  [    6.414790] ----- cycle: start -----
  [    6.414793] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.414805] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.414814] ----- cycle: end -----
  [    6.414816] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.414827] ----- cycle: start -----
  [    6.414829] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.414839] /soc/phy@4c1f0040: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.414857] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/phy@4c1f0040
  [    6.414864] ----- cycle: end -----
  [    6.414866] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/phy@4c1f0040
  [    6.414880] device: 'platform:4c1f0040.phy--platform:4c100000.usb': device_add
  [    6.414943] platform 4c100000.usb: Linked as a sync state only consumer to 4c1f0040.phy
  [    6.414947] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /soc/phy@4c1f0040
  [    6.414956] platform 4c100000.usb: Not linking /interrupt-controller@48000000 - might never become dev
  [    6.414962] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /interrupt-controller@48000000
  [    6.414979] device: 'scmi_protocol:scmi_dev.7--platform:4c100000.usb': device_add
  [    6.415027] devices_kset: Moving 4c100000.usb to end of list
  [    6.415032] platform 4c100000.usb: Linked as a consumer to scmi_dev.7
  [    6.415035] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /firmware/scmi/protocol@14
  [    6.416216] imx8mp-dwc3 4c010010.usb: error -EPROBE_DEFER: failed to get dwc3 platform data
  [    6.416310] platform 4c100000.usb: Dropping the link to scmi_dev.7
  [    6.416317] device: 'scmi_protocol:scmi_dev.7--platform:4c100000.usb': device_unregister
  [    6.416680] platform 4c100000.usb: Dropping the link to 4c1f0040.phy
  [    6.416687] device: 'platform:4c1f0040.phy--platform:4c100000.usb': device_unregister
  [    6.416892] i2c 1-0052: Dropping the link to 4c100000.usb
  [    6.416898] device: 'platform:4c100000.usb--i2c:1-0052': device_unregister
  [    6.419266] devices_kset: Moving 4c010010.usb to end of list
  [    6.454423] device: 'phy-4c1f0040.phy.0': device_add
  [    6.454545] device: '4c100000.usb': device_add
  [    6.454659] ----- cycle: start -----
  [    6.454664] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.454680] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.454689] ----- cycle: end -----
  [    6.454692] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: Fixed dependency cycle(s) with /soc/usb@4c010010/usb@4c100000
  [    6.454706] device: 'platform:4c100000.usb--i2c:1-0052': device_add
  [    6.454763] i2c 1-0052: Linked as a sync state only consumer to 4c100000.usb
  [    6.454770] ----- cycle: start -----
  [    6.454773] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.454786] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.454795] ----- cycle: end -----
  [    6.454797] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.455132] imx8mp-dwc3 4c010010.usb: error -EPROBE_DEFER: failed to get dwc3 platform data
  [    6.455211] i2c 1-0052: Dropping the link to 4c100000.usb
  [    6.455215] device: 'platform:4c100000.usb--i2c:1-0052': device_unregister
  [    6.455831] devices_kset: Moving 4c010010.usb to end of list
  [    6.456354] device: '4c100000.usb': device_add
  [    6.456458] ----- cycle: start -----
  [    6.456463] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.456479] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.456488] ----- cycle: end -----
  [    6.456491] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: Fixed dependency cycle(s) with /soc/usb@4c010010/usb@4c100000
  [    6.456505] device: 'platform:4c100000.usb--i2c:1-0052': device_add
  [    6.456563] i2c 1-0052: Linked as a sync state only consumer to 4c100000.usb
  [    6.456571] ----- cycle: start -----
  [    6.456573] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.456586] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.456595] ----- cycle: end -----
  [    6.456598] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.456940] imx8mp-dwc3 4c010010.usb: error -EPROBE_DEFER: failed to get dwc3 platform data
  [    6.457022] i2c 1-0052: Dropping the link to 4c100000.usb
  [    6.457026] device: 'platform:4c100000.usb--i2c:1-0052': device_unregister
  [    6.474614] devices_kset: Moving 4c010010.usb to end of list
  [    6.522012] device: '4c100000.usb': device_add
  [    6.522299] ----- cycle: start -----
  [    6.522317] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.522335] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.522347] ----- cycle: end -----
  [    6.522454] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: Fixed dependency cycle(s) with /soc/usb@4c010010/usb@4c100000
  [    6.533826] device: 'platform:4c100000.usb--i2c:1-0052': device_add
  [    6.534139] i2c 1-0052: Linked as a sync state only consumer to 4c100000.usb
  [    6.534164] ----- cycle: start -----
  [    6.534169] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
  [    6.534192] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.534203] ----- cycle: end -----
  [    6.534207] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.545615] device: 'regulator:regulator.4--platform:4c1f0040.phy': device_add
  [    6.548513] devices_kset: Moving 4c1f0040.phy to end of list
  [    6.548537] devices_kset: Moving phy-4c1f0040.phy.0 to end of list
  [    6.548547] imx8mq-usb-phy 4c1f0040.phy: Linked as a consumer to regulator.4
  [    6.549386] device: '4c1f0040.phy-switch': device_add
  [    6.549395] imx8mp-dwc3 4c010010.usb: error -EPROBE_DEFER: failed to get dwc3 platform data
  [    6.558846] /soc/phy@4c1f0040 Dropping the fwnode link to /soc/bus@44000000/i2c@44350000/tcpc@52/connector
  [    6.568591] imx_usb 4c200000.usb: Linked as a consumer to regulator.5
  [    6.575430] ------------[ cut here ]------------
  [    6.580063] WARNING: drivers/base/core.c:1640 at device_del+0x2bc/0x38c, CPU#1: kworker/u24:7/85
  [    6.588847] Modules linked in: tcpci(+) tcpm gf128mul aead snd_soc_fsl_sai(+) fsl_imx9_ddr_perf ci_hdrc_imx(+) ina2xx(+) amc6821(+) imx_pcm_dma
  snd_soc4
  [    6.636591] CPU: 1 UID: 0 PID: 85 Comm: kworker/u24:7 Not tainted 7.1.0-rc4+ #14 PREEMPT
  [    6.644767] Hardware name: Aquila iMX95 on Aquila Development Board (DT)
  [    6.651466] Workqueue: events_unbound deferred_probe_work_func
  [    6.657300] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [    6.664250] pc : device_del+0x2bc/0x38c
  [    6.668094] lr : device_del+0x18c/0x38c
  [    6.671934] sp : ffff800080b0b9b0
  [    6.675237] x29: ffff800080b0b9d0 x28: 0000000000000000 x27: 0000000000000000
  [    6.682372] x26: 0000000000000000 x25: 0000000000000000 x24: ffff000086c15cc8
  [    6.689504] x23: ffff000086c15cc0 x22: ffff000080a71010 x21: 0000000004208060
  [    6.696637] x20: ffffd5f0e544ab58 x19: ffff000086c15c10 x18: 0000000000000000
  [    6.703770] x17: 0000000000000000 x16: 0000000000000003 x15: 0000000000000400
  [    6.710902] x14: ffff000081b3e7d0 x13: 0000000000000000 x12: ffff00008316d380
  [    6.718035] x11: ffff00008012d910 x10: ffff00008316d240 x9 : 0000000000000017
  [    6.725175] x8 : ffff800080b0b8f8 x7 : 0000000000000000 x6 : fefefefefefeff64
  [    6.732301] x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff00008746ff00
  [    6.739433] x2 : ffff000081b3e740 x1 : 0000000000000003 x0 : ffff000086c15800
  [    6.746573] Call trace:
  [    6.749024]  device_del+0x2bc/0x38c (P)
  [    6.752857]  platform_device_del+0x2c/0x9c
  [    6.756947]  platform_device_unregister+0x14/0x3c
  [    6.761652]  of_platform_device_destroy+0xf0/0x100
  [    6.766438]  device_for_each_child_reverse+0x70/0xc8
  [    6.771402]  of_platform_depopulate+0x34/0x78
  [    6.775761]  dwc3_imx8mp_probe+0x234/0x3c0 [dwc3_imx8mp]
  [    6.781073]  platform_probe+0x5c/0xa4
  [    6.784738]  really_probe+0xc0/0x3dc
  [    6.788312]  __driver_probe_device+0x88/0x1a0
  [    6.792663]  driver_probe_device+0x3c/0x11c
  [    6.796840]  __device_attach_driver+0xbc/0x17c
  [    6.801281]  bus_for_each_drv+0x88/0xe8
  [    6.805108]  __device_attach+0x9c/0x1cc
  [    6.808939]  device_initial_probe+0x54/0x60
  [    6.810462] ci_hdrc ci_hdrc.0: EHCI Host Controller
  [    6.813112]  bus_probe_device+0x34/0xa0
  [    6.821216] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
  [    6.821796]  deferred_probe_work_func+0xa8/0x104
  [    6.821802]  process_one_work+0x15c/0x2a0
  [    6.821810]  worker_thread+0x18c/0x300
  [    6.821814]  kthread+0x118/0x124
  [    6.821822]  ret_from_fork+0x10/0x20
  [    6.833454] ---[ end trace 0000000000000000 ]--

Log with commit reverted:

[    6.370196] device: '4c100000.usb': device_add
[    6.378088] ----- cycle: start -----
[    6.378095] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.378109] ----- cycle: start -----
[    6.378111] /soc/phy@4c1f0040: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.378129] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/phy@4c1f0040
[    6.378138] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
[    6.378148] ----- cycle: end -----
[    6.378151] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: Fixed dependency cycle(s) with /soc/usb@4c010010/usb@4c100000
[    6.378166] device: 'platform:4c100000.usb--i2c:1-0052': device_add
[    6.378233] i2c 1-0052: Linked as a sync state only consumer to 4c100000.usb
[    6.378240] ----- cycle: start -----
[    6.378243] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
[    6.378255] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.378265] ----- cycle: end -----
[    6.378267] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.378277] ----- cycle: start -----
[    6.378280] /soc/bus@44000000/i2c@44350000/tcpc@52/connector: cycle: depends on /soc/usb@4c010010/usb@4c100000
[    6.378289] /soc/phy@4c1f0040: cycle: depends on /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.378298] /soc/usb@4c010010/usb@4c100000: cycle: depends on /soc/phy@4c1f0040
[    6.378305] ----- cycle: end -----
[    6.378307] /soc/usb@4c010010/usb@4c100000: Fixed dependency cycle(s) with /soc/phy@4c1f0040
[    6.378317] device: 'platform:4c1f0040.phy--platform:4c100000.usb': device_add
[    6.378365] platform 4c100000.usb: Linked as a sync state only consumer to 4c1f0040.phy
[    6.378369] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /soc/phy@4c1f0040
[    6.378378] platform 4c100000.usb: Not linking /interrupt-controller@48000000 - might never become dev
[    6.378383] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /interrupt-controller@48000000
[    6.378402] device: 'scmi_protocol:scmi_dev.7--platform:4c100000.usb': device_add
[    6.378448] devices_kset: Moving 4c100000.usb to end of list
[    6.378454] platform 4c100000.usb: Linked as a consumer to scmi_dev.7
[    6.378457] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /firmware/scmi/protocol@14
[    6.412551] imx8mp-dwc3 4c010010.usb: Dropping the link to 4c1f0040.phy
[    6.420383] device: 'platform:4c1f0040.phy--platform:4c010010.usb': device_unregister
[    6.448740] /soc/phy@4c1f0040 Dropping the fwnode link to /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.455463] /soc/usb@4c010010/usb@4c100000 Dropping the fwnode link to /soc/bus@44000000/i2c@44350000/tcpc@52/connector
[    6.466316] wm8904 1-001a: Linked as a consumer to regulator.2
[    6.467099] device: 'phy-4c1f0040.phy.0': device_add
[    6.467280] device: 'regulator:regulator.4--platform:4c1f0040.phy': device_add
[    6.469337] devices_kset: Moving 4c1f0040.phy to end of list
[    6.477641] devices_kset: Moving phy-4c1f0040.phy.0 to end of list
[    6.477672] imx8mq-usb-phy 4c1f0040.phy: Linked as a consumer to regulator.4
[    6.477755] device: '4c1f0040.phy-switch': device_add
[    6.479392] imx_usb 4c200000.usb: Linked as a consumer to regulator.5
[    6.653448] spi-nor spi0.0: Linked as a consumer to regulator.0
[    6.655937] device: 'phy:phy-4c1f0040.phy.0--platform:4c100000.usb': device_add
[    6.656027] devices_kset: Moving 4c100000.usb to end of list
[    6.656039] dwc3 4c100000.usb: Linked as a consumer to phy-4c1f0040.phy.0
[    6.662812] device: '4c100000.usb': device_add
[    6.665219] device: '4c100000.usb-role-switch': device_add


Kind regards,

Franz

