Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1DB8EF73
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 17:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfHOPgt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 11:36:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:14399 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOPgt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 11:36:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 08:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; 
   d="scan'208";a="194786054"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 15 Aug 2019 08:36:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 15 Aug 2019 18:36:45 +0300
Date:   Thu, 15 Aug 2019 18:36:45 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20190815153645.GD24772@kuha.fi.intel.com>
References: <20190805182413.29362-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805182413.29362-1-ajayg@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

I'm really sorry for being so late with the review.

On Mon, Aug 05, 2019 at 11:24:13AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> CCGx controller used on NVIDIA GPU card has two separate display
> altmode for two DP pin assignments. UCSI specification doesn't
> prohibits using separate display altmode.
> 
> Current UCSI Type-C framework expects only one display altmode for
> all DP pin assignment. This patch squashes two separate display
> altmode into single altmode to support controllers with separate
> display altmode. We first read all the alternate modes of connector
> and then run through it to know if there are separate display
> altmodes. If so, it prepares a new port altmode set after squashing
> two or more separate altmodes into one.
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> ---
> Original discussion on this issue is at [1]
> 
> Change from v1->v2
> 	- Fix ucsi->ppm NULL check in ucsi_sync based on
> 	comment from an automated email from someone (I lost the email).
> 
> 1. https://marc.info/?l=linux-usb&m=154905866830998&w=2
> 
>  drivers/usb/typec/ucsi/ucsi.c | 212 ++++++++++++++++++++++++++++++++--
>  drivers/usb/typec/ucsi/ucsi.h |  12 ++
>  2 files changed, 217 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ba288b964dc8..68ea66fcaa0e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -39,11 +39,37 @@
>   */
>  #define UCSI_SWAP_TIMEOUT_MS	5000
>  
> +static void ucsi_update_get_current_cam_cmd(struct ucsi_connector *con,
> +					    struct ucsi_data *data)
> +{
> +	u8 cam, new_cam;
> +
> +	if (data->cci.data_length == 0x1) {
> +		cam = data->message_in[0];
> +		new_cam = con->port_alt[cam].linked_idx;
> +		data->message_in[0] = new_cam;
> +		con->new_port_alt[new_cam].active_idx = cam;
> +	}
> +}
> +
>  static inline int ucsi_sync(struct ucsi *ucsi)
>  {
> -	if (ucsi->ppm && ucsi->ppm->sync)
> -		return ucsi->ppm->sync(ucsi->ppm);
> -	return 0;
> +	struct ucsi_connector *con = ucsi->connector;
> +	struct ucsi_data *data;
> +	int ret = 0;
> +
> +	if (ucsi->ppm && ucsi->ppm->sync) {
> +		ret = ucsi->ppm->sync(ucsi->ppm);
> +		if (ret)
> +			return ret;
> +
> +		data = ucsi->ppm->data;
> +		if (data->ctrl.alt.cmd == UCSI_GET_CURRENT_CAM &&
> +		    con->has_multiple_dp)
> +			ucsi_update_get_current_cam_cmd(con, data);

Since you are capturing commands, then couldn't this be initially
handled in ucsi_ccg.c?

> +	}
> +
> +	return ret;
>  }
>  
>  static int ucsi_command(struct ucsi *ucsi, struct ucsi_control *ctrl)
> @@ -101,14 +127,65 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
>  	return ret;
>  }
>  
> +static void ucsi_update_set_new_cam_cmd(struct ucsi_connector *con,
> +					struct ucsi_control *ctrl)
> +{
> +	struct new_ucsi_altmode *new_port, *port;
> +	struct typec_altmode *alt = NULL;
> +	u64 cmd;
> +	u8 new_cam, cam, pin;
> +	bool enter_new_mode;
> +	int i, j, k = 0xff;
> +
> +	cmd = ctrl->raw_cmd;
> +	new_cam = (cmd >> 24) & 0xff;
> +	new_port = &con->new_port_alt[new_cam];
> +	cam = new_port->linked_idx;
> +	enter_new_mode = (cmd >> 23) & 1;
> +
> +	if (cam == UCSI_MULTI_LINKED_INDEX) {
> +		if (enter_new_mode) {
> +			port = con->port_alt;

You could have set that earlier, no?

> +			for (i = 0; con->partner_altmode[i]; i++) {
> +				alt = con->partner_altmode[i];
> +				if (alt->svid == new_port->svid)
> +					break;
> +			}

Why do you enter the next loop even if !alt?

> +			for (j = 0; port[j].svid; j++) {
> +				pin = DP_CONF_GET_PIN_ASSIGN(port[j].mid);
> +				if (alt && port[j].svid == alt->svid &&
> +				    (pin & DP_CONF_GET_PIN_ASSIGN(alt->vdo))) {
> +					/* prioritize pin E->D->C */
> +					if (k == 0xff || (k != 0xff && pin >
> +					    DP_CONF_GET_PIN_ASSIGN(port[k].mid))
> +					    ) {
> +						k = j;
> +					}
> +				}
> +			}

That is really difficult to read, let alone understand. You are making
assumption here that the alt mode is always DP alt?

> +			cam = k;
> +			new_port->active_idx = cam;
> +		} else {
> +			cam = new_port->active_idx;
> +		}
> +	}

You have a lot of nested stuff here. Please see if you can improve
the above code.

> +	cmd &= ~(0xff << 24);

I'm not sure I understand why couldn't the cmd be 0 before this point?
Actually, do you even need that variable for anything?

> +	cmd |= (cam << 24);
> +	ctrl->raw_cmd = cmd;

Couldn't you just update ctrl->raw_cmd directly?

> +}
> +
>  static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>  			    void *data, size_t size)
>  {
>  	struct ucsi_control _ctrl;
> +	struct ucsi_connector *con = ucsi->connector;
>  	u8 data_length;
>  	u16 error;
>  	int ret;
>  
> +	if (ctrl->alt.cmd == UCSI_SET_NEW_CAM && con->has_multiple_dp)
> +		ucsi_update_set_new_cam_cmd(con, ctrl);
> +
>  	ret = ucsi_command(ucsi, ctrl);
>  	if (ret)
>  		goto err;
> @@ -364,10 +441,24 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  
>  	for (i = 0; i < max_altmodes;) {
>  		memset(alt, 0, sizeof(alt));
> -		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con->num, i, 1);
> -		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
> -		if (len <= 0)
> -			return len;
> +
> +		if (recipient == UCSI_RECIPIENT_CON) {
> +			if (con->has_multiple_dp) {
> +				alt[0].svid = con->new_port_alt[i].svid;
> +				alt[0].mid = con->new_port_alt[i].mid;
> +			} else {
> +				alt[0].svid = con->port_alt[i].svid;
> +				alt[0].mid = con->port_alt[i].mid;
> +			}
> +			len = sizeof(alt[0]);
> +		} else {
> +			UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient,
> +						     con->num, i, 1);
> +			len = ucsi_run_command(con->ucsi, &ctrl, alt,
> +					       sizeof(alt));
> +			if (len <= 0)
> +				return len;
> +		}
>  
>  		/*
>  		 * This code is requesting one alt mode at a time, but some PPMs
> @@ -521,6 +612,103 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>  		ucsi_altmode_update_active(con);
>  }
>  
> +static void ucsi_update_con_altmodes(struct ucsi_connector *con)
> +{
> +	int max_altmodes = con->ucsi->cap.num_alt_modes;
> +	struct new_ucsi_altmode *alt, *new_alt;
> +	int i, j, k = 0;
> +	bool found = false;
> +
> +	alt = con->port_alt;
> +	new_alt = con->new_port_alt;
> +	memset(con->new_port_alt, 0, sizeof(con->new_port_alt));
> +
> +	for (i = 0; i < max_altmodes; i++) {
> +		if (!alt[i].svid)
> +			break;
> +
> +		/* already checked and considered */
> +		if (alt[i].checked)
> +			continue;
> +
> +		if (!DP_CONF_GET_PIN_ASSIGN(alt[i].mid)) {
> +			/* Found Non DP altmode */
> +			new_alt[k].svid = alt[i].svid;
> +			new_alt[k].mid |= alt[i].mid;
> +			new_alt[k].linked_idx = i;
> +			alt[i].linked_idx = k;
> +			k++;
> +			continue;
> +		}
> +
> +		for (j = i + 1; j < max_altmodes; j++) {
> +			if (alt[i].svid != alt[j].svid ||
> +			    !DP_CONF_GET_PIN_ASSIGN(alt[j].mid)) {
> +				continue;
> +			} else {
> +				/* Found duplicate DP mode */
> +				new_alt[k].svid = alt[i].svid;
> +				new_alt[k].mid |= alt[i].mid | alt[j].mid;
> +				new_alt[k].linked_idx = UCSI_MULTI_LINKED_INDEX;
> +				alt[i].linked_idx = k;
> +				alt[j].linked_idx = k;
> +				alt[j].checked = true;
> +				found = true;
> +			}
> +		}
> +		if (found) {
> +			con->has_multiple_dp = true;
> +		} else {
> +			/* Didn't find any duplicate DP altmode */
> +			new_alt[k].svid = alt[i].svid;
> +			new_alt[k].mid |= alt[i].mid;
> +			new_alt[k].linked_idx = i;
> +			alt[i].linked_idx = k;
> +		}
> +		k++;
> +	}
> +}
> +
> +static int ucsi_get_altmodes(struct ucsi_connector *con)
> +{
> +	int max_altmodes = con->ucsi->cap.num_alt_modes;
> +	struct ucsi_altmode alt[2];
> +	struct ucsi_control ctrl;
> +	int num = 1;
> +	int len;
> +	int j;
> +	int i;
> +	int k = 0;
> +
> +	memset(con->port_alt, 0, sizeof(con->port_alt));
> +
> +	for (i = 0; i < max_altmodes;) {
> +		memset(alt, 0, sizeof(alt));
> +		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, UCSI_RECIPIENT_CON,
> +					     con->num, i, 1);
> +		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
> +		if (len <= 0)
> +			return len;
> +
> +		/*
> +		 * This code is requesting one alt mode at a time, but some PPMs
> +		 * may still return two.
> +		 */
> +		num = len / sizeof(alt[0]);
> +		i += num;
> +
> +		for (j = 0; j < num; j++) {
> +			if (!alt[j].svid)
> +				return 0;
> +
> +			con->port_alt[k].mid = alt[j].mid;
> +			con->port_alt[k].svid = alt[j].svid;
> +			k++;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static void ucsi_connector_change(struct work_struct *work)
>  {
>  	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
> @@ -851,6 +1039,16 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	if (IS_ERR(con->port))
>  		return PTR_ERR(con->port);
>  
> +	/* Get Alternate modes */
> +	ret = ucsi_get_altmodes(con);
> +	if (ret) {
> +		dev_err(ucsi->dev,
> +			"%s: con%d failed (%d)to get port alternate modes\n",
> +			__func__, con->num, ret);
> +		return 0;
> +	}
> +	ucsi_update_con_altmodes(con);

Instead of first collecting all the connector alt modes, and then
processing them, why not just process every connector alt mode right
after getting it?

>  	/* Alternate modes */
>  	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
>  	if (ret)
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index de87d0b8319d..7bbdf83c8d4a 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -274,6 +274,15 @@ struct ucsi_connector_capability {
>  	u8:6; /* reserved */
>  } __packed;
>  
> +struct new_ucsi_altmode {
> +	u16 svid;
> +	u32 mid;
> +	u8 linked_idx;
> +	u8 active_idx;
> +#define UCSI_MULTI_LINKED_INDEX	(0xff)
> +	bool checked;
> +} __packed;

The name "new_ucsi_altmode" is a not clear to me.

Why don't you just have a pointer to struct ucsi_altmode in that
structure? I'm not sure you really need those linked_idx, active_idx
and checked members.

> +
>  struct ucsi_altmode {
>  	u16 svid;
>  	u32 mid;
> @@ -408,6 +417,7 @@ struct ucsi {
>  
>  struct ucsi_connector {
>  	int num;
> +	bool has_multiple_dp;
>  
>  	struct ucsi *ucsi;
>  	struct mutex lock; /* port lock */
> @@ -424,6 +434,8 @@ struct ucsi_connector {
>  
>  	struct ucsi_connector_status status;
>  	struct ucsi_connector_capability cap;
> +	struct new_ucsi_altmode port_alt[UCSI_MAX_ALTMODES];
> +	struct new_ucsi_altmode new_port_alt[UCSI_MAX_ALTMODES];

I'm pretty sure you don't need two of those. You should be able to
handle this with a pointer to the correct port_altmode member inside
your structure. You can also add a member to your structure that is
pointer to another structure of the same type:

        struct my_ucsi_altmode {
                u16 svid;
                u32 mid;
                struct ucsi_altmode *port_altmode;
                struct my_ucsi_altmode *companion[UCSI_MAX_ALTMODES];
        };

But I pretty sure pointer to the correct port_altmode is enough:

        struct my_ucsi_altmode {
                u16 svid;
                u32 mid;
                struct ucsi_altmode *port_altmode;
        };

>  };

I don't think there is anything preventing all this from being done in
ucsi_ccg.c initially. I don't think we need to touch ucsi.h nor ucsi.c
at all at this point.

So just collect the connector alternate modes for example into struct
ucsi_ccg instead of struct ucsi_connector, and then process the
commands that need to be handled separately in ucsi_ccg_cmd().


thanks,

-- 
heikki
