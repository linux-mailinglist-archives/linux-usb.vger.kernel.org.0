Return-Path: <linux-usb+bounces-36581-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF8dOAfr72lEHwEAu9opvQ
	(envelope-from <linux-usb+bounces-36581-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 01:02:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909647BABE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 01:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C34D1301F484
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430CF3AE709;
	Mon, 27 Apr 2026 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQ4IUzZ0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA73E175A81;
	Mon, 27 Apr 2026 23:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777330947; cv=none; b=RTzXqhQbs+wv7O04B94V/I4abavQgnx3nyUuMD04DIn/a5EVQkgoBE/I5UK52CZkUa1jcb2CT9fcEGdX5y2B5DClDBcgFG9e/QlvaQ5ab45YfwsXIt7g/PycGEaXGxslII3ewFbhZMAAy5anTN6J0YvUApWVlvHp9eEP5b/m3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777330947; c=relaxed/simple;
	bh=SigOEgVySnDYD1EY47u+rfV1d/Es6g9p4/VsLpUhrCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoC7l724CkYIqRwzQ3Ahf0XZKDX6ghv/rfOCtC9Ka43j4W1mwZqU/pSRJhTnlD+y4kXLDABVxmkrPRPHJaFxdB4hTD8Bk/CDmvvbp7hu1CWYXVV7WEkGDzS7J93/wSZLnFLfeTj5nTUQm3PeTvcdtoIynYoQaxVLDtYIqW8oA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQ4IUzZ0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777330946; x=1808866946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SigOEgVySnDYD1EY47u+rfV1d/Es6g9p4/VsLpUhrCs=;
  b=XQ4IUzZ00ianj1KVG2P7ZeZK5qxnAo/T++iYapTY0aQMVaw0jzS9o3XH
   ASosNyKTT3ImzV6pgtt6eh3Rj4DoqsRajZi0/tohuwdp9lYtlGEDWhqb1
   J6duVz9p93w5bkfEo9h0GDsdux6wHm6YNioLONMP9X1g0t9y6C8LY96TI
   M3gACmN4jSbfDfGf6dHn6LNnptf5ZeAKXhBuAtLiNhuVmwKJN45xpx2YQ
   G1ognQB6w+M8Vme+f5beDsGS5NS9KsAIBPsJEsjAkiJT/RrDkcWnBqBs2
   FfgpZdtqaBxDgvGVUH6KZ3TBS77gLi42WJrqtqwKrnOAlcctSKcwMIHIo
   w==;
X-CSE-ConnectionGUID: YY3NmyRYQDCvaOHsrXI7ew==
X-CSE-MsgGUID: a+DvvrzkQ4mr4+OXiZFjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82096866"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="82096866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 16:02:26 -0700
X-CSE-ConnectionGUID: jFZot8AiTSm1eqt3wLwM2g==
X-CSE-MsgGUID: hpNOFlZsR3+94RnQadMe1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="238104864"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2026 16:02:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHUy4-000000009Gv-34mz;
	Mon, 27 Apr 2026 23:02:20 +0000
Date: Tue, 28 Apr 2026 07:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, badhri@google.com,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
Message-ID: <202604280624.g6vOa3Cf-lkp@intel.com>
References: <20260419213638.38291-2-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419213638.38291-2-m32285159@gmail.com>
X-Rspamd-Queue-Id: 4909647BABE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36581-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,google.com,linux.intel.com,linuxfoundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,git-scm.com:url,01.org:url]

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus linus/master next-20260427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/usb-typec-tcpm-replace-strcpy-with-strscpy/20260427-011111
base:   v7.0
patch link:    https://lore.kernel.org/r/20260419213638.38291-2-m32285159%40gmail.com
patch subject: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260428/202604280624.g6vOa3Cf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280624.g6vOa3Cf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604280624.g6vOa3Cf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/tcpm/tcpm.c: In function '_tcpm_log':
>> drivers/usb/typec/tcpm/tcpm.c:729:9: error: expected ';' before '}' token
     729 |         }
         |         ^


vim +729 drivers/usb/typec/tcpm/tcpm.c

f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  706  
e79e01254d02ff drivers/staging/typec/tcpm.c  Joe Perches   2017-08-25  707  __printf(2, 0)
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  708  static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  709  {
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  710  	char tmpbuffer[LOG_BUFFER_ENTRY_SIZE];
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  711  	u64 ts_nsec = local_clock();
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  712  	unsigned long rem_nsec;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  713  
d5a4f93511b700 drivers/usb/typec/tcpm.c      Peter Chen    2018-06-12  714  	mutex_lock(&port->logbuffer_lock);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  715  	if (!port->logbuffer[port->logbuffer_head]) {
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  716  		port->logbuffer[port->logbuffer_head] =
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  717  				kzalloc(LOG_BUFFER_ENTRY_SIZE, GFP_KERNEL);
d5a4f93511b700 drivers/usb/typec/tcpm.c      Peter Chen    2018-06-12  718  		if (!port->logbuffer[port->logbuffer_head]) {
d5a4f93511b700 drivers/usb/typec/tcpm.c      Peter Chen    2018-06-12  719  			mutex_unlock(&port->logbuffer_lock);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  720  			return;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  721  		}
d5a4f93511b700 drivers/usb/typec/tcpm.c      Peter Chen    2018-06-12  722  	}
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  723  
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  724  	vsnprintf(tmpbuffer, sizeof(tmpbuffer), fmt, args);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  725  
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  726  	if (tcpm_log_full(port)) {
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  727  		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
2919950c498311 drivers/usb/typec/tcpm/tcpm.c Maxwell Doose 2026-04-19  728  		strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27 @729  	}
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  730  
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  731  	if (port->logbuffer_head < 0 ||
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  732  	    port->logbuffer_head >= LOG_BUFFER_ENTRIES) {
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  733  		dev_warn(port->dev,
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  734  			 "Bad log buffer index %d\n", port->logbuffer_head);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  735  		goto abort;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  736  	}
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  737  
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  738  	if (!port->logbuffer[port->logbuffer_head]) {
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  739  		dev_warn(port->dev,
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  740  			 "Log buffer index %d is NULL\n", port->logbuffer_head);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  741  		goto abort;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  742  	}
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  743  
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  744  	rem_nsec = do_div(ts_nsec, 1000000000);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  745  	scnprintf(port->logbuffer[port->logbuffer_head],
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  746  		  LOG_BUFFER_ENTRY_SIZE, "[%5lu.%06lu] %s",
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  747  		  (unsigned long)ts_nsec, rem_nsec / 1000,
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  748  		  tmpbuffer);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  749  	port->logbuffer_head = (port->logbuffer_head + 1) % LOG_BUFFER_ENTRIES;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  750  
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  751  abort:
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  752  	mutex_unlock(&port->logbuffer_lock);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  753  }
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

