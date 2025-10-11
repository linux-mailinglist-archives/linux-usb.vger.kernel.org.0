Return-Path: <linux-usb+bounces-29162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47BBCF518
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 14:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3434D189C0B7
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 12:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2005E2773D0;
	Sat, 11 Oct 2025 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuP48seu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28498244687
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185138; cv=none; b=USbm+lYUAY4vh23gkAjVozoe9eSVOGbkFkJhBWy5+Ns5U481XhMKLjMxk+1yPd3EMT3gUJrLXut5rhVsK+YBWi1eZOFpAM7N1UqIiqHmXjK8hy8WKNR4yuqtC4gioQm/EK8+VoMkpcq2a7ukX3PM8gdMfiv+6Wx+LcPPXVhqni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185138; c=relaxed/simple;
	bh=8rWpXcMF5sSLnfJa/4/zDC3sNX5ccwOkLC7zsteO0vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ujFuBR3bmrym7ArPS3j8egBEtogBggvv7AF7m2S8Otw7TaP5ijxhxqux9VdJvMDh46Li8aFyWqg26ghV882070fJMPSL2GgsXW6tI+lln13aCdezD0LNUg3ptIak+UWB92afYXIMp1K6EWUv51tE8TsvbldUfWqUcmkOZbDlTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuP48seu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760185132; x=1791721132;
  h=date:from:to:cc:subject:message-id;
  bh=8rWpXcMF5sSLnfJa/4/zDC3sNX5ccwOkLC7zsteO0vs=;
  b=SuP48seuTl9cSLKaFMzAjiY2M6WFEORmclNp4iMieWrGB8ksESvpjWDY
   MCNZrHkgDFZNq86DaxSLACI5TrP+T7I0NuO7OMtnVWdukbkzG5IqzBIqD
   LAXLmv7zwYWhyA9l5mWjEiGENIeBTcfMvVS6eQWoGnFoRTZ99fEBUsc13
   q2BI2o4h5nlFut9+LCLjDFEdVB8xyxx2sI8bTAuks05ZBQXNTfqXr+U/M
   Ctfhce8+5q0CBDlrt2HsVxKaR2A+g/mOPQZtKBSFjFHoRfqHOfdVtZQOe
   zO6Ph3Ev4Sp2CBjpYbfhC9wMcpYEbqUGFec/XCx1PeQwZbGR+Wqq0GEvu
   g==;
X-CSE-ConnectionGUID: zIe1el/FSQ+AIs4iJ6MA0g==
X-CSE-MsgGUID: cFTlzl7nQZqSzADBqWtVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85011436"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="85011436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 05:18:52 -0700
X-CSE-ConnectionGUID: uVKmtkOYRDum6JDAIpz/dg==
X-CSE-MsgGUID: FfEhjBKLRseQOjefZNB3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="204865392"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2025 05:18:50 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7YYi-0003l5-10;
	Sat, 11 Oct 2025 12:18:48 +0000
Date: Sat, 11 Oct 2025 20:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 64b229b5b6816b9247e0f592e6f7cdb3693cf3b8
Message-ID: <202510112019.0rEXIIMZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 64b229b5b6816b9247e0f592e6f7cdb3693cf3b8  usb: dwc3: dwc3-generic-plat: Add layerscape dwc3 support

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
    arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20251011
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-13bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-65bb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-85bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-899b.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   `-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-052-20251011
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-13bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-65bb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-85bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-899b.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   `-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-053-20251011
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-13bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-65bb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-85bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-899b.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   `-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-054-20251011
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-13bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-65bb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-85bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-899b.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|   `-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
`-- arm64-randconfig-055-20251011
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-kbox-a-ls.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var1.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3-ads2.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var3.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28-var4.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-kontron-sl28.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-13bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-65bb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-85bb.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds-899b.dtb:usb-(fsl-ls1028a-dwc3):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-freescale-fsl-ls1028a-qds.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
    `-- arch-arm64-boot-dts-freescale-fsl-ls1028a-rdb.dtb:usb-(fsl-ls1028a-dwc3):Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)

elapsed time: 1453m

configs tested: 259
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                   randconfig-001-20251010    gcc-12.5.0
arc                   randconfig-001-20251011    clang-22
arc                   randconfig-002-20251010    gcc-8.5.0
arc                   randconfig-002-20251011    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          moxart_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251010    gcc-8.5.0
arm                   randconfig-001-20251011    clang-22
arm                   randconfig-002-20251010    gcc-13.4.0
arm                   randconfig-002-20251011    clang-22
arm                   randconfig-003-20251010    gcc-8.5.0
arm                   randconfig-003-20251011    clang-22
arm                   randconfig-004-20251010    gcc-8.5.0
arm                   randconfig-004-20251011    clang-22
arm                           stm32_defconfig    clang-22
arm                           tegra_defconfig    clang-22
arm                         wpcm450_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251010    gcc-14.3.0
arm64                 randconfig-001-20251011    clang-22
arm64                 randconfig-002-20251010    clang-19
arm64                 randconfig-002-20251011    clang-22
arm64                 randconfig-003-20251010    clang-17
arm64                 randconfig-003-20251011    clang-22
arm64                 randconfig-004-20251010    gcc-15.1.0
arm64                 randconfig-004-20251011    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251010    gcc-15.1.0
csky                  randconfig-001-20251011    gcc-8.5.0
csky                  randconfig-002-20251010    gcc-10.5.0
csky                  randconfig-002-20251011    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251010    clang-22
hexagon               randconfig-001-20251011    gcc-8.5.0
hexagon               randconfig-002-20251010    clang-18
hexagon               randconfig-002-20251011    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251010    gcc-14
i386        buildonly-randconfig-001-20251011    clang-20
i386        buildonly-randconfig-002-20251010    clang-20
i386        buildonly-randconfig-002-20251011    clang-20
i386        buildonly-randconfig-003-20251010    clang-20
i386        buildonly-randconfig-003-20251011    clang-20
i386        buildonly-randconfig-004-20251010    gcc-14
i386        buildonly-randconfig-004-20251011    clang-20
i386        buildonly-randconfig-005-20251010    gcc-14
i386        buildonly-randconfig-005-20251011    clang-20
i386        buildonly-randconfig-006-20251010    gcc-14
i386        buildonly-randconfig-006-20251011    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251011    gcc-14
i386                  randconfig-002-20251011    gcc-14
i386                  randconfig-003-20251011    gcc-14
i386                  randconfig-004-20251011    gcc-14
i386                  randconfig-005-20251011    gcc-14
i386                  randconfig-006-20251011    gcc-14
i386                  randconfig-007-20251011    gcc-14
i386                  randconfig-011-20251011    clang-20
i386                  randconfig-012-20251011    clang-20
i386                  randconfig-013-20251011    clang-20
i386                  randconfig-014-20251011    clang-20
i386                  randconfig-015-20251011    clang-20
i386                  randconfig-016-20251011    clang-20
i386                  randconfig-017-20251011    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251010    clang-22
loongarch             randconfig-001-20251011    gcc-8.5.0
loongarch             randconfig-002-20251010    gcc-15.1.0
loongarch             randconfig-002-20251011    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251010    gcc-11.5.0
nios2                 randconfig-001-20251011    gcc-8.5.0
nios2                 randconfig-002-20251010    gcc-9.5.0
nios2                 randconfig-002-20251011    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251010    gcc-8.5.0
parisc                randconfig-001-20251011    gcc-8.5.0
parisc                randconfig-002-20251010    gcc-12.5.0
parisc                randconfig-002-20251011    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-19
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    clang-22
powerpc               randconfig-001-20251010    clang-22
powerpc               randconfig-001-20251011    gcc-8.5.0
powerpc               randconfig-002-20251010    gcc-15.1.0
powerpc               randconfig-002-20251011    gcc-8.5.0
powerpc               randconfig-003-20251010    clang-22
powerpc               randconfig-003-20251011    gcc-8.5.0
powerpc64             randconfig-001-20251010    clang-22
powerpc64             randconfig-001-20251011    gcc-8.5.0
powerpc64             randconfig-002-20251010    gcc-14.3.0
powerpc64             randconfig-002-20251011    gcc-8.5.0
powerpc64             randconfig-003-20251010    gcc-13.4.0
powerpc64             randconfig-003-20251011    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251010    clang-22
riscv                 randconfig-001-20251011    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
riscv                 randconfig-002-20251011    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251010    gcc-14.3.0
s390                  randconfig-001-20251011    clang-22
s390                  randconfig-002-20251010    clang-22
s390                  randconfig-002-20251011    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251010    gcc-15.1.0
sh                    randconfig-001-20251011    clang-22
sh                    randconfig-002-20251010    gcc-15.1.0
sh                    randconfig-002-20251011    clang-22
sh                           se7750_defconfig    clang-22
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251010    gcc-11.5.0
sparc                 randconfig-001-20251011    clang-22
sparc                 randconfig-002-20251010    gcc-8.5.0
sparc                 randconfig-002-20251011    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251010    clang-20
sparc64               randconfig-001-20251011    clang-22
sparc64               randconfig-002-20251010    gcc-10.5.0
sparc64               randconfig-002-20251011    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251010    gcc-14
um                    randconfig-001-20251011    clang-22
um                    randconfig-002-20251010    gcc-14
um                    randconfig-002-20251011    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251010    clang-20
x86_64      buildonly-randconfig-001-20251011    clang-20
x86_64      buildonly-randconfig-002-20251010    clang-20
x86_64      buildonly-randconfig-002-20251011    clang-20
x86_64      buildonly-randconfig-003-20251010    clang-20
x86_64      buildonly-randconfig-003-20251011    clang-20
x86_64      buildonly-randconfig-004-20251010    clang-20
x86_64      buildonly-randconfig-004-20251011    clang-20
x86_64      buildonly-randconfig-005-20251010    gcc-14
x86_64      buildonly-randconfig-005-20251011    clang-20
x86_64      buildonly-randconfig-006-20251010    gcc-14
x86_64      buildonly-randconfig-006-20251011    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251011    gcc-14
x86_64                randconfig-002-20251011    gcc-14
x86_64                randconfig-003-20251011    gcc-14
x86_64                randconfig-004-20251011    gcc-14
x86_64                randconfig-005-20251011    gcc-14
x86_64                randconfig-006-20251011    gcc-14
x86_64                randconfig-007-20251011    gcc-14
x86_64                randconfig-008-20251011    gcc-14
x86_64                randconfig-071-20251011    clang-20
x86_64                randconfig-072-20251011    clang-20
x86_64                randconfig-073-20251011    clang-20
x86_64                randconfig-074-20251011    clang-20
x86_64                randconfig-075-20251011    clang-20
x86_64                randconfig-076-20251011    clang-20
x86_64                randconfig-077-20251011    clang-20
x86_64                randconfig-078-20251011    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251010    gcc-8.5.0
xtensa                randconfig-001-20251011    clang-22
xtensa                randconfig-002-20251010    gcc-9.5.0
xtensa                randconfig-002-20251011    clang-22
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

