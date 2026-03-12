Return-Path: <linux-usb+bounces-34668-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMr3Fv6Psml5NgAAu9opvQ
	(envelope-from <linux-usb+bounces-34668-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:05:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD6270024
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DEA83043770
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10A93BE62F;
	Thu, 12 Mar 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpQmvkcs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBBF3845DF
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309888; cv=none; b=vGX7s9LV/CVGumkaZOBZkUCze5NTTkTqeGYG3mJxce/P92xa9pUbb9h+NSdB2VTz8pIyWe2Pu5wiaZgh6tPPHbu/mxAO49dSmoxV6KVjVyJGLkff02IkmttiUaLsujHkH5vlopv0gbEOVlPA47sa/s2s1Dm983Gfzsfzo/YV5zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309888; c=relaxed/simple;
	bh=cNHwcyvjlqOn/sSK9BepZUE0uOreTt3cfgNnXEYhuwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUwGkEqT8SKvUvihRclmM/qcyx7RabVRnqYm9DlEKeTSsY3rLlbOT9Wtuy03/zpsvjc3fQhAEtybNnMuA8LabYMZ/jH0sVGmhoTg0wPPza5AHH2S2Js60CKakSkC/Ya4Q/U7CC8gsx5oOlmVyGzya32J6+phGkk/vHImUIje6SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpQmvkcs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-660dcafc85aso1414547a12.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773309878; x=1773914678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+szYmIVQmnY3WCiXmubWFb8BEwrcKI82m+hDxFjwnOQ=;
        b=mpQmvkcsfWFSRVNp8jk32zicic75KC8/YK6azrgab+NAghob2HnuDNT1hwQRzATAgz
         UglhlVmkrtdGr5tVeHGfz3uG1nYwukjTmhhhoS1FUIbttCH4hyBj2mfKVy4nt542JYBE
         nm7iBxMabr/HTvMcgUxCmvBhzCoom9JpnkeexNoRKk//G5UY62CHKprob7jwQfk8iQ1K
         qvit+mXI04XbdEn7dInFfe+lRJpehfkPAj4xAMo4/3ckrG2ElzNaWqE4mof8AXexzPCa
         u9L0TwLFYeCAsfZS1f6HQhnKOIpK7hF2DPUGIjPFlKN4hyuWQ1RdB+z/Q02pseTnFIMS
         ER6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309878; x=1773914678;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+szYmIVQmnY3WCiXmubWFb8BEwrcKI82m+hDxFjwnOQ=;
        b=j81TnnTgpN4pQ4UKvuFc0CVs0iTKGtK1RcJFFW2aedRcb9HIsnGU6zPYKhciYEadf1
         lYH4JQZMkS7YKnWWA3rQ0pXVaHzKhx+ztCsF/JrS/pUfkrTGZk48LdR2SavxsRRHbiHj
         mA7Y1IO+/k5tWpWhqBUPpMRCX/9gDiP9qcNgOkaKoRp3ME3pgaCprwW0Sy4QHo4K0FJc
         HO8jCyPzdJU8+zij3GKpRt8OqhrCEf5HlcUnMSeoi+P3UZeyhXSuh/N25mivwtKOW2NH
         Ffw5O8HQ4UmRTTEbJ6yJmpgX3L5nYLvxqW5sRAAEm/XEfItXFaBi4c8D3jSE63wuPtSI
         awjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhKTdMV8M2DrXoO52jjnmkfMq0JXMoIC+wcMYyZuKC52BsJQWmWSFCDVjcMMo+GMe5bNhaS4XmPi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySTl/DhTHw5cr81d/udz/vokRvBkAmYlp/scmW2pR4RoTYkLJG
	4ObUHWnvIwgxWm/sioJf6VIVypeK5rEZ0QupC19dnkx1T6APvOrEtf4yLbCcKeCY8R4=
X-Gm-Gg: ATEYQzxyWoCCjctjClEHSsmfqoSagt5KsuqodUy+H+8TXyEmQCKKMyMAln0q/WULQ9A
	tLL1loZVbLLUe4QfjUTr5drD8vdFk0AWglJPIYPDTQzmvk9vvC7luFFjhRjlzB9gjYY9+mlmrxs
	AQo9HFD+yC+SAlY/m1HXuXeeQfWNsRWkng2FSou6MxAw3VE9GmyqeOWjfpSDgdcQgw6ePMY/UfC
	g6UWfRRK2LxQFP8DmdwPGJ4swR21x6J0VfgfkYTRbyAp1undpvCjiB26SQyGvdewOPitoebKpyd
	V3WCZF8SAKIJpnf1pfu7T+AvrTJYCmFwq+oyahlXFQstNTc5rFV0id11EXzjvb8cPTNiUo/Xi4z
	TzyILUP6EgyJmtIJ28vpRv7J8vTbd/XXY9gnTuye8rbnML7b2w0rrKyVEKAmonG98vpRjNIT5xw
	+lbHn7L/TsW6rw8OzvNnq40pyy69OJRSAhlvVA7ZrMRUIZ
X-Received: by 2002:a05:6402:4445:b0:663:9739:6279 with SMTP id 4fb4d7f45d1cf-663973967f3mr240730a12.10.1773309877960;
        Thu, 12 Mar 2026 03:04:37 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fdc8932sm427254a12.14.2026.03.12.03.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 03:04:37 -0700 (PDT)
Message-ID: <11a4c0e8-de4e-4c11-862b-0c58cad969f6@linaro.org>
Date: Thu, 12 Mar 2026 10:04:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
To: Alexander Koskovich <akoskovich@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34668-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:email]
X-Rspamd-Queue-Id: 06BD6270024
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 06:16, Alexander Koskovich wrote:
> This is required for devices (e.g. ASUS ROG Phone 3) where more than
> one USB port can act as a sink and both share a single USBIN input on
> the PMIC.
> 
> Because the PM8150B uses USBIN to determine VBUS presence, a charger
> connected to one port causes the PMIC to falsely detect VBUS on the
> other port, preventing it from entering source mode.
> 
> For example, plugging a charger into one port prevents using the other
> port for a flash drive.
> 
> Fix this by adding support for the vbus-gpios connector binding so the
> driver can use an external GPIO for per-port VBUS presence detection
> instead of the shared USBIN register.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v2:
> - Dropped RFC prefix
> - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
> - Updated cover to better describe scenario where this change is relevant
> - Update comment for EN_TRY_SRC to make more sense
> - Skip vSafe5V poll too not just vSafe0V
> - return gpiod_get_value_cansleep (Konrad)
> - regmap_update_bits -> regmap_set_bits (Konrad)
> - Get vbus-gpios per connector (Konrad)
> - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
> - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa46991..a8f6687a3522 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mod_devicetable.h>
> @@ -176,6 +177,8 @@ struct pmic_typec_port {
>   	bool				vbus_enabled;
>   	struct mutex			vbus_lock;		/* VBUS state serialization */
>   
> +	struct gpio_desc		*vbus_detect_gpio;
> +
>   	int				cc;
>   	bool				debouncing_cc;
>   	struct delayed_work		cc_debounce_dwork;
> @@ -279,6 +282,9 @@ static int qcom_pmic_typec_port_vbus_detect(struct pmic_typec_port *pmic_typec_p
>   	unsigned int misc;
>   	int ret;
>   
> +	if (pmic_typec_port->vbus_detect_gpio)
> +		return gpiod_get_value_cansleep(pmic_typec_port->vbus_detect_gpio);
> +
>   	ret = regmap_read(pmic_typec_port->regmap,
>   			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
>   			  &misc);
> @@ -310,6 +316,13 @@ static int qcom_pmic_typec_port_vbus_toggle(struct pmic_typec_port *pmic_typec_p
>   		val = TYPEC_SM_VBUS_VSAFE0V;
>   	}
>   
> +	/*
> +	 * On devices with multiple ports sharing USBIN, VBUS from another
> +	 * port makes the USBIN-based vsafe polls unreliable.
> +	 */
> +	if (pmic_typec_port->vbus_detect_gpio)
> +		return 0;
> +
>   	/* Poll waiting for transition to required vSafe5V or vSafe0V */
>   	ret = regmap_read_poll_timeout(pmic_typec_port->regmap,
>   				       pmic_typec_port->base + TYPEC_SM_STATUS_REG,
> @@ -589,7 +602,15 @@ static int qcom_pmic_typec_port_start_toggling(struct tcpc_dev *tcpc,
>   		mode = EN_SNK_ONLY;
>   		break;
>   	case TYPEC_PORT_DRP:
> -		mode = EN_TRY_SNK;
> +		/*
> +		 * With VBUS present on USBIN from another port, EN_TRY_SNK
> +		 * keeps the port in sink mode. Use EN_TRY_SRC so the port
> +		 * tries to source first.
> +		 */
> +		if (pmic_typec_port->vbus_detect_gpio)
> +			mode = EN_TRY_SRC;
> +		else
> +			mode = EN_TRY_SNK;
>   		break;
>   	}
>   
> @@ -677,6 +698,19 @@ static int qcom_pmic_typec_port_start(struct pmic_typec *tcpm,
>   	if (ret)
>   		goto done;
>   
> +	/*
> +	 * On devices with multiple USB-C ports sharing USBIN, bypass
> +	 * VSAFE0V so SRC attachment can complete despite VBUS being
> +	 * present on USBIN from another port.
> +	 */
> +	if (pmic_typec_port->vbus_detect_gpio) {
> +		ret = regmap_set_bits(pmic_typec_port->regmap,
> +				     pmic_typec_port->base + TYPEC_EXIT_STATE_CFG_REG,
> +				     BYPASS_VSAFE0V_DURING_ROLE_SWAP);

off-by-one

once fixed:
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

