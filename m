Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF89E28B5BC
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 15:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbgJLNPA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 09:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730431AbgJLNPA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 09:15:00 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C42DC0613D0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 06:15:00 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id h10so6005873oie.5
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n3JIyI4XrolAYQK2FWnE52kJDJziCbID4EfBID/Ook8=;
        b=XvPiTWaU0mACJ9epWfhqtXbyOO9d0R43O7jjcNEjEhqkex8VbrflqlfCnXruP/XCjl
         PDXrxnTkEz5MoZQbB7HQRUA9h3dOLiO+iR45njq/Bcp6w2OFtDjnfGrKP/y14ui+DSSc
         iQ/cUkazdM3NHTkz3FvCjM2XxjPoV8sbOzoq4Oh4iDD6WFrTPFmgzwy7GJia89ivJZVZ
         flqL97hsS6cIJymRTHrGtTiIPclrQmSYy1X3lzRngf1kpJaY5F5Y1/CEfm4KlqGRzUvl
         tc5W7xT8TNLxUu7Ovk7DxichTCnf1NXLynKWRuyUHg6ge6e0LPmX1gCnDKPcOik/+bDc
         6CCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=n3JIyI4XrolAYQK2FWnE52kJDJziCbID4EfBID/Ook8=;
        b=jrCQEygTjsrhXVGR3ZbvI7L5gT8o7kl6LUu3ZBaakOokNBXhm6SJsrXnBHNTpyLG1E
         ZnI/8/vBvcD3VAGE2roL0C9nyQFduKwx+zJULyK68exu2141RJDtLluRX8jHvYcJzDOS
         Ta2jp5QsEZ64VQ7nVV6spWALvb1dt7pyFgji8weegr72HKOf4qDdYS0NkEzN/CP1Xu4c
         oRg1FefaajIpdIUV5XrTw97aoLASjN12CzBH/a5o6xcOnWr62+AGJHKCiJn8ikxeIbPp
         NBmd+ZpFHqzXh5Da6SbZo16C/IaIWhFabtqHbNMtosXJRzwjkdoPnP2ybASTW/Sjpbcw
         O7HA==
X-Gm-Message-State: AOAM531b+aGogJItMU2hJ32ABy/SIdIy0tjYRFcj3T7iaqIdhqszaTfL
        GqOG1cEJMr4gzvDRBlIDnW8=
X-Google-Smtp-Source: ABdhPJwAoRfhi8KcuDq8C2tDI1WDC2RqLYCsPoxs2JL2afELTjw+gfjpPtdpL/xSvuJi+qlG5v5ByQ==
X-Received: by 2002:aca:db06:: with SMTP id s6mr10148976oig.64.1602508499717;
        Mon, 12 Oct 2020 06:14:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i12sm4717661oto.34.2020.10.12.06.14.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 06:14:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 12 Oct 2020 06:14:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        cy_huang@richtek.com, u0084500@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: reset hard_reset_count for any
 disconnect
Message-ID: <20201012131458.GA6394@roeck-us.net>
References: <1602500592-3817-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1602500592-3817-1-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 12, 2020 at 07:03:12PM +0800, Li Jun wrote:
> Current tcpm_detach() only reset hard_reset_count if port->attached
> is true, this may cause this counter clear is missed if the CC
> disconnect event is generated after tcpm_port_reset() is done
> by other events, e.g. VBUS off comes first before CC disconect for
> a power sink, in that case the first tcpm_detach() will only clear
> port->attached flag but leave hard_reset_count there because
> tcpm_port_is_disconnected() is still false, then later tcpm_detach()
> by CC disconnect will directly return due to port->attached is cleared,
> finally this will result tcpm will not try hard reset or error recovery
> for later attach.
> 
> ChiYuan reported this issue on his platform with below tcpm trace:
> After power sink session setup after hard reset 2 times, detach
> from the power source and then attach:
> [ 4848.046358] VBUS off
> [ 4848.046384] state change SNK_READY -> SNK_UNATTACHED
> [ 4848.050908] Setting voltage/current limit 0 mV 0 mA
> [ 4848.050936] polarity 0
> [ 4848.052593] Requesting mux state 0, usb-role 0, orientation 0
> [ 4848.053222] Start toggling
> [ 4848.086500] state change SNK_UNATTACHED -> TOGGLING
> [ 4848.089983] CC1: 0 -> 0, CC2: 3 -> 3 [state TOGGLING, polarity 0, connected]
> [ 4848.089993] state change TOGGLING -> SNK_ATTACH_WAIT
> [ 4848.090031] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @200 ms
> [ 4848.141162] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_ATTACH_WAIT, polarity 0, disconnected]
> [ 4848.141170] state change SNK_ATTACH_WAIT -> SNK_ATTACH_WAIT
> [ 4848.141184] pending state change SNK_ATTACH_WAIT -> SNK_UNATTACHED @20 ms
> [ 4848.163156] state change SNK_ATTACH_WAIT -> SNK_UNATTACHED [delayed 20 ms]
> [ 4848.163162] Start toggling
> [ 4848.216918] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
> [ 4848.216954] state change TOGGLING -> SNK_ATTACH_WAIT
> [ 4848.217080] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @200 ms
> [ 4848.231771] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_ATTACH_WAIT, polarity 0, disconnected]
> [ 4848.231800] state change SNK_ATTACH_WAIT -> SNK_ATTACH_WAIT
> [ 4848.231857] pending state change SNK_ATTACH_WAIT -> SNK_UNATTACHED @20 ms
> [ 4848.256022] state change SNK_ATTACH_WAIT -> SNK_UNATTACHED [delayed20 ms]
> [ 4848.256049] Start toggling
> [ 4848.871148] VBUS on
> [ 4848.885324] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
> [ 4848.885372] state change TOGGLING -> SNK_ATTACH_WAIT
> [ 4848.885548] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @200 ms
> [ 4849.088240] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed200 ms]
> [ 4849.088284] state change SNK_DEBOUNCED -> SNK_ATTACHED
> [ 4849.088291] polarity 1
> [ 4849.088769] Requesting mux state 1, usb-role 2, orientation 2
> [ 4849.088895] state change SNK_ATTACHED -> SNK_STARTUP
> [ 4849.088907] state change SNK_STARTUP -> SNK_DISCOVERY
> [ 4849.088915] Setting voltage/current limit 5000 mV 0 mA
> [ 4849.088927] vbus=0 charge:=1
> [ 4849.090505] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES
> [ 4849.090828] pending state change SNK_WAIT_CAPABILITIES -> SNK_READY @240 ms
> [ 4849.335878] state change SNK_WAIT_CAPABILITIES -> SNK_READY [delayed240 ms]
> 
> this patch fix this issue by clear hard_reset_count at any cases
> of cc disconnect, í.e. don't check port->attached flag.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> Reported-and-tested-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 55535c4..a6fae1f 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2890,6 +2890,9 @@ static void tcpm_reset_port(struct tcpm_port *port)
>  
>  static void tcpm_detach(struct tcpm_port *port)
>  {
> +	if (tcpm_port_is_disconnected(port))
> +		port->hard_reset_count = 0;
> +
>  	if (!port->attached)
>  		return;
>  
> @@ -2898,9 +2901,6 @@ static void tcpm_detach(struct tcpm_port *port)
>  		port->tcpc->set_bist_data(port->tcpc, false);
>  	}
>  
> -	if (tcpm_port_is_disconnected(port))
> -		port->hard_reset_count = 0;
> -
>  	tcpm_reset_port(port);
>  }
>  
> -- 
> 2.7.4
> 
