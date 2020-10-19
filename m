Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F162928A9
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgJSN4l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 09:56:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:58918 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728344AbgJSN4k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 09:56:40 -0400
IronPort-SDR: LeuIfm9izajAu7mXQ8RT7uewe66gVTI1oVLnFmLte+FXCJaLc3PiVngA7ac9wk6M1Ynh0Yhlii
 Y20e9SFDqOiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="164417592"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="164417592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 06:56:40 -0700
IronPort-SDR: o5hNjvW8dbMA3UFNLnruyOLOCht/WOWpY7pExSeWoZYgHtmB1HJniHuQj/movLP4l0rjnSb2Lc
 23w68452IKyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="422188080"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 Oct 2020 06:56:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 19 Oct 2020 16:56:37 +0300
Date:   Mon, 19 Oct 2020 16:56:37 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        cy_huang@richtek.com, u0084500@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: reset hard_reset_count for any
 disconnect
Message-ID: <20201019135637.GK1667571@kuha.fi.intel.com>
References: <1602500592-3817-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1602500592-3817-1-git-send-email-jun.li@nxp.com>
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

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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

thanks,

-- 
heikki
