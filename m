Return-Path: <linux-usb+bounces-1621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEA7C946F
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 13:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55CC6B20BCC
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 11:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A101096C;
	Sat, 14 Oct 2023 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFhM3OYh"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA49101D3
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 11:59:34 +0000 (UTC)
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FA8A9;
	Sat, 14 Oct 2023 04:59:32 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-49ad8b76003so1151532e0c.3;
        Sat, 14 Oct 2023 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697284771; x=1697889571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZlc482k/rrtYqYbzZMx2rkwqW6WN7JZHueUcH2+av8=;
        b=lFhM3OYhck0X7bRC9rHWiSvonGLxp7P8M6Yxy61fGfjCyf6VTqnabghNX10tLNAOJs
         QH5KcIa/VLUTqePIzUwVultheYFtJ8ojo7ymJ2JZPR62h+8EEgVdflCkFAmJrSKmpMcg
         clz5eHfECyULTAfi+L03wbSqTC7mxKJcJ9xiKOzcPQVlG/rupmUiciBjCjURExaXIR4N
         jFW88wlZJYlSWljSQYXNpDw6hEAZaUSppsWprbfB9UIFcaO0LfGldrg4pGxNsSxXzx9h
         6kwyrA++vD1CVTu8reHAtYwSllcOTqkBP22Vm4BhbUKSKR5V3LoiSGI0vcRM8aVsFIhm
         XguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697284771; x=1697889571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZlc482k/rrtYqYbzZMx2rkwqW6WN7JZHueUcH2+av8=;
        b=YN/Hj6C33n4tq/jjbi/0RkOOFepFviXold2RdGuiuk0qdrWE4tHAvXfuhEy3cQY281
         5CUm5CF5GjXUF2+I8RC8clebuCEEqEvIdJIxGThIEU5pey7pG5kjF4BBzuhcNvc9gAQp
         /vf6uC0BQV3E7rzGNYQwW7IUqRLjEBN4M/53EJABQ0AIqiSQLk3PashifBEkR+60Hvfx
         x1n6Nv0NBRD6Nm1nGFxKTjLtaP9Uw7v+9CDoVVvJQJa1RGOZS9mFvINmqS+I/K/pKejb
         1N2xSCFQBhNFXspBS0NnyaP+qmtszyxP9vfH35huQ1awN+LPq8WUddmPxWdiXE6QFemD
         RgVA==
X-Gm-Message-State: AOJu0Ywr6rGI3ygXGI97eClFCmbqj1mE86IvcqOWKKpFM0dqhl2JeU5Y
	sJ3xLukfh7PZaDPcwmlZGeo=
X-Google-Smtp-Source: AGHT+IFRpDpRJ4qHUzHOJR30FoxUvX1FnX7kQ21oTbc/rsFp2eIu/q0xyG7y6Tc4wsOvzFbBZdT6aQ==
X-Received: by 2002:a1f:a9c9:0:b0:49e:1eca:f847 with SMTP id s192-20020a1fa9c9000000b0049e1ecaf847mr15754459vke.15.1697284770972;
        Sat, 14 Oct 2023 04:59:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10-20020a056122062a00b004961bbadb84sm258976vkp.7.2023.10.14.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 04:59:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 14 Oct 2023 04:59:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
	kyletso@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, rdbabiera@google.com,
	amitsd@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: Check for sink pdp op current only
 for pd
Message-ID: <636e2ace-30cb-4d05-b67f-7047f6fad2a9@roeck-us.net>
References: <20231014031709.1900370-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231014031709.1900370-1-badhri@google.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 14, 2023 at 03:17:09AM +0000, Badhri Jagan Sridharan wrote:
> TCPM checks for sink caps operational current even when PD is disabled.
> This incorrectly sets tcpm_set_charge() when PD is disabled.
> Check for sink caps only when PD is disabled.
                                      ^^^^^^^^

enabled ?

> 
> [   97.572342] Start toggling
> [   97.578949] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> [   99.571648] CC1: 0 -> 0, CC2: 0 -> 4 [state TOGGLING, polarity 0, connected]
> [   99.571658] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> [   99.571673] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> [   99.741778] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> [   99.789283] CC1: 0 -> 0, CC2: 4 -> 5 [state SNK_DEBOUNCED, polarity 0, connected]
> [   99.789306] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
> [   99.903584] VBUS on
> [   99.903591] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AMS]
> [   99.903600] polarity 1
> [   99.910155] enable vbus discharge ret:0
> [   99.910160] Requesting mux state 1, usb-role 2, orientation 2
> [   99.946791] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> [   99.946798] state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_AMS]
> [   99.946800] Setting voltage/current limit 5000 mV 500 mA
> [   99.946803] vbus=0 charge:=1
> [  100.027139] state change SNK_DISCOVERY -> SNK_READY [rev3 NONE_AMS]
> [  100.027145] Setting voltage/current limit 5000 mV 3000 mA
> [  100.466830] VBUS on
> 
> Cc: stable@vger.kernel.org
> Fixes: 34fde9ec08a3 ("FROMGIT: usb: typec: tcpm: not sink vbus if operational current is 0mA")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 6e843c511b85..994493481c24 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4268,7 +4268,8 @@ static void run_state_machine(struct tcpm_port *port)
>  				current_lim = PD_P_SNK_STDBY_MW / 5;
>  			tcpm_set_current_limit(port, current_lim, 5000);
>  			/* Not sink vbus if operational current is 0mA */
> -			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
> +			tcpm_set_charge(port, port->pd_supported ?
> +					!!pdo_max_current(port->snk_pdo[0]) : true);
>  
>  			if (!port->pd_supported)
>  				tcpm_set_state(port, SNK_READY, 0);
> 
> base-commit: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
> -- 
> 2.42.0.655.g421f12c284-goog
> 

