Return-Path: <linux-usb+bounces-6199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DED8505BC
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 18:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD94428642E
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 17:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95325CDF3;
	Sat, 10 Feb 2024 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="dpIklDQg"
X-Original-To: linux-usb@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5241A82
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707586119; cv=none; b=T/GPZtT04sZ64U309m2k/835NxiEVztdcoOTQTRyYTFv0m79bIatjeNMxa7zusHFV2gYCdTEFmVN7p/QPGNQKmY078YWvehmYBFoJIYrywLvxxPTi10sLaYmVD7op7pGHUL2SJGLdyOMPzUElN+KWYWJQunHUD3xoKnskG2NEkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707586119; c=relaxed/simple;
	bh=pf2UAfzKGXTqluZ4N2+srSgP6U+ctC3gEVHGKGm7tTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtbpCA60pVTiyOXMn1drf37xhApRMT7+8a8hHJUrCTgC+p8KobXqoiDew6OrzGzi0r4FjXbq4SkPysgUcBHbnvcL8PcSjCBdFI7LiwgU1d1ul26QsAL97rX+KID+SPFz0wL4XmlTBibsk7/6T/Fsa0aFD6q3gsB93nw23/SN/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=dpIklDQg; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1707586105; bh=pf2UAfzKGXTqluZ4N2+srSgP6U+ctC3gEVHGKGm7tTA=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=dpIklDQgw6zvgdPiNjntPipdby9BzOdVErK8ec0o2XwLQZq3Pr360+sAqYsr9zr3W
	 xnmd/os8cvkN0Gz9pmImwxYy3qvgDtWIrA6EjZAgIiF435ktuBLO1V3gEKCoaLdne1
	 sPsJUTHBwPKM+njYH2iJKF+hCfByfPrkQpI161GY=
Date: Sat, 10 Feb 2024 18:28:25 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: reset counter when enter into
 unattached state after try role
Message-ID: <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820151518.1403006-1-xu.yang_2@nxp.com>

Hi,

On Sun, Aug 20, 2023 at 11:15:18PM +0800, Xu Yang wrote:
> The try_src_count and try_snk_count may still be 1 after enter into
> unattached state. This may be caused by below case:
>  - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
>  - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED
> 
> The port->attached is not true at the end and tcpm_reset_port() will not
> be called. This will reset counter into for these cases, otherwise the tcpm
> won't try role when new cable attached.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5639b9a1e0bf..c9a186a8c58c 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *port)
>  	if (tcpm_port_is_disconnected(port))
>  		port->hard_reset_count = 0;
>  
> +	port->try_src_count = 0;
> +	port->try_snk_count = 0;

This patch breaks partner detection for USB type-c hubs and USB type-c docks.

Connecting an unpowered USB-C 4-port HUB:

Before reverting this patch: (endless loop)

[    0.657246] Setting usb_comm capable false
[    0.661870] Setting voltage/current limit 0 mV 0 mA
[    0.661880] polarity 0
[    0.661883] Requesting mux state 0, usb-role 0, orientation 0
[    0.663879] state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AMS]
[    0.663891] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
[    0.663897] 4-0022: registered
[    0.663962] Setting usb_comm capable false
[    0.669903] Setting voltage/current limit 0 mV 0 mA
[    0.669914] polarity 0
[    0.669917] Requesting mux state 0, usb-role 0, orientation 0
[    0.672166] cc:=2
[    0.679360] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    0.779554] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    0.779570] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
[    0.779576] Start toggling
[   12.957711] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[   12.957720] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   12.957729] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   13.157924] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   13.157939] cc:=2
[   13.167339] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   13.267545] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   13.267561] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   13.267566] cc:=3
[   13.278148] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   13.378347] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   13.378364] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   13.378373] Start toggling
[   13.387019] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   13.462597] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   13.462606] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   13.462613] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   13.662808] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   13.662827] cc:=2
[   13.672351] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   13.772550] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   13.772581] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   13.772586] cc:=3
[   13.781883] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   13.882095] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   13.882112] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   13.882118] Start toggling
[   13.890365] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   13.967377] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   13.967386] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   13.967393] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   14.167587] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   14.167602] cc:=2
[   14.177398] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   14.277605] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   14.277621] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   14.277626] cc:=3
[   14.287822] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   14.388028] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   14.388045] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   14.388051] Start toggling
[   14.397965] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   14.472959] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   14.472968] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   14.472975] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   14.673163] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   14.673179] cc:=2
[   14.683570] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   14.783777] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   14.783793] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   14.783798] cc:=3
[   14.793352] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   14.893469] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   14.893485] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   14.893492] Start toggling
[   14.903601] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   14.983779] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   14.983788] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   14.983796] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   15.183991] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   15.184005] cc:=2
[   15.193756] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   15.293963] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   15.293980] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   15.293985] cc:=3
[   15.304408] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   15.404606] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   15.404623] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   15.404629] Start toggling
[   15.414219] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   15.492054] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   15.492063] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   15.492071] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   15.692264] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   15.692279] cc:=2
[   15.701387] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   15.801593] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   15.801609] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   15.801615] cc:=3
[   15.811570] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   15.911786] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   15.911803] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   15.911809] Start toggling
[   15.920856] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   15.999246] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   15.999255] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   15.999263] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   16.199458] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   16.199474] cc:=2
[   16.208903] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   16.309105] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   16.309122] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   16.309127] cc:=3
[   16.319633] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   16.419838] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   16.419854] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   16.419861] Start toggling
[   16.428888] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   16.505691] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   16.505699] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   16.505706] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   16.705894] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   16.705910] cc:=2
[   16.715312] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   16.815518] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   16.815534] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   16.815539] cc:=3
[   16.825341] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   16.925553] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   16.925571] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   16.925577] Start toggling
[   16.934430] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   17.008462] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   17.008471] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   17.008478] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   17.208666] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   17.208683] cc:=2
[   17.218657] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   17.318863] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   17.318879] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   17.318884] cc:=3
[   17.328497] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   17.428704] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   17.428720] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   17.428727] Start toggling
[   17.437989] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   17.517195] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   17.517204] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   17.517213] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   17.717406] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   17.717422] cc:=2
[   17.727337] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   17.827542] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   17.827559] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   17.827563] cc:=3
[   17.837921] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   17.938133] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   17.938149] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   17.938156] Start toggling
[   17.946970] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   18.020575] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   18.020584] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   18.020591] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   18.220785] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   18.220801] cc:=2
[   18.231043] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   18.331250] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   18.331266] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   18.331271] cc:=3
[   18.341883] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   18.442081] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   18.442098] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   18.442104] Start toggling
[   18.450845] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   18.529250] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   18.529259] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   18.529267] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   18.729453] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   18.729469] cc:=2
[   18.739051] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   18.839250] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   18.839267] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   18.839271] cc:=3
[   18.847079] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   18.947289] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   18.947305] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   18.947312] Start toggling
[   18.955648] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   19.031557] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   19.031568] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   19.031576] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   19.231629] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   19.231644] cc:=2
[   19.241224] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   19.341424] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   19.341443] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   19.341449] cc:=3
[   19.351743] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   19.451963] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   19.451979] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   19.451986] Start toggling
[   19.460899] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   19.536487] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   19.536496] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   19.536503] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   19.736697] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   19.736712] cc:=2
[   19.746524] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   19.846714] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   19.846774] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   19.846779] cc:=3
[   19.856380] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   19.956584] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   19.956601] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   19.956607] Start toggling
[   19.964946] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   20.040030] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   20.040039] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   20.040046] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   20.240232] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   20.240248] cc:=2
[   20.248133] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   20.348339] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   20.348355] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   20.348361] cc:=3
[   20.357423] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   20.457475] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   20.457492] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   20.457498] Start toggling
[   20.467656] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   20.547175] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   20.547184] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   20.547193] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   20.747388] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   20.747403] cc:=2
[   20.756392] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   20.856458] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   20.856474] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   20.856479] cc:=3
[   20.863358] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   20.963403] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   20.963419] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   20.963425] Start toggling
[   20.969938] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   21.044949] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   21.044958] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   21.044966] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   21.245077] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   21.245090] cc:=2
[   21.251435] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   21.351484] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   21.351499] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   21.351508] cc:=3
[   21.357834] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   21.457897] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   21.457913] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   21.457920] Start toggling
[   21.464455] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   21.536293] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   21.536301] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   21.536312] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   21.736475] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   21.736488] cc:=2
[   21.745580] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   21.845679] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   21.845695] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   21.845700] cc:=3
[   21.852380] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   21.952434] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   21.952450] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   21.952457] Start toggling
[   21.958032] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   22.031084] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   22.031094] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   22.031101] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   22.231203] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   22.231218] cc:=2
[   22.237238] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   22.337281] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   22.337298] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   22.337304] cc:=3
[   22.343114] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   22.443221] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   22.443237] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   22.443244] Start toggling
[   22.449085] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   22.527011] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   22.527020] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   22.527028] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   22.727222] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   22.727238] cc:=2
[   22.736834] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   22.837041] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   22.837057] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   22.837062] cc:=3
[   22.847286] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   22.947351] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   22.947367] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   22.947373] Start toggling
[   22.955370] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   23.029294] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   23.029303] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   23.029310] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   23.229503] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   23.229518] cc:=2
[   23.239083] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   23.339294] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   23.339310] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   23.339315] cc:=3
[   23.347947] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   23.447989] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   23.448005] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   23.448011] Start toggling
[   23.457261] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   23.536826] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   23.536835] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   23.536843] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   23.736961] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   23.736977] cc:=2
[   23.746763] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   23.846952] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   23.846969] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   23.846974] cc:=3
[   23.855442] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[   23.955490] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[   23.955505] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[   23.955511] Start toggling
[   23.964647] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[   24.037445] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[   24.037454] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   24.037462] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   24.237649] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   24.237665] cc:=2
[   24.246526] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[   24.346634] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[   24.346649] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[   24.346654] cc:=3
[   24.357490] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]

After reverting the patch:

[    0.665952] Setting usb_comm capable false
[    0.670577] Setting voltage/current limit 0 mV 0 mA
[    0.670584] polarity 0
[    0.670629] Requesting mux state 0, usb-role 0, orientation 0
[    0.672656] state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AMS]
[    0.672668] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
[    0.672674] 4-0022: registered
[    0.672734] Setting usb_comm capable false
[    0.678431] Setting voltage/current limit 0 mV 0 mA
[    0.678444] polarity 0
[    0.678447] Requesting mux state 0, usb-role 0, orientation 0
[    0.680532] cc:=2
[    0.686272] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    0.786469] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    0.786486] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
[    0.786492] Start toggling
[    6.839620] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[    6.839629] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[    6.839639] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[    7.039829] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[    7.039846] cc:=2
[    7.049047] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
[    7.149249] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[    7.149266] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[    7.149270] cc:=3
[    7.158701] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
[    7.258897] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
[    7.258915] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
[    7.258921] Start toggling
[    7.266951] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
[    7.341707] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
[    7.341716] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[    7.341723] pending state change SRC_ATTACH_WAIT -> SRC_ATTACHED @ 200 ms [rev1 NONE_AMS]
[    7.541918] state change SRC_ATTACH_WAIT -> SRC_ATTACHED [delayed 200 ms]
[    7.541934] polarity 1
[    7.541939] Requesting mux state 1, usb-role 1, orientation 2
[    7.574501] vbus:=1 charge=0
[    7.574903] pending state change SRC_ATTACHED -> SRC_UNATTACHED @ 480 ms [rev1 NONE_AMS]
[    7.580492] VBUS on
[    7.580497] state change SRC_ATTACHED -> SRC_STARTUP [rev1 NONE_AMS]
[    7.580505] AMS POWER_NEGOTIATION start
[    7.580508] cc:=4
[    7.586492] state change SRC_STARTUP -> AMS_START [rev3 POWER_NEGOTIATION]
[    7.586498] state change AMS_START -> SRC_SEND_CAPABILITIES [rev3 POWER_NEGOTIATION]
[    7.586504] PD TX, header: 0x11a1
[    7.600290] PD TX complete, status: 2
[    7.600355] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    7.769110] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    7.769132] PD TX, header: 0x11a1
[    7.786930] PD TX complete, status: 2
[    7.788211] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    7.938343] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    7.938359] PD TX, header: 0x11a1
[    7.953177] PD TX complete, status: 2
[    7.953273] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    8.103472] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    8.103489] PD TX, header: 0x11a1
[    8.120014] PD TX complete, status: 2
[    8.120111] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    8.270231] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    8.270248] PD TX, header: 0x11a1
[    8.285528] PD TX complete, status: 2
[    8.285624] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    8.435766] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    8.435788] PD TX, header: 0x11a1
[    8.450077] PD TX complete, status: 2
[    8.450228] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    8.600425] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    8.600443] PD TX, header: 0x11a1
[    8.615200] PD TX complete, status: 2
[    8.615293] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    8.765492] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    8.765512] PD TX, header: 0x11a1
[    8.782628] PD TX complete, status: 2
[    8.782732] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    8.932917] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    8.932935] PD TX, header: 0x11a1
[    8.949602] PD TX complete, status: 2
[    8.949707] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    9.099911] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    9.099929] PD TX, header: 0x11a1
[    9.116041] PD TX complete, status: 2
[    9.116142] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    9.266308] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    9.266326] PD TX, header: 0x11a1
[    9.282962] PD TX complete, status: 2
[    9.283063] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    9.433223] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    9.433244] PD TX, header: 0x11a1
[    9.449758] PD TX complete, status: 2
[    9.449855] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    9.600047] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    9.600065] PD TX, header: 0x11a1
[    9.616269] PD TX complete, status: 2
[    9.616310] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    9.766453] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    9.766470] PD TX, header: 0x11a1
[    9.782042] PD TX complete, status: 2
[    9.782148] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[    9.932341] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[    9.932359] PD TX, header: 0x11a1
[    9.948928] PD TX complete, status: 2
[    9.949031] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   10.099231] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   10.099248] PD TX, header: 0x11a1
[   10.115496] PD TX complete, status: 2
[   10.115589] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   10.265782] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   10.265800] PD TX, header: 0x11a1
[   10.282709] PD TX complete, status: 2
[   10.282810] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   10.433011] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   10.433029] PD TX, header: 0x11a1
[   10.449594] PD TX complete, status: 2
[   10.449702] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   10.599852] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   10.599870] PD TX, header: 0x11a1
[   10.616542] PD TX complete, status: 2
[   10.616647] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   10.766844] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   10.766935] PD TX, header: 0x11a1
[   10.784152] PD TX complete, status: 2
[   10.784253] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   10.934369] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   10.934386] PD TX, header: 0x11a1
[   10.949643] PD TX complete, status: 2
[   10.949749] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   11.099930] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   11.099949] PD TX, header: 0x11a1
[   11.117254] PD TX complete, status: 2
[   11.117360] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   11.267418] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   11.267435] PD TX, header: 0x11a1
[   11.284007] PD TX complete, status: 2
[   11.284116] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   11.434308] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   11.434325] PD TX, header: 0x11a1
[   11.450561] PD TX complete, status: 2
[   11.450663] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   11.600855] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   11.600872] PD TX, header: 0x11a1
[   11.618078] PD TX complete, status: 2
[   11.618184] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   11.768378] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   11.768396] PD TX, header: 0x11a1
[   11.785107] PD TX complete, status: 2
[   11.785227] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   11.935431] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   11.935448] PD TX, header: 0x11a1
[   11.951955] PD TX complete, status: 2
[   11.952069] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   12.102261] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   12.102278] PD TX, header: 0x11a1
[   12.118553] PD TX complete, status: 2
[   12.118654] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   12.268854] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   12.268871] PD TX, header: 0x11a1
[   12.286119] PD TX complete, status: 2
[   12.286223] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   12.436417] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   12.436436] PD TX, header: 0x11a1
[   12.453586] PD TX complete, status: 2
[   12.453692] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   12.603893] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   12.603924] PD TX, header: 0x11a1
[   12.620706] PD TX complete, status: 2
[   12.620812] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   12.770935] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   12.770953] PD TX, header: 0x11a1
[   12.786119] PD TX complete, status: 2
[   12.786214] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   12.936405] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   12.936422] PD TX, header: 0x11a1
[   12.953263] PD TX complete, status: 2
[   12.953367] pending state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES @ 150 ms [rev3 POWER_NEGOTIATION]
[   13.103568] state change SRC_SEND_CAPABILITIES -> SRC_SEND_CAPABILITIES [delayed 150 ms]
[   13.103585] state change SRC_SEND_CAPABILITIES -> SRC_READY [rev3 POWER_NEGOTIATION]
[   13.103759] AMS POWER_NEGOTIATION finished
[   13.103763] cc:=3

A diff:

--- work        2024-02-10 18:05:56.240978440 +0100
+++ nonwork     2024-02-10 18:06:27.800653295 +0100
@@ -1,55 +1,67 @@
 Setting usb_comm capable false
 Setting voltage/current limit 0 mV 0 mA
 polarity 0
 Requesting mux state 0, usb-role 0, orientation 0
 state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AMS]
 CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
 4-0022: registered
 Setting usb_comm capable false
 Setting voltage/current limit 0 mV 0 mA
 polarity 0
 Requesting mux state 0, usb-role 0, orientation 0
-cc:=2 
+cc:=2
 pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
 state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
 state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
 Start toggling
 CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
 state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
 pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
 state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
 cc:=2
 pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 NONE_AMS]
 state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
 state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
 cc:=3
 pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @ 100 ms [rev1 NONE_AMS]
 state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delayed 100 ms]
 state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev1 NONE_AMS]
 Start toggling
 state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
 CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, connected]
 state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
-pending state change SRC_ATTACH_WAIT -> SRC_ATTACHED @ 200 ms [rev1 NONE_AMS]
-state change SRC_ATTACH_WAIT -> SRC_ATTACHED [delayed 200 ms]
-polarity 1
+pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
+state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
+cc:=2

So it looks like the trouble start right after the first transition to
SNK_UNATTACHED which is when this new code from this patch runs.

I'm not that deep into the TCPM state machine code, but my thinking is that
give that this patch resets both try counters during transition to either
SNK_UNATTACHED or SRC_UNATTACHED and looking at the failing log, it somehow
breaks transition to SRC_ATTACHED state, when TOGGLING.

It only always goes from SRC_ATTACH_WAIT -> SNK_TRY with this patch.
Without this patch, it goes to SRC_ATTACHED after initially trying SNK_TRY
earlier.

So only use cases where the type-c port is in power sink mode, work and
use cases with type-c port being in source mode are broken.

Unless someone has a better idea, I'd like to send a revert for this patch,
which will make partner detection work again with the docks/ hubs I have. I'd be
happy to test a better fix for the original problem, that doesn't break the
power source mode when toggling on dual power role ports.

kind regards,
	o.

> +
>  	if (!port->attached)
>  		return;
>  
> -- 
> 2.34.1
> 

