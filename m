Return-Path: <linux-usb+bounces-34772-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A8uK/yptGn+rgAAu9opvQ
	(envelope-from <linux-usb+bounces-34772-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 01:21:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FFE28AE30
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 01:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 585A3305ACBB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 00:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63328274B5C;
	Sat, 14 Mar 2026 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBD8omVy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E119CC0C;
	Sat, 14 Mar 2026 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447666; cv=none; b=cjc0mPrqaZyB1SPNqqLDgx0e3DdSzM+Ye3SsMJE3Xz7WIowE877PLvWKg6l133kb4XQ4xJxZcbMFAKVhxl/m/fVXZn/ajLyM+pRya79xva4fHipwP2+9sXL8ykYoG1jXSm0qljt8PoL6XwW76Wx4nBCShe2MeCjNaOOQV/ruOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447666; c=relaxed/simple;
	bh=lDVm6BdGlnpwJG5TJL78+5HauKD1j66z/nxi24bhn/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRPG1KuMP9x7hjRSG6JHV9BmHAsiWw1LtziFEwEXLSviPqQxoKHjMBD/mphXXKGrucLPvvWHXpucSirIuQFgNLx3e2tESegsCToHe0Rzvi6wrZHPR2vfY4fd/gN7HjsY1fjKIMQVBZpS/CTSYnaUyF3Wd9QnIQBtQ8jOMj4SVmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBD8omVy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26440C19421;
	Sat, 14 Mar 2026 00:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773447665;
	bh=lDVm6BdGlnpwJG5TJL78+5HauKD1j66z/nxi24bhn/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBD8omVyZwVe6eWWZ2smI/WqOLcJwPixa6dhNwF8ualDBiooB0y+fscgzP7fi1ZH9
	 EPqXFETIMQEU7p/QF1EoIVLd2iu30P/wbgB0LYxFQN3+QPDGqkudq3O5yiM3IDeC5X
	 XvxBjT/e06Wk/I6KlolCh8vLTOX3yjskAan5ZMzvwhK+mgwNnQQrBNZ5fQuhJ10auj
	 ijUHL9HPHlr6R5eLmi/aGTRxBk3TczceDJBmiQKhQ1TA6wNA1alzShRNgVgg9Aw2x3
	 rBEL80W/nzSebe1op3UgdLVkOz3CD344sqn8skWSZriOIohQAdnwbZF417nI65OfWH
	 J0BePkmYe4ruA==
Date: Fri, 13 Mar 2026 19:21:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Li Jun <jun.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpios property
Message-ID: <177344766351.3720394.7574014035146712126.robh@kernel.org>
References: <20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com>
 <20260312-support-setting-orientation-use-gpio-v2-1-59c523a09f12@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-support-setting-orientation-use-gpio-v2-1-59c523a09f12@nxp.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34772-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45FFE28AE30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 16:07:24 +0800, Xu Yang wrote:
> The Type-C chip know the cable orientation and then normally will set the
> switch channel to correctly configure the data path. Some chips itself
> support to output the control signal by indicating the capability in
> bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
> CONFIG_STANDARD_OUTPUT register. For PTN5110 which doesn't present this
> capability currently there is no way to achieve the orientation setting.
> Add an optional "orientation-gpios" property to achieve the same purpose.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - use property name "orientation-gpios"
>  - remove the "if" condition and modify commit message
> ---
>  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


