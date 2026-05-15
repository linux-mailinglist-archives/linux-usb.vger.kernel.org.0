Return-Path: <linux-usb+bounces-37466-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGu8LcjIBmrynwIAu9opvQ
	(envelope-from <linux-usb+bounces-37466-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:18:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0E54A742
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D98A23083290
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263643E4C83;
	Fri, 15 May 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCg7FA3R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F463E3D94;
	Fri, 15 May 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829350; cv=none; b=QEVlnsSHA33Ju49Nwwd8G6qn8TclijsMh82s30apW92GplluUGMn6Jfmwh8YoHjGchhzK11Xw/6W5uwJAyy1f9YZlRFIWJY+qYV8dQV7COcd1FmaBaXgsQafBQ57Ax4IaaR/aWg8oNbMjUjdby9GE9fkbXq5TAcJMPPG+2jGbeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829350; c=relaxed/simple;
	bh=XhyYTFASD5Q9vCKaLAJxpiG7N1FW7Fv0tBL2WsVBrCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9lj1gCyMBgqcfmEK+zU+pWmL2Pqq7N7LfsR3+Xu32EgklGQ3k0AibuTCEbIGi3WyKSf1vbWv7w2DiUtGQv3alVLQ67mKWoQGHiD3G/GvtUYU9hS8cNjRABprtShTLBpG8qVZr4I902GIBF36Jl7Kqubvzwh+3eecNdFRoSzO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCg7FA3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475AAC2BCB0;
	Fri, 15 May 2026 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778829349;
	bh=XhyYTFASD5Q9vCKaLAJxpiG7N1FW7Fv0tBL2WsVBrCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iCg7FA3RcQBt97aZ8oo6Iy144E9/bSFK89c5Mf1JLJ+ASTR3rvJ+5wEhm1TGyCN9w
	 I4FaBzF+XADL8ekqN1rwI5HFjeHlYyaMwcEScOQlndQKHwF9uRYMBSiZO8Hnq5Vq2F
	 31OaA4R9esdRGYLURR+mn4Dph6u1n14dGs8y3JTNznfcjUahxxNfi3/ZUqzQ/vCeK6
	 u+MD3alLPDfORacDO9DYC184QJuJ5tz3rzWNtilQoqN/O6rXx2V1WUj0Hgo7TwNM8G
	 a6uymm1oLho9mem1oGmCe2pZL2TeonKqsM3Ct5eTPPHMswffeBJU9+Cn4qvn/kIimg
	 NCRWqKU4GmuxA==
Message-ID: <f34a38e9-c6bc-4ccb-9c9b-23288e09d734@kernel.org>
Date: Fri, 15 May 2026 09:15:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] power: Add power_supply_get_battery_all() to fetch
 battery psy handles
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260515-batt-status-v1-0-fed6b7d8cea7@google.com>
 <20260515-batt-status-v1-1-fed6b7d8cea7@google.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260515-batt-status-v1-1-fed6b7d8cea7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 37C0E54A742
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37466-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

On 15-May-26 07:48, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add power_supply_get_battery_all() to allow drivers to obtain a list of
> registered battery type power supply references in the system.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  drivers/power/supply/power_supply_core.c | 122 +++++++++++++++++++++++++++++++
>  include/linux/power_supply.h             |   9 +++
>  2 files changed, 131 insertions(+)
> 
> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
> index a446d3d086fc..697645426fb1 100644
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
> @@ -482,6 +482,128 @@ struct power_supply *power_supply_get_by_name(const char *name)
>  }
>  EXPORT_SYMBOL_GPL(power_supply_get_by_name);
>  
> +static int __power_supply_get_num_battery(struct power_supply *epsy, void *data)
> +{
> +	int *count = data;
> +
> +	if (epsy->desc->type == POWER_SUPPLY_TYPE_BATTERY)
> +		(*count)++;
> +
> +	return 0;
> +}
> +
> +static int power_supply_get_num_battery(struct device *dev)
> +{
> +	int ret, count = 0;
> +
> +	ret = power_supply_for_each_psy(&count, __power_supply_get_num_battery);
> +
> +	dev_dbg(dev, "%s: count: %d ret %d\n", __func__, count, ret);
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +struct psy_get_supplies_data {
> +	int cnt;
> +	int size;
> +	struct power_supply **psys;
> +};
> +
> +static int __power_supply_populate_battery_array(struct power_supply *epsy,
> +						 void *_data)
> +{
> +	struct psy_get_supplies_data *data = _data;
> +
> +	if (epsy->desc->type == POWER_SUPPLY_TYPE_BATTERY) {
> +		if (data->size <= data->cnt)
> +			return -EOVERFLOW;
> +
> +		get_device(&epsy->dev);
> +		data->psys[data->cnt] = epsy;
> +		atomic_inc(&epsy->use_cnt);
> +		data->cnt++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int power_supply_populate_battery_array(struct device *dev, int size,
> +					       struct power_supply **batteries)
> +{
> +	int ret, i;
> +
> +	struct psy_get_supplies_data data = {
> +		.cnt = 0,
> +		.size = size,
> +		.psys = batteries,
> +	};
> +
> +	ret = power_supply_for_each_psy(&data, __power_supply_populate_battery_array);
> +
> +	dev_dbg(dev, "%s Found %d batteries with array size %d ret %d\n",
> +		__func__, data.cnt, data.size, ret);
> +
> +	if (ret < 0) {
> +		for (i = 0; i < data.cnt; i++)
> +			power_supply_put(batteries[i]);
> +		return ret;
> +	}
> +
> +	return data.cnt;
> +}
> +
> +/**
> + * power_supply_get_battery_all() - Searches for all battery type power supplies
> + *				    and returns their references.
> + * @dev: Pointer to device requesting the power supply refs.
> + * @psys: Pointer to an array of power supply refs that will be filled by this
> + *	  function.
> + *
> + * This function helps drivers get handles to all battery type power supplies.
> + * If acquiring a ref to a power supply results in error, then the search for
> + * battery type power supplies will abort and the acquired power supplies will
> + * be "put".
> + *
> + * Return: Indicates the number of battery type power supplies returned on
> + * success or the negative error code on failure.
> + *
> + * It's the responsibility of the caller to invoke power_supply_put() on the
> + * individual psy refs and free the array returned by this function using kfree().

Not a full review, just a quick remark: It seems to me that there should
be some helper function e.g. :

void power_supply_put_array(struct power_supply **psys, int count);

Which can be called with the returned array + count to do this for the caller,
rather then expecting all callers to open code this.

Regards,

Hans


> + */
> +int __must_check power_supply_get_battery_all(struct device *dev,
> +					      struct power_supply ***psys)
> +{
> +	int ret;
> +
> +	if (!psys)
> +		return -EINVAL;
> +
> +	ret = power_supply_get_num_battery(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ret) {
> +		*psys = NULL;
> +		return 0;
> +	}
> +
> +	*psys = kzalloc_objs(**psys, ret);
> +	if (!*psys)
> +		return -ENOMEM;
> +
> +	ret = power_supply_populate_battery_array(dev, ret, *psys);
> +	if (ret <= 0) {
> +		kfree(*psys);
> +		*psys = NULL;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(power_supply_get_battery_all);
> +
>  /**
>   * power_supply_put() - Drop reference obtained with power_supply_get_by_name
>   * @psy: Reference to put
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index 7a5e4c3242a0..2467530a5740 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -806,11 +806,20 @@ extern int power_supply_reg_notifier(struct notifier_block *nb);
>  extern void power_supply_unreg_notifier(struct notifier_block *nb);
>  #if IS_ENABLED(CONFIG_POWER_SUPPLY)
>  extern struct power_supply *power_supply_get_by_name(const char *name);
> +extern int __must_check power_supply_get_battery_all(struct device *dev,
> +						     struct power_supply ***psys);
>  extern void power_supply_put(struct power_supply *psy);
>  #else
>  static inline void power_supply_put(struct power_supply *psy) {}
>  static inline struct power_supply *power_supply_get_by_name(const char *name)
>  { return NULL; }
> +static inline int __must_check power_supply_get_battery_all(struct device *dev,
> +							    struct power_supply ***psys)
> +{
> +	if (psys)
> +		*psys = NULL;
> +	return 0;
> +}
>  #endif
>  extern struct power_supply *power_supply_get_by_reference(struct fwnode_handle *fwnode,
>  							  const char *property);
> 


