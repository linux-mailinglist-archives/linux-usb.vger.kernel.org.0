Return-Path: <linux-usb+bounces-33093-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKqaO1o9g2kPkQMAu9opvQ
	(envelope-from <linux-usb+bounces-33093-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 13:36:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B221EE5DDE
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 13:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C3843014693
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 12:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4BB3D3D16;
	Wed,  4 Feb 2026 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="or6ep/MU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A82C21EC;
	Wed,  4 Feb 2026 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208593; cv=none; b=DlyRx3iQIvR+sdORNFh9FLNxFC36aujvmR+lKCqg/FLR6vrFqqMjaLmQmy8WEbah4KjUfAAElWrgweQlbz5CHFupVWHifvPuy8oHpe1oWfFcDZ+mB7STMoP2LinOVZw7zXjmD18UHiEksTso4HY3bYIHqUZTgIVUHd9EYEbymLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208593; c=relaxed/simple;
	bh=WlKEmANlhoeYrCXJWHvB6TEn3KZY7nVZyZZFjxfGCjA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AX0Omfc0HcSIeXVi77mGagaLCv5pt4N5N6m3fnYBMM1BQqXmTZXejo3qNyKpEfWF2TEABCWXF27gi8jkXgTwCAL94FM6dnvRkYUk3KJhJ5VII9v2i/qPS4YKXDftR4a9r337VMDq0Zd/herkBwJTxkOYpzw97xe9knalvK5tmZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=or6ep/MU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E12EC4CEF7;
	Wed,  4 Feb 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208593;
	bh=WlKEmANlhoeYrCXJWHvB6TEn3KZY7nVZyZZFjxfGCjA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=or6ep/MUEO7Rkex66GhNLO9OYipPgu06PJg7NW/33ibtdHH2m02TsTdiDhyX/l6Z5
	 wfssj/Rje5IF9rfnvmQVVuos8Tjoq1FN4NWlMRDNtdGlhN9pySdaJCYij1o71WX/VL
	 tOCqh0Q1I536ccACHHrUKCFgUELVz07w7e/A6vhnq18KJhdj8E5/3wrupaIqZ2NfU3
	 alXciDDqmylM3kHTmk8kKltFlhss3RTZPU0zJGUN9UQYgE63ThKVbA4Mege2wQR+AW
	 5LpTgEupm+VahhqVNdHaAE/NJEBFf6TxQvOL5ih70zBTa5+MLzyzo7NTtRpjD4XZ2L
	 /423lnRjms8yg==
Date: Wed, 04 Feb 2026 06:36:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Li Jun <jun.li@nxp.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Frank Li <frank.li@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org
To: Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
 <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
Message-Id: <177020859226.1501535.7850161479548058687.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,pengutronix.de,nxp.com,synopsys.com,kernel.org,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33093-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,i.mx:url]
X-Rspamd-Queue-Id: B221EE5DDE
X-Rspamd-Action: no action


On Wed, 04 Feb 2026 19:06:16 +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> the needed modifications.
> 
> Add the common compatible string "fsl,imx-dwc3" to indicate that the
> flattened module should be selected. This compatible is also used by
> "select" to inform the DeviceTree validator to apply this binding.
> 
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible.
> 
> Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> using the new combined binding.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++++++++
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
>  2 files changed, 144 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/fsl,imx-dwc3.example.dtb: /example-0/usb@4c100000: failed to match any schema with compatible: ['fsl,imx943-dwc3', 'fsl,imx-dwc3']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.example.dtb: usb@4c100000 (fsl,imx943-dwc3): compatible:0: 'fsl,imx943-dwc3' is not one of ['fsl,imx8mp-dwc3', 'fsl,imx94-dwc3', 'fsl,imx95-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


