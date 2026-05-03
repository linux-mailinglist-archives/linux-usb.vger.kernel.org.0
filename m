Return-Path: <linux-usb+bounces-36852-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKweFiY+92k2dwIAu9opvQ
	(envelope-from <linux-usb+bounces-36852-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 14:23:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2AA4B5B25
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 14:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8453F3009568
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 12:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE6A3B19C9;
	Sun,  3 May 2026 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evePO99E"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4316A956;
	Sun,  3 May 2026 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810979; cv=none; b=eQEvbpLWa+1GO/1zrVVpBMiVa3qDpGZRfgyFnch37E6W6B12AslsvKDO8LAFjzdqJ6jfMAFLZe85xjW5qQcPH6m6NXAPoTSIZyWGho8fXlEy+8PECvgSccUTwn91oJlpobdziAdT1K5DpP2vL/i3stagrg2PGNO2Ba47BXx6NRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810979; c=relaxed/simple;
	bh=3t2fZVhKoGJkBso3q9G12wHZi5tsGuXL8oWG87Neuqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNj+BHb7N0QupfKngFquAPB2qw5UKGR/EeMjFkDLOlxXnR4R09itQT1el3VsGZWqLBnJnhssbi9czkzJHYTy6gWxdKfMBNyAfzNKyPKADdfEU9DLI74PAsk+jXT14GA45G8MAnCndhx2zcAFwg35r87ZLCYvQQWd87ZAcgJkroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evePO99E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5418DC2BCB4;
	Sun,  3 May 2026 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810978;
	bh=3t2fZVhKoGJkBso3q9G12wHZi5tsGuXL8oWG87Neuqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evePO99E5G3/P9ft2lQWXkiCQfxNPpki++qf7j2veTXoCfrY8FPAZ+TC7aMIIcS/P
	 lyYLugbwZDjdaLMrto3q5W0u+WTts2oTGPrkRbKfUMDkrmZvKY09ZcYP6yAUvJj6OT
	 L3pzIFIuRPi04aY5JEonUxYkQYIKAhrWfjVYt9jGtZakcC9p+2tXVebhaTeICLtPgQ
	 EyN8z2l8HN3+8d0q/ZJJwwZzDo6Ac8yYodb22pgBoMmmCXQ6PQ63wLsHkOkSQMJjLP
	 XV1SDjdK/S+bXt15QgARTKSaZd7+nwL+Zt3ha1C6XN7p0VFwebfMtWEpnrcFFyRNGb
	 wwV1dgi2PvbVg==
Date: Sun, 3 May 2026 14:22:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB
 support on Versal Gen2 platform
Message-ID: <20260503-enchanted-galago-of-relaxation-dcda7f@quoll>
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
 <20260429173050.1772377-2-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429173050.1772377-2-radhey.shyam.pandey@amd.com>
X-Rspamd-Queue-Id: BF2AA4B5B25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36852-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fe200000:email]

On Wed, Apr 29, 2026 at 11:00:47PM +0530, Radhey Shyam Pandey wrote:
>  additionalProperties: false
>  
>  examples:
> @@ -156,3 +193,30 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/power/xlnx-zynqmp-power.h>
> +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
> +    #include <dt-bindings/phy/phy.h>
> +    usb {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Please follow DTS coding style.

> +        compatible = "xlnx,versal2-mmi-dwc3";

I really doubt that DWC3 block comes without addressing space
(registers), so either you just misrepresented things, like created a
fake block and syscon, or forgot to combine DWC3 with the wrapper.

And if you built with W=1 your DTS you would see errors. How do you see
it now? Where do you place it? Wrapper must be outside of soc, but DWC3
child must be inside. Did you read submitting patches and writing
bindings documents?

> +        clocks = <&zynqmp_clk 32>, <&zynqmp_clk 34>;
> +        clock-names = "bus_clk", "ref_clk";
> +        power-domains = <&zynqmp_firmware PD_USB_0>;
> +        resets = <&zynqmp_reset ZYNQMP_RESET_USB1_CORERESET>;
> +        reset-names = "usb_crst";
> +        phys = <&psgtr 2 PHY_TYPE_USB3 0 2>;
> +        phy-names = "usb3-phy";
> +        xlnx,usb-syscon = <&udh_slcr 0x005c 0x0070 0x00c4 0x00f8>;
> +        ranges;
> +
> +        usb@fe200000 {
> +            compatible = "snps,dwc3";
> +            reg = <0xfe200000 0x40000>;
> +            interrupt-names = "host", "otg";
> +            interrupts = <0 65 4>, <0 69 4>;

Why these are not proper defines?

> +            dr_mode = "host";
> +            dma-coherent;
> +        };
> +    };
> -- 
> 2.43.0
> 

