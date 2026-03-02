Return-Path: <linux-usb+bounces-33859-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKd4DblXpWlR9wUAu9opvQ
	(envelope-from <linux-usb+bounces-33859-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:26:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901C1D586E
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63D913038526
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 09:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAC638F620;
	Mon,  2 Mar 2026 09:21:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022135.outbound.protection.outlook.com [52.101.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A619E992;
	Mon,  2 Mar 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443302; cv=fail; b=C0NgH6BXSIy/ors/EYg2R4FfW94Q9DM1bt+gSEFqnTPMOGcWwuRPaNAO4LexrhcxkPuaJjsIDBc7iKXNj+qJFiIfxs5SPVSWNE3KiSqN2iYZ/6LKrBoezy4qp3bc0kczb6P/f7KxCiLhHUtkU4o/0L1uAGr7VuxZmyKAl9CfNFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443302; c=relaxed/simple;
	bh=1Z33Phu7x3CHh40xblQ7jTQS9QTU0sjq5hisA3ndeqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJr5aRwmj3rCIxsu1OMBp+V1BkoSbamq+bVz42OcFL+QNoyFsBzjv718/zDE81HyJ8GiSg5b7WsOUWoCuIIs09bJWvTP1RoCS7VrMGQBDQvvZLU5/yJgdeVunY2OmPLXtSZiEMUlbjwnNz/vImQIjFFHG/1glB6I50jRHu7gdRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rew/JxKcmqxAsvH2OAWey8ZkBey6uvdCiKVp9yIOqAmyjN/ZUhZehE+hdsodz4+aRFSG55cn+WoRArF8EaOpteMZ1Zp+AFO/Hq75byfOLvOTqF1Q1BASNL7ELkPuqlCdiDKN/XWWuAcTk8g1zW6Zm5EB+WPRdrXXIgGbK1cjOKcIcMA9zJLU9XG6VyrTl1wQAJSQlt4YdXL3GgqCMlApf3WxT9b0o9Xzas00pmHnAV1YI66vvl7X/nydjG5Ua7lO+hw5BYpL0ix/i8UUdDVXi/uDkPBaidSPSF3wkMHYoYEYqmIsmOFq5EaanMcPwFMy0yLQe+LtqUYAeyKWDOFORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUT0+/ccuLv2+gHeJELvNl11n+NhhWBnn0AP0Bf2zPA=;
 b=RndpDSTbADwe1lHpdyhpnaZ/jQVxfDwrhmeUCRvxdUz73qmdexc5qUYF1rLVQFRce8E+Q1wYfdoDIEwKnBjJFgWfBSRLVxZhSTV0ugW8cjRHIWxuTM+0v/gh+rQFAl+Krys6ZygO6FBarCgzqsjbmrOwJfpnsVHtNBtYp4wjgsca4xT/9gZT4R3Tj5Am6E8nIa3RNNzi+zndeOnk+v0rOUOLuCm3ehwcQPDJHj5Ut1xXGYIa74Nt0u9uKQRiV+PI2xWWoecRrcbW0Z7uzmSRFqgbvucHWyBUAbmHFcQ8yJSRFgaamXcSky151wA2R5zk74R3qJQarieeInMSPHrgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::36) by KL1PR0601MB5823.apcprd06.prod.outlook.com
 (2603:1096:820:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 09:21:35 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:300:2d:cafe::a3) by PS2PR01CA0024.outlook.office365.com
 (2603:1096:300:2d::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 09:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 09:21:33 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 21D3041604EA;
	Mon,  2 Mar 2026 17:21:33 +0800 (CST)
Date: Mon, 2 Mar 2026 17:21:25 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <aaVWlfMPSZgy55Cc@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|KL1PR0601MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: c37b7508-6d33-4e46-8885-08de783d192e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	VykWYn/Znw/vC54L+DtQsOUj3nOqQ/uL+7R2jB7x8NCDtdX1nvF3jGFZH0r1ZFR0yshE3LtWCsnJrEnUWdY7eToJbgo3+/9ZU3gNLB74/fnlqvOOOYxVqqpXuKO95BxUlhKr8l+wHRIDaUqX1hO6MWlRxy1y32CCLN74lfYJ7hnL6AMH+rZvzJej3djoSGKQKt9FTVsDNLxA8IGjWKg5mIWGD2eU8Nma7Q8fR0JT57Q2oPI9eG3Phq5kFOZHGTPUqR+iWyOhXGYu2cn7M62MR/Jgb4rmhxzttW620ElZdcvrBu619TLovA0A0tjgzFockgaiXoNLLWTml5noGykqo0xZiejIUakPCv9LZ8G4JiavgvoUsvVjEVo4gubpdWRwotRjEEtn+qWeJE8hwGR9Tps5Mqq2GVw/Q3PyaxohP1bQllhiU/cctDiI3LKMyiG1a+yhCjthyjIRX8TxuxBMfL1L+nVMSQQai+2DoWET2AD1O++RxKF+WStd+Hr6MxVGDBWA2t47u54Zdjx/dS0s6+OyFi/cRMNVWqtUKDunVCLu17XDdP0F8j7F5a1KfpBu4rBbkN8TzXVY/YL9q0wRYxGgR4NciR8UeAI1LheBu1OLpWNX0wbpI3PMKZanILDiiP2HIVXOQtZPhAxkLpnjubU6CIbNdJPmdNqHbGdMJjQCt82lFFeNr59BoaODeK0DpHuPbMwQpSDHPpydEM5B7zP0kLLxD00S+3VeQ717YPcLaxaINvat2DAaCjyh+VGuLlY6N0uEyLBSrzyVIz8UQbYCxTVsTHpCRwCEvApieQE=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ah6TWnoiL+0AyubhECioHp7ERkGzbvizJfFiSl88qSQ1YBTkysvIWhUwteUe+7cfiqixfrO0z7tAjwJulIWbyeo3z52fpcl9M6uZqLGqSxBiNU155RXrquYWAzZlMInG3fgh65u6rNQqv/rLk35rYmR+Lz2TSfSYiPwOE/2y5Yzs05e11JKir1u58ugbyRtimPNrrqGqISjUqnM0+WsJGg1V9gwweLBSYJ8Oi1yhws90kjO4sNwQWQeMtInHIkceIG9THwKSQ5su7UQ8CpvhCJu5m1M/E5BPdT3eHe5DQqi8GmnNxAoolZIAqWiHVNCZNy/agMVySLJi6wLcvkw9kY1VKXUKjcYvpHTslfKh6pWLn3nnq7mvv+vmKqBawxM4W+VPEZqjEXjBU+BrSkTSxFQgBwBGMr3L2sqxl42mWyuBvRlfux5enh2htXZky1IV
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:21:33.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37b7508-6d33-4e46-8885-08de783d192e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5823
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33859-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.911];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cadence.com:email]
X-Rspamd-Queue-Id: 8901C1D586E
X-Rspamd-Action: no action

On 26-03-02 08:28:07, Krzysztof Kozlowski wrote:
> 
> On Mon, Mar 02, 2026 at 11:03:34AM +0800, Peter Chen wrote:
> > Extend the Cadence USBSS DRD binding to also cover the USBSSP
> > controller by adding "cdns,usbssp" to the compatible enum.
> >
> > The USBSSP is the next-generation Cadence USB controller IP. It adds
> > SuperSpeed Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an
> > XHCI-based device controller. The register layout and resource model
> > (otg/xhci/dev memory regions; host/peripheral/otg interrupts) are
> > identical to the USBSS, so both controllers share the same binding
> > and the same platform driver (cdns3-plat.c).
> >
> > Changes to the binding:
> > - compatible: const -> enum with cdns,usb3 and cdns,usbssp
> > - maximum-speed: add super-speed-plus
> > - Add USBSSP example
> >
> > This patch was developed with assistance from Anthropic Claude Opus 4.6.
> 
> Use proper tag, but expect pushback of microslop crap.

Krzysztof, thanks for your reply.

I tried to add Assisted-by or Co-developed-by tag, neither can pass
checkpatch.pl check, it needs a valid email address. See below:

ERROR: Unrecognized email address: 'Claude (Anthropic Claude Opus 4.6)'
#45:
Assisted-by: Claude (Anthropic Claude Opus 4.6)

> 
> >
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> >  .../devicetree/bindings/usb/cdns,usb3.yaml    | 36 +++++++++++++++++--
> >  1 file changed, 33 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > index f454ddd9bbaa..f79333e7fc1f 100644
> > --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > @@ -4,14 +4,22 @@
> >  $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Cadence USBSS-DRD controller
> > +title: Cadence USBSS/USBSSP DRD controller
> >
> >  maintainers:
> >    - Pawel Laszczak <pawell@cadence.com>
> >
> > +description:
> > +  Cadence USB dual-role controllers. USBSS (cdns,usb3) supports up to
> > +  SuperSpeed (USB 3.0). USBSSP (cdns,usbssp) is the next generation with
> > +  SuperSpeed Plus (USB 3.1 gen2x1) and XHCI-based device controller. Both
> > +  share the same register layout and resource model.
> 
> So are compatible or not?
> 

Sorry for the misleading description. They are NOT fully compatible.
The register layout (OTG/XHCI/Device) and interrupts
(OTG/XHCI/Device/Wakeup) are the same, but register contents are
different, esp, the device (gadget) controllers are architecturally different:

- USBSS uses a custom gadget controller (cdns3_gadget_init)
- USBSSP uses an XHCI-based gadget controller (cdnsp_gadget_init)

I will fix the description in v2 to clearly state this difference.

> > +
> >  properties:
> >    compatible:
> > -    const: cdns,usb3
> > +    enum:
> > +      - cdns,usb3
> > +      - cdns,usbssp
> 
> Why do we need another generic compatible?
> 
> And why do you add it now to each of device schemas using this one?

Like explain above, the USBSSP has a different device/gadget controller
architecture from USBSS. The platform driver uses the compatible string
to select the correct gadget init function:

  if (device_get_match_data(dev) == &cdnsp_plat)
      cdns->gadget_init = cdnsp_gadget_init;
  else
      cdns->gadget_init = cdns3_gadget_init;

Without a distinct compatible, the driver cannot know which gadget
controller is present. This is a Cadence IP-level distinction (not
SoC-specific), so a generic compatible seems appropriate here. But
please let me know if you'd prefer a different approach.

> >
> >  examples:
> >    - |
> > +    // USBSS example (SuperSpeed)
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >      bus {
> >          #address-cells = <2>;
> > @@ -109,3 +118,24 @@ examples:
> >              dr_mode = "otg";
> >          };
> >      };
> > +  - |
> > +    // USBSSP example (SuperSpeed Plus)
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    bus {
> 
> No, drop entire example. It's the same as other.
> 

I original thought the user may copy SS binding doc to their
SSP dts file, and forget to change maximum-speed property,
so the maximum speed will be fixed at SS. If we don't need
to worry about it, I will delete at v2.

-- 

Best regards,
Peter

