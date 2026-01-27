Return-Path: <linux-usb+bounces-32784-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI/wDLeLeGmqqwEAu9opvQ
	(envelope-from <linux-usb+bounces-32784-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:56:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FE922CE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 640F530091FB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59ED4335096;
	Tue, 27 Jan 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWflfMeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AE278E63
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507398; cv=none; b=mHmwlz/ikHj8jf1qK96utVMk6Ue4uBEYH9PMLxef/zbkpIbc3WGMItUkGbJqAcOCRTd8tqcg5yyB8vH/dlqUZfiPVfFhw7iw2bJORk52JxZ5yQ6CZ0dnBLI0V9J4VylAiiRE6MGkNUs86lQN7bXJLl1sY9mBo82Oa4gLzew5amM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507398; c=relaxed/simple;
	bh=dc1HLt9rE0KO9U+HrAP2K7F5Lyzb8oVf7hrBoir0H58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrUVsZXiI1imY8iROL1mN0yQoOHQVAHPhgJ22/4Dn4oVP7oR1QkJZ92nCTxQ2JQE1c65SeVozsBJvn2RM88ZJEc2inHPw/K4pWs8z6mBn1AjLJCsZhZquq/OYJdcwpdo/BIEKBbpplfXOXmBNGuPhXxaTB6isqm6BY1PwZz8PWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWflfMeU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507397; x=1801043397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dc1HLt9rE0KO9U+HrAP2K7F5Lyzb8oVf7hrBoir0H58=;
  b=PWflfMeULHsFVbiZVTq66bCmSj03kgRsKWli+8BVq0rLEB46UqpXHbtC
   i8lT1CB/pgtakI9DxuQrIXh3qAbZBYabrfXLZMap2lolEDc2zgkWY6P+U
   1LH/77iA3/Hz1ccAg4+eLQF2GJLczAYxd+h9ffLkM4GjDcSdOjKPGemMt
   /BDABNpEuw4VAULXFhxv3TAGMHRM9nllwBIanEJEgDbDVoWJH19DFhvnK
   vty5C78TX121WitQ5336neUONdyUSuOfuytm3EGAV8CSQbzGFnFKLJY9D
   JQ/J4BVbpWlcS3Yfhl+yL5EVOPs6ZeGQoJcHI2he2OQfobCqbPi1O1bRd
   A==;
X-CSE-ConnectionGUID: YZV6G8OFQaml5BAdLP2lRQ==
X-CSE-MsgGUID: wLWWhw6dSwa75xAB9+gVkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70788025"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70788025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:49:57 -0800
X-CSE-ConnectionGUID: +Za2anaySTWxRE6LxOxuRA==
X-CSE-MsgGUID: lKLBQUgVSxu7z+XuvbnWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212047112"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Jan 2026 01:49:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0B01A98; Tue, 27 Jan 2026 10:49:53 +0100 (CET)
Date: Tue, 27 Jan 2026 10:49:53 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Gil Fine <gil.fine@linux.intel.com>
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com, gil.fine@intel.com,
	linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 2/5] thunderbolt: Verify PCIe adapters in detect state
 before setup PCIe tunnel
Message-ID: <20260127094953.GF2275908@black.igk.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
 <20260126220606.3476657-3-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260126220606.3476657-3-gil.fine@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,wunner.de];
	TAGGED_FROM(0.00)[bounces-32784-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 562FE922CE
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:06:03AM +0200, Gil Fine wrote:
> USB4 Connection Manager guide suggests making sure PCIe downstream and PCIe
> upstream adapter is in Detect state, before set up a PCIe tunnel.
> 
> Add this step by checking LTSSM field in ADP_PCIE_CS_0 to follow the CM
> guide more closely.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> ---
>  drivers/thunderbolt/tb.h      |  2 ++
>  drivers/thunderbolt/tb_regs.h | 15 +++++++++++++++
>  drivers/thunderbolt/tunnel.c  | 17 +++++++++++++++++
>  drivers/thunderbolt/usb4.c    | 23 +++++++++++++++++++++++
>  4 files changed, 57 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index c2ff2069eb20..dbbbd2bd63f3 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1480,6 +1480,8 @@ int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw);
>  int usb4_dp_port_requested_bandwidth(struct tb_port *port);
>  
>  int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable);
> +int usb4_pci_port_check_ltssm_state(struct tb_port *port,
> +				    enum tb_pcie_ltssm_state ltssm);
>  
>  static inline bool tb_is_usb4_port_device(const struct device *dev)
>  {
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index c0bf136236e6..71bed02a6974 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -473,10 +473,25 @@ struct tb_regs_port_header {
>  
>  /* PCIe adapter registers */
>  #define ADP_PCIE_CS_0				0x00
> +#define ADP_PCIE_CS_0_LTSSM_MASK		GENMASK(28, 25)
>  #define ADP_PCIE_CS_0_PE			BIT(31)
>  #define ADP_PCIE_CS_1				0x01
>  #define ADP_PCIE_CS_1_EE			BIT(0)
>  
> +enum tb_pcie_ltssm_state {
> +	TB_PCIE_LTSSM_DETECT		= 0x0,
> +	TB_PCIE_LTSSM_POLLING		= 0x1,
> +	TB_PCIE_LTSSM_CONFIG		= 0x2,
> +	TB_PCIE_LTSSM_CONFIG_IDLE	= 0x3,
> +	TB_PCIE_LTSSM_RECOVERY		= 0x4,
> +	TB_PCIE_LTSSM_RECOVERY_IDLE	= 0x5,
> +	TB_PCIE_LTSSM_L0		= 0x6,
> +	TB_PCIE_LTSSM_L1		= 0x7,
> +	TB_PCIE_LTSSM_L2		= 0x8,
> +	TB_PCIE_LTSSM_DISABLED		= 0x9,
> +	TB_PCIE_LTSSM_HOT_RESET		= 0xa,
> +};
> +
>  /* USB adapter registers */
>  #define ADP_USB3_CS_0				0x00
>  #define ADP_USB3_CS_0_V				BIT(30)
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index 28c1e5c062f3..72beaf99765f 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -296,6 +296,22 @@ static inline void tb_tunnel_changed(struct tb_tunnel *tunnel)
>  			tunnel->src_port, tunnel->dst_port);
>  }
>  
> +static int tb_pci_pre_activate(struct tb_tunnel *tunnel)
> +{
> +	struct tb_port *down = tunnel->src_port;
> +	struct tb_port *up = tunnel->dst_port;
> +	int ret;
> +
> +	if (!tb_switch_is_usb4(down->sw) || !tb_switch_is_usb4(up->sw))

What if

 USB4 <-> TB3

I think we should do the same still, no?

> +		return 0;
> +
> +	ret = usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DETECT);
> +	if (ret)
> +		return ret;
> +
> +	return usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT);
> +}
> +
>  static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
>  {
>  	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
> @@ -511,6 +527,7 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
>  	if (!tunnel)
>  		return NULL;
>  
> +	tunnel->pre_activate = tb_pci_pre_activate;
>  	tunnel->activate = tb_pci_activate;
>  	tunnel->src_port = down;
>  	tunnel->dst_port = up;
> diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> index 403a46aa35e5..706c9bc796e2 100644
> --- a/drivers/thunderbolt/usb4.c
> +++ b/drivers/thunderbolt/usb4.c
> @@ -3145,3 +3145,26 @@ int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable)
>  	return tb_port_write(port, &val, TB_CFG_PORT,
>  			     port->cap_adap + ADP_PCIE_CS_1, 1);
>  }
> +
> +/**
> + * usb4_pci_port_check_ltssm_state() - Checks the LTSSM state of PCIe adapter
> + * @port: PCIe adapter
> + * @ltssm: PCIe adapter LTSSM state as encoded in &enum tb_pcie_ltssm_state
> + *
> + * Return:
> + * * %0 - If LTSSM state of @port is as expected @state.
> + * * %-ETIMEDOUT - The @ltssm state was not reached within the given timeout.
> + * * Negative errno - Other failure occurred.
> + */
> +int usb4_pci_port_check_ltssm_state(struct tb_port *port,
> +				    enum tb_pcie_ltssm_state ltssm)
> +{
> +	u32 val = FIELD_PREP(ADP_PCIE_CS_0_LTSSM_MASK, ltssm);
> +
> +	if (!tb_port_is_pcie_down(port) && !tb_port_is_pcie_up(port))
> +		return -EINVAL;
> +
> +	return usb4_port_wait_for_bit(port, port->cap_adap + ADP_PCIE_CS_0,
> +				      ADP_PCIE_CS_0_LTSSM_MASK, val, 500,
> +				      USB4_PORT_DELAY);
> +}
> -- 
> 2.43.0

