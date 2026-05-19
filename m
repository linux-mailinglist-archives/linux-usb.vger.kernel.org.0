Return-Path: <linux-usb+bounces-37662-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCNbJigXDGoZVQUAu9opvQ
	(envelope-from <linux-usb+bounces-37662-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:54:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9E57979C
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8053F300BC9A
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 07:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE473DD53F;
	Tue, 19 May 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2YPT5OS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5B2459C5;
	Tue, 19 May 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177204; cv=none; b=dnvvRMiB0AJMlxBWFVkkVaVxYxWiam5Y1G3w2XtmiCrGeVXkP2B+K/XgpZFfdfgo6x39n9qXH8GcU8J1PFY2K+0zDbXox6gH6DI6d0TjHT7i+/bLb5/WhfTmuDBHXTwlCRqRiGdhWLxOLw6uf88JrnOyRsVg1vNr7aPw38iKim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177204; c=relaxed/simple;
	bh=yXTwYb0TYewWEz8M4mWVV3N9sdfgMTYstmYNExmfTmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HG767r5sOK0AuQXF3IaQe4Eho7MIDN1B1320JfzIcAayzooPbyMsgyD9sE4fuwGIUvRknvcIblzBfg4qaUwqvuI3CNzCR5vq44t5Zd6Uw8hbBaUwh0Cfezg/1j+eqdXwerOiyzDa30VG7KWUqtER/usZbpA99tpTIb+tPA7DRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2YPT5OS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A52C2BCB3;
	Tue, 19 May 2026 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779177203;
	bh=yXTwYb0TYewWEz8M4mWVV3N9sdfgMTYstmYNExmfTmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2YPT5OSl42ULfAUVG2dDg/cESPxZx8zrv0LXhmrpZHMDQmVDzm+ugMfxbzPNixLd
	 4eU/oLuVazU2xgwYpfH7KiTlcsZP4ojXmi1f9HFN+FqaG9DQzn7C5Bs3P8V1F/CSiX
	 AFgRmaw0mW7mc+gLxzTjCtyrNUmx9M5noua7MlOEuBKyFYgluDFHE/Mj4YkBtawArO
	 4Wdf0sPZRfZ+BBW0+cDxBd0dJBuFXADz93qImHti7tIU0GLRx22CRFn+VStgcl7gdY
	 JCs0L53Ejwr7tgF5U8nTX74pfOgYBEo8m9fMGB4LNz+eu3LFdgqvkWG1nzzrB15ctA
	 ayQR3o+lEDhFg==
Date: Tue, 19 May 2026 09:53:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, gene_chen@richtek.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: richtek,rt1711h: remove
 deprecated .txt file
Message-ID: <20260519-pompous-ammonite-of-focus-05c63e@quoll>
References: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
 <20260518162014.18251-2-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518162014.18251-2-akash.sukhavasi@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37662-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: A0D9E57979C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 11:20:13AM -0500, Akash Sukhavasi wrote:
> Remove the deprecated .txt binding for richtek,rt1711h. It was
> superseded by the YAML schema added in commit a72095ed8e65
> ("dt-bindings usb: typec: rt1711h: Add binding for Richtek RT1711H").
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
>  1 file changed, 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


