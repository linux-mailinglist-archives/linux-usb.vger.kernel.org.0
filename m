Return-Path: <linux-usb+bounces-29615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2AC05716
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 11:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8BC3A3595AE
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F9E30CDA3;
	Fri, 24 Oct 2025 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5n0SO5h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133B28314A
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299674; cv=none; b=L23Q0GT0da0g9ngGt4MTr7TZsdKFCmVNvlXGBwwLVSaiujudQT9Sdfn9/lifodET83yDJhF2bw5+HgUGJ7AgSFhstuznLVfna9JHY8refmfS1G4b716sDdDr6a+VXF3ljjonvEylslBRv5CGYKzh0W89Wsd8ueBZBT/gP7EagQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299674; c=relaxed/simple;
	bh=JTV4ylLZ4A9fPlBmOJEgAuFaBKLfVpvNwkcx8RV2D10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J/vZtfukOt48Cnf57O/+0gadzIM0wQ9MjMWe2E7gBbUj0FkxDhA0WU1wXjAKrkHlnd5cvMrtg3rT/8re9onta49qj0SzkE4MV/i5XLZeIGrvjsx8Jqw2toBbctaH5666D+rGkMZGVv8GVaMQ6FTT2Frgwk42WlxKKQp8FikmBP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5n0SO5h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761299672; x=1792835672;
  h=date:from:to:cc:subject:message-id;
  bh=JTV4ylLZ4A9fPlBmOJEgAuFaBKLfVpvNwkcx8RV2D10=;
  b=l5n0SO5hWDmjxaUjssiLSEIgJUNgNGJ03dep5ukRKESJ3guxkj67H0fX
   Mkm481JUPFHyKt7fBVQMUNf7/WKcGDU2xel2fNfDA5ERRh8uhfmJN+mqR
   QqG3jktf77a+DJjqa1B2CyCHPKLkoeywVX0GbHNWYWl0VQKD5G0xL9DtT
   1H3f7j32vZYtZfKs8jCrCjVHbR6VDtl8zhjP/V0DW+shD6XRKoFSVXfXW
   8jCuC6KYfkUXe37YH615TFNAZJtwoNUxKBErdKGHdri/FbfTIwbmWEAM0
   ud4OoB/3sYwuGzE5ie4SAzIOHGtIRp6gsZiDkW0gaO6sig2eXtIJzEfus
   Q==;
X-CSE-ConnectionGUID: wQGcxQszTp6+wmbXV47A2A==
X-CSE-MsgGUID: 7k4UrMB+S1yJxp8MFmRUjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67345762"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="67345762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 02:54:32 -0700
X-CSE-ConnectionGUID: smAErtDpSrmJqCjlZ5IG6g==
X-CSE-MsgGUID: c8igCfCFQu2Vyo2e/vV7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184286305"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 02:54:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCEV9-000EPo-2e;
	Fri, 24 Oct 2025 09:54:27 +0000
Date: Fri, 24 Oct 2025 17:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH UNVERIFIED WARNING
 d227a8b3e715963b7c034971c3b467d5430a2cab
Message-ID: <202510241757.6Sg1rZeo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d227a8b3e715963b7c034971c3b467d5430a2cab  usb: typec: ps883x: Fix missing mutex_unlock()

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
|-- arm64-randconfig-051-20251024
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
|-- arm64-randconfig-052-20251024
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
|-- arm64-randconfig-053-20251024
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
|-- arm64-randconfig-054-20251024
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
`-- arm64-randconfig-055-20251024
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

elapsed time: 1450m

configs tested: 149
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251023    gcc-8.5.0
arc                   randconfig-002-20251023    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20251023    clang-22
arm                   randconfig-002-20251023    clang-19
arm                   randconfig-003-20251023    gcc-8.5.0
arm                   randconfig-004-20251023    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251023    clang-22
arm64                 randconfig-002-20251023    gcc-8.5.0
arm64                 randconfig-003-20251023    gcc-8.5.0
arm64                 randconfig-004-20251023    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251023    gcc-11.5.0
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-002-20251023    gcc-13.4.0
csky                  randconfig-002-20251024    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251023    clang-22
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-002-20251023    clang-22
hexagon               randconfig-002-20251024    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251023    clang-20
i386        buildonly-randconfig-002-20251023    clang-20
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-003-20251023    gcc-14
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-004-20251023    clang-20
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-005-20251023    clang-20
i386        buildonly-randconfig-006-20251023    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251023    clang-22
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-002-20251023    clang-18
loongarch             randconfig-002-20251024    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251023    gcc-8.5.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-002-20251023    gcc-8.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251023    gcc-9.5.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-002-20251023    gcc-8.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251023    gcc-12.5.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251023    clang-22
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-003-20251023    clang-22
powerpc               randconfig-003-20251024    clang-16
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20251023    clang-22
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-002-20251023    gcc-10.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-003-20251023    gcc-10.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251023    gcc-8.5.0
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-002-20251023    gcc-14.3.0
riscv                 randconfig-002-20251024    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251023    clang-19
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-002-20251023    gcc-8.5.0
s390                  randconfig-002-20251024    clang-22
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-15.1.0
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-002-20251023    gcc-15.1.0
sh                    randconfig-002-20251024    gcc-14.3.0
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251023    gcc-12.5.0
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-002-20251023    gcc-8.5.0
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc64               randconfig-001-20251023    clang-22
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-002-20251023    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251023    gcc-13
um                    randconfig-002-20251023    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251023    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-002-20251023    gcc-13
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-003-20251023    clang-20
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-004-20251023    gcc-14
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251023    clang-20
x86_64      buildonly-randconfig-006-20251023    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251023    gcc-8.5.0
xtensa                randconfig-002-20251023    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

