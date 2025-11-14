Return-Path: <linux-usb+bounces-30509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D4608C5BA68
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 07:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 042D235578D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 06:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74B52F49F0;
	Fri, 14 Nov 2025 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgIHQRAF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622362C21C5;
	Fri, 14 Nov 2025 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103547; cv=none; b=gUCVA0TZ7JoqjMEmSqw51QfySYSKzH1fpToGiRA4kpkv8oA1QKnd1b5g5BwSXJv/OYlsryrXK4z+J70SCbCgMF9cEQCwO8o+B1m1vn+BteAmBMZgOBq2IovXfZc8jBEswDpzxRtcqNhnAtnP8UvquE+haTFpg74TZbBNmkZHMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103547; c=relaxed/simple;
	bh=xFTZB7nmkE+KO4dvaal04ySKsjenV1oFXSJbgDFkRCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4d1N37fCqQ8RH5UNU1aVp8owqjwFQpfS/ORi7GQgu4p49UZRMD+j8Qve66guDiOtRcqBi21OMdvsyX7Hd6urS/PFFlERJezlqjjxLeDArMWaaSmiei2OpEUX5ke1/+azNn2jqXwEnoFf2Voq3gwBMLjloMDazharlpEvcEQRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgIHQRAF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763103545; x=1794639545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xFTZB7nmkE+KO4dvaal04ySKsjenV1oFXSJbgDFkRCs=;
  b=FgIHQRAFfiOqpyNhQBp4iFndQDW+l2DYqtH7xOe2zIBlIbH1cX2ihtt1
   7rykBaUHKN6ifMfq64unq1Egp/9gQnVy4z1e2T6gkOXrpiFo/QEEh24lL
   ecH8psJpuazh8V/8DMelFQLlw0JqRTxyJM+k61XFpty4mrfnfO2XioMqP
   JXYEhUchE241dyvoWghK21FpDOoF8hb3sQ4DKaegtkR2agk03n4jrCoz/
   mxlM0o2dNcbYaj8zGWZUvlbHuLwpznku4f9BpTFHgobxB16Uamrx5T6/V
   VGE2fZ24O4snbA1aDIr/V28Nqp8jhTS9o7Wy7I3dZP33snkZDcW1DrcCn
   g==;
X-CSE-ConnectionGUID: EwXAjjPlS1OJ3o+9hbdUTg==
X-CSE-MsgGUID: is9JycfMSUuN0bG3t8VRhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82830177"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="82830177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:59:04 -0800
X-CSE-ConnectionGUID: sHgC19cwQRqmP32YdA4xww==
X-CSE-MsgGUID: QB8Mq28wStu+JhA4kq9W5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190127701"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 22:59:01 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnlq-0006H5-2o;
	Fri, 14 Nov 2025 06:58:58 +0000
Date: Fri, 14 Nov 2025 14:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: adrianhoyin.ng@altera.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org,
	Thinh.Nguyen@synopsys.com, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	adrianhoyin.ng@altera.com
Subject: Re: [PATCH 2/4] arm64: dts: intel: agilex5: Add USB3.1 support for
 Agilex5 SoCDK
Message-ID: <202511141429.Ae8oNWSX-lkp@intel.com>
References: <7ec6e1787a677f6614f7f991a31a9ac58b539780.1762839776.git.adrianhoyin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ec6e1787a677f6614f7f991a31a9ac58b539780.1762839776.git.adrianhoyin.ng@altera.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next westeri-thunderbolt/next linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adrianhoyin-ng-altera-com/dt-bindings-usb-dwc3-altera-Add-binding-for-Altera-DWC3-wrapper/20251111-142609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/7ec6e1787a677f6614f7f991a31a9ac58b539780.1762839776.git.adrianhoyin.ng%40altera.com
patch subject: [PATCH 2/4] arm64: dts: intel: agilex5: Add USB3.1 support for Agilex5 SoCDK
config: arm64-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251114/202511141429.Ae8oNWSX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141429.Ae8oNWSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141429.Ae8oNWSX-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts:111.7-113.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

