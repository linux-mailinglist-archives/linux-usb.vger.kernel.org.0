Return-Path: <linux-usb+bounces-35093-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKAiLXBiu2lujQIAu9opvQ
	(envelope-from <linux-usb+bounces-35093-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 03:41:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DE52C512C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 03:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37C4330888D5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 02:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB3838756F;
	Thu, 19 Mar 2026 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6ZUK1lq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897EF2E2DF2;
	Thu, 19 Mar 2026 02:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888086; cv=none; b=o8gR6XJzL7Si5EGpNZIQngyp7NviysLZsbJS9m07h/i9uS954y+w5NNtiEFvaJlhz5ZkH0JLY7xtvCpN4t0pkK3PsOUShHIZ/pvAOuO02Jxl0Z5F9P09RkN6fYhl/7G54DaCDLpVZQukxedZooNeXfyPBjEF0Gcj5NXVutV9HTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888086; c=relaxed/simple;
	bh=0YnP0cX3MOJZgYSvb4gihkYukDmX2h84D3ADD5FXdlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgTacC36uXex15LFioRJGS/AyzG8eJLeFh9T+9JX+TSnaX5GQEAvRjVBUMXtSQ8Sk5D41QQ32u/3hl9MxfaWzPoes4ExCu5m3loJfkxOrrQRotz7MkjAJj/wqB9c6wActJqPQkOfYWuZYqm+vH84PHYNhZAHf/XrUNLQeYUFHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6ZUK1lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BB0C19421;
	Thu, 19 Mar 2026 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888086;
	bh=0YnP0cX3MOJZgYSvb4gihkYukDmX2h84D3ADD5FXdlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6ZUK1lqkr0Ua+ipa9dcLBgDnGGBlJvcoNOB5C1O8WnuVfKIeUQ+DJWDy7dohNL4L
	 rR37FEj7qh9YiJx9m27wX7qU7NcJNrOc5ZPd8sAiU2/Q6m4FVYS6ou7GVU2gEazrcR
	 5b7wlNnJHQquBjC93+eZ7LOlrYLdn8jQTK6jDKbLF3BxmcI0dB8qNgvAkFBJZ9AU8n
	 b7+31FsaSsZ7d1x0sslfDgUwF4tn08Jfq+zX+8au2oO9XlkfHHvwrCBoAbsk35mFDi
	 V53+XwVUy4XaSG404BZ5/5T7owqvGFBBJOZM9wzFD96NiAdw2kr2efZWodWNpcdowT
	 C9XFRJycPcrSg==
Date: Thu, 19 Mar 2026 10:41:24 +0800
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
Message-ID: <20260319024124-GKB489299@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
 <20260318-crock-tinderbox-ae12024627d9@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-crock-tinderbox-ae12024627d9@spud>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35093-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	NEURAL_HAM(-0.00)[-0.934];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 60DE52C512C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

On 17:21 Wed 18 Mar     , Conor Dooley wrote:
> On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> > Hi Conor,
> > 
> > On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > > Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> > > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > > > 
> > > > Explicitly reduce number of phy property to minimal one.
> > > 
> > > Is this valid for the existing compatible, will it work with only one
> > > clock?
> > > 
> > I didn't change clock binding, do you mean phy?
> > 
> > Both k1 and k3 work with one clock (no change here)
> > 
> > for phy, the existing k1 requires two. for k3, one controller requires
> > one phy due to only has USB2.0 support, other controllers requires two
> > phys - USB2, USB3 PHY
> 
> Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
> constraints for the k1, can you please add a conditional section to the
> binding to enforce 2 phys min for k1?
> 

To be explicit, the change should be applied to both K1 and K3, even in K1
use case, it's perfectly fine for designer to choose enabling USB2.0
only, and leave the comb phy to pcie contoller, so only one phy required

While revisiting the DT file, the phy related property should be moved
to board level, but this is another thing we should fix..

-- 
Yixun Lan (dlan)

