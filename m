Return-Path: <linux-usb+bounces-8504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B788EB7C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 17:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E74C72A3814
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5578F12F585;
	Wed, 27 Mar 2024 16:42:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB28E1C06
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711557769; cv=none; b=DD51Oeu5QsaL6WTQuaH7RLhh1d6co1izwyTYvD4bY6iv20JFP47zXr46JfXkLh/fimbVE4+Z5tbR/jRVk/oQ6CIudeopBH7ZLdlFleiA24mK4U6565A9DnHwaSX+vn7qdF/CUiujU52c6A3xqiHs8Us6Xh2/YZ83vBanwGhzJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711557769; c=relaxed/simple;
	bh=esyr/376E4zJzAfRWHKNuCNcWr/vPo91L53dL4nhuKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSWxK2NttJeJqCTs/Ip5O9WW48Wa5/8pENH1EbRoG3dvtcajMKuGnpoArdalEbQuzR+kuXKkO2yTqq2IHumtlGvjzm72zUoVVI1X+wAAgSDNaAAmgtSHk/evDNuiZpgojoAwgym90S+juMkg400JM85xHG9flR0LbeUC1lEiL10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 9329414040D; Wed, 27 Mar 2024 17:42:44 +0100 (CET)
Date: Wed, 27 Mar 2024 17:42:44 +0100
From: Christian Ehrhardt <lk@c--e.de>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org, quic_prashk@quicinc.com,
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
	saranya.gopal@intel.com, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <ZgRMhB96pVgxnMq4@cae.in-ulm.de>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>


Hi,

On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> The UCSI specification mentions that when the OPM is notified by the
> PPM of an asynchronous event it should first send all the commands it
> needs to get the details of the event and only after acknowledge it by
> sending ACK_CC_CI with the Connector Change bit set, while the current
> code sends this ack immediately after scheduling all the partner_tasks.
> Move this ACK_CC_CI command to the end of all partner_tasks.
> 
> This fixes a problem with some LG Gram laptops where the PPM sometimes
> notifies the OPM with the Connector Change Indicator field set in the
> CCI after an ACK_CC_CI command is sent, causing the UCSI stack to check
> the connector status indefinitely since the EVENT_PENDING bit is already
> cleared. This causes an interrupt storm and an artificial high load on
> these platforms.
> 
> It would also be interesting to see if we could take this approach and
> implement the discussion in [1] regarding sending an ACK_CC_CI command
> that acks both the command completion and the connector change.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> 
> [1]: https://lore.kernel.org/all/20240320073927.1641788-1-lk@c--e.de/
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 0c8f3b3a99d6..b8b39e43aba8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -69,6 +69,23 @@ static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
>  	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
>  }
>  
> +static void ucsi_handle_ack_connector_change(struct ucsi_connector *con)
> +{
> +	struct ucsi *ucsi = con->ucsi;
> +	int ret;
> +
> +	if (list_empty(&con->partner_tasks)) {
> +		mutex_lock(&ucsi->ppm_lock);
> +		ret = ucsi_acknowledge_connector_change(ucsi);
> +		mutex_unlock(&ucsi->ppm_lock);
> +
> +		if (ret)
> +			dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);

What if a real async connector change event happens here? It can because
you just cleared the connector change condition. But it will be ignored
because EVENT_PENDING is still set. In practive the new event might even
be reported in the CCI along with the completion of the ACK command
above (without an additional async event).

So the PPM now thinks it reported the event to us and will not send
an async event again. But we will never check for it because we ignored
it and the UCSI will be stuck forever.

What UCSI backend (ACPI, CCG, ...) is this?

> +
> +		clear_bit(EVENT_PENDING, &ucsi->flags);
> +	}
> +}
> +
>  static int ucsi_exec_command(struct ucsi *ucsi, u64 command);

      regards  Christian


