Return-Path: <linux-usb+bounces-29277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C7BD80B9
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 09:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C6064F445C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 07:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE6F30E85F;
	Tue, 14 Oct 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0leJRQd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A62BD597
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428763; cv=none; b=sX9riG/Zc4+/nvXl34vDPEtoh+Eki8vwLzVGbIBDzxPyqpszyYHbZfOROVW+D+GYjKyF6UbyEOll+eExcrX17N8keW3hmzbH2iLXT7pfxpkaFv6QyL+vbbNWAGGuX1Vl7cOT4z9hsG2Q4rdaDTOpl+7jtAN6rFNHzsBfg/E4MbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428763; c=relaxed/simple;
	bh=M/VIwVHimauTcEQ8n6NZxUxLUEi84/VrwvvX0Gh+aMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s3Gb5jwkTsxNH1DhRwbNNrVgD9++PVMVy6edCvd7RnvhToA3O1EZFCaDk9hvwbuYMMSoPL8oNTKti35gCat6c2iopEYFFXqW+mKGnACSirhnxpvRoa8xYPK1w0b77gVtqBJBWQM+D2oWj69mhprnZ39Z/MSES71kIxQba7HsZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0leJRQd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760428761; x=1791964761;
  h=date:from:to:cc:subject:message-id;
  bh=M/VIwVHimauTcEQ8n6NZxUxLUEi84/VrwvvX0Gh+aMc=;
  b=H0leJRQdgv8xTCW+l+6KHztmdspZXz+n0rK2SlPmuQXtC0CoEcw5KypH
   bp4oT88t3o5RmMSr0NxKVdTpDAXrqtG6nRDmSdXJ2TUtvFUQkDCI2TTQz
   GBK6Zau2C5OZV7Nm5PctgMP8Vt3Fk98X4jRaSP4xHV61AfWn+bVDAy3nW
   hEliUdI/NMd6CTNq+7p+gBWKmK79ZcZYa5PAuBOIyAmyNMjorHU+3Do87
   lIgtk2PS8i1QKLMV7K3kiHRWifV/zGX3B9q3aaQWFTI5bA4JtjAXMiC80
   Usb3G+JiiSlnvv0hBNvTc8UuknwTrNIfYOLE+ozvD8vARG3GNtPj1Td+A
   Q==;
X-CSE-ConnectionGUID: xas9C4+UT7i+pteHKA4G2A==
X-CSE-MsgGUID: hzRpR9DLSu6UiYbQyJ4rAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73261740"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73261740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:59:20 -0700
X-CSE-ConnectionGUID: +WVYHxo1Ruqp9EuXlcjSlA==
X-CSE-MsgGUID: TdPgkGUVSZGONbtnuB9vpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="187115293"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2025 00:59:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ZwD-0002X9-02;
	Tue, 14 Oct 2025 07:59:17 +0000
Date: Tue, 14 Oct 2025 15:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 877c80dfbf788e57a3338627899033b7007037ee
Message-ID: <202510141537.2KuOF5ua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 877c80dfbf788e57a3338627899033b7007037ee  usb: ljca: Improve ACPI hardware ID documentation

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
|-- arm64-randconfig-051-20251013
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
|-- arm64-randconfig-052-20251013
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
|-- arm64-randconfig-053-20251013
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
|-- arm64-randconfig-054-20251013
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
`-- arm64-randconfig-055-20251013
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

elapsed time: 1379m

configs tested: 133
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251013    gcc-8.5.0
arc                   randconfig-002-20251013    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-19
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251013    gcc-10.5.0
arm                   randconfig-002-20251013    clang-22
arm                   randconfig-003-20251013    gcc-12.5.0
arm                   randconfig-004-20251013    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251013    clang-19
arm64                 randconfig-002-20251013    gcc-8.5.0
arm64                 randconfig-003-20251013    clang-22
arm64                 randconfig-004-20251013    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251013    gcc-15.1.0
csky                  randconfig-002-20251013    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251013    clang-22
hexagon               randconfig-002-20251013    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251013    gcc-13
i386        buildonly-randconfig-002-20251013    clang-20
i386        buildonly-randconfig-003-20251013    gcc-14
i386        buildonly-randconfig-004-20251013    clang-20
i386        buildonly-randconfig-005-20251013    gcc-14
i386        buildonly-randconfig-006-20251013    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251013    clang-18
loongarch             randconfig-002-20251013    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251013    gcc-8.5.0
nios2                 randconfig-002-20251013    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251013    gcc-12.5.0
parisc                randconfig-002-20251013    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251013    clang-22
powerpc               randconfig-002-20251013    clang-18
powerpc               randconfig-003-20251013    clang-22
powerpc                     redwood_defconfig    clang-22
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251013    gcc-10.5.0
powerpc64             randconfig-002-20251013    gcc-15.1.0
powerpc64             randconfig-003-20251013    clang-20
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251013    clang-22
riscv                 randconfig-002-20251013    clang-22
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251013    gcc-8.5.0
s390                  randconfig-002-20251013    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251013    gcc-10.5.0
sh                    randconfig-002-20251013    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251013    gcc-8.5.0
sparc                 randconfig-002-20251013    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251013    clang-20
sparc64               randconfig-002-20251013    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251013    gcc-14
um                    randconfig-002-20251013    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251013    gcc-13
x86_64      buildonly-randconfig-002-20251013    clang-20
x86_64      buildonly-randconfig-003-20251013    clang-20
x86_64      buildonly-randconfig-004-20251013    gcc-14
x86_64      buildonly-randconfig-005-20251013    clang-20
x86_64      buildonly-randconfig-006-20251013    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251013    gcc-11.5.0
xtensa                randconfig-002-20251013    gcc-11.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

