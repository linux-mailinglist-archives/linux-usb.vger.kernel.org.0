Return-Path: <linux-usb+bounces-29559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBDBFF784
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 09:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B0FE3A7904
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 07:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9632BF012;
	Thu, 23 Oct 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZmOSYr6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFE32BDC15
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203701; cv=none; b=kQake3J/m6ZcjN7fMvcxoQrYTyTgrmflKF9+HPIgYPNpCN26StXB6kmxGpC954DgLvcxOZLKilLYxfSm2OFStnD9rIpT2EgOys/cd2/nBXO41EStNzXZ810tJOuWu/EBMQY45R2mBYUF198JKn2RU+7FMZL1pKAMrG7p7Ts52QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203701; c=relaxed/simple;
	bh=ZvkSkfhbpnF7mv/oXEsipgS2OJAD87fSrlhDk5lOjkA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kjMjPqOdcz0WTYjpbg0UWkqNhN4N0Q9SNZOcjEaFbs39iMRCKzJKEklkZOZAkicfpV7kznN2trhgXJAyJE/GL+Gyvf0RTIMXzRak5sy9uVfbXjLKdcvNSpglUIUqnvKBvy1gpxsy5s+OATF8pGsH0qXKIRjqVHeeEeCm6+3chLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZmOSYr6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761203699; x=1792739699;
  h=date:from:to:cc:subject:message-id;
  bh=ZvkSkfhbpnF7mv/oXEsipgS2OJAD87fSrlhDk5lOjkA=;
  b=hZmOSYr6X+nxRc68aDTrvVEE1V0606tQ5usHnep97MaPB1+hqN4r5LKl
   9exL+298xWUSGmlzlyuXi+7Werk8q2VmmpObeal7Tq17vXaA3Cl3JZGDH
   i+2EB5AhG4iykhZeAYDdw7uYmH/hlsoz7bPUr9Id3fvPrB3gFJOptD5LN
   wZ7xhkOeHS+E8YY4W/00PYSa+lNvQ5HFRH+Ctqm5XuBzqLJMtG3NIN4dg
   NJoWH8dGAyqzdZy55pbq7sCMBrbUSVNqz9Fvk0FRk0SvuDiuq1CwwpN88
   jx7wJeH3fjLJciV7apXFpG4YZFN9BqPGacuGxjAN6D3zLplMsQERNRQ19
   g==;
X-CSE-ConnectionGUID: ERatPvDcQZ24KraGGKq9Kw==
X-CSE-MsgGUID: GTmDYJrKQOSY4ZYA3EGDHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50942902"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="50942902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:14:58 -0700
X-CSE-ConnectionGUID: D1cPYu/IRiiJ53fhWIsybQ==
X-CSE-MsgGUID: sTYYXN1WQL+DBPb1BU4mRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183683529"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2025 00:14:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBpXC-000D8r-2v;
	Thu, 23 Oct 2025 07:14:54 +0000
Date: Thu, 23 Oct 2025 15:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH UNVERIFIED WARNING
 93741bd104ce07a790519ecee3a331ee7cf61ae3
Message-ID: <202510231523.YHON16Ml-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 93741bd104ce07a790519ecee3a331ee7cf61ae3  usb: uhci: Work around bogus clang shift overflow warning from DMA_BIT_MASK(64)

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
    drivers/usb/typec/mux/ps883x.c:171 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20251023
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
|-- arm64-randconfig-052-20251023
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
|-- arm64-randconfig-053-20251023
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
|-- arm64-randconfig-054-20251023
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
|-- arm64-randconfig-055-20251023
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
`-- i386-randconfig-141-20251023
    `-- drivers-usb-typec-mux-ps883x.c-ps883x_sw_set()-warn:inconsistent-returns-retimer-lock-.

elapsed time: 1285m

configs tested: 225
configs skipped: 3

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251022    gcc-13.4.0
arc                   randconfig-001-20251023    gcc-8.5.0
arc                   randconfig-002-20251022    gcc-8.5.0
arc                   randconfig-002-20251023    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                           h3600_defconfig    gcc-15.1.0
arm                   randconfig-001-20251022    gcc-11.5.0
arm                   randconfig-001-20251023    gcc-8.5.0
arm                   randconfig-002-20251022    gcc-10.5.0
arm                   randconfig-002-20251023    gcc-8.5.0
arm                   randconfig-003-20251022    gcc-10.5.0
arm                   randconfig-003-20251023    gcc-8.5.0
arm                   randconfig-004-20251022    clang-22
arm                   randconfig-004-20251023    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251022    gcc-9.5.0
arm64                 randconfig-001-20251023    gcc-8.5.0
arm64                 randconfig-002-20251022    clang-18
arm64                 randconfig-002-20251023    gcc-8.5.0
arm64                 randconfig-003-20251022    gcc-10.5.0
arm64                 randconfig-003-20251023    gcc-8.5.0
arm64                 randconfig-004-20251022    gcc-12.5.0
arm64                 randconfig-004-20251023    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251022    gcc-15.1.0
csky                  randconfig-001-20251023    gcc-10.5.0
csky                  randconfig-002-20251022    gcc-11.5.0
csky                  randconfig-002-20251023    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251022    clang-22
hexagon               randconfig-001-20251023    gcc-10.5.0
hexagon               randconfig-002-20251022    clang-22
hexagon               randconfig-002-20251023    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251022    clang-20
i386        buildonly-randconfig-001-20251023    clang-20
i386        buildonly-randconfig-002-20251022    clang-20
i386        buildonly-randconfig-002-20251023    clang-20
i386        buildonly-randconfig-003-20251022    gcc-14
i386        buildonly-randconfig-003-20251023    clang-20
i386        buildonly-randconfig-004-20251022    clang-20
i386        buildonly-randconfig-004-20251023    clang-20
i386        buildonly-randconfig-005-20251022    gcc-12
i386        buildonly-randconfig-005-20251023    clang-20
i386        buildonly-randconfig-006-20251022    gcc-14
i386        buildonly-randconfig-006-20251023    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251023    clang-20
i386                  randconfig-002-20251023    clang-20
i386                  randconfig-003-20251023    clang-20
i386                  randconfig-004-20251023    clang-20
i386                  randconfig-005-20251023    clang-20
i386                  randconfig-006-20251023    clang-20
i386                  randconfig-007-20251023    clang-20
i386                  randconfig-011-20251023    gcc-14
i386                  randconfig-012-20251023    gcc-14
i386                  randconfig-013-20251023    gcc-14
i386                  randconfig-014-20251023    gcc-14
i386                  randconfig-015-20251023    gcc-14
i386                  randconfig-016-20251023    gcc-14
i386                  randconfig-017-20251023    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251022    gcc-12.5.0
loongarch             randconfig-001-20251023    gcc-10.5.0
loongarch             randconfig-002-20251022    gcc-15.1.0
loongarch             randconfig-002-20251023    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251022    gcc-8.5.0
nios2                 randconfig-001-20251023    gcc-10.5.0
nios2                 randconfig-002-20251022    gcc-10.5.0
nios2                 randconfig-002-20251023    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251022    gcc-13.4.0
parisc                randconfig-001-20251023    gcc-10.5.0
parisc                randconfig-002-20251022    gcc-10.5.0
parisc                randconfig-002-20251023    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     asp8347_defconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251022    gcc-8.5.0
powerpc               randconfig-001-20251023    gcc-10.5.0
powerpc               randconfig-002-20251022    gcc-8.5.0
powerpc               randconfig-002-20251023    gcc-10.5.0
powerpc               randconfig-003-20251022    gcc-8.5.0
powerpc               randconfig-003-20251023    gcc-10.5.0
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251022    gcc-8.5.0
powerpc64             randconfig-001-20251023    gcc-10.5.0
powerpc64             randconfig-002-20251022    gcc-8.5.0
powerpc64             randconfig-002-20251023    gcc-10.5.0
powerpc64             randconfig-003-20251022    clang-22
powerpc64             randconfig-003-20251023    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251023    gcc-8.5.0
riscv                 randconfig-002-20251023    gcc-14.3.0
riscv                 randconfig-002-20251023    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251023    clang-19
s390                  randconfig-001-20251023    gcc-8.5.0
s390                  randconfig-002-20251023    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-8.5.0
sh                    randconfig-002-20251023    gcc-15.1.0
sh                    randconfig-002-20251023    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251023    gcc-12.5.0
sparc                 randconfig-001-20251023    gcc-8.5.0
sparc                 randconfig-002-20251023    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251023    clang-22
sparc64               randconfig-001-20251023    gcc-8.5.0
sparc64               randconfig-002-20251023    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251023    gcc-13
um                    randconfig-001-20251023    gcc-8.5.0
um                    randconfig-002-20251023    gcc-14
um                    randconfig-002-20251023    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251022    clang-20
x86_64      buildonly-randconfig-001-20251023    gcc-14
x86_64      buildonly-randconfig-002-20251022    gcc-14
x86_64      buildonly-randconfig-002-20251023    gcc-14
x86_64      buildonly-randconfig-003-20251022    gcc-14
x86_64      buildonly-randconfig-003-20251023    gcc-14
x86_64      buildonly-randconfig-004-20251022    clang-20
x86_64      buildonly-randconfig-004-20251023    gcc-14
x86_64      buildonly-randconfig-005-20251022    gcc-14
x86_64      buildonly-randconfig-005-20251023    gcc-14
x86_64      buildonly-randconfig-006-20251022    gcc-14
x86_64      buildonly-randconfig-006-20251023    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251023    clang-20
x86_64                randconfig-072-20251023    clang-20
x86_64                randconfig-073-20251023    clang-20
x86_64                randconfig-074-20251023    clang-20
x86_64                randconfig-075-20251023    clang-20
x86_64                randconfig-076-20251023    clang-20
x86_64                randconfig-077-20251023    clang-20
x86_64                randconfig-078-20251023    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251023    gcc-8.5.0
xtensa                randconfig-002-20251023    gcc-13.4.0
xtensa                randconfig-002-20251023    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

