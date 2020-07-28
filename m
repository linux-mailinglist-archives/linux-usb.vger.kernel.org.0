Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F90230AF1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 15:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729496AbgG1NG4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 09:06:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:31567 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729044AbgG1NG4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 09:06:56 -0400
IronPort-SDR: AddDt18f/oooNCX5+Fuji7WASaGYR1jfuXlBgkIuLLQSUd89sX6r5OzqTC8vtsud4xoCjKWfaU
 O1zfUsl76Lwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="131266536"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="131266536"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 06:06:55 -0700
IronPort-SDR: 1xwuiXZIewdWKXYOVWWgaUzr04hT9XE/SoYp7PqbujJUgYHz3plbRRxgpfnA7NLqN+rKBZ7Zgq
 5Qt8oaHsX+gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394324399"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 06:06:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 16:06:52 +0300
Date:   Tue, 28 Jul 2020 16:06:52 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
Message-ID: <20200728130652.GJ883641@kuha.fi.intel.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724174702.61754-4-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 07:47:00PM +0200, Hans de Goede wrote:
> Refactor tcpm_handle_vdm_request and its tcpm_pd_svdm helper function so
> that reporting the results of the vdm to the altmode-driver is separated
> out into a clear separate step inside tcpm_handle_vdm_request, instead
> of being scattered over various places inside the tcpm_pd_svdm helper.
> 
> This is a preparation patch for fixing an AB BA lock inversion between the
> tcpm code and some altmode drivers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Keep "if (adev && pdev)" checks as is instead of modifying them
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 76 ++++++++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index ee239b54bcd8..03a0c083ee9a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -159,6 +159,14 @@ enum pd_msg_request {
>  	PD_MSG_DATA_SOURCE_CAP,
>  };
>  
> +enum adev_actions {
> +	ADEV_NONE = 0,
> +	ADEV_NOTIFY_USB_AND_QUEUE_VDM,
> +	ADEV_QUEUE_VDM,
> +	ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL,
> +	ADEV_ATTENTION,
> +};
> +
>  /* Events from low level driver */
>  
>  #define TCPM_CC_EVENT		BIT(0)
> @@ -1078,10 +1086,10 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>  
>  #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>  
> -static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
> -			u32 *response)
> +static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
> +			const u32 *p, int cnt, u32 *response,
> +			enum adev_actions *adev_action)
>  {
> -	struct typec_altmode *adev;
>  	struct typec_altmode *pdev;
>  	struct pd_mode_data *modep;
>  	int rlen = 0;
> @@ -1097,9 +1105,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  
>  	modep = &port->mode_data;
>  
> -	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
> -				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
> -
>  	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>  				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>  
> @@ -1125,8 +1130,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  			break;
>  		case CMD_ATTENTION:
>  			/* Attention command does not have response */
> -			if (adev)
> -				typec_altmode_attention(adev, p[1]);
> +			*adev_action = ADEV_ATTENTION;
>  			return 0;
>  		default:
>  			break;
> @@ -1180,23 +1184,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  		case CMD_ENTER_MODE:
>  			if (adev && pdev) {
>  				typec_altmode_update_active(pdev, true);
> -
> -				if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
> -					response[0] = VDO(adev->svid, 1,
> -							  CMD_EXIT_MODE);
> -					response[0] |= VDO_OPOS(adev->mode);
> -					return 1;
> -				}
> +				*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
>  			}
>  			return 0;
>  		case CMD_EXIT_MODE:
>  			if (adev && pdev) {
>  				typec_altmode_update_active(pdev, false);
> -
>  				/* Back to USB Operation */
> -				WARN_ON(typec_altmode_notify(adev,
> -							     TYPEC_STATE_USB,
> -							     NULL));
> +				*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
> +				return 0;
>  			}
>  			break;
>  		default:
> @@ -1207,11 +1203,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  		switch (cmd) {
>  		case CMD_ENTER_MODE:
>  			/* Back to USB Operation */
> -			if (adev)
> -				WARN_ON(typec_altmode_notify(adev,
> -							     TYPEC_STATE_USB,
> -							     NULL));
> -			break;
> +			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
> +			return 0;
>  		default:
>  			break;
>  		}
> @@ -1221,15 +1214,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  	}
>  
>  	/* Informing the alternate mode drivers about everything */
> -	if (adev)
> -		typec_altmode_vdm(adev, p[0], &p[1], cnt);
> -
> +	*adev_action = ADEV_QUEUE_VDM;
>  	return rlen;
>  }
>  
>  static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  				    const __le32 *payload, int cnt)
>  {
> +	enum adev_actions adev_action = ADEV_NONE;
> +	struct typec_altmode *adev;
>  	u32 p[PD_MAX_PAYLOAD];
>  	u32 response[8] = { };
>  	int i, rlen = 0;
> @@ -1237,6 +1230,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	for (i = 0; i < cnt; i++)
>  		p[i] = le32_to_cpu(payload[i]);
>  
> +	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
> +				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
> +
>  	if (port->vdm_state == VDM_STATE_BUSY) {
>  		/* If UFP responded busy retry after timeout */
>  		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
> @@ -1251,7 +1247,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	}
>  
>  	if (PD_VDO_SVDM(p[0]))
> -		rlen = tcpm_pd_svdm(port, p, cnt, response);
> +		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
> +
> +	if (adev) {
> +		switch (adev_action) {
> +		case ADEV_NONE:
> +			break;
> +		case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
> +			WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
> +			typec_altmode_vdm(adev, p[0], &p[1], cnt);
> +			break;
> +		case ADEV_QUEUE_VDM:
> +			typec_altmode_vdm(adev, p[0], &p[1], cnt);
> +			break;
> +		case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
> +			if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
> +				response[0] = VDO(adev->svid, 1, CMD_EXIT_MODE);
> +				response[0] |= VDO_OPOS(adev->mode);
> +				rlen = 1;
> +			}
> +			break;
> +		case ADEV_ATTENTION:
> +			typec_altmode_attention(adev, p[1]);
> +			break;
> +		}
> +	}
>  
>  	if (rlen > 0)
>  		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> -- 
> 2.26.2

thanks,

-- 
heikki
