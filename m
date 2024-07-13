Return-Path: <linux-usb+bounces-12187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFF93032B
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 04:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ED0228295D
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 02:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD50101E6;
	Sat, 13 Jul 2024 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWu+ZxNg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D73D6B
	for <linux-usb@vger.kernel.org>; Sat, 13 Jul 2024 02:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720836543; cv=none; b=LR7ocLGga507pOc0SLhiUhWmLNO/atSOJ+ykvs5Il1BoqrVJkOg4J5SDn6G4+eMcC2JxKXm5CS0T6RyBlT2D3p8FjPpKj3bmLSXmiaSUHpyQQ9bw8Haq1STIeKbuFjqNLvRh737PuhPn2Qp0gtyO8eCaCuHtzu155mYt5kLD1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720836543; c=relaxed/simple;
	bh=/KcTT5fiNz0UHpcdY1VKFOpfY18DxGvriyoBn0m00mM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MUbJhfp6hDKBcZImPLbkcjqDo8T+XDYPvXTeij3z2O3sW829fHodEZtmu2LbJsGRlMqcv69XHVAHR9fSb1Qw+r3uSyNchhVcKePhANaUtVNo9MWsHDlfvVwkHNYPaWHoXe1V+TiZedxvMg9PeO5yyviekJ/SurXjMye+Jur4eRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWu+ZxNg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720836540; x=1752372540;
  h=date:from:to:cc:subject:message-id;
  bh=/KcTT5fiNz0UHpcdY1VKFOpfY18DxGvriyoBn0m00mM=;
  b=MWu+ZxNgrnS/WMPaN8Nw0d4sPQJpL2EUoElIn8KkgL70G60wkb8fhCMx
   jXwoHfqPkrcARMkJrVdtWclhXz/TLvaXWZFhGvhomjxtITMFJ4SrvBJTU
   ISarltwXly90AURxmIE3tVOmon0XcFPt22dalJXMMBt+H8JnsaFbRsULK
   f4gv8S3WpsyzLzJ63DI4naRqc3xpS1Rrc4tqaXRH97jCLbNyjLMWAo8n8
   4O6R3zqi5mSgcbuq++scY37lLz1SUhN9j0l3wCQZdCcou18svjDj71mRV
   d1+m2yqEETepBp+V3vY66qfsw2OTZD5hZw1N85HpNqexowensY3Fqbwl9
   Q==;
X-CSE-ConnectionGUID: VJAHEe1IRfeAzPhVQcwJPg==
X-CSE-MsgGUID: papOn2vAR96w8eiVQ1vzkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="21210147"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="21210147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 19:08:59 -0700
X-CSE-ConnectionGUID: EAsBzQGjQbadqQli1PtLLQ==
X-CSE-MsgGUID: /gh+oHHSSSKrpMWpUNYUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48972556"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jul 2024 19:08:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSSBz-000bYG-2e;
	Sat, 13 Jul 2024 02:08:55 +0000
Date: Sat, 13 Jul 2024 10:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b727493011123db329e2901e3abf81a8d146b6fe
Message-ID: <202407131006.PX690bOd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: b727493011123db329e2901e3abf81a8d146b6fe  kselftest: devices: Add test to detect device error logs

Unverified Warning (likely false positive, please contact us if interested):

arch/powerpc/boot/dts/fsl/mvme2500.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1023rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p2020ds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1024qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/t1024rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t2080qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t2081qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t2081qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20240712
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:dm_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:dp_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:dm_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:dp_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
|   |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:dm_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:dp_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:dm_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:dp_hs_phy_irq-was-expected
|   |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
|   `-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-was-expected
`-- powerpc-randconfig-051-20240712
    |-- arch-powerpc-boot-dts-fsl-mvme2500.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-mvme2500.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-oca4080.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pa.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pa.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pa_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pa_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pb_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1010rdb-pb_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020mbg-pc_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020mbg-pc_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020mbg-pc_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020mbg-pc_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_32b.dtb:usb:phy_type-is-a-required-property
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_36b.dtb:usb:phy_type-is-a-required-property
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_camp_core0.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_camp_core0.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_camp_core0.dtb:usb:phy_type-is-a-required-property
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_camp_core1.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_camp_core1.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pc_camp_core1.dtb:usb:phy_type-is-a-required-property
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pd.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pd.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb-pd.dtb:usb:phy_type-is-a-required-property
    |-- arch-powerpc-boot-dts-fsl-p1020rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020rdb_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020rdb_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020utm-pc_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020utm-pc_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1020utm-pc_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1020utm-pc_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1021mds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1021mds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1021rdb-pc_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1021rdb-pc_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1021rdb-pc_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1021rdb-pc_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1022ds_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1022ds_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1022ds_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1022ds_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1022rdk.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1022rdk.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1023rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1023rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1024rdb_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1024rdb_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1024rdb_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1024rdb_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1025rdb_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1025rdb_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1025rdb_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1025rdb_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p1025twr.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p1025twr.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p2020ds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p2020ds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p2020rdb-pc_32b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p2020rdb-pc_32b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p2020rdb-pc_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p2020rdb-pc_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p2020rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p2020rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p2041rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p2041rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p3041ds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p3041ds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p4080ds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p4080ds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p5020ds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p5020ds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-p5040ds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-p5040ds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1023rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1023rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1023rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1024qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1024qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1024qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1024rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1024rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1024rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1040d4rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040d4rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040d4rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1040qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1040rdb-rev-a.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040rdb-rev-a.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040rdb-rev-a.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1040rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1040rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1042d4rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042d4rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042d4rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1042qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1042rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t1042rdb_pi.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042rdb_pi.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t1042rdb_pi.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t2080qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t2080qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t2080qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t2080rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t2080rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t2080rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t2081qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t2081qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t2081qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t4240qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t4240qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t4240qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-t4240rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-t4240rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    `-- arch-powerpc-boot-dts-fsl-t4240rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:

elapsed time: 969m

configs tested: 186
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240713   gcc-13.2.0
arc                   randconfig-002-20240713   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                          pxa168_defconfig   gcc-13.2.0
arm                             pxa_defconfig   gcc-13.2.0
arm                   randconfig-001-20240713   gcc-13.2.0
arm                   randconfig-002-20240713   gcc-13.2.0
arm                   randconfig-003-20240713   gcc-13.2.0
arm                   randconfig-004-20240713   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240713   gcc-13.2.0
arm64                 randconfig-002-20240713   gcc-13.2.0
arm64                 randconfig-003-20240713   gcc-13.2.0
arm64                 randconfig-004-20240713   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240713   gcc-13.2.0
csky                  randconfig-002-20240713   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   clang-18
i386         buildonly-randconfig-003-20240713   gcc-8
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   clang-18
i386         buildonly-randconfig-005-20240713   gcc-13
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   clang-18
i386                  randconfig-001-20240713   gcc-10
i386                  randconfig-002-20240713   clang-18
i386                  randconfig-002-20240713   gcc-13
i386                  randconfig-003-20240713   clang-18
i386                  randconfig-003-20240713   gcc-13
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   clang-18
i386                  randconfig-005-20240713   gcc-10
i386                  randconfig-006-20240713   clang-18
i386                  randconfig-006-20240713   gcc-12
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   clang-18
i386                  randconfig-012-20240713   gcc-7
i386                  randconfig-013-20240713   clang-18
i386                  randconfig-013-20240713   gcc-13
i386                  randconfig-014-20240713   clang-18
i386                  randconfig-014-20240713   gcc-13
i386                  randconfig-015-20240713   clang-18
i386                  randconfig-015-20240713   gcc-11
i386                  randconfig-016-20240713   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240713   gcc-13.2.0
loongarch             randconfig-002-20240713   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        omega2p_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240713   gcc-13.2.0
nios2                 randconfig-002-20240713   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240713   gcc-13.2.0
parisc                randconfig-002-20240713   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240713   gcc-13.2.0
powerpc               randconfig-002-20240713   gcc-13.2.0
powerpc               randconfig-003-20240713   gcc-13.2.0
powerpc                        warp_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240713   gcc-13.2.0
powerpc64             randconfig-002-20240713   gcc-13.2.0
powerpc64             randconfig-003-20240713   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240713   gcc-13.2.0
riscv                 randconfig-002-20240713   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240713   gcc-13.2.0
s390                  randconfig-002-20240713   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240713   gcc-13.2.0
sh                    randconfig-002-20240713   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240713   gcc-13.2.0
sparc64               randconfig-002-20240713   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240713   gcc-13.2.0
um                    randconfig-002-20240713   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   clang-18
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   clang-18
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   clang-18
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   clang-18
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   clang-18
x86_64                randconfig-016-20240713   clang-18
x86_64                randconfig-071-20240713   clang-18
x86_64                randconfig-072-20240713   clang-18
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   clang-18
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240713   gcc-13.2.0
xtensa                randconfig-002-20240713   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

