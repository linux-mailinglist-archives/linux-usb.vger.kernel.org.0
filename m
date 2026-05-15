Return-Path: <linux-usb+bounces-37524-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFDUKeKdB2oD+wIAu9opvQ
	(envelope-from <linux-usb+bounces-37524-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 00:27:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29E558D74
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 00:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1CBF30136E1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 22:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E66D3E2AD7;
	Fri, 15 May 2026 22:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OA078xnY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE97372ECA
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883780; cv=none; b=hI4DrKLFeCon4RpgcsH+qk6x4wWYrBqLt288/mrZyx01q4h6y3en2dFiG358siHJrFkWZJ2aeXOLbgaXKKd66wTL9FqWrGmqBmy2FlPY9CN4F9SvO9oIbPPLodn1R+Zmy/1J5OVFRooByPBTdVuh44Dbsvo1exQ3XmueUAasWwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883780; c=relaxed/simple;
	bh=rDH8B+QqgndpGE3qse8f/2bDTYp/j4uHy9m1Q2rSD20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwayAkjojZOJif1z+GqoXwyPHcaKy3iRcehFX1FWP7PBfu1CarX7vN8pTMRo5UVIwMqUmC5T0q532/2Bayxr5uwnBBYdWbx3fzpnT0WdlWlmsZ8ya3RMVrNPd1EEbUdzaM5p1tOjlzR005cgh9J8Wo5dN0e6l9XVIcKaakumebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OA078xnY; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65e170f1ca5so749768d50.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778883777; x=1779488577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5m7nm9/acQjAEPOHXxWuk1T8HUQRk5NC7/L7t4zgkds=;
        b=OA078xnY3CDSdzAvwGg+bjxKcVgDkkAGpYYnYGC3D++Pqb7HvX/XHleyqM9XGCLdL0
         cBx09u9gaftVwsOOwpEjWPNlNlsi2weSQ2doV6AmnVWgLQ99DvuTaa399chxxMEiR8JV
         q3RX2Da2Tx8WJII4YLCKqGW7ezdF1iC1ssIDWriwXXVQIHybvMkhJBOV4Bja5uaUiuDY
         mVUUX+0nXGfYJMvjHfZyFPBuBzs36TM4ZW+OlbfaxhQ9JfjEd0tW8xcg2XPSUHG5Wwt6
         ACXxc8W8AM0JnThXmMsf7a/thA3oSjuAPva2iKscDlD4K964eSjnyWILPshtg62ni8ZB
         q+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883777; x=1779488577;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5m7nm9/acQjAEPOHXxWuk1T8HUQRk5NC7/L7t4zgkds=;
        b=RpFqtxAm4ImQtuoXqHiiv5MlsfY7B7/mXKmCGvpAUshLEKpXVy4PouDkhj8gVQbNOM
         p0I7Q32xRPs4ZVpWn8N71zxor2Ora5liAbyHTlyZHpGzOMnmyMQSiUwB70eNKKmkHCG/
         AwF1F+gy2JP2S/uc6wjjZ40yPm9Roh5amhGqgtkicyrlwTXYAYtUlmWGw9CVa/HZUimY
         XVw5DZtWYFFBdBH/TdGwNEho1t9RavuvdSZ0uF+czkzRzDxXbR6TEs5CpoVw3cR0w48P
         Qnl+uw9sbf13EcN/IiDLhJqgbR+9YViT+TtrciKhQb80TjP3XZxwfmGevBXOkTbLhbGl
         VniA==
X-Forwarded-Encrypted: i=1; AFNElJ8mhq5xCh1Q7NNFkd5PGMD1BixuYy9Zn8Cx3vK2lOqZANcPxXDw1Ch9Po5TQ8xe3hHcL6zcS7OMTuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznYjnmleI+x63/OA4OLU5OwzrzGv6unla8OJA7fIWftGpBcswf
	ErQlUZHMgGHtFw/AcMX8NlpLPUpFHspknTiYxaTgIgJWKbbf1o4W4CBXCA9qhomi0A==
X-Gm-Gg: Acq92OFZkdxM559bnkIU71zKzuDZ5M/N0+/ta+6kKkg9gtVpIhBlqPyAwIYZFnTHy+z
	yOV40cs+kq+6ImqMQo34GSs/GQN+w18USyRLWemo9Z/LRo3FZZkvIgGOlct3D/J7rHfOOMaD7uq
	ZdNCgqUKnGJoI6M7yDyyIv+FuxG41SwSNLD8YW+CUb/4yrY3M0kO2do3wmRaRdozNBjJ/n0mt+8
	hGqZIFR+O8dmYy3E2SwhRgLbuTRGW9M0rtldWgIhRtGrbKJ/UXEtZ89u2F/CJbfRub4uTE3Zv1E
	km/2cE+jmx1ZmfWvTc8WlHWe62CxF2HPVqqrE9NtnPcKKWXEOi/3FvPbW3OxMkbXA9asG0YVevO
	/ja2qcgUE85KWQ+ab6PMD7DBM97euYftjhQNbOyicMxbuqe7sE6xO72v96DDQITJ8cjywHuj5xz
	IMzpsmfdOFtn3wG0lLGhRIZZhyuhbEbVmOTwGKB5QtT/JEYYrE1Tf9oGaLH1ck4l5qXAqEye5Qs
	jhwZAlcxw==
X-Received: by 2002:a05:690e:4403:b0:65c:2738:c687 with SMTP id 956f58d0204a3-65e2270ef58mr4744685d50.21.1778883776819;
        Fri, 15 May 2026 15:22:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:9ee1:b971:dc61:3e74? ([2600:1700:4570:89a0:9ee1:b971:dc61:3e74])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0dbcda4bsm3144803d50.18.2026.05.15.15.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:22:56 -0700 (PDT)
Message-ID: <14fa7e1b-89e8-498f-90ea-f82586c5d6b9@google.com>
Date: Fri, 15 May 2026 15:22:54 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] power: supply: max17042: add handler for energy_now
 property
To: Hans de Goede <hansg@kernel.org>, Sebastian Reichel <sre@kernel.org>,
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
 <20260515-batt-status-v1-3-fed6b7d8cea7@google.com>
 <17f49974-1f39-4b4c-8577-da33da7f1cc4@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <17f49974-1f39-4b4c-8577-da33da7f1cc4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AB29E558D74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37524-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Hans,

Thanks for the review.

On 5/15/26 12:25 AM, Hans de Goede wrote:
> Hi,
>
> On 15-May-26 07:48, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add handler to report power_supply_prop_energy_now so that users can get
>> current SoC in uWH. Additionally, add helper functions to get avg_vcell
>> and repcap values in uv and uah units respectively to avoid code
>> duplication.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> NACK for multiple reasons:
>
> 1. We don't want to do this in all drivers which only support
> charge_now and not energy_now, instead the TCPM driver should
> convert charge_now to energy_now when necessary itself so that
> the TCPM code will work with all battery type power-supply drivers
> not just those which provide energy_now.

Got it. I will pivot and update the TCPM driver to fetch charge_now and
a voltage property (voltage_avg) from the battery power supply,
performing the energy_now calculation locally.


>
> 2. Having energy_now without energy_full is problematic and will
> confuse userspace which prefers energy_* over charge_* since
> userspace will now miss a reference value for full to report
> a charging progress percentage. I also wonder how this works
> on the TCPM side does the  Battery Status response message not
> have a full value / percentage ?

Only the present state of charge of the battery (in units of 0.1Wh) is
sent out to the port partner as part of Battery Status response message
per USB PD spec.

`energy_full` and `energy_full_design` are sent out as part of Battery
Capacity response message. I plan to send out the patches to support
Batt Caps soon.


>
> 3. IIRC userspace (upower) picks either energy_* or charge_*
> values depending on which are present. I'm not sure if having
> both will not confuse userspace. As mentioned in 2. having both
> while one of them has an incomplete set of properties is sure
> to confuse userspace.

I see.


I will drop this patch for now.


Thanks,

Amit


>
> Regards,
>
> Hans
>
>
>
>
>
>> ---
>>  drivers/power/supply/max17042_battery.c | 60 ++++++++++++++++++++++++++-------
>>  1 file changed, 47 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
>> index 167fb3fb3732..e16eb6985b70 100644
>> --- a/drivers/power/supply/max17042_battery.c
>> +++ b/drivers/power/supply/max17042_battery.c
>> @@ -81,6 +81,7 @@ static enum power_supply_property max17042_battery_props[] = {
>>  	POWER_SUPPLY_PROP_CHARGE_NOW,
>>  	POWER_SUPPLY_PROP_CHARGE_COUNTER,
>>  	POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT,
>> +	POWER_SUPPLY_PROP_ENERGY_NOW,
>>  	POWER_SUPPLY_PROP_TEMP,
>>  	POWER_SUPPLY_PROP_TEMP_ALERT_MIN,
>>  	POWER_SUPPLY_PROP_TEMP_ALERT_MAX,
>> @@ -95,6 +96,36 @@ static enum power_supply_property max17042_battery_props[] = {
>>  	POWER_SUPPLY_PROP_CURRENT_AVG,
>>  };
>>  
>> +static int max17042_get_repcap_uah(struct max17042_chip *chip, u64 *rep_cap)
>> +{
>> +	u32 data;
>> +	int ret;
>> +
>> +	ret = regmap_read(chip->regmap, MAX17042_RepCap, &data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*rep_cap = data * 5000000ll;
>> +	*rep_cap *= chip->task_period;
>> +	do_div(*rep_cap, MAX17042_DEFAULT_TASK_PERIOD);
>> +	do_div(*rep_cap, chip->pdata->r_sns);
>> +
>> +	return 0;
>> +}
>> +
>> +static int max17042_get_avgvcell_uv(struct max17042_chip *chip, u32 *vcell)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_read(chip->regmap, MAX17042_AvgVCELL, vcell);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*vcell = (*vcell * 625) / 8;
>> +
>> +	return 0;
>> +}
>> +
>>  static int max17042_get_temperature(struct max17042_chip *chip, int *temp)
>>  {
>>  	int ret;
>> @@ -180,14 +211,12 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
>>  	int temp, vavg, vbatt, ret;
>>  	u32 val;
>>  
>> -	ret = regmap_read(chip->regmap, MAX17042_AvgVCELL, &val);
>> +	ret = max17042_get_avgvcell_uv(chip, &val);
>>  	if (ret < 0)
>>  		goto health_error;
>>  
>> -	/* bits [0-3] unused */
>> -	vavg = val * 625 / 8;
>>  	/* Convert to millivolts */
>> -	vavg /= 1000;
>> +	vavg = val / 1000;
>>  
>>  	ret = regmap_read(chip->regmap, MAX17042_VCELL, &val);
>>  	if (ret < 0)
>> @@ -304,11 +333,10 @@ static int max17042_get_property(struct power_supply *psy,
>>  		val->intval = data * 625 / 8;
>>  		break;
>>  	case POWER_SUPPLY_PROP_VOLTAGE_AVG:
>> -		ret = regmap_read(map, MAX17042_AvgVCELL, &data);
>> +		ret = max17042_get_avgvcell_uv(chip, &data);
>>  		if (ret < 0)
>>  			return ret;
>> -
>> -		val->intval = data * 625 / 8;
>> +		val->intval = data;
>>  		break;
>>  	case POWER_SUPPLY_PROP_VOLTAGE_OCV:
>>  		ret = regmap_read(map, MAX17042_OCVInternal, &data);
>> @@ -350,14 +378,9 @@ static int max17042_get_property(struct power_supply *psy,
>>  		val->intval = data64;
>>  		break;
>>  	case POWER_SUPPLY_PROP_CHARGE_NOW:
>> -		ret = regmap_read(map, MAX17042_RepCap, &data);
>> +		ret = max17042_get_repcap_uah(chip, &data64);
>>  		if (ret < 0)
>>  			return ret;
>> -
>> -		data64 = data * 5000000ll;
>> -		data64 *= chip->task_period;
>> -		do_div(data64, MAX17042_DEFAULT_TASK_PERIOD);
>> -		do_div(data64, chip->pdata->r_sns);
>>  		val->intval = data64;
>>  		break;
>>  	case POWER_SUPPLY_PROP_CHARGE_COUNTER:
>> @@ -370,6 +393,17 @@ static int max17042_get_property(struct power_supply *psy,
>>  		data64 = div_s64(data64, MAX17042_DEFAULT_TASK_PERIOD);
>>  		val->intval = div_s64(data64, chip->pdata->r_sns);
>>  		break;
>> +	case POWER_SUPPLY_PROP_ENERGY_NOW:
>> +		ret = max17042_get_repcap_uah(chip, &data64);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = max17042_get_avgvcell_uv(chip, &data);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		val->intval = data64 * data / 1000000;
>> +		break;
>>  	case POWER_SUPPLY_PROP_TEMP:
>>  		ret = max17042_get_temperature(chip, &val->intval);
>>  		if (ret < 0)
>>

