Return-Path: <linux-usb+bounces-13217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84994B5F4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 06:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7B01C21219
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 04:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A3883A17;
	Thu,  8 Aug 2024 04:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ES1EfYZ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F633F7
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 04:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723091914; cv=none; b=okJg2Qq5KIUXLvjRfiyB6rFE8yS68qCc6YsdoUTfOCh0zM1rYg+jxrn1NZUKXdasi4qLe6F00EtIbLzYUCuCCN8ltcygyBUw/MkxzJlPqVxAe3GWgX/5n6MspTsTW4szCO8kMGhgKrdzfsVNohXxNnC2ZPqFEJJ4czY/YeSZG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723091914; c=relaxed/simple;
	bh=B2esHlfLEmnM6Lwsv/7z3Zn1L6ipdenO8iHp/X7U8rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EBK2z1/H81HKeAi59E38IR33QablfXrZfvz/O8pid6cnFGEIbM8wlrJIwe71x4Keaf/8WFFcKPBNQnVECNQ+MlgKLcczQ227CHcpsKBwpmeVunRIQ5u3gfc0BuI/VUdAy+ePTQ5I+JehU0GhjSx7+Lz6YngKFb04o4iGPClkMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ES1EfYZ5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723091911; x=1754627911;
  h=date:from:to:cc:subject:message-id;
  bh=B2esHlfLEmnM6Lwsv/7z3Zn1L6ipdenO8iHp/X7U8rU=;
  b=ES1EfYZ50GCm3CLlRHBJQ7aVP03Gb2kvhSu/QztSSZ5zFMHXlUNB+33a
   MGcYn3vDMPYMLBs0M6E438PoEUWB8Jd0Umi3Ru64LOs2T07uEzY/umSIq
   XZz1B0ZWf3YzrIvfA+U9deBvofJORNcOLfUdQaNuCYIwxtqqe8KO7t7am
   LdowxAdeIlJXgnstPW9FZ9cSZKq3EDsciiF7NyRb1EFg8wUBvt6BxZAaH
   eW9PxujrsGuh57ZyXwenzUjnEjnAoW86OJhZPHiI3WrlVjqRSXyNMxP2e
   y/X/nrWIj+SdG1ZGckmGSfOTyPDgyWDavg3qypcoNafxTXZ27WlGxPfE+
   Q==;
X-CSE-ConnectionGUID: r0T5wSq5Tl+sfo9qKGZzuA==
X-CSE-MsgGUID: 2CaP3GkaQQmixUiGJPSuWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43716356"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="43716356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 21:38:30 -0700
X-CSE-ConnectionGUID: zy+jc8HPTQyeHsB5LqZ7Xg==
X-CSE-MsgGUID: os1TqRn7TmyfEWHwdwal5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="87747356"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2024 21:38:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbuto-0005wE-20;
	Thu, 08 Aug 2024 04:37:44 +0000
Date: Thu, 08 Aug 2024 12:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 25f51b76f90f10f9bf2fbc05fc51cf685da7ccad
Message-ID: <202408081220.nb7t6LJE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 25f51b76f90f10f9bf2fbc05fc51cf685da7ccad  xhci-pci: Make xhci-pci-renesas a proper modular driver

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20240807
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clock-names:sleep-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clocks:is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clock-names:sleep-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clocks:is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clock-names:sleep-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clocks:is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clock-names:sleep-was-expected
|   |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clocks:is-too-long
|   |-- arch-arm64-boot-dts-ti-k3-am642-evm-nand.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-ti-k3-am642-evm.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-ti-k3-am642-hummingboard-t-pcie.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-ti-k3-am642-hummingboard-t-usb3.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-ti-k3-am642-hummingboard-t.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-ti-k3-am642-phyboard-electra-rdk.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-ti-k3-am642-sk.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-ti-k3-am642-tqma64xxl-mbax4xxl.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
`-- powerpc-randconfig-051-20240807
    |-- arch-powerpc-boot-dts-asp834x-redboot.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-b4420qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-b4420qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-b4860qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-b4860qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-bsc9131rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-bsc9131rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-bsc9132qds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-bsc9132qds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-cyrus_p5020.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-fsl-iommu-parent-fsl-liodn-reg-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-cyrus_p5020.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-ge_imp3a.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-ge_imp3a.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-kmcent2.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-kmcoge4.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds.dtb:usb-2b000:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds.dtb:usb-2b000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds_36b.dtb:usb-2b000:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds_36b.dtb:usb-2b000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds_36b.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    |-- arch-powerpc-boot-dts-fsl-mpc8536ds_36b.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
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
    |-- arch-powerpc-boot-dts-fsl-t4240rdb.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-powerpc-boot-dts-mpc8308_p1m.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8308rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8313erdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-sleep-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8315erdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8349emitx.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8349emitxgp.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8377_rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-sleep-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8377_wlan.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-sleep-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8378_rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-sleep-were-unexpected)
    |-- arch-powerpc-boot-dts-mpc8379_rdb.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-sleep-were-unexpected)
    |-- arch-powerpc-boot-dts-turris1x.dtb:usb:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-compatible-were-unexpected)
    `-- arch-powerpc-boot-dts-turris1x.dtb:usb:compatible:oneOf-conditional-failed-one-must-be-fixed:

elapsed time: 992m

configs tested: 213
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240808   gcc-13.2.0
arc                   randconfig-002-20240808   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-14.1.0
arm                        neponset_defconfig   gcc-13.2.0
arm                   randconfig-001-20240808   gcc-13.2.0
arm                   randconfig-002-20240808   gcc-13.2.0
arm                   randconfig-003-20240808   gcc-13.2.0
arm                   randconfig-004-20240808   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           stm32_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240808   gcc-13.2.0
arm64                 randconfig-002-20240808   gcc-13.2.0
arm64                 randconfig-003-20240808   gcc-13.2.0
arm64                 randconfig-004-20240808   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240808   gcc-13.2.0
csky                  randconfig-002-20240808   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             alldefconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240808   clang-18
i386         buildonly-randconfig-002-20240808   clang-18
i386         buildonly-randconfig-002-20240808   gcc-12
i386         buildonly-randconfig-003-20240808   clang-18
i386         buildonly-randconfig-004-20240808   clang-18
i386         buildonly-randconfig-005-20240808   clang-18
i386         buildonly-randconfig-006-20240808   clang-18
i386         buildonly-randconfig-006-20240808   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240808   clang-18
i386                  randconfig-001-20240808   gcc-12
i386                  randconfig-002-20240808   clang-18
i386                  randconfig-002-20240808   gcc-12
i386                  randconfig-003-20240808   clang-18
i386                  randconfig-004-20240808   clang-18
i386                  randconfig-004-20240808   gcc-12
i386                  randconfig-005-20240808   clang-18
i386                  randconfig-005-20240808   gcc-12
i386                  randconfig-006-20240808   clang-18
i386                  randconfig-006-20240808   gcc-12
i386                  randconfig-011-20240808   clang-18
i386                  randconfig-012-20240808   clang-18
i386                  randconfig-012-20240808   gcc-11
i386                  randconfig-013-20240808   clang-18
i386                  randconfig-014-20240808   clang-18
i386                  randconfig-014-20240808   gcc-11
i386                  randconfig-015-20240808   clang-18
i386                  randconfig-015-20240808   gcc-12
i386                  randconfig-016-20240808   clang-18
i386                  randconfig-016-20240808   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240808   gcc-13.2.0
loongarch             randconfig-002-20240808   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm47xx_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-14.1.0
mips                     decstation_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240808   gcc-13.2.0
nios2                 randconfig-002-20240808   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240808   gcc-13.2.0
parisc                randconfig-002-20240808   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240808   gcc-13.2.0
powerpc               randconfig-002-20240808   gcc-13.2.0
powerpc                     skiroot_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240808   gcc-13.2.0
powerpc64             randconfig-002-20240808   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240808   gcc-13.2.0
riscv                 randconfig-002-20240808   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240808   gcc-13.2.0
s390                  randconfig-002-20240808   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240808   gcc-13.2.0
sh                    randconfig-002-20240808   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-14.1.0
sh                           se7705_defconfig   gcc-14.1.0
sh                           se7721_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240808   gcc-13.2.0
sparc64               randconfig-002-20240808   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240808   gcc-13.2.0
um                    randconfig-002-20240808   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240808   gcc-12
x86_64       buildonly-randconfig-002-20240808   gcc-12
x86_64       buildonly-randconfig-003-20240808   gcc-12
x86_64       buildonly-randconfig-004-20240808   gcc-12
x86_64       buildonly-randconfig-005-20240808   gcc-12
x86_64       buildonly-randconfig-006-20240808   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240808   gcc-12
x86_64                randconfig-002-20240808   gcc-12
x86_64                randconfig-003-20240808   gcc-12
x86_64                randconfig-004-20240808   gcc-12
x86_64                randconfig-005-20240808   gcc-12
x86_64                randconfig-006-20240808   gcc-12
x86_64                randconfig-011-20240808   gcc-12
x86_64                randconfig-012-20240808   gcc-12
x86_64                randconfig-013-20240808   gcc-12
x86_64                randconfig-014-20240808   gcc-12
x86_64                randconfig-015-20240808   gcc-12
x86_64                randconfig-016-20240808   gcc-12
x86_64                randconfig-071-20240808   gcc-12
x86_64                randconfig-072-20240808   gcc-12
x86_64                randconfig-073-20240808   gcc-12
x86_64                randconfig-074-20240808   gcc-12
x86_64                randconfig-075-20240808   gcc-12
x86_64                randconfig-076-20240808   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240808   gcc-13.2.0
xtensa                randconfig-002-20240808   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

