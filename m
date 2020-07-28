Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5E6230ACC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 14:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbgG1M7b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 08:59:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:34132 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728990AbgG1M7b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 08:59:31 -0400
IronPort-SDR: bLhCqAuuLQK2zIGNACmpgjis7A/JdYFDceHFEOwvI5P2K3peyFijjW3ckjO+NuQiX4D+jIjNMM
 BkO5thSJxUZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="130762073"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="130762073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 05:59:30 -0700
IronPort-SDR: LDtKmxS+RmqTsNXUXTH5IKulINkb0Qr1IRNPZBdc8U0/ZpxzK3o6Za2lm4YogFjW856vGmMmA2
 nIJ8kwTskabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394322233"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 05:59:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 15:59:27 +0300
Date:   Tue, 28 Jul 2020 15:59:27 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/6] usb: typec: tcpm: Refactor
 tcpm_handle_vdm_request payload handling
Message-ID: <20200728125927.GI883641@kuha.fi.intel.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724174702.61754-3-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 07:46:59PM +0200, Hans de Goede wrote:
> Refactor the tcpm_handle_vdm_request payload handling by doing the
> endianness conversion only once directly inside tcpm_handle_vdm_request
> itself instead of doing it multiple times inside various helper functions
> called by tcpm_handle_vdm_request.
> 
> This is a preparation patch for some further refactoring to fix an AB BA
> lock inversion between the tcpm code and some altmode drivers.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

One nit below, but nothing that would require a new version, so FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 49 ++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 862c474b3ebd..ee239b54bcd8 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -981,16 +981,15 @@ static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>  	mutex_unlock(&port->lock);
>  }
>  
> -static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
> -				  int cnt)
> +static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>  {
> -	u32 vdo = le32_to_cpu(payload[VDO_INDEX_IDH]);
> -	u32 product = le32_to_cpu(payload[VDO_INDEX_PRODUCT]);
> +	u32 vdo = p[VDO_INDEX_IDH];
> +	u32 product = p[VDO_INDEX_PRODUCT];
>  
>  	memset(&port->mode_data, 0, sizeof(port->mode_data));
>  
>  	port->partner_ident.id_header = vdo;
> -	port->partner_ident.cert_stat = le32_to_cpu(payload[VDO_INDEX_CSTAT]);
> +	port->partner_ident.cert_stat = p[VDO_INDEX_CSTAT];
>  	port->partner_ident.product = product;
>  
>  	typec_partner_set_identity(port->partner);
> @@ -1000,17 +999,15 @@ static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
>  		 PD_PRODUCT_PID(product), product & 0xffff);
>  }
>  
> -static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
> -			       int cnt)
> +static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	struct pd_mode_data *pmdata = &port->mode_data;
>  	int i;
>  
>  	for (i = 1; i < cnt; i++) {
> -		u32 p = le32_to_cpu(payload[i]);
>  		u16 svid;
>  
> -		svid = (p >> 16) & 0xffff;
> +		svid = (p[i] >> 16) & 0xffff;
>  		if (!svid)
>  			return false;
>  
> @@ -1020,7 +1017,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
>  		pmdata->svids[pmdata->nsvids++] = svid;
>  		tcpm_log(port, "SVID %d: 0x%x", pmdata->nsvids, svid);
>  
> -		svid = p & 0xffff;
> +		svid = p[i] & 0xffff;
>  		if (!svid)
>  			return false;
>  
> @@ -1036,8 +1033,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
>  	return false;
>  }
>  
> -static void svdm_consume_modes(struct tcpm_port *port, const __le32 *payload,
> -			       int cnt)
> +static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	struct pd_mode_data *pmdata = &port->mode_data;
>  	struct typec_altmode_desc *paltmode;
> @@ -1054,7 +1050,7 @@ static void svdm_consume_modes(struct tcpm_port *port, const __le32 *payload,
>  
>  		paltmode->svid = pmdata->svids[pmdata->svid_index];
>  		paltmode->mode = i;
> -		paltmode->vdo = le32_to_cpu(payload[i]);
> +		paltmode->vdo = p[i];
>  
>  		tcpm_log(port, " Alternate mode %d: SVID 0x%04x, VDO %d: 0x%08x",
>  			 pmdata->altmodes, paltmode->svid,
> @@ -1082,21 +1078,17 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>  
>  #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>  
> -static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
> +static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  			u32 *response)
>  {
>  	struct typec_altmode *adev;
>  	struct typec_altmode *pdev;
>  	struct pd_mode_data *modep;
> -	u32 p[PD_MAX_PAYLOAD];
>  	int rlen = 0;
>  	int cmd_type;
>  	int cmd;
>  	int i;
>  
> -	for (i = 0; i < cnt; i++)
> -		p[i] = le32_to_cpu(payload[i]);
> -
>  	cmd_type = PD_VDO_CMDT(p[0]);
>  	cmd = PD_VDO_CMD(p[0]);
>  
> @@ -1157,13 +1149,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>  		switch (cmd) {
>  		case CMD_DISCOVER_IDENT:
>  			/* 6.4.4.3.1 */
> -			svdm_consume_identity(port, payload, cnt);
> +			svdm_consume_identity(port, p, cnt);
>  			response[0] = VDO(USB_SID_PD, 1, CMD_DISCOVER_SVID);
>  			rlen = 1;
>  			break;
>  		case CMD_DISCOVER_SVID:
>  			/* 6.4.4.3.2 */
> -			if (svdm_consume_svids(port, payload, cnt)) {
> +			if (svdm_consume_svids(port, p, cnt)) {
>  				response[0] = VDO(USB_SID_PD, 1,
>  						  CMD_DISCOVER_SVID);
>  				rlen = 1;
> @@ -1175,7 +1167,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>  			break;
>  		case CMD_DISCOVER_MODES:
>  			/* 6.4.4.3.3 */
> -			svdm_consume_modes(port, payload, cnt);
> +			svdm_consume_modes(port, p, cnt);
>  			modep->svid_index++;
>  			if (modep->svid_index < modep->nsvids) {
>  				u16 svid = modep->svids[modep->svid_index];
> @@ -1238,15 +1230,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>  static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  				    const __le32 *payload, int cnt)
>  {
> -	int rlen = 0;
> +	u32 p[PD_MAX_PAYLOAD];
>  	u32 response[8] = { };
> -	u32 p0 = le32_to_cpu(payload[0]);
> +	int i, rlen = 0;
> +
> +	for (i = 0; i < cnt; i++)
> +		p[i] = le32_to_cpu(payload[i]);
>  
>  	if (port->vdm_state == VDM_STATE_BUSY) {
>  		/* If UFP responded busy retry after timeout */
> -		if (PD_VDO_CMDT(p0) == CMDT_RSP_BUSY) {
> +		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
>  			port->vdm_state = VDM_STATE_WAIT_RSP_BUSY;
> -			port->vdo_retry = (p0 & ~VDO_CMDT_MASK) |
> +			port->vdo_retry = (p[0] & ~VDO_CMDT_MASK) |
>  				CMDT_INIT;

You could have changed that to:

			port->vdo_retry = (p[0] & ~VDO_CMDT_MASK) | CMDT_INIT;

while at it.

>  			mod_delayed_work(port->wq, &port->vdm_state_machine,
>  					 msecs_to_jiffies(PD_T_VDM_BUSY));
> @@ -1255,8 +1250,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		port->vdm_state = VDM_STATE_DONE;
>  	}
>  
> -	if (PD_VDO_SVDM(p0))
> -		rlen = tcpm_pd_svdm(port, payload, cnt, response);
> +	if (PD_VDO_SVDM(p[0]))
> +		rlen = tcpm_pd_svdm(port, p, cnt, response);
>  
>  	if (rlen > 0)
>  		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> -- 
> 2.26.2

thanks,

-- 
heikki
