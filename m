Return-Path: <linux-usb+bounces-35044-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNaDKcKWumnSXgIAu9opvQ
	(envelope-from <linux-usb+bounces-35044-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:12:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E42BB464
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11039314677B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 12:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930ED3D5667;
	Wed, 18 Mar 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0XuDyf+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E123AEF5A;
	Wed, 18 Mar 2026 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835853; cv=none; b=TnxSjV8oDfSI/3TqQsAqM6hLE1Pi3wjkV+OJl5QbLZs1Qux/O7bDOLmTF4WIn2B9sor2j+kg+TtK8PQl0cYRzuXWEGBPAKccMuHZIimPXA6JdSAQ+xIwzMnv5aouSdGoRpXL2JHQl7cw+IJGvdvLediibVxDlCD+BoMkt5MjhHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835853; c=relaxed/simple;
	bh=uwGnVgjVF+WDR9bFHveUphn3+zSoGFtmkoZZy1nZcDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLy34bsUCjWBTyzRbUAMa8meT/teEp5voW92iATxJJi+Xmsdn8iaF8Ogt6MGvNjGjBaRJk5frbxY4sySw7jTVESt5lYmIeXlGt6wdcCd1T9vd/gpq6QQakEeNAmca7uNlDbIVownkqcEUA3scg7vTjRUnuLsDZYAIdQNz5uXeVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0XuDyf+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773835851; x=1805371851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uwGnVgjVF+WDR9bFHveUphn3+zSoGFtmkoZZy1nZcDA=;
  b=m0XuDyf+w7DVkuZpGl+XIo5dIUWdm3guvrXIMe7uxGIawDlVH34VcNlo
   4ufAU7PSQJbGD0P8nf1g4fYkRSzIbumAP0aKyrU/kt9YbwZwMgdhyyWDe
   YrkbpOWTFTFr4pqolZC71kcbeAvFSNZg1qzqY+ua6Eyiy7TSp4t0T0Hqn
   pjBTLltRHGde+jH8T6RucGRWbuT2YWSOT9uHg97Vdxq9haMpOCCrjATiA
   gbYe/VDKowWOWhftp03Yq8yxgcbDlICLai0rMVPm28YSdIUIGM8NTvFB5
   wtSbj7u2/J6tT8PrpYDLfx/c3xqD6QGQQOdfv5pscJqYNLK/taHq1HK1Q
   g==;
X-CSE-ConnectionGUID: 0c0OzJlWSN2+a2Fd2kT9og==
X-CSE-MsgGUID: aY0hIWQPTy2O7XvYFv2n+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74800201"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74800201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:10:51 -0700
X-CSE-ConnectionGUID: jLsN2SJlQQmCSB3ssd5hxA==
X-CSE-MsgGUID: GReFG/SuSfaK9BPigQnOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222584933"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2026 05:10:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D47D499; Wed, 18 Mar 2026 13:10:46 +0100 (CET)
Date: Wed, 18 Mar 2026 14:10:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: support setting orientation
 via GPIO
Message-ID: <abqWGW8vimyIq7hi@kuha>
References: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
 <20260316-support-setting-orientation-use-gpio-v3-2-0e6622b00dd9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-support-setting-orientation-use-gpio-v3-2-0e6622b00dd9@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35044-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 092E42BB464
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Mon, Mar 16, 2026 at 05:41:56PM +0800, Xu Yang wrote:
> @@ -316,6 +318,10 @@ static int tcpci_set_orientation(struct tcpc_dev *tcpc,
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>  	unsigned int reg;
>  
> +	if (tcpci->orientation_gpio)
> +		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
> +						orientation == TYPEC_ORIENTATION_NORMAL ? 0 : 1);

Sorry, I though this was covered in the last version. The condition
looks unnecessary, so:

		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
                                        	orientation != TYPEC_ORIENTATION_NORMAL);

thanks,

-- 
heikki

