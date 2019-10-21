Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9849DEDAF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 15:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbfJUNfT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 09:35:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:1141 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfJUNfT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 09:35:19 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 06:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209445236"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 06:35:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Oct 2019 16:35:14 +0300
Date:   Mon, 21 Oct 2019 16:35:14 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 11/18] usb: typec: ucsi: Simplified registration and I/O
 API
Message-ID: <20191021133514.GB28049@kuha.fi.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <20191021112524.79550-12-heikki.krogerus@linux.intel.com>
 <4100b405-d3d9-25aa-0888-24d94053876c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4100b405-d3d9-25aa-0888-24d94053876c@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 21, 2019 at 06:17:30AM -0700, Guenter Roeck wrote:
> On 10/21/19 4:25 AM, Heikki Krogerus wrote:
> > Adding more simplified API for interface registration and
> > read and write operations.
> > 
> > The registration is split into separate creation and
> > registration phases. That allows the drivers to properly
> > initialize the interface before registering it if necessary.
> > 
> > The read and write operations are supplied in a completely
> > separate struct ucsi_operations that is passed to the
> > ucsi_register() function during registration. The new read
> > and write operations will work more traditionally so that
> > the read callback function reads a requested amount of data
> > from an offset, and the write callback functions write the
> > given data to the offset. The drivers will have to support
> > both non-blocking writing and blocking writing. In blocking
> > writing the driver itself is responsible of waiting for the
> > completion event.
> > 
> > The new API makes it possible for the drivers to perform
> > tasks also independently of the core ucsi.c, and that should
> > allow for example quirks to be handled completely in the
> > drivers without the need to touch ucsi.c.
> > 
> > The old API is kept until all drivers have been converted to
> > the new API.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >   drivers/usb/typec/ucsi/ucsi.c | 326 +++++++++++++++++++++++++++++++---
> >   drivers/usb/typec/ucsi/ucsi.h |  58 ++++++
> >   2 files changed, 355 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index edd722fb88b8..75f0a5df6a7f 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -98,6 +98,98 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
> >   	return ret;
> >   }
> > +static int ucsi_acknowledge_command(struct ucsi *ucsi)
> > +{
> > +	u64 ctrl;
> > +
> > +	ctrl = UCSI_ACK_CC_CI;
> > +	ctrl |= UCSI_ACK_COMMAND_COMPLETE;
> > +
> > +	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
> > +}
> > +
> > +static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
> > +{
> > +	u64 ctrl;
> > +
> > +	ctrl = UCSI_ACK_CC_CI;
> > +	ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
> > +
> > +	return ucsi->ops->async_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
> > +}
> > +
> > +static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
> > +
> > +static int ucsi_read_error(struct ucsi *ucsi)
> > +{
> > +	u16 error;
> > +	int ret;
> > +
> > +	/* Acknowlege the command that failed */
> > +	ret = ucsi_acknowledge_command(ucsi);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, &error, sizeof(error));
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch (error) {
> > +	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
> > +		return -EOPNOTSUPP;
> > +	case UCSI_ERROR_CC_COMMUNICATION_ERR:
> > +		return -ECOMM;
> > +	case UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL:
> > +		return -EPROTO;
> > +	case UCSI_ERROR_DEAD_BATTERY:
> > +		dev_warn(ucsi->dev, "Dead battery condition!\n");
> > +		return -EPERM;
> > +	/* The following mean a bug in this driver */
> > +	case UCSI_ERROR_INVALID_CON_NUM:
> > +	case UCSI_ERROR_UNREGONIZED_CMD:
> > +	case UCSI_ERROR_INVALID_CMD_ARGUMENT:
> > +		dev_err(ucsi->dev, "possible UCSI driver bug (0x%x)\n", error);
> > +		return -EINVAL;
> > +	default:
> > +		dev_err(ucsi->dev, "%s: error without status\n", __func__);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
> > +{
> > +	u32 cci;
> > +	int ret;
> > +
> > +	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (cci & UCSI_CCI_BUSY)
> > +		return -EBUSY;
> > +
> > +	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
> > +		return -EIO;
> > +
> > +	if (cci & UCSI_CCI_NOT_SUPPORTED)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (cci & UCSI_CCI_ERROR)
> > +		return ucsi_read_error(ucsi);
> 
> I am a bit concerned that this may result in an endless recursion. Would it
> be possible to avoid that ?

We can check is the command is UCSI_GET_ERROR_STATUS, and only call
ucsi_read_error if it isn't.

> > +
> > +	return UCSI_CCI_LENGTH(cci);
> > +}
> > +
> >   static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
> >   			    void *data, size_t size)
> >   {
> > @@ -106,6 +198,26 @@ static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
> >   	u16 error;
> >   	int ret;
> > +	if (ucsi->ops) {
> > +		ret = ucsi_exec_command(ucsi, ctrl->raw_cmd);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		data_length = ret;
> > +
> > +		if (data) {
> > +			ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data, size);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +
> > +		ret = ucsi_acknowledge_command(ucsi);
> > +		if (ret)
> > +			return ret;
> > +
> > +		return data_length;
> > +	}
> > +
> >   	ret = ucsi_command(ucsi, ctrl);
> >   	if (ret)
> >   		goto err;
> > @@ -518,7 +630,7 @@ static void ucsi_partner_change(struct ucsi_connector *con)
> >   		ucsi_altmode_update_active(con);
> >   }
> > -static void ucsi_connector_change(struct work_struct *work)
> > +static void ucsi_handle_connector_change(struct work_struct *work)
> >   {
> >   	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
> >   						  work);
> > @@ -580,7 +692,10 @@ static void ucsi_connector_change(struct work_struct *work)
> >   	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
> >   		ucsi_partner_change(con);
> > -	ret = ucsi_ack(ucsi, UCSI_ACK_EVENT);
> > +	if (ucsi->ops)
> > +		ret = ucsi_acknowledge_connector_change(ucsi);
> > +	else
> > +		ret = ucsi_ack(ucsi, UCSI_ACK_EVENT);
> >   	if (ret)
> >   		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
> > @@ -591,6 +706,20 @@ static void ucsi_connector_change(struct work_struct *work)
> >   	mutex_unlock(&con->lock);
> >   }
> > +/**
> > + * ucsi_connector_change - Process Connector Change Event
> > + * @ucsi: UCSI Interface
> > + * @num: Connector number
> > + */
> > +void ucsi_connector_change(struct ucsi *ucsi, u8 num)
> > +{
> > +	struct ucsi_connector *con = &ucsi->connector[num - 1];
> > +
> > +	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
> > +		schedule_work(&con->work);
> > +}
> > +EXPORT_SYMBOL_GPL(ucsi_connector_change);
> > +
> >   /**
> >    * ucsi_notify - PPM notification handler
> >    * @ucsi: Source UCSI Interface for the notifications
> > @@ -647,6 +776,39 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
> >   	unsigned long tmo;
> >   	int ret;
> > +	if (ucsi->ops) {
> > +		u64 command = UCSI_PPM_RESET;
> > +		u32 cci;
> > +
> > +		ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
> > +					     sizeof(command));
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
> > +
> > +		do {
> > +			if (time_is_before_jiffies(tmo))
> > +				return -ETIMEDOUT;
> > +
> > +			ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> > +			if (ret)
> > +				return ret;
> > +
> > +			if (cci & ~UCSI_CCI_RESET_COMPLETE) {
> 
> This repeats the reset command if any bit but UCSI_CCI_RESET_COMPLETE
> is set. The old code has a comment here; it might be worthwhile to
> add thesame comment here.

OK. I'll leave the comment.

thanks,

-- 
heikki
