Return-Path: <linux-usb+bounces-13503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED0952B5D
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 11:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A530C1F21581
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 09:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF09A1B0127;
	Thu, 15 Aug 2024 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lP81t6EM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE117A932
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712252; cv=none; b=Shgu54XnPRIXy7p6aLapbZQF0ffkBNbRORxicj6ScbovgywSD+1Vo9X2t6pHi00JtFFD5dQOWRRhpNqB8+J6MQnHwfiPtRgF2dezEJgQGOzhxMxcTD8MfjTWJ1jLuh16RsvMfn9Mae1uNwgdVwN1uXsu5tw3PDvxYJL9vKGTQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712252; c=relaxed/simple;
	bh=XyvNZIHSzqVRCUbNIr1R7QCL340HzX8ZGKvsfnlrLhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmZtw1nyZsP2rHthHrd8UqsiKlaZdAJnEHwXEUJ7fCTZyBave6qTSHiUp+e/eCRhbxkLNCeIgJrQPnA1UeWGjlEsbY6f8a1vwKLleMM0V9rYWTI9Pv7doUWPMJ7C1VNwU2z+tuMQI+uH3DKyiJ100DUfUNWW4+RyBNpsCUeYbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lP81t6EM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712251; x=1755248251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XyvNZIHSzqVRCUbNIr1R7QCL340HzX8ZGKvsfnlrLhk=;
  b=lP81t6EMNgWGrCN6mk5ll5mrM9Pq8//x+xlhjJbR0j1Ilol1VusHR+6u
   K15BdMlsW2x4Lvn0xsogIcFz0rZTDHB/D/O/I5zjMzwRd8mYcRsLzOw0J
   CGu0Mgmk0Gh5+Q3yCdua79so8lZ84p/C8vH4/gIuu9YIVjsTbTTlmyH/d
   OVsbO4G4bCvTa6vWiS5xmQWMD44IXF7c50/gOWZqVphUtb/pw0WnCdyWz
   ispn/8lAcsFQmnIOcAbyvbC26hnEfq3/PGAqTttowJaL18asDiUjbAEwO
   9dNCqe++XRJ806rPSBdIJoWPvASMrgRTuRor7/iZYP8EwlUVL6pnEdyiq
   Q==;
X-CSE-ConnectionGUID: VQv4Dpn8RzCOaW/S8vLjcw==
X-CSE-MsgGUID: uCS/xBfoSPaWy8nQwEok5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22094611"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22094611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:57:30 -0700
X-CSE-ConnectionGUID: aruQRKN/S8m1PY0j41qGOA==
X-CSE-MsgGUID: auLF0UhAT5SG9jnx/FCqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="96816945"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2024 01:57:27 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/5] usb: typec: ucsi: Minor improvements
Date: Thu, 15 Aug 2024 11:57:21 +0300
Message-ID: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The two first patches prevent potential issues. The rest are just
cleanups - removing duplicated or otherwise useless code.

James, can you test these? I'm changing the handling of the identity
discovery in patch 3/5. It would be great if you (or somebody else)
could confirm that it continues to work as expected.

thanks,

Heikki Krogerus (5):
  usb: typec: ucsi: Don't truncate the reads
  usb: typec: ucsi: Only assign the identity structure if the PPM
    supports it
  usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
  usb: typec: ucsi: Call CANCEL from single location
  usb: typec: ucsi: Remove useless error check from ucsi_read_error()

 drivers/usb/typec/ucsi/ucsi.c | 126 ++++++++++------------------------
 drivers/usb/typec/ucsi/ucsi.h |  14 +---
 2 files changed, 39 insertions(+), 101 deletions(-)

-- 
2.43.0


