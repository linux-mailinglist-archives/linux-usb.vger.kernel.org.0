Return-Path: <linux-usb+bounces-2671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3CA7E4E8C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 02:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC21C1C20D8C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 01:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A32465E;
	Wed,  8 Nov 2023 01:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RaSTpYL1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB8650
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 01:25:45 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FF9195
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 17:25:44 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc411be7e5so47205ad.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Nov 2023 17:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699406744; x=1700011544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbe9YhcmLnhVSdUJeBSp7NH8qTkLcFla8GELM3iBT5U=;
        b=RaSTpYL1QDtgoUN6EJf7e8wExA2iI+FUHwycahD8/d0PkiAuULXshZjMBJRNa6jjz3
         pnUa2VjMk8pg4/qkyMmy3JqO+OQoDkV97EUgB+P2DLX3EmO8TL9oJPkk22GRM8Al4KjQ
         0j763Y0afO/r32ZfqjAbeIX2vOgwly8eWx6zgr/SfW2nzDmwilcLTLKGupIB6HKsGxfP
         IyuejfNjDO3cgRVO+vrj/W0ZfNQPoDO6clU6uZTbuDU3uH8MIbIlx9OFMQxb9+PvQg5Z
         qHT1lZ/nDSVirEib0CBs6Vzg2o6cWFIpGG6MuAHiVthNE1q4GXSZYSzS/3+K1be2TX3W
         C/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699406744; x=1700011544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbe9YhcmLnhVSdUJeBSp7NH8qTkLcFla8GELM3iBT5U=;
        b=VplcK41UERyJrMFiklZNhgGH1bnm6Gw1JNMepRqGZ+UlZ2dpAv0KDn+KDHGD45g2LG
         bDEPOlhhqSipjRB/J7YA/+UWxMQIerivxLn7sGU4vf/k+hbZsXDbtXCMISeWWoqgnzDV
         /9CYiY9UOLkik/oxfEinieKP+769QSFo+1/ZUdSRUK6Z9cZtjJTC8wgJGHJKFKg5ESO7
         m4U1Nux6mM0pdQCY3ZN1/3HDqSVo+nIV3Qc9gA7bwLqZ2K8S8AaPK8TgnJKfVYVryNTo
         xP2vR3QPkVkpRuMtugFY3z8iFoyE4wipo/xOzUYfePagC0m4kg9VCPatOjphve/IvrNe
         jfQQ==
X-Gm-Message-State: AOJu0YwvkIi4BHee8fM8aEGkeOnRU5SohDhD5bnTHhWCQKUI8ikQFh19
	UmlK0YY63yHvi3nN1KZKZKieTQ==
X-Google-Smtp-Source: AGHT+IE42iLXlgMX5gr5mmLSAoIv3BuaB0SLP21w+X4h906CeIcccKPnpmxrJYUEA/dpUY3sjAnZ5A==
X-Received: by 2002:a17:902:eb8a:b0:1cc:6078:5305 with SMTP id q10-20020a170902eb8a00b001cc60785305mr350589plg.1.1699406743841;
        Tue, 07 Nov 2023 17:25:43 -0800 (PST)
Received: from google.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b001c9d968563csm444351plr.79.2023.11.07.17.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 17:25:43 -0800 (PST)
Date: Tue, 7 Nov 2023 17:25:40 -0800
From: William McVicker <willmcvicker@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com, kyletso@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: tcpm: Fix sink caps op current check
Message-ID: <ZUrjlO7mtMFl96f1@google.com>
References: <20231101012845.2701348-1-badhri@google.com>
 <feb4297d-eaa4-40b0-824d-af2c6bdb97e3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feb4297d-eaa4-40b0-824d-af2c6bdb97e3@roeck-us.net>

On 10/31/2023, Guenter Roeck wrote:
> On 10/31/23 18:28, Badhri Jagan Sridharan wrote:
> > TCPM checks for sink caps operational current even when PD is disabled.
> > This incorrectly sets tcpm_set_charge() when PD is disabled.
> > Check for sink caps only when PD is enabled.
> > 
> > [   97.572342] Start toggling
> > [   97.578949] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> > [   99.571648] CC1: 0 -> 0, CC2: 0 -> 4 [state TOGGLING, polarity 0, connected]
> > [   99.571658] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> > [   99.571673] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> > [   99.741778] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> > [   99.789283] CC1: 0 -> 0, CC2: 4 -> 5 [state SNK_DEBOUNCED, polarity 0, connected]
> > [   99.789306] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
> > [   99.903584] VBUS on
> > [   99.903591] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AMS]
> > [   99.903600] polarity 1
> > [   99.910155] enable vbus discharge ret:0
> > [   99.910160] Requesting mux state 1, usb-role 2, orientation 2
> > [   99.946791] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> > [   99.946798] state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_AMS]
> > [   99.946800] Setting voltage/current limit 5000 mV 500 mA
> > [   99.946803] vbus=0 charge:=1
> > [  100.027139] state change SNK_DISCOVERY -> SNK_READY [rev3 NONE_AMS]
> > [  100.027145] Setting voltage/current limit 5000 mV 3000 mA
> > [  100.466830] VBUS on
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 803b1c8a0cea ("usb: typec: tcpm: not sink vbus if operational current is 0mA")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks for catching this Badhri! I verified this fixes the charging issues seen
on Pixel 6 and 7 with the mainline and v6.1 kernel. Feel free to add

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will
> 
> > ---
> > Changes since v2:
> > * Fix the "Fixes" tag
> > * Refactor code based on Guenter Roeck's suggestion.
> > 
> > Changes since v1:
> > * Fix commit title and description to address comments from Guenter Roeck
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 058d5b853b57..afc791ab6d4f 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4273,7 +4273,8 @@ static void run_state_machine(struct tcpm_port *port)
> >   				current_lim = PD_P_SNK_STDBY_MW / 5;
> >   			tcpm_set_current_limit(port, current_lim, 5000);
> >   			/* Not sink vbus if operational current is 0mA */
> > -			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
> > +			tcpm_set_charge(port, !port->pd_supported ||
> > +					pdo_max_current(port->snk_pdo[0]));
> >   			if (!port->pd_supported)
> >   				tcpm_set_state(port, SNK_READY, 0);
> > 
> > base-commit: c70793fb7632a153862ee9060e6d48131469a29c
> 

