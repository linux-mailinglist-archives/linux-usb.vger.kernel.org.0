Return-Path: <linux-usb+bounces-33307-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALZuNb9gjWkF1wAAu9opvQ
	(envelope-from <linux-usb+bounces-33307-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 06:10:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A4C12A5CB
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 06:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE9263123A07
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 05:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170C1274FDB;
	Thu, 12 Feb 2026 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN9ihvCK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47198264614;
	Thu, 12 Feb 2026 05:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770873011; cv=none; b=ahtCOE30DKAM4Xai6MHypmKhZzOBotRSBH55rng8O5U1SYyvz+QZ0QsGVIuixQcWyw3mDSWXxIt1WYJ/jmVR+EVQaAtDJbXTWWGBTR+tdIt2bvYbGs2WtDpgaq0dO4a2gMS5rNXmR8WV1TbJZST1dzd+ORphYZtpYpJDgGdWWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770873011; c=relaxed/simple;
	bh=AWycgvjXareZiKDi2v1YKnUJ7irl/9M9MIsERyYFAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VperHWx/Bt9hjtuZ2gW+0ipAXyFENERKA14AE5uFWK0pS0wtofFK5ye9Hgs/HzQDFHFJI8blMYWHA5SannPOo8iFDEWMtqaeMiDEHa98F/9XMfTHs/cYjV61AdgsnZDHeSG3JJZwoa+VWHRKPImdWwgrdA7u0Rj6f+RxR0yIRuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN9ihvCK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770873011; x=1802409011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AWycgvjXareZiKDi2v1YKnUJ7irl/9M9MIsERyYFAzk=;
  b=QN9ihvCKnI/Kbg9qh294/zor9miPPbxqzNAQjpmbYA/JfU9T+3ylDfxS
   4alnr5rYWgh38VkqMPzyQo8HDa3hZkv6EQjC7WKJzuAyFrhoY3LlOOTvX
   7YgSR0xtyCA0USQlxPidL1TTYHrpGpti/qjOst9yOb7O+GD2KUPguGGS7
   ZiZzBTacTfxSvbAseOsQX0+++lufJCA/2sSvxUovr4+CMRh6v6IG+3yMe
   qZk5hgKGe+BrIVnTuJKrFLGVcKAwCGL6t+RoRb/MK6KBgDvbwz3RCX0BM
   pgl9cqyvlqsAl2W64V9qGcHXXYLaOYO2AHT31xflUAjVN/PrziGBJuATh
   A==;
X-CSE-ConnectionGUID: lHdoglg4S2ytTlOzZnGWhA==
X-CSE-MsgGUID: zxQyfaXMTiacWHI/rwuAqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71944127"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71944127"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 21:10:10 -0800
X-CSE-ConnectionGUID: 1tIveEPuR0GxAVMIvq/eOw==
X-CSE-MsgGUID: NlORbNgpSoKdtcMi6ae+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="250146124"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2026 21:10:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqOxn-00000000qiu-1qg3;
	Thu, 12 Feb 2026 05:10:03 +0000
Date: Thu, 12 Feb 2026 13:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended
 msg response
Message-ID: <202602121335.mBTMe5lG-lkp@intel.com>
References: <20260211-skedb-v1-2-616340426cdc@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-skedb-v1-2-616340426cdc@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33307-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,amitsd.google.com,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77A4C12A5CB
X-Rspamd-Action: no action

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-connector-Add-sink-properties-to-comply-with-PD-3-1-spec/20260212-072745
base:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
patch link:    https://lore.kernel.org/r/20260211-skedb-v1-2-616340426cdc%40google.com
patch subject: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended msg response
config: arc-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121335.mBTMe5lG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121335.mBTMe5lG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121335.mBTMe5lG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/typec/tcpm/tcpm.c:351 cannot understand function prototype: 'struct pd_identifier'
>> Warning: drivers/usb/typec/tcpm/tcpm.c:368 cannot understand function prototype: 'struct sink_caps_ext_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

