Return-Path: <linux-usb+bounces-38259-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JhCHmrVHWq6fAkAu9opvQ
	(envelope-from <linux-usb+bounces-38259-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 20:54:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA56244CC
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 20:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08F933028C19
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 18:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E6137C907;
	Mon,  1 Jun 2026 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="CQ+bgjee"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33036493C;
	Mon,  1 Jun 2026 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340067; cv=none; b=O/TQbopUBwjlN6wWxTfM2NAlbYf7B3ontIrf/6E/cYKga/TW2nLTg1INfTfug4GbCJIHFszBjl3831F9kyOVhbsG0kjXEacmuwyrtV9bk+GooONi0/tcyx8iEMZbRCPgxKE8CNlYVMocoYuaRH4O1UAH84luQRgDNw+d9l6FeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340067; c=relaxed/simple;
	bh=1qm4IauYcKOxgeV54rcaV2dvZAHR7JRSBL1Lm9GCCt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNM1PNbrVIVrbHcZ4qD/P+6j4RUQFZdlqryvSm14X4oYSVHCPVT+Es/RGSBKaaf1Ur91fw+hm0s8Z3c1rPy78lafJjRlzqPvwtbYAObkjyXYV+DLUm/K0zzIEJmVpT04Y7Ul5MmdyyqvrMiH4q+9lnZNmBFMngg364nqz+Ikboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=CQ+bgjee; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1780340054; x=1780944854;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=KJrJQ6GU1V3Lr6UQ0zYfkwZkFshtKWrW/CPFcTTSXAQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CQ+bgjeeQHqWhWPCH0WerrM0NeI62wlbvVuYlRwHkRvRaNvUSS7V/HfqBw4Z6y5l
	 BgmDPMoNLsRFXNzgV0o/s1ZTvYQSJ5LMMC1p2Eaq6f8ELM+cOh1S39HCqNHADdsoZ
	 XpZxnY5aOb7Ufaog5VVmXtEjuE1XVi1STA8995M3U01SCRR3xWyJHGxui+8k0GrYh
	 vMH79zarqV+KZ6UwsX9+ddbdvkzagfjlpPRl9pyNXKjjRHejBAGQZ4SVW9a6Wb6Z+
	 qcsjGGh7ixw/09/Agsg6E+vvKyMPFaIGLv0P5C5Cy+Cx8Wr2inG8e4rAbXIGKBqoE
	 wWoxppZewZR67uzukQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MS1G7-1wsZfl1D59-00SRRq; Mon, 01
 Jun 2026 20:48:50 +0200
Message-ID: <7077b8f7-f940-492c-9b52-e7d32732723f@oldschoolsolutions.biz>
Date: Mon, 1 Jun 2026 20:48:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] usb: typec: ps883x: Fix DP+USB3 configuration
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jack Pham <jack.pham@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U9wPJ3Gu278Ciibt3ItbWaKjPWiDLMRCM50zg1C/gJALzK/JRQc
 e0dhM15zjI9Yd4+uHHpjytgX7fehVtcqJugDcdLwzEbFarXDHi8P8wHRcRVbwrIqTc8ulS7
 nsy0YZCf6yhM0gGnSPKAOE2R/1+RLdQ8Gs7DOhePjJNzeywyQgUua9dLaskecDAcNLwnW0W
 yNos/BAN+ycpFGtxHPnTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UgVBEDh1dNc=;Gd+elaI/7pA5DivLkXV08PaqYI9
 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
 gFqddKOVQZldP8cJNJUUhaLPFRTQg=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38259-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: EEDA56244CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 6/1/26 15:55, Stephan Gerhold wrote:
> Commit 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()") introduc=
ed
> two regressions:
>
>   1. The CONN_STATUS_0_USB_3_1_CONNECTED bit is mistakenly written to th=
e
>      wrong configuration register (cfg1 instead of cfg0). This breaks US=
B3
>      when using USB3+DP adapters.
>
>   2. The switch-case fallthrough block is inverted: Currently,
>      TYPEC_DP_STATE_C (DP-only) inherits the USB3 configuration, while
>      TYPEC_DP_STATE_D (DP+USB3) is missing the necessary DP sink flags.
>
> Fix these by writing the USB3 bit to the correct register and swapping t=
he
> case statement order so both states get their correct bits assigned.

Hi Stephan,

thank you for the patch. I tested this on my PS8830-equipped boxes, with=
=20
hubs that do USB3+DP splitting.

- Lenovo Thinkpad T14s G6

- Snapdragon Dev Kit for Windows X1E001DE

On both negotiation works well, and DP Altmode and USB3 can be used=20
simultaneously. The exclusive cases (with/without hub) also work well.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards,

=2D-

Jens

> Cc: stable@vger.kernel.org
> Fixes: 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/usb/typec/mux/ps883x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps88=
3x.c
> index 1256252eceed..c9bf4b4c2ba1 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -118,12 +118,12 @@ static int ps883x_set(struct ps883x_retimer *retim=
er, struct typec_retimer_state
>   				CONN_STATUS_1_DP_HPD_LEVEL;
>  =20
>   			switch (state->mode)  {
> +			case TYPEC_DP_STATE_D:
> +				cfg0 |=3D CONN_STATUS_0_USB_3_1_CONNECTED;
> +				fallthrough;
>   			case TYPEC_DP_STATE_C:
>   				cfg1 |=3D CONN_STATUS_1_DP_SINK_REQUESTED |
>   					CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
> -				fallthrough;
> -			case TYPEC_DP_STATE_D:
> -				cfg1 |=3D CONN_STATUS_0_USB_3_1_CONNECTED;
>   				break;
>   			default: /* MODE_E */
>   				break;
>
> ---
> base-commit: 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef
> change-id: 20260601-ps883x-usb3dp-fixes-32c09e9bd6f6
>
> Best regards,
> --
> Stephan Gerhold <stephan.gerhold@linaro.org>
>
>

