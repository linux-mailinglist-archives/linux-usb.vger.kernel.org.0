Return-Path: <linux-usb+bounces-25194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E83AEBEE2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 20:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A1656194E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8278F2EAD1C;
	Fri, 27 Jun 2025 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGcVmWHj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48EE15E8B
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047821; cv=none; b=SYkM48e4v9Wemzw+cpWCis/WBMft+we/Y69BdUNpXQUI3MfpROoz+9N0B1IPwPzTOvVDH27YTrVmPVdl1utMo/kp+Nj9A7ecbC21jYgsWiV/9KH/z8TfPJ9HaF0f1hL9fr1ZZKLn7Tb4fxnMC0mrnkovKYtvVjHp/DKYxBckM2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047821; c=relaxed/simple;
	bh=lqLeBSwj5XYTKIyBsdFivWoTkaqDhkbbkSmbiy68E5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RmYBRxxiNXn9QeYMa/UfVC61LJukBu0AwENLpTgvEohYQ6HrXcnGSdbUuhSmXs/sW8Uk1VwEIJilTrD64nOr3Oi8Glx03VpbhSBCoyZRlF4UuCtMZcz/A6/W9ijMTy565dPdhsFErpR8aaoUxpasViuHWGGkiq4Qdf8ZJcPJLYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGcVmWHj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751047820; x=1782583820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lqLeBSwj5XYTKIyBsdFivWoTkaqDhkbbkSmbiy68E5U=;
  b=aGcVmWHjO8MHT1qvz/cPTofVwIOS++Nh66hUCdflqNEMvAkkSTwEmK/d
   NG9d0RSRZMZUy4eN7lRRbT+bGKmZcaB9FBZl0YAfzNQY7mmEthFQNI2T1
   uROhdhmQcA8AeBaETMFfco6gvLnPQRVugGFm9XBXAZMZMyRFQITq/xBTU
   CIKGCfJ+Cj07dK7hBPgaZqUyEmWSZ3IA2aib4hKNIPe95HAG5wrAvD4+P
   IFGtIpGQL1jXD4ZIbW1QRIvSehVjPwwgripFspMyCCZsRQ+GzNMYMbTs8
   PP+Zuqy7YkVu9UeMQPeslqvR3Dkx09+4Dqu2ZQt1N0fULPY4Fvwe1FLSa
   Q==;
X-CSE-ConnectionGUID: 5LeD1UEYQ4CIbcRb/m2Flw==
X-CSE-MsgGUID: PujTfA9nSXSBDRD+XZfa8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53309976"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53309976"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:10:19 -0700
X-CSE-ConnectionGUID: l5gBQt+yS42JHkzRHBp6rg==
X-CSE-MsgGUID: B8qgAUytTyiJrF2hXfU1iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="183773538"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 11:10:19 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com
Subject: [PATCH v2 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Fri, 27 Jun 2025 11:10:09 -0700
Message-Id: <cover.1751042810.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements support for UCSI SET_PDOS command. It provides
interface to send message out data structure and update source or sink
capabilities PDOs on a connector over debugfs interface.

Pooja Katiyar (3):
  usb: typec: ucsi: Add support for message out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/cros_ec_ucsi.c |  4 +-
 drivers/usb/typec/ucsi/debugfs.c      | 33 +++++++++++++-
 drivers/usb/typec/ucsi/displayport.c  |  6 +--
 drivers/usb/typec/ucsi/ucsi.c         | 64 ++++++++++++++++-----------
 drivers/usb/typec/ucsi/ucsi.h         | 14 ++++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 20 ++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  4 +-
 7 files changed, 105 insertions(+), 40 deletions(-)

-- 
2.34.1


