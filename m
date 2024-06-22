Return-Path: <linux-usb+bounces-11557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C4913564
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 19:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96E31F21AE3
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 17:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8312182C5;
	Sat, 22 Jun 2024 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8zFJUQW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53589171CC
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719077702; cv=none; b=umuE19mD3DrAwMU3aWRxOZBfaRxItsew3rLf7EXLkFw1RN2BTFuUXR9uMX7re+LTjB7zFDGLLzFLRR9olqGz9hqqs2nmjuyNyl28XN0j0/m/4v4o30Yd8A6ZMqGxuTqK+JUnSW1mlJPrnnvabQXTiVtSCFYcujTtotzc2bR53cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719077702; c=relaxed/simple;
	bh=PLH+W5Kr1OGDldrMep9Yo5HHMyeJMw3xX96JkBB/AYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WGzt1vxDFhGLRiOtpCJve54TJawB1bVPnv4x2N6K8oSFpKjf4ox3vrA+wD7000LCMkkm3BvmNrGsq3A5SnW9qliaEm3ihPoKCmFAMbd29G9Wp0Dcaika5XoYv1XvSZy062MHOsMq6T+W0deKgERqXOnGr4AxrH/inqS154YKZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8zFJUQW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719077700; x=1750613700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLH+W5Kr1OGDldrMep9Yo5HHMyeJMw3xX96JkBB/AYw=;
  b=T8zFJUQW6KEdLoB7KewOtpp6Yap23nCSr7IpR7W/1y8gzr5uqnK5wgq1
   vc0fYycRN5+DgRoldXcBAteqjLlRK1JzmuinorY1lFh6Vh0v+97zmKFrm
   WIi3XEOzOMf/h3q49xHKmSlVWMoAVmEQJGKdvEqPalX0y5g/GoEEKzHNU
   xxVf543RMCX1Lq/hkjnNKrw/N1oNt3giGEgTdhKCLcRlnZxbXeyt2oH6T
   uk5SHmUtmYdCbfOqGfVBpMs6J6GS+Ui1NeSjk4WXxq54UFiRXK7LiZ/wh
   kE8egwgxiDD+gnmzm+G50a/sePmGPLqZM2iaYoIKsA0cri2A+kUExr/9f
   g==;
X-CSE-ConnectionGUID: hiH/zjjxRL2zsUPfQcTo/w==
X-CSE-MsgGUID: /qQO6VXXT6CQMt9ciyPIHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="27496483"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="27496483"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 10:35:00 -0700
X-CSE-ConnectionGUID: 4jmiM1tGSfG5hEYQBwChfQ==
X-CSE-MsgGUID: 5imaS8AJQyqN6p7sL4bT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="43319681"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jun 2024 10:34:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL4db-0009qw-2q;
	Sat, 22 Jun 2024 17:34:55 +0000
Date: Sun, 23 Jun 2024 01:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [usb:usb-testing 18/29]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800:
 interrupt-names:1: 'hs_phy_irq' was expected
Message-ID: <202406230117.PmWeGRVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   819984a0dd3606b7c46fe156cd56a0dc0d604788
commit: 34aa3ca43902baf3440480bf95abf88b4e092588 [18/29] dt-bindings: usb: qcom,dwc3: Add SC8180X compatibles
config: arm64-randconfig-051-20240622 (https://download.01.org/0day-ci/archive/20240623/202406230117.PmWeGRVI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406230117.PmWeGRVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230117.PmWeGRVI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clocks: [[41, 0], [42], [116, 0], [116, 1], [120, 0], [120, 1], [123, 0], [123, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names:1: 'dsi0_phy_pll_out_byteclk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names:2: 'dsi0_phy_pll_out_dsiclk' was expected
--
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clocks: [[41, 0], [42], [118, 0], [118, 1], [122, 0], [122, 1], [125, 0], [125, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names:1: 'dsi0_phy_pll_out_byteclk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names:2: 'dsi0_phy_pll_out_dsiclk' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

