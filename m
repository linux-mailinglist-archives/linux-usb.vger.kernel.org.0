Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA237DF96D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 02:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfJVAVj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 20:21:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:55786 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728406AbfJVAVj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 20:21:39 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 17:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,325,1566889200"; 
   d="scan'208";a="281123253"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Oct 2019 17:21:37 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iMhvc-000EeF-Q4; Tue, 22 Oct 2019 08:21:36 +0800
Date:   Tue, 22 Oct 2019 08:20:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     kbuild-all@lists.01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 12/18] usb: typec: ucsi: acpi: Move to the new API
Message-ID: <201910220850.hJBU1fLX%lkp@intel.com>
References: <20191021112524.79550-13-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021112524.79550-13-heikki.krogerus@linux.intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[cannot apply to v5.4-rc4 next-20191021]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Heikki-Krogerus/usb-typec-API-improvements/20191022-013906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/typec/ucsi/ucsi_acpi.c:54:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const *from @@    got void [noderevoid const *from @@
>> drivers/usb/typec/ucsi/ucsi_acpi.c:54:9: sparse:    expected void const *from
   drivers/usb/typec/ucsi/ucsi_acpi.c:54:9: sparse:    got void [noderef] <asn:2> *
>> drivers/usb/typec/ucsi/ucsi_acpi.c:64:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got void [noderef] <asvoid *to @@
>> drivers/usb/typec/ucsi/ucsi_acpi.c:64:9: sparse:    expected void *to
   drivers/usb/typec/ucsi/ucsi_acpi.c:64:9: sparse:    got void [noderef] <asn:2> *

vim +54 drivers/usb/typec/ucsi/ucsi_acpi.c

    43	
    44	static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
    45				  void *val, size_t val_len)
    46	{
    47		struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
    48		int ret;
    49	
    50		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
    51		if (ret)
    52			return ret;
    53	
  > 54		memcpy(val, ua->base + offset, val_len);
    55	
    56		return 0;
    57	}
    58	
    59	static int ucsi_acpi_async_write(struct ucsi *ucsi, unsigned int offset,
    60					 const void *val, size_t val_len)
    61	{
    62		struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
    63	
  > 64		memcpy(ua->base + offset, val, val_len);
    65	
    66		return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
    67	}
    68	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
