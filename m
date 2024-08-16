Return-Path: <linux-usb+bounces-13549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818A954B89
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF6C1C2422C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D31B8EBD;
	Fri, 16 Aug 2024 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5aHfCSD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049581AC8B8
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816745; cv=none; b=PGJkiCqlcoP1kmCZp4LSr/SzRXpREDSpa0OW0Z6OeNIs8PN4dydvRHlts1K6AvBge8RtQOF5xMvt642pHZBUi2TJFusYC/vhQoO7VgmRjFVFLiKCa8AKqqbnUfd3WEDLbL16kZ1GLLHzufkA41i70FGtZmjO8iUsE5sE5XOhPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816745; c=relaxed/simple;
	bh=L7h7Ckq31EYTfIUhygBoq936KlBUkVRBhyCp/mDei+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZtaC/oBGDSNhnRHe69+9CCoXTKrqjK+m5R3JuUNZieRO1FqBP/gT1Kmmy8u/Ux+kHkyAYcqroP6Bev1uLmjwZTjbH3kel/UhLZTwoCVsQFkhY/oO8x1t3jcKOcww7oUH71hg/IPIr8eEzABuDZi8MTJCl/foeaYEx5cb+K6ty8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5aHfCSD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816744; x=1755352744;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L7h7Ckq31EYTfIUhygBoq936KlBUkVRBhyCp/mDei+U=;
  b=D5aHfCSDHATeSPiWQ45thYXUKCydLmtGtlZDTzLX6E0wGQpMNjARg6XB
   0aoTGyCEKhjGkdwAplrAgqG8gGsvzYc5PFPT0cOaoOSN/NC5PloFZdVnc
   12mz8E56gDPab9ai4QQxFC9iramrDCnoW+H7xc2LBv7lXGVL1ot48KDnA
   uOJoFNOeR9Swulif4dQJ2ePN5gfcjXDnPmFT7dUOTyI6L9j/mlaM3q/k3
   Y1V5jqepxTN4DcIpf1cPP9pGHyWmhKBuWQrpxYo4ULyNtYCxMxI3LenN4
   Vp1BRAy/fv9kUAZ4aclvJ8N7QdOQj+YTg0594iwSNqj6ia1Ow1naXOP0K
   g==;
X-CSE-ConnectionGUID: 8gVNas4ES6+gLaeQhekqQQ==
X-CSE-MsgGUID: kP7vcbqKSEG5MGkjULPydg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660055"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:03 -0700
X-CSE-ConnectionGUID: MzMFSkn5Qe+mO96lGrquWQ==
X-CSE-MsgGUID: LJBFQoQLRlWEY7PxfyFApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192376"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:00 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Bartosz Szpila <bszpila@google.com>
Subject: [PATCH v2 0/6] usb: typec: ucsi: Minor improvements
Date: Fri, 16 Aug 2024 16:58:53 +0300
Message-ID: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The first three patches remove potential problems. I prepared
especially the second one as a protection against similar issues that
I had to fix earlier. The rest is just cleanups.

What changed since v1:

In this version I refactored the code so that UCSI_MAX_DATA_LENGTH()
is introduced in the first patch where it is used.

I also added one more patch, the first one, where I remove the unused
fields from struct ucsi_connector_status. Those fields are beyond the
MAX_DATA_LENGTH (16 bytes) with the older UCSI versions, so without
removing them, the code would fail on older systems after the read
truncation is removed in the second patch. Thanks for reporting that
Siva.

So please test these if you have time.

The first version of these patches:
https://lore.kernel.org/linux-usb/20240815085726.2865482-1-heikki.krogerus@linux.intel.com/

thanks,


Heikki Krogerus (6):
  usb: typec: ucsi: Remove unused fields from struct
    ucsi_connector_status
  usb: typec: ucsi: Don't truncate the reads
  usb: typec: ucsi: Only assign the identity structure if the PPM
    supports it
  usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
  usb: typec: ucsi: Call CANCEL from single location
  usb: typec: ucsi: Remove useless error check from ucsi_read_error()

 drivers/usb/typec/ucsi/ucsi.c | 126 ++++++++++------------------------
 drivers/usb/typec/ucsi/ucsi.h |  41 ++---------
 2 files changed, 41 insertions(+), 126 deletions(-)

-- 
2.43.0


