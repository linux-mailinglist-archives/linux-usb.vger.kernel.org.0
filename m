Return-Path: <linux-usb+bounces-34269-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBebDpWPrmnVGAIAu9opvQ
	(envelope-from <linux-usb+bounces-34269-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 10:15:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92749235FAA
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 10:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81DE5303DD72
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC4C37757E;
	Mon,  9 Mar 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cVZaBhmg"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197B376BF2;
	Mon,  9 Mar 2026 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047577; cv=none; b=JbSS4RGiK+ai7j9OjoSJduxn512w2uUw9OqAUbr35u3weph0KOsjBxcdacutUkBLpEeDg4XauMe1DyZBUvlEUSwFg0rWidg4vK66oTygTlvgODn9tu3dQiWSTbRbCWULtTSqWGCF3CBuX/JkktpBNGPZ6OxJCgP272agsIiEBK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047577; c=relaxed/simple;
	bh=XU/OZsnAkXJsAREhmH0zo/e2f3R9pWNOu/At/zSzQSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPBlSCY+X2tW5prPcm2Hf4qkUkbPLGoHtV9n7KErBYCdSMHoCKQXQqc37UtgiEnmFqKjZ7a4wKED7ysG10cjE6PJJjogixBxn3pgTjnuYC4d4lnGcF0fNCLQZQqTZwnjG7nE1HCwQKtIMgoxHn/jv5Rl8oKbDTF/05P31zAwnIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cVZaBhmg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773047573;
	bh=XU/OZsnAkXJsAREhmH0zo/e2f3R9pWNOu/At/zSzQSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cVZaBhmgCJEZXkbimKfFG584G5rKotRs3MKd0Ejg91SDHArdz4fp+TqxhGWXvvGGi
	 Mn5a3f62I9ybOGiAjEmUU92MSBK1/ywM6tt/Oat3z+Ojp0tdMnqLcYgOwj30cAfVn5
	 hP0+UVMjULwU5/cfF6+6fT2hLn99ANuKNDm0qMTBnn9MRPaAFTUHP5cNmrYi5xLbki
	 bYgEr1yLrjhByTwlYAvLXKv8aWRLicyPMUVF4EFQPVcCeCxwih8zKoOVb0k8RPo4AE
	 SKPcXqlaXs2nvcyChFwtvJs/FqMyz77EsJAk4M9vfi1GIRNMTLNrgqQ0YpytRmUhew
	 8khXgb1tqisVA==
Received: from [192.168.1.39] (82-65-172-229.subs.proxad.net [82.65.172.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: aferraris)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D94EC17E01B1;
	Mon,  9 Mar 2026 10:12:52 +0100 (CET)
Message-ID: <0b3b80ac-5cc2-4c19-a8f1-b8b44992eec4@collabora.com>
Date: Mon, 9 Mar 2026 10:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: roles: get usb role switch from parent only
 for usb-b-connector
To: Xu Yang <xu.yang_2@nxp.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 dsimic@manjaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20260309074313.2809867-1-xu.yang_2@nxp.com>
 <20260309074313.2809867-3-xu.yang_2@nxp.com>
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=arnaud.ferraris@collabora.com; keydata=
 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
 L9jD4jU=
In-Reply-To: <20260309074313.2809867-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92749235FAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34269-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.925];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.ferraris@collabora.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action



Le 09/03/2026 à 08:43, Xu Yang a écrit :
> usb_role_switch_is_parent() was walking up to the parent node and checking
> for the "usb-role-switch" property regardless of the type of the passed
> fwnode. This could cause unrelated device nodes to be probed as potential
> role switch parent, leading to spurious matches and "-EPROBE_DEFER" being
> returned infinitely.
> 
> Till now only Type-B connector node will have a parent node which may
> present "usb-role-switch" property and register the role switch device.
> For Type-C connector node, its parent node will always be a Type-C chip
> device which will never register the role switch device. However, it may
> still present a non-boolean "usb-role-switch = <&usb_controller>" property
> for historical compatibility.
> 
> So restrict the helper to only operate on Type-B connector when attempting
> to get the role switch from parent node.
> 
> Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>   - new patch
> ---
>   drivers/usb/roles/class.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index b8e28ceca51e..edec139b68b5 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -139,9 +139,14 @@ static void *usb_role_switch_match(const struct fwnode_handle *fwnode, const cha
>   static struct usb_role_switch *
>   usb_role_switch_is_parent(struct fwnode_handle *fwnode)
>   {
> -	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
> +	struct fwnode_handle *parent;
>   	struct device *dev;
>   
> +	if (!fwnode_device_is_compatible(fwnode, "usb-b-connector"))
> +		return NULL;
> +
> +	parent = fwnode_get_parent(fwnode);
> +
>   	if (!fwnode_property_present(parent, "usb-role-switch")) {
>   		fwnode_handle_put(parent);
>   		return NULL;

Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>

Cheers,
Arnaud

