Return-Path: <linux-usb+bounces-33791-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH1jN77doWlcwgQAu9opvQ
	(envelope-from <linux-usb+bounces-33791-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:09:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9871BBCB2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B695317D0D8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 18:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A34436921E;
	Fri, 27 Feb 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wlPFGzas"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE7E36C0CB;
	Fri, 27 Feb 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215095; cv=none; b=Psdh9Sms69mVOx9gKLe2l4Ez/F8U+1TVh7tWczvR7Tlli+sh0xkzEJ+l4eCQJZCqN+vfC9tv2W/Gc/GSlh/YDNtjePsX4IU15ul7wMPjJwpSdY8DvckkfD47MGpGesJYCkrLa7CmLLsWHlHRYL7o35cUCIHMZkpAlFvzUcwfAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215095; c=relaxed/simple;
	bh=7c6HFX4NEwk2FMm96FTQ88HHYGNIC4bFpu3jZhULeoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLJmw9VDJzLdeCgZsJqVsV07JqV+kFzgJE9mpqRES0HUgVMDb0RhNOtsRVU4DXjGjKw+i4qYZx/zBB2X6ykMTVxroZv/Da0g1LOUi6vjaHW76/Dz6Qm3XBvSRvrfIasIKaR+cFu7oAOrm4JnXnUC+DxWuevzbPchWblhcRsl2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wlPFGzas; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+cD8P2tgu0apAWqjJEf8nXuFb43/7yGEaH3yQ4zcVZs=; b=wlPFGzas5TRFXsWMzr30uerhNP
	MRX6pfwee1ZFOljpvujmJKcCZaTp5Unlq7RZNXCR2DYjbLVincwqBDjKNxHaUYNgA3ymJMPeqvDOb
	bPg9o/HJH0nTdqDnuC7pELBjLiW+rn8f9XsD1KjgG2KDft8OZmXuOWpxveKWEUXjfQf+Uifyo7tfG
	Tsytl618n+VLIFD28N5nqdjJYWEQLe6NGGaC8qlfx/WuE8cmseeJt/vvp5lTWOSrV6VtF6ZEkxpri
	zOnBUfDjLjpQseSAt4h8ueYhhGD89WEevl7DQaykRUP0KdfYP/lR951pnQ1nfZ4kjddlB50P6+3P5
	gJGe0yXg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26F-00000008sDD-0tzI;
	Fri, 27 Feb 2026 17:58:03 +0000
Message-ID: <4186c887-fec4-4677-a7b0-e48c52ac5dea@infradead.org>
Date: Fri, 27 Feb 2026 09:58:02 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: add needs_full_reinit flag
To: Xu Yang <xu.yang_2@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33791-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,synopsys.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:mid,infradead.org:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 4B9871BBCB2
X-Rspamd-Action: no action

Hi--

On 2/12/26 12:35 AM, Xu Yang wrote:
> The current design assumes that the controller remains powered when wakeup
> is enabled. However, some SoCs provide wakeup capability even when the
> controller itself is powered down, using separate dedicated wakeup logic.
> This allows additional power savings, but requires the controller to be
> fully re‑initialized after system resume.
> 
> To support these SoCs, introduce a flag needs_full_reinit for the purpose.
> And the glue layer needs to indicate if the controller needs this behavior
> by setting a same flag needs_full_reinit in dwc3_properties.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
> Changes in v4:
>  - also rename core_may_lose_power to needs_full_reinit
>  - add R-b tag
> Changes in v3:
>  - no changes
> Changes in v2:
>  - put core_may_lose_power into dwc3_properties and check it in
>    dwc3_get_software_properties()
>  - rename may_lose_power to needs_full_reinit
> ---
>  drivers/usb/dwc3/core.c | 9 +++++++--
>  drivers/usb/dwc3/core.h | 3 +++
>  drivers/usb/dwc3/glue.h | 3 +++
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index a35b3db1f9f3..67bcc8dccc89 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1119,6 +1119,8 @@ struct dwc3_glue_ops {
>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
>   * @usb2_lpm_disable: set to disable usb2 lpm for host
>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> + * @needs_full_reinit: set to indicate the core may lose power and need full
> +			initialization during system pm

The line above should begin with
 *

Please correct it so that kernel-doc doesn't complain:

WARNING: drivers/usb/dwc3/core.h:1122 bad line:                         initialization during system pm

Thanks.

>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk



