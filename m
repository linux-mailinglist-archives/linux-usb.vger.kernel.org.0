Return-Path: <linux-usb+bounces-34976-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL1KCYXLuWl/NgIAu9opvQ
	(envelope-from <linux-usb+bounces-34976-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 22:45:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB5D2B2DCD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 22:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 040AD300BC64
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 21:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BFF397688;
	Tue, 17 Mar 2026 21:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTiOJc38"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995203909B1;
	Tue, 17 Mar 2026 21:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783877; cv=none; b=F5d0m5IYnKmKmACgoiHkvX5vtldARx/9KHYDUljRyUV4o+JlGlEuCLgWpDSk0E0tjWTbz4Nn7CU/FGRc8Nars0fqGDJTbl5Sid4qZFciZVwHerxDTlMp6pPMAyfaAdJUyOg9hrhe1PHMbUKJtt95/yyzp+T4Rm+glilU1yLWgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783877; c=relaxed/simple;
	bh=YnJxAqY3yVW0rBxCTAK9ZMy9uB7s9ePxLZFBfN6k5Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk6olEJkkv7bF2PUC+EG53PuvdfJOO3SN+b/nxCl0WWU/E9HcQpcDw1Cm0IM2i1nPUhoIWiEf0Xginbp76eiiyNSRC6Cp/BN3vCNVQC+Fd+x2GTW/ljE3pdwCbeKRTT1Jgtj33tbFAIULFZORxxqmjlcKWm3A94LmvT7TBy/xXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTiOJc38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F6BC4CEF7;
	Tue, 17 Mar 2026 21:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773783877;
	bh=YnJxAqY3yVW0rBxCTAK9ZMy9uB7s9ePxLZFBfN6k5Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTiOJc38tOqLBn6rKI1YCPrqaDNI0pR0suhd/76OSH8FqwhojyJL044wxft0zFGA7
	 w+I48l+FEX6LtDsEgVFl2jI8n39BjNL59z9UROKhQOiG7OZvEJOigEYsBP2wi5hk9O
	 FmsEpuMyAgqtQpmGo2Rexj+dRBKotiX5FNyPpAJMjkFtMAw2GXApL7KCUZ6KWrHea/
	 en+WOvZRSy2Z0HiZnCp0iRwgqX9uSrgiqbfoXRncbkq+FkqQ+P6Roz4MKSke+pZXQN
	 kc6l8umBVg5mToKGRlv82fTPz3cnr9E2MpwCL4ID403lX93cBrlYJ18gAnG6zkENKE
	 LfzKPrZQwg0rw==
Date: Wed, 18 Mar 2026 05:44:35 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260317214435-GKA453922@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-shortness-gecko-72f14fbc79f2@spud>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34976-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FB5D2B2DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > 
> > Explicitly reduce number of phy property to minimal one.
> 
> Is this valid for the existing compatible, will it work with only one
> clock?
> 
I didn't change clock binding, do you mean phy?

Both k1 and k3 work with one clock (no change here)

for phy, the existing k1 requires two. for k3, one controller requires
one phy due to only has USB2.0 support, other controllers requires two
phys - USB2, USB3 PHY

> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > index 0f0b5e061ca1..cc27b363ca79 100644
> > --- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > @@ -27,7 +27,9 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-dwc3
> > +    enum:
> > +      - spacemit,k1-dwc3
> > +      - spacemit,k3-dwc3
> >  
> >    reg:
> >      maxItems: 1
> > @@ -42,11 +44,13 @@ properties:
> >      maxItems: 1
> >  
> >    phys:
> > +    minItems: 1
> >      items:
> >        - description: phandle to USB2/HS PHY
> >        - description: phandle to USB3/SS PHY
> >  
> >    phy-names:
> > +    minItems: 1
> >      items:
> >        - const: usb2-phy
> >        - const: usb3-phy
> > 
> > -- 
> > 2.53.0
> > 



-- 
Yixun Lan (dlan)

